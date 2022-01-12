//`include "run_gsim.v"
module GSIM (                       //Don't modify interface
	input          i_clk,
	input          i_reset,
	input          i_module_en,
	input  [  4:0] i_matrix_num,
	output         o_proc_done,

	// matrix memory
	output         o_mem_rreq,
	output [  9:0] o_mem_addr,
	input          i_mem_rrdy,
	input  [255:0] i_mem_dout,
	input          i_mem_dout_vld,
	
	// output result
	output         o_x_wen,
	output [  8:0] o_x_addr,
	output [ 31:0] o_x_data  
);
// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
reg			o_proc_done_r, o_proc_done_w;
// matrix memory
reg			o_mem_rreq_r, o_mem_rreq_w;
reg [  9:0]	o_mem_addr_r, o_mem_addr_w;
// output result
reg			o_x_wen_r, o_x_wen_w;
reg	[  8:0]	o_x_addr_r, o_x_addr_w;
reg	[ 31:0] o_x_data_r, o_x_data_w;
// run_gsim
reg	[4095:0] A, A_next;
reg	[ 255:0] mA[0:15], mA_next[0:15];
reg	[ 255:0] B, B_next;
wire	[ 511:0] X;
// vars
reg	[ 2:0]	cur_state, next_state; // 000 ~ 111
reg	[ 4:0]	round, round_next; // 0 ~ matrix_num
reg	[ 4:0]	count_load, count_load_next; // 0 ~ matrix_num
reg	[ 4:0]	count_data, count_data_next; // 0~17
reg	[ 3:0]	count_out, count_out_next; // 0~15
reg			load_en, load_en_next;
reg			read_en, read_en_next;
reg			load_done, load_done_next;
reg			out_done, out_done_next;
reg			o_run_gsim_en_r, o_run_gsim_en_w;
// paras
parameter S_IDLE		= 3'b000; // Idle
parameter S_FIRST_LOAD	= 3'b001; // First time Load A and B (17-cycle + Handshake)
parameter S_START_EX	= 3'b010; // Set start Compute X (16-iter * 19-cycle = 304-cycle)
parameter S_WAIT_X		= 3'b011; // Waiting for X computaiton finished
parameter S_OUT			= 3'b100; // Output X to S-Memery
parameter S_END			= 3'b111; // End

integer i;
// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
assign o_proc_done		= o_proc_done_r;
assign o_mem_rreq		= o_mem_rreq_r;
assign o_mem_addr		= o_mem_addr_r;
assign o_x_wen			= o_x_wen_r;
assign o_x_addr			= o_x_addr_r;
assign o_x_data			= o_x_data_r;

assign o_run_gsim_en	= o_run_gsim_en_r;
run_gsim u_run_gsim(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_module_en(o_run_gsim_en),
	.o_done(i_run_gsim_done),
	.i_a(A),
	.i_b(B),
	.o_x(X)
);
// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------

// finite state nachine
always@(*) begin
	next_state	 	= cur_state;
	round_next		= round;
	load_en_next	= load_en;
	o_run_gsim_en_w	= o_run_gsim_en_r;
	o_proc_done_w	= o_proc_done_r;
	count_load_next	= count_load;

	case(cur_state) 
		S_IDLE: begin
			if(i_module_en) begin
				next_state		= S_FIRST_LOAD;
				round_next		= 1;
				o_run_gsim_en_w	= 0;
			end else begin
				next_state		= S_IDLE;
			end
		end
		S_FIRST_LOAD: begin
			if(load_done) begin
				next_state		= S_START_EX;
				load_en_next	= 0;
				count_load_next	= count_load + 1;
			end else begin
				load_en_next	= 1;
				next_state		= S_FIRST_LOAD;
			end
		end
		S_START_EX: begin
			o_run_gsim_en_w		= 1; // Compute X with loaded A,B
			load_en_next		= 1; // Load next A,B
			next_state			= S_WAIT_X; // wait for X
		end
		S_WAIT_X: begin
			if(load_done) begin
				load_en_next	= 0;
			end

			if(i_run_gsim_done) begin // X done
				count_load_next	= count_load + 1;
				next_state		= S_OUT;
			end else begin
				next_state		= S_WAIT_X;
			end
		end
		S_OUT: begin
			if((round==i_matrix_num) && out_done) begin
				next_state		= S_END;
				o_proc_done_w	= 1;
			end
			else if(out_done) begin
				o_run_gsim_en_w	= 0;
				next_state		= S_START_EX;
				round_next		= round + 1;
			end else begin
				next_state		= S_OUT;
			end
		end
		S_END: begin
			next_state			= S_END;
			if(!i_module_en) begin
				o_proc_done_w	= 0;
			end
		end
	endcase
