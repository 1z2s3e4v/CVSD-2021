`timescale 1ns/10ps
module IOTDF( clk, rst, in_en, iot_in, fn_sel, busy, valid, iot_out);
input          clk;
input          rst;
input          in_en;
input  [7:0]   iot_in;
input  [2:0]   fn_sel;
output         busy;
output         valid;
output [127:0] iot_out;
// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
// outputs
reg	[127:0]	iot_out_w, iot_out_r;
reg			valid_w, valid_r,
			busy_w, busy_r;
// vars
reg	[127:0]	data[7:0], data_next[7:0]; // 128-bit data (16cycle * 8-bit), 8 data per round
reg	[142:0]	sum, sum_next; // sum of 16 * 128-bit --> 143-bit
reg	[2:0]	cur_state, next_state; // 000~111
reg	[7:0]	start_bit; // 0~127 (8*cycle for loading data)
reg	[3:0]	count_cycle, count_cycle_next; // 0~15 (16 cycle for loading 1 data)
reg [2:0]	count_data, count_data_next; // 0~7 (8 data per round)
reg [2:0]	data_idx, data_idx_next; // 0~7 (8 data per round)
reg	[3:0]	count_round, count_round_next; // 0~11 (12 round with 96 input)
reg [127:0] compare, compare_next; // compare result (MAX or MIN)
reg [127:0] last_extre, last_extre_next; // compare result (MAX or MIN)
reg	[3:0]	i;
reg			enable;
// para
parameter S_IDLE	= 3'b000; // Idle
parameter S_LOAD	= 3'b001; // waiting for data loader
parameter S_EX		= 3'b010; // comparasion
parameter S_OUT		= 3'b011; // output the result
parameter S_END		= 3'b111; // end

parameter F_MAX		= 3'b001; // Max(N)
parameter F_MIN		= 3'b010; // Min(N)
parameter F_AVG		= 3'b011; // Avg(N)
parameter F_EXTRACT	= 3'b100; // Extract(low < data < high)
parameter F_EXCLUDE	= 3'b101; // Exclude(data<low , high<data)
parameter F_PEAKMAX	= 3'b110; // PeakMax(the data is larger than previous output data)
parameter F_PEAKMIN	= 3'b111; // PeakMin(the data is smaller than previous output data)
// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
assign iot_out	= iot_out_r; // output
assign valid	= valid_r; // 1 when output
assign busy		= busy_r; // 1 for pause input

// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
// state
always@(*) begin
	count_data_next		= count_data;
	data_idx_next		= data_idx;
	enable				= 1;
	case(cur_state) 
		S_IDLE: begin
			next_state	= S_LOAD;
		end
		S_LOAD: begin
			if(count_cycle == 4'd15) begin
				count_data_next	= count_data + 1;
				data_idx_next	= count_data;
				next_state	= S_EX;
			end else begin
				next_state		= S_LOAD;
			end
		end
		S_EX: begin
			if(count_round == 12) begin
				next_state	= S_END;
			end else begin
				next_state	= S_LOAD;
			end
		end
		S_END: begin
			next_state	= S_END;
			enable		= 0;
		end
		default: begin
			next_state	= S_LOAD;
		end
	endcase
end
// Load Data // load 96 * 128-bit data (8-bit * 16-cycle per data) 
always@(*) begin
	for(i=0;i<=7;i=i+1)
		data_next[i] = data[i];
	if(in_en) begin
		start_bit			= 127 - (count_cycle << 3); // *8
		data_next[count_data][start_bit -: 8]	= iot_in; // data[0~7][0~15]
		count_cycle_next	= count_cycle + 1;
	end else begin
		count_cycle_next	= count_cycle;
	end
end
// Function
always@(*) begin
	valid_w				= 0;
	busy_w				= 0;
	iot_out_w			= 0;
	sum_next			= sum;
	last_extre_next		= last_extre;
	count_round_next	= count_round;
	compare_next		= compare;
	if(cur_state == S_EX) begin
		if(data_idx == 7) begin
			count_round_next	= count_round + 1;
		end
		case(fn_sel)
			F_MAX: begin
				if(data_idx == 0) begin
					compare_next	= data[0];
				end else begin
					compare_next	= (compare > data[data_idx])? compare : data[data_idx];
				end
				if(data_idx == 7) begin
					valid_w			= 1;
					iot_out_w		= (compare > data[data_idx])? compare : data[data_idx];
				end else begin 
					valid_w		= 0;
					iot_out_w	= 0;
				end
			end
			F_MIN: begin
				if(data_idx == 0) begin
					compare_next	= data[0];
				end else begin
					compare_next	= (compare < data[data_idx])? compare : data[data_idx];
				end
				if(data_idx == 7) begin
					valid_w			= 1;
					iot_out_w		= (compare < data[data_idx])? compare : data[data_idx];
				end else begin 
					valid_w		= 0;
					iot_out_w	= 0;
				end
			end
			F_AVG: begin
				if(data_idx == 0) begin
					sum_next = 143'd0 + data[data_idx];
				end else begin
					sum_next = sum + data[data_idx];
				end
				if(data_idx == 7) begin
					valid_w			= 1;
					iot_out_w		= (sum + data[data_idx]) / 8;
				end else begin 
					valid_w		= 0;
					iot_out_w	= 0;
				end
			end
			F_EXTRACT: begin
				if(data[data_idx] > 128'h6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF && data[data_idx] < 128'hAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF) begin
					valid_w		= 1;
					iot_out_w	= data[data_idx];
				end else begin 
					valid_w		= 0;
					iot_out_w	= 0;
				end
			end
			F_EXCLUDE: begin
				if(data[data_idx] < 128'h7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF || data[data_idx] > 128'hBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF) begin
					valid_w		= 1;
					iot_out_w	= data[data_idx];
				end else begin 
					valid_w		= 0;
					iot_out_w	= 0;
				end
			end
			F_PEAKMAX: begin
				last_extre_next	= last_extre;
				compare_next	= compare;
				if(count_round == 0) begin
					if(data_idx == 0) begin
						compare_next	= data[0];
					end else begin
						compare_next	= (compare > data[data_idx])? compare : data[data_idx];
					end
					if(data_idx == 7) begin
						valid_w			= 1;
						iot_out_w		= (compare > data[data_idx])? compare : data[data_idx];
						last_extre_next	= (compare > data[data_idx])? compare : data[data_idx];
					end else begin
						valid_w			= 0;
						iot_out_w		= 0;
					end
				end else begin
					if(data[data_idx] > last_extre) begin
						valid_w			= 1;
						iot_out_w		= data[data_idx];
						compare_next	= (compare > data[data_idx])? compare : data[data_idx];
					end else begin 
						valid_w			= 0;
						iot_out_w		= 0;
					end
					if(data_idx == 7) begin
						last_extre_next	= (compare > data[data_idx])? compare : data[data_idx];
					end
				end
			end
			F_PEAKMIN: begin
				last_extre_next	= last_extre;
				compare_next	= compare;
				if(count_round == 0) begin
					if(data_idx == 0) begin
						compare_next	= data[0];
					end else begin
						compare_next	= (compare < data[data_idx])? compare : data[data_idx];
					end
					if(data_idx == 7) begin
						valid_w			= 1;
						iot_out_w		= (compare < data[data_idx])? compare : data[data_idx];
						last_extre_next	= (compare < data[data_idx])? compare : data[data_idx];
					end else begin
						valid_w			= 0;
						iot_out_w		= 0;
					end
				end else begin
					if(data[data_idx] < last_extre) begin
						valid_w			= 1;
						iot_out_w		= data[data_idx];
						compare_next	= (compare < data[data_idx])? compare : data[data_idx];
					end else begin 
						valid_w			= 0;
						iot_out_w		= 0;
					end
					if(data_idx == 7) begin
						last_extre_next	= (compare < data[data_idx])? compare : data[data_idx];
					end
				end
			end
			default: begin
				valid_w			= 0;
				iot_out_w		= 0;
			end
		endcase
	end else begin
		valid_w			= 0;
		iot_out_w		= 0;
	end
end
// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
always@(posedge clk or posedge rst) begin
	if(rst) begin
		iot_out_r	<= 0;
		valid_r		<= 0;
		busy_r		<= 0;

		for(i=0;i<=7;i=i+1)
			data[i]		<= 0;
		compare		<= 0;
		sum			<= 0;
		data_idx	<= 0;
		count_round	<= 0;
		last_extre	<= 0;
		count_data	<= 0;
		count_cycle	<= 0;
		cur_state	<= S_IDLE;
	end else begin
		for(i=0;i<=7;i=i+1)
			data[i]		<= data_next[i];
		sum			<= sum_next;
		compare		<= compare_next;
		data_idx	<= data_idx_next;
		last_extre	<= last_extre_next;
		
		count_round	<= count_round_next;
		count_data	<= count_data_next;
		count_cycle	<= count_cycle_next;
		cur_state	<= next_state;

		busy_r		<= busy_w;
		valid_r		<= valid_w;
		iot_out_r	<= iot_out_w;
	end
end
endmodule
