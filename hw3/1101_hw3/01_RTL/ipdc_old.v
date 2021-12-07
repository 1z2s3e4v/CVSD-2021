
module ipdc (                       //Don't modify interface
	input         i_clk,
	input         i_rst_n,
	input         i_op_valid,
	input  [ 3:0] i_op_mode,
    output        o_op_ready,
	input         i_in_valid,
	input  [23:0] i_in_data,
	output        o_in_ready,
	output        o_out_valid,
	output [23:0] o_out_data
);

// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
// outputs
reg	[23:0]	o_out_data_w, o_out_data_r;
reg			o_op_ready_w, o_op_ready_r, 
			o_in_ready_w, o_in_ready_r, 
			o_out_valid_w, o_out_valid_r;
// vars
reg	[7:0]	count_load, count_load_next;
wire [7:0]	data_R, data_G, data_B;
reg	[2:0]	cur_state, next_state;
reg	[2:0]	scale; // 1, 2, 4 
reg	[7:0]	origin, origin_next, cur_A, cur_A_next; // 0~255
reg			flag_OF;
reg	[23:0]	catch [0:5]; // 6*6 (max 4*4 + padding), each value 0~255, [5:3]row, [2:0]col
reg	[3:0]	count_filter, count_filter_next;

wire [23:0]	sram_o_Q;
reg	[7:0]	sram_i_A, sram_i_A_w, sram_i_A_r;
reg			sram_i_CEN, sram_i_CEN_w, sram_i_CEN_r;
reg			sram_i_WEN, sram_i_WEN_w, sram_i_WEN_r;
// paras
parameter S_IDLE		= 3'b000; // Idle
parameter S_IF			= 3'b001; // op fetch (o_op_ready=1)
parameter S_EX			= 3'b010; // run opation
parameter S_LOAD_IMAGE	= 3'b011; // load image for 256 cycle
parameter S_LOAD_FILTER	= 3'b100; // get image into 3*3 filter
parameter S_FIND_MEDIAN	= 3'b101; // get the median of the 3*3 filter
parameter S_END			= 3'b111; // Process End

parameter OP_LOAD_IMAGE		= 4'b0000;
parameter OP_SHIFT_RIGHT	= 4'b0100;
parameter OP_SHIFT_LEFT		= 4'b0101;
parameter OP_SHIFT_UP		= 4'b0110;
parameter OP_SHIFT_DOWN		= 4'b0111;
parameter OP_SCALE_DOWN		= 4'b1000;
parameter OP_SCALE_UP		= 4'b1001;
parameter OP_MEDIAN_FILTER	= 4'b1100;
parameter OP_YCBCR_DISPLAY	= 4'b1101;
parameter OP_CENSUS_TRANS	= 4'b1110;

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
assign o_op_ready	= o_op_ready_r;
assign o_in_ready	= o_in_ready_r;
assign o_out_valid	= o_out_valid_r;
assign data_R		= i_in_data[23:16];
assign data_G       = i_in_data[15:8];
assign data_B       = i_in_data[7:0];

assign sram_i_A		= sram_i_A_r;
assign sram_i_CEN	= sram_i_CEN_r;
assign sram_i_WEN	= sram_i_WEN_r;

