module alu (
    input               i_clk,
    input               i_rst_n,
    input               i_valid,
    input signed [11:0] i_data_a,
    input signed [11:0] i_data_b,
    input        [2:0]  i_inst,
    output              o_valid,
    output       [11:0] o_data,
    output              o_overflow
);
    
// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
reg  [11:0] o_data_w, o_data_r;
reg         o_valid_w, o_valid_r;
reg         o_overflow_w, o_overflow_r;
// ---- Add your own wires and registers here if needed ---- //
reg	 [11:0]	data_old, abs_a, abs_b;
reg  		of_old;
reg	 [12:0]	data_add, data_mac;   // extend the bit num (+1)
reg  [23:0] data_multi; // extend the bit num (*2)
reg  [18:0] data_round; // extend the bit num

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
assign o_valid = o_valid_r;
assign o_data = o_data_r;
assign o_overflow = o_overflow_r;
// ---- Add your own wire data assignments here if needed ---- //




// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
// ---- Write your conbinational block design here ---- //
always@(*) begin
    o_valid_w = i_valid;
	o_data_w = 12'b0;
	o_overflow_w = 1'b0;

	case(i_inst)
		3'b000: begin // Add
			data_add = {i_data_a[11], i_data_a} + {i_data_b[11], i_data_b};
			// data
			o_data_w = data_add[11:0];
			// overflow
			o_overflow_w = ^data_add[12:11];
		end
		3'b001: begin // Sub
			data_add = {i_data_a[11], i_data_a} - {i_data_b[11], i_data_b};
			// data
			o_data_w = data_add[11:0];
			// overflow
			o_overflow_w = ^data_add[12:11];
		end
		3'b010: begin // Multi
			data_multi = i_data_a * i_data_b;
			data_round = (data_multi[4]==1'b1)? data_multi[23:5]+1: data_multi[23:5];

			// data
			o_data_w = data_round[11:0];
			// overflow
			o_overflow_w = (data_round[18:11] != 8'b11111111 & data_round[18:11] != 8'b00000000);
		end
		3'b011: begin // MAC
			data_multi = i_data_a * i_data_b;
			data_round = (data_multi[4]==1'b1)? data_multi[23:5]+1: data_multi[23:5];
			data_mac = data_round[12:0] + {data_old[11], data_old};
			// data
			o_data_w = data_mac[11:0];
			// overflow
			o_overflow_w = of_old | (data_round[18:11] != 8'b11111111 & data_round[18:11] != 8'b00000000) | ^data_mac[12:11];
		end
		3'b100: begin // XNOR
			o_data_w = ~(i_data_a ^ i_data_b);
		end
		3'b101: begin // ReLu
			o_data_w = (i_data_a>0)? i_data_a: 12'b0;
		end
		3'b110: begin // Mean
			data_add = ({i_data_a[11], i_data_a} + {i_data_b[11], i_data_b}) >>> 1;
			// data
			o_data_w = data_add[11:0];
		end
		3'b111: begin // AbsMax
			abs_a = (i_data_a[11])? (~i_data_a+1'b1): i_data_a;
			abs_b = (i_data_b[11])? (~i_data_b+1'b1): i_data_b;
			o_data_w = (abs_a >= abs_b)? abs_a: abs_b;
		end
		default: begin 
			o_data_w = 12'b0;
			o_overflow_w = 1'b0;
		end
	endcase
end

// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
// ---- Write your sequential block design here ---- //
always@(posedge i_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin
        o_data_r <= 0;
        o_overflow_r <= 0;
        o_valid_r <= 0;
    end else begin
        o_data_r <= o_data_w;
        o_overflow_r <= o_overflow_w;
        o_valid_r <= o_valid_w;
    end
end

always@(posedge i_clk or negedge i_rst_n) begin
    if(i_rst_n) begin
		if(i_inst==3'b011) begin
			data_old <= o_data_w;
			of_old <= o_overflow_w;
		end else begin
			data_old <= 0;
			of_old <= 0;
		end
	end
end
endmodule
