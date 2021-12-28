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
reg	[ 31 : 0 ] s1, s2, s3; // register for execute
reg [ INST_W-1 : 0 ] IF_inst;
reg [ ADDR_W-1 : 0 ] pc, next_pc;
reg	[  5 : 0 ] opcode; // [31:26] i_inst
reg	[  4 : 0 ] rs, rt, rd; // [25:21], [20:16], [15:11] i_inst
reg	[ 15 : 0 ] im; // immediate = [15:0] i_inst (I-type)
reg	[  2 : 0 ] cur_state, next_state; // 7 states
reg [  1 : 0 ] type; // R-type, I-type, other
reg	flag_OF; // overflow
reg [  5 : 0 ] i;
// paras
parameter S_IDLE	= 3'b000; // Idle
parameter S_IF		= 3'b001; // Instruction Fetch
parameter S_ID		= 3'b010; // Instruction Decode
parameter S_EX		= 3'b011; // ALU computing / Load Data
parameter S_WB		= 3'b100; // Date Write-Back
parameter S_NEXT	= 3'b101; // Next PC generation
parameter S_END		= 3'b110; // Process end
parameter S_MEM		= 3'b111; // 

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
// ---- Add your own wire data assignments here if needed ---- //
assign o_i_addr			 = o_i_addr_r;
assign o_d_wen			 = o_d_wen_r;
assign o_d_addr			 = o_d_addr_r;
assign o_d_wdata		 = o_d_wdata_r;
assign o_status			 = o_status_r;
assign o_status_valid	 = o_status_valid_r;

// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
// ---- Write your conbinational block design here ---- //
always@(cur_state) begin
	if (i_rst_n) begin
	case (cur_state)
		S_IDLE: begin
			o_i_addr_w			 = 0;
			o_d_wen_w			 = 0;
			o_d_addr_w			 = 0;
			o_d_wdata_w			 = 0;
			o_status_w			 = 0;
			o_status_valid_w	 = 0;
			flag_OF				 = 0;
			opcode				 = 0;
			rs					 = 0;
			rt					 = 0;
			rd					 = 0;
			im					 = 0;
			IF_inst				 = 0;
			type				 = 0;
			
			next_state = S_IF;
		end
		S_IF: begin
			IF_inst = i_i_inst;
			next_pc = pc + 4;
			next_state = (i_i_inst==0)? S_IDLE : S_ID;
		end
		S_ID: begin
			opcode	 = IF_inst[31:26];
			rs		 = IF_inst[25:21];
			rt		 = IF_inst[20:16];
			rd		 = IF_inst[15:11];
			im		 = IF_inst[15: 0];
			case (opcode)
				`OP_ADD, `OP_SUB, `OP_AND, `OP_OR, `OP_NOR, `OP_SLT: begin
					type = 0; // R-type
				end
				`OP_ADDI, `OP_LW, `OP_SW, `OP_BEQ, `OP_BNE: begin
					type = 1; // I-type
				end
				default: begin
					type = 2; // EOF or other
				end
			endcase
			next_state = (type == 2)? S_END : S_EX;
		end
		S_EX: begin
			case (opcode)
				// R-type
				`OP_ADD: begin
					{flag_OF, registers[rd]} = registers[rs] + registers[rt]; // s1 = s2 + s3
				end
				`OP_SUB: begin
					registers[rd] = registers[rs] - registers[rt]; // s1 = s2 - s3
					flag_OF = (registers[rs] < registers[rt]);
				end
				`OP_AND: begin
					registers[rd] = registers[rs] & registers[rt]; // s1 = s2 & s3
				end
				`OP_OR:	begin
					registers[rd] = registers[rs] | registers[rt]; // s1 = s2 | s3
				end
				`OP_NOR: begin
					registers[rd] = ~(registers[rs] | registers[rt]); // s1 = ~(s2 | s3)
				end
				`OP_SLT: begin
					registers[rd] = (registers[rs] < registers[rt])? 1 : 0; // s1 = (s2 < s3)? 1 : 0
				end
				// I-type
				`OP_ADDI: begin
					{flag_OF, registers[rt]} = registers[rs] + im; // s1 = s2 + im
				end
				`OP_LW: begin
					{flag_OF, o_d_addr_w} = registers[rs] + im;
				end
				`OP_SW: begin
					{flag_OF, o_d_addr_w}  = registers[rs] + im;
					o_d_wdata_w = registers[rt];
					o_d_wen_w = 1;
				end
				`OP_BEQ: begin
					next_pc = (registers[rs] == registers[rt])? (next_pc + im) : next_pc;
				end
				`OP_BNE: begin
					next_pc = (registers[rs] != registers[rt])? (next_pc + im) : next_pc;
				end
			endcase
			next_state = S_MEM;
		end
		S_MEM: begin
			if(!flag_OF) begin
				case (opcode)
					`OP_LW: registers[rt] = i_d_rdata;
				endcase
			end
			next_state = S_WB;
		end
		S_WB: begin
			if(!flag_OF) begin
				case (opcode)
					`OP_LW: begin
						registers[rt] = i_d_rdata;
					end
					`OP_SW:	o_d_wen_w = 0;
					// no need to write back other register because it has been set above
				endcase
			end
			next_state = S_NEXT;
		end
		S_NEXT: begin
			pc				 = next_pc;
			o_i_addr_w		 = next_pc;
			o_status_valid_w = 1;
			if(flag_OF) begin
				o_status_w	 = `MIPS_OVERFLOW;
				next_state	 = S_END;
			end else begin
				o_status_w	 = (type == 0)? `R_TYPE_SUCCESS : `I_TYPE_SUCCESS;
				next_state = S_IDLE;
			end
		end
		S_END: begin // EOF
			o_status_w = `MIPS_END;
			o_status_valid_w = 1;
			next_state = S_END;
		end
	endcase
	end
end


// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
// ---- Write your sequential block design here ---- //
always@(posedge i_clk or negedge i_rst_n) begin
	if(!i_rst_n) begin // set all zero when i_rst_n is low
		o_i_addr_r			 <= 0;
		o_d_wen_r			 <= 0;
		o_d_addr_r			 <= 0;
		o_d_wdata_r			 <= 0;
		o_status_r			 <= 0;
		o_status_valid_r	 <= 0;

		o_i_addr_w			 <= 0;
		o_d_wen_w			 <= 0;
		o_d_addr_w			 <= 0;
		o_d_wdata_w			 <= 0;
		o_status_w			 <= 0;
		o_status_valid_w	 <= 0;
		opcode				 <= 0;
		rs					 <= 0;
		rt					 <= 0;
		rd					 <= 0;
		im					 <= 0;
		cur_state			 <= 0;
		next_state			 <= 1;
		flag_OF				 <= 0;
		pc					 <= 0;
		next_pc				 <= 0;
		IF_inst				 <= 0;
		type				 <= 0;
		for(i=0; i<32; i=i+1) 
			registers[i]	 <= 0;
	end else begin
		o_i_addr_r		 <= o_i_addr_w;
		o_d_wen_r		 <= o_d_wen_w;
		o_d_addr_r		 <= o_d_addr_w;
		o_d_wdata_r		 <= o_d_wdata_w;
		o_status_r		 <= o_status_w;
		o_status_valid_r <= o_status_valid_w;
	end
end

always@(negedge i_clk) begin
	if(i_rst_n) begin
		cur_state = next_state;
	end else begin
		cur_state = cur_state;
	end
end
endmodule
