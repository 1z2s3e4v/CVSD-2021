module core #(                             //Don't modify interface
	parameter ADDR_W = 32,
	parameter INST_W = 32,
	parameter DATA_W = 32
)(
	input                   i_clk,			// [01] Clock signal in the system
	input                   i_rst_n,		// [01] Active low asynchronous reset
	output [ ADDR_W-1 : 0 ] o_i_addr,		// [32] Address from program counter (PC)
	input  [ INST_W-1 : 0 ] i_i_inst,		// [32] Instruction from instruction memory
	output                  o_d_wen,		// [01] Write enable of data memory. Set low for reading mode, and high for writing mode
	output [ ADDR_W-1 : 0 ] o_d_addr,		// [32] Address for data memory
	output [ DATA_W-1 : 0 ] o_d_wdata,		// [32] Unsigned data input to data memory
	input  [ DATA_W-1 : 0 ] i_d_rdata,		// [32] Unsigned data output from data memory
	output [        1 : 0 ] o_status,		// [02] Status of core processing to each instruction
	output                  o_status_valid	// [01] Set high if ready to output status
);

// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
// ---- Add your own wires and registers here if needed ---- //

// For outputs
reg	   [        1 : 0 ] o_status_r, o_status_w;
reg	   [ DATA_W-1 : 0 ] o_d_wdata_r, o_d_wdata_w;
reg	   [ ADDR_W-1 : 0 ] o_i_addr_r, o_i_addr_w, o_d_addr_r, o_d_addr_w;
reg 					o_status_valid_r, o_status_valid_w, o_d_wen_r, o_d_wen_w;

//
reg [ 31 : 0 ] registers[0:31];
reg	[  5 : 0 ] opcode;
reg	[  4 : 0 ] rs, rt, rd;
reg	[  2 : 0 ] current_state, next_state, type;
reg	[ 15 : 0 ] immediate;
reg 		   overflow;

parameter IDLE 		= 3'b000;	// IDLE
parameter FETCH 	= 3'b001;	// Instruction Fetch
parameter DECODE   	= 3'b010;	// Instruction Decode
parameter EXECUTE 	= 3'b011;	// Execute
parameter MEMORY   	= 3'b100;	// Memory Access
parameter WRITE   	= 3'b101;	// Write Back
parameter STOP   	= 3'b110;	// Stop Processing
parameter H_MAXNUM	= 32'd2147483648;

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
// ---- Add your own wire data assignments here if needed ---- //
assign o_i_addr 		= o_i_addr_r;
assign o_d_wen 			= o_d_wen_r;
assign o_d_addr 		= o_d_addr_r;
assign o_d_wdata 		= o_d_wdata_r;
assign o_status 		= o_status_r;
assign o_status_valid 	= o_status_valid_r;


// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
// ---- Write your combinational block design here ---- //
always@(current_state) begin
	if (i_rst_n) begin
		case (current_state)
			IDLE:	next_state = FETCH;
			FETCH: begin
				overflow			= 0;
				o_status_w 			= 0;
				o_status_valid_w 	= 0;
				next_state 			= DECODE;
			end
			DECODE: begin
				opcode = i_i_inst[31:26];

				case (opcode)
				`OP_ADD, `OP_SUB, `OP_OR, `OP_XOR: begin
					type 		= 1;
					rs 	 		= i_i_inst[25:21];
					rt	 		= i_i_inst[20:16];
					rd 	 		= i_i_inst[15:11];
				end
				`OP_LW, `OP_SW, `OP_BEQ, `OP_BNE, `OP_ADDI: begin
					type 		= 2;
					rs 	 		= i_i_inst[25:21];
					rt 	 		= i_i_inst[20:16];
					immediate 	= i_i_inst[15: 0];
				end
				default:
					type 		= 3;
				endcase

				next_state = (type == 3) ? STOP : EXECUTE;
			end
			EXECUTE: begin
				if (type == 1) begin // R-Type
					case (opcode)
					`OP_ADD: begin
						overflow 		= (registers[rs] > H_MAXNUM && registers[rt] > H_MAXNUM) ? 1 : 0;
						registers[rd] 	= registers[rs] + registers[rt];
					end
					`OP_SUB: begin
						overflow 		= (registers[rt] > registers[rs]) ? 1 : 0;
						registers[rd] 	= registers[rs] - registers[rt];
					end
					`OP_XOR:	registers[rd] = registers[rs] ^ registers[rt];
					`OP_OR:		registers[rd] = registers[rs] | registers[rt];
					endcase
				end
				else begin			// I-Type
					case (opcode)
					`OP_LW: begin
						o_d_wen_w  = 0;
						o_d_addr_w = registers[rs] + immediate;
					end
					`OP_SW: begin
						o_d_wen_w   = 1;
						o_d_addr_w  = registers[rs] + immediate;
						o_d_wdata_w = registers[rt];
					end
					`OP_ADDI:	registers[rt] = registers[rs] + immediate;
					`OP_BEQ:	o_i_addr_w = (registers[rt] == registers[rs]) ? o_i_addr_w + immediate : o_i_addr_w;
					`OP_BNE:	o_i_addr_w = (registers[rt] != registers[rs]) ? o_i_addr_w + immediate : o_i_addr_w;
					default:	opcode = opcode;
					endcase
				end
				next_state = MEMORY;
			end
			MEMORY: 
			begin
				case (opcode)
				`OP_LW: registers[rt] = i_d_rdata;
				`OP_SW: o_d_wen_w = 0;
				default: opcode = opcode;
				endcase

				next_state = WRITE;
			end
			WRITE: 
			begin
				case (opcode)
				`OP_LW: registers[rt] = i_d_rdata;
				`OP_SW: o_d_wen_w = 0;
				default: opcode = opcode;
				endcase

				o_i_addr_w = o_i_addr_w + 4;
				
				if (overflow)	o_status_w = `MIPS_OVERFLOW;
				else			o_status_w = (type == 1) ? `R_TYPE_SUCCESS : `I_TYPE_SUCCESS;
				o_status_valid_w = 1;
				
				next_state = FETCH;
			end
			STOP:
			begin
				o_status_w = `MIPS_END;
				o_status_valid_w = 1;
				next_state = STOP;
			end
			default:
				next_state = FETCH;
		endcase
	end
end

always@(negedge i_clk) begin
	if (i_rst_n)
		current_state = next_state;
	else
		current_state = current_state;
end

// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
// ---- Write your sequential block design here ---- //
always@(posedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin   // reset signal active
		o_i_addr_r 			<= 0;
		o_d_wen_r 			<= 0;
		o_d_addr_r 			<= 0;
		o_d_wdata_r 		<= 0;
		o_status_r 			<= 0;
		o_status_valid_r 	<= 0;
		o_i_addr_w 			<= 0;
		o_d_wen_w 			<= 0;
		o_d_addr_w 			<= 0;
		o_d_wdata_w 		<= 0;
		o_status_w 			<= 0;
		o_status_valid_w 	<= 0;

		type				<= 0;
		opcode				<= 0;
		next_state			<= 1;
		current_state		<= 0;
		rs					<= 0;
		rt					<= 0;
		rd					<= 0;
		immediate			<= 0;
		overflow			<= 0;

		registers[ 0]		<= 0;
		registers[ 1]		<= 0;
		registers[ 2]		<= 0;
		registers[ 3]		<= 0;
		registers[ 4]		<= 0;
		registers[ 5]		<= 0;
		registers[ 6]		<= 0;
		registers[ 7]		<= 0;
		registers[ 8]		<= 0;
		registers[ 9]		<= 0;
		registers[10]		<= 0;
		registers[11]		<= 0;
		registers[12]		<= 0;
		registers[13]		<= 0;
		registers[14]		<= 0;
		registers[15]		<= 0;
		registers[16]		<= 0;
		registers[17]		<= 0;
		registers[18]		<= 0;
		registers[19]		<= 0;
		registers[20]		<= 0;
		registers[21]		<= 0;
		registers[22]		<= 0;
		registers[23]		<= 0;
		registers[24]		<= 0;
		registers[25]		<= 0;
		registers[26]		<= 0;
		registers[27]		<= 0;
		registers[28]		<= 0;
		registers[29]		<= 0;
		registers[30]		<= 0;
		registers[31]		<= 0;
	end else begin
		o_i_addr_r 			<= o_i_addr_w;
		o_d_wen_r			<= o_d_wen_w;
		o_d_addr_r 			<= o_d_addr_w;
		o_d_wdata_r			<= o_d_wdata_w;
		o_status_r 			<= o_status_w;
		o_status_valid_r	<= o_status_valid_w;
	end
end

endmodule