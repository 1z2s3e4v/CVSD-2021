module core #(                             //Don't modify interface
	parameter ADDR_W = 32,
	parameter INST_W = 32,
	parameter DATA_W = 32
)(
	input                   i_clk,
	input                   i_rst_n,
	output [ ADDR_W-1 : 0 ] o_i_addr,
	input  [ INST_W-1 : 0 ] i_i_inst,
	output                  o_d_wen,
	output [ ADDR_W-1 : 0 ] o_d_addr,
	output [ DATA_W-1 : 0 ] o_d_wdata,
	input  [ DATA_W-1 : 0 ] i_d_rdata,
	output [        1 : 0 ] o_status,
	output                  o_status_valid
);

// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
// ---- Add your own wires and registers here if needed ---- //
// I/Os
reg	[ ADDR_W-1 : 0 ] o_i_addr_w, o_i_addr_r;
reg					 o_d_wen_w, o_d_wen_r;
reg	[ ADDR_W-1 : 0 ] o_d_addr_w, o_d_addr_r;
reg	[ DATA_W-1 : 0 ] o_d_wdata_w, o_d_wdata_r;
reg	[        1 : 0 ] o_status_w, o_status_r;
reg					 o_status_valid_w, o_status_valid_r;
// vars
reg	[ 31 : 0 ] registers[0:31]; // 32 unsigned 32-bit registers
reg	[  5 : 0 ] opcode; // [31:26] i_inst
reg	[  4 : 0 ] rs, rt, rd; // [25:21], [20:16], [15:11] i_inst (R-type)
reg	[ 15 : 0 ] immediate; // [15:0] i_inst (I-type)
reg	[  2 : 0 ] cur_state, next_state; // 7 states
reg	flag_R_TYPE_SUCCESS, flag_I_TYPE_SUCCESS, flag_MIPS_OVERFLOW, flag_MIPS_END;
// paras
parameter S_IDLE	= 3'b000; // Idle
parameter S_FETCH	= 3'b001; // Instruction Fetch
parameter S_DECODE	= 3'b010; // Instruction Decode
parameter S_EXEC	= 3'b011; // ALU computing / Load Data
parameter S_WB		= 3'b100; // Date Write-Back
parameter S_NEXT	= 3'b101; // Next PC generation
parameter S_END		= 3'b110; // Process end

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
// ---- Add your own wire data assignments here if needed ---- //
assign o_i_addr = o_i_addr_r;
assign o_d_wen = o_d_wen_r;
assign o_d_addr = o_d_addr_r;
assign o_d_wdata = o_d_wdata_r;
assign o_status = o_status_r;
assign o_status_valid = o_status_valid_r;

// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
// ---- Write your conbinational block design here ---- //
always@(cur_state) begin
	
	case (cur_state)
		S_IDLE: begin
			o_i_addr_w = 0;
			o_d_wen_w = 0;
			o_d_addr_w = 0;
			o_d_wdata_w = 0;
			o_status_w = 0;
			o_status_valid_w = 0;
			flag_R_TYPE_SUCCESS = 1'b0;
			flag_I_TYPE_SUCCESS = 1'b0;
			flag_MIPS_OVERFLOW = 1'b0;
			flag_MIPS_END = 1'b0;
			
			next_state = S_FETCH;
		end
		S_FETCH: begin

			next_state = S_DECODE;
		end
		S_DECODE: begin
			
			next_state = S_EXEC;
		end
		S_EXEC: begin

			next_state = S_WB;
		end
		S_WB: begin

			next_state = S_NEXT;
		end
		S_NEXT: begin

			next_state = S_END;
		end
		S_END: begin

			next_state = S_END;
		end
		default: begin

			next_state = S_IDLE;
		end
	endcase

	if(flag_R_TYPE_SUCCESS) begin
		o_status_w = 2'b00; // status = 0 if R-type instruction success
		o_status_valid_w = 1'b1;
	end
	if(flag_I_TYPE_SUCCESS) begin
		o_status_w = 2b'01; // status = 1 if I-type instruction success
		o_status_valid_w = 1'b1;
	end
	if(flag_MIPS_OVERFLOW) begin
		o_status_w = 2'b10; // status = 2 if overflow
		o_status_valid_w = 1'b1;
	end
	if(flag_MIPS_END) begin
		o_status_w = 2'b11; // status = 3 if stop
		o_status_valid_w = 1'b1;
	end
end


// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
// ---- Write your sequential block design here ---- //
always@(posedge i_clk or negedge i_rst_n) begin
	if(!i_rst_n) begin // set all zero when i_rst_n is low
		o_i_addr_r <= 0;
		o_d_wen_r <= 0;
		o_d_addr_r <= 0;
		o_d_wdata_r <= 0;
		o_status_r <= 0;
		o_status_valid_r <= 0;

		o_i_addr_w <= 0;
		o_d_wen_w <= 0;
		o_d_addr_w <= 0;
		o_d_wdata_w <= 0;
		o_status_w <= 0;
		o_status_valid_w <= 0;
		opcode <= 0;
		rs <= 0;
		rt <= 0;
		rd <= 0;
		immediate <= 0;
		cur_state <= 0;
		next_state <= 0;
		flag_R_TYPE_SUCCESS <= 0;
		flag_I_TYPE_SUCCESS <= 0;
		flag_MIPS_OVERFLOW <= 0;
		flag_MIPS_END <= 0;
		for(i=0; i<32; i++) registers[i] <= 0;
	end else begin
		o_i_addr_r <= o_i_addr_w;
		o_d_wen_r <= o_d_wen_w;
		o_d_addr_r <= o_d_addr_w;
		o_d_wdata_r <= o_d_wdata_w;
		o_status_r <= o_status_w;
		o_status_valid_r <= o_status_valid_w;
	end
end

always@(posedge i_clk or negedge i_rst_n) begin
	if(i_rst_n) begin
		cur_state = next_state;
	end else begin
		cur_state = cur_state;
	end
end
endmodule