end

// Load A and B
always@(*) begin
	load_done_next	= 0;
	o_mem_rreq_w	= 0;
	o_mem_addr_w	= o_mem_addr_r;
	A_next			= A;
	B_next			= B;
	count_data_next	= count_data;
	read_en_next	= 0;
	for(i=0;i<=15;i=i+1)
		mA_next[i]	= mA[i];

	if(load_en)begin
		if(count_data >= 5'd17) begin // load_done (delay one cycle)
			load_done_next	= 1;
			o_mem_rreq_w	= 0;
		end else begin // require data
			load_done_next	= 0;
			o_mem_rreq_w	= 1;
			o_mem_addr_w	= count_load*17 + count_data; 
		end
		if(i_mem_dout_vld && i_mem_rrdy && (~read_en)) begin
			read_en_next	= 1;
		end

		if(read_en && i_mem_dout_vld && i_mem_rrdy && count_data <=5'd16) begin // get data
			if(count_data <= 5'd15) begin // A[0~15]
				A_next[(count_data<<8)+255 -:256]	= i_mem_dout;
				mA_next[count_data]					= i_mem_dout;
			end else if(count_data == 5'd16) begin // B
				B_next	= i_mem_dout;
			end
			count_data_next	= count_data + 1;
			o_mem_addr_w	= count_load*17 + count_data+1; 
			read_en_next	= 0;
		end 
	end
	if(cur_state == S_START_EX || cur_state==S_IDLE) begin // start, reset data_counter
		count_data_next		= 0;
		load_done_next		= 0;
	end
end
// Output X
always@(*) begin
	out_done_next	= 0;
	o_x_wen_w		= 0;
	o_x_addr_w		= o_x_addr_r;
	o_x_data_w		= o_x_data_r;
	count_out_next	= count_out;
	if(cur_state == S_OUT) begin
		o_x_wen_w		= 1;
		o_x_addr_w		= ((round-1)<<4) + count_out;
		o_x_data_w		= X[(count_out<<5)+31 -: 32];
		count_out_next	= count_out + 1;
		if(count_out == 4'd15) begin
			count_out_next	= 0;
			out_done_next	= 1;
		end
	end
end

// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
always@(posedge i_clk or posedge i_reset) begin
	if(i_reset) begin
		o_proc_done_r	<= 0;
		o_mem_rreq_r	<= 0;
		o_mem_addr_r	<= 10'b1111111111;
		o_x_wen_r		<= 0;
		o_x_addr_r		<= 0;
		o_x_data_r		<= 0;
		o_run_gsim_en_r	<= 0;
		A				<= 0;
		B				<= 0;
		round			<= 0;
		count_load		<= 0;
		count_data		<= 0;
		count_out		<= 0;
		load_en			<= 0;
		read_en			<= 0;
		load_done		<= 0;
		out_done		<= 0;
		cur_state		<= 0;
		for(i=0;i<=15;i=i+1)
			mA[i]			<= 0;
	end	else begin
		o_proc_done_r	<= o_proc_done_w;
		o_mem_rreq_r	<= o_mem_rreq_w;
		o_mem_addr_r	<= o_mem_addr_w;
		o_x_wen_r		<= o_x_wen_w;
		o_x_addr_r		<= o_x_addr_w;
		o_x_data_r		<= o_x_data_w;
		o_run_gsim_en_r	<= o_run_gsim_en_w;

		A				<= A_next;
		B				<= B_next;
		round			<= round_next;
		count_load		<= count_load_next;
		count_data		<= count_data_next;
		count_out		<= count_out_next;
		load_en			<= load_en_next;
		read_en			<= read_en_next;
		load_done		<= load_done_next;
		out_done		<= out_done_next;
		
		cur_state		<= next_state;
		for(i=0;i<=15;i=i+1)
			mA[i]			<= mA_next[i];
	end
end
endmodule