sram_256x8 sram_R(
	.Q(sram_o_Q[23:16]),
	.CLK(i_clk),
	.CEN(sram_i_CEN),
	.WEN(sram_i_WEN),
	.A(sram_i_A),
	.D(data_R)
);
sram_256x8 sram_G(
	.Q(sram_o_Q[15:8]),
	.CLK(i_clk),
	.CEN(sram_i_CEN),
	.WEN(sram_i_WEN),
	.A(sram_i_A),
	.D(data_G)
);
sram_256x8 sram_B(
	.Q(sram_o_Q[7:0]),
	.CLK(i_clk),
	.CEN(sram_i_CEN),
	.WEN(sram_i_WEN),
	.A(sram_i_A),
	.D(data_B)
);
// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
always@(*)begin
	if(i_rst_n)begin
	case(cur_state)
		S_IDLE: begin
			o_out_valid_w	= 0;
			o_in_ready_w	= 1;
			sram_i_CEN_w	= 1;
			next_state		= S_IF;
		end
		S_IF: begin
			o_out_valid_w	= 0;
			o_op_ready_w	= 1;
			o_in_ready_w	= 1;
			sram_i_CEN_w	= 1;
			flag_OF			= 0;
			next_state		= S_EX;
		end
		S_EX: begin
			o_op_ready_w	= 0;
			if(!i_op_valid) begin // wait until i_op_valid
				next_state = S_EX;
			end else begin
				case(i_op_mode)
					OP_LOAD_IMAGE: begin
						count_load	= 0;
						next_state	= S_LOAD_IMAGE;
					end
					OP_SHIFT_RIGHT: begin
						{flag_OF, origin_next[3:0]} = origin[3:0] + scale + 3;

						if(flag_OF) begin
							origin_next = origin;
						end else begin
							origin_next[3:0] = origin[3:0] + scale;
						end
						next_state	= S_OUTPUT_REGION;
					end
					OP_SHIFT_LEFT: begin
						{flag_OF, origin_next[3:0]} = origin[3:0] - scale;
						if(flag_OF) begin
							origin_next[3:0] = origin[3:0];
						end
						next_state	= S_OUTPUT_REGION;
					end
					OP_SHIFT_UP: begin
						{flag_OF, origin_next[7:4]} = origin[7:4] - scale;
						if(flag_OF) begin
							origin_next[7:4] = origin[7:4];
						end
						next_state	= S_OUTPUT_REGION;
					end
					OP_SHIFT_DOWN: begin
						{flag_OF, origin_next[7:4]} = origin[7:4] + scale + 3;
						if(flag_OF) begin
							origin_next[7:4] = origin[7:4];
						end else begin
							origin_next[7:4] = origin[7:4] + scale;
						end
						next_state	= S_OUTPUT_REGION;
					end
					OP_SCALE_DOWN: begin
						if(!scale[2]) scale = scale << 1;
						next_state	= S_OUTPUT_REGION;
					end
					OP_SCALE_UP: begin
						if(!scale[0]) scale = scale >> 1;
						next_state	= S_OUTPUT_REGION;
					end
					OP_MEDIAN_FILTER: begin
						next_state		= S_LOAD_FILTER;
					end
					OP_YCBCR_DISPLAY: begin
						// Y  = rouding(0.25R + 0.625G)
						// Cb = rouding(-0.125R - 0.25G + 0.5B + 128)
						// Cr = rouding(0.5R - 0.375G - 0.125B + 128)
						// value = 255 if > 255
						next_state = S_END;
					end
					OP_CENSUS_TRANS: begin
						next_state = S_END;
					end
				endcase
			end
		end
		S_OUTPUT_REGION: begin
			o_out_valid_w	= 1;
			o_out_data_w	= 0;
			o_out_data_w	= catch[9];

			{flag_OF, cur_A_next}	= cur_A[3:0] + scale; // right shift
			if()
			if()
				next_state = S_OUTPUT_REGION;
			else
				next_state = S_IF;
		end
		S_OUTPUT_MEDIAN: begin
			
		end
		S_LOAD_IMAGE: begin
			if(!i_in_valid) begin // wait until i_in_valid
				next_state = S_LOAD_IMAGE;
			end else begin // load image
				//------- set image to sram -------//
				sram_i_CEN_w	= 0; 
				sram_i_WEN_w	= 0; // Write
				sram_i_A_w	= count_load; // Adress
				//---------------------------------//
				if(count_load < 36) begin
					catch[]
				end

				if(count_load == 255) begin
					next_state = S_IF;
				end else begin
					count_load_next = count_load + 1;
					next_state = S_LOAD_IMAGE;
				end
			end
		end
		S_LOAD_CATCH: begin
			sram_i_CEN_w	= 0; 
			sram_i_WEN_w	= 1; // Read
			// Read 4*4 value
			cur_A	= origin;
			sram_i_A_w	= cur_A;
			{col_OF, cur_A_next}	= cur_A[3:0] + scale;
			if(col_OF) begin
				{row_OF, cur_A_next}	= cur_A[7:4] + scale;
			end
			if(col_OF && row_OF) begin
				
			end

			// Read padding
			case(count_filter)
				4'd0: begin
					sram_i_A_w = cur_A;
					filter[1][1] = sram_o_Q;
				end
				4'd1: begin
					sram_i_A_w = (cur_A[7:4]>=scale && cur_A[3:0]>=scale)? {cur_A[7:4]-scale, cur_A[3:0]-scale} : 0; // Adress([0][0])
					filter[0][0] = sram_o_Q;
				end
				4'd2: begin
					sram_i_A_w = (cur_A[7:4]>=scale)? {cur_A[7:4]-scale, cur_A[3:0]} : 0; // Adress([0][1])
					filter[0][1] = sram_o_Q;
				end
				4'd3: begin
					sram_i_A_w = (cur_A[7:4]>=scale && cur_A[3:0]<=(15-scale))? {cur_A[7:4]-scale, cur_A[3:0]+scale} : 0; // Adress([0][2])
					filter[0][2] = sram_o_Q;
				end
				4'd4: begin
					sram_i_A_w = (cur_A[3:0]>=scale)? {cur_A[7:4], cur_A[3:0]-scale} : 0; // Adress([1][0])
					filter[1][0] = sram_o_Q;
				end
				4'd5: begin
					sram_i_A_w = (cur_A[3:0]<=(15-scale))? {cur_A[7:4], cur_A[3:0]+scale} : 0; // Adress([1][2])
					filter[1][2] = sram_o_Q;
				end
				4'd6: begin
					sram_i_A_w = (cur_A[7:4]<=(15-scale) && cur_A[3:0]>=scale)? {cur_A[7:4]+scale, cur_A[3:0]-scale} : 0; // Adress([2][0])
					filter[2][0] = sram_o_Q;
				end
				4'd7: begin
					sram_i_A_w = (cur_A[7:4]<=(15-scale))? {cur_A[7:4]+scale, cur_A[3:0]} : 0; // Adress([2][1])
					filter[2][1] = sram_o_Q;
				end
				4'd8: begin
					sram_i_A_w = (cur_A[7:4]<=(15-scale) && cur_A[3:0]<=(15-scale))? {cur_A[7:4]+scale, cur_A[3:0]+scale} : 0; // Adress([2][2])
					filter[2][2] = sram_o_Q;
				end
				default: begin
					sram_i_A_w = 0;
				end
			endcase
			count_filter_next = count_filter + 1;
			if(count_load == 8) begin
				sram_i_CEN_w = 1; // SRAM standby
				next_state = S_FIND_MEDIAN;
			end
			else 
				next_state = S_LOAD_FILTER;
		end
		S_FIND_MEDIAN: begin
			// find max, mid, min in each row
			
			// find max, mid, min in each col
		end
		S_END: begin
			next_state = S_END;
		end
	endcase
	end
end


// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
always@(posedge i_clk or negedge i_rst_n) begin
	if(!i_rst_n) begin
		o_op_ready_r	<= 0;
		o_op_ready_w	<= 0;
		o_in_ready_r	<= 0;
		o_in_ready_w	<= 0;
		o_out_valid_r	<= 0;
		o_out_valid_w	<= 0;

		scale			<= 1;
		origin			<= 0;
		origin_next		<= 0;
		count_load		<= 0;
		count_load_next	<= 0;

		cur_state		<= 0;
		next_state		<= 1;
	end else begin
		o_op_ready_r	<= o_op_ready_w;
		o_in_ready_r	<= o_in_ready_w;
		o_out_valid_r	<= o_out_valid_w;

		sram_i_A_r		<= sram_i_A_w;
		sram_i_CEN_r	<= sram_i_CEN_w;
		sram_i_WEN_r	<= sram_i_WEN_w;
	end
end

always@(negedge i_clk) begin
	if(i_rst_n) begin
		cur_state		<= next_state;
		count_load		<= count_load_next;
		count_filter	<= count_filter_next;
		origin			<= origin_next;
		dispaly("cur_state = %s", next_state);
	end	else begin
		cur_state	<= cur_state;
	end
end

endmodule
