module run_gsim ( i_clk, i_reset, i_module_en, o_done, i_a, i_b, o_x );
input          i_clk;
input          i_reset;
input          i_module_en;
output         o_done;
// matrix memory
input	[4095:0] i_a; // 16 * 256-bit
input	[ 255:0] i_b; // 1 * 256-bit
output	[ 511:0] o_x; // 16 * 32-bit
// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
reg	[ 31:0]	o_x_w[0:15], o_x_r[0:15];
reg			o_done_w, o_done_r;
reg	[255:0]	A[0:15], A_next[0:15];
reg	[255:0] B, B_next;
reg	[ 31:0] X[0:15], X_next[0:15];
reg	[ 47:0] AX[0:15], AX_next[0:15]; // (ax) in each round, S31.16 --> S15.16
reg	[ 36:0] SUM[0:15], SUM_next[0:15]; // (b - 15*ax), S20.16 --> S15.16
reg	[ 47:0] newX[0:15], newX_next[0:15]; // 1/a * (b - 15*ax), S17.30 --> S15.16


// vars
reg	[ 1:0]	cur_state, next_state; // 000~111

integer		i,j; // 
reg	[ 3:0]	iter, iter_next; // 0~15
reg	[ 4:0]	round, round_next; // count the round in the single iteration

// paras
parameter S_IDLE		= 3'b00; // Idle
parameter S_WAIT		= 3'b01; // wait for i_module_en, if(i_module_en 0->1) set input to matrix A and B
parameter S_EX			= 3'b10; // Compute Gauss-Seidel Iteration
parameter S_HOLD		= 3'b11; // hold the X until i_module_en 1->0

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
assign o_done	= o_done_r;
genvar _i;
generate
for(_i=0;_i<=15;_i=_i+1)
	assign o_x[(_i*16):(_i*16+32)]	= X[_i];
endgenerate

// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
// finite state nachine
always@(*) begin
	o_done_w	= o_done_r;
	iter_next	= iter;
	round_next	= round;
	case(cur_state)
		S_IDLE: begin
			next_state	= S_WAIT;
		end
		S_WAIT: begin
			if(i_module_en) begin
				next_state	= S_EX;
				o_done_w	= 0;
				iter_next	= 0;
				round_next	= 0;
			end else begin
				next_state	= S_WAIT;
			end
		end
		S_EX: begin
			if(iter == 3'd15) begin
				next_state	= S_HOLD;
				o_done_w	= 1;
			end else begin
				next_state	= S_EX;
				if(round == 4'd17) begin
					iter_next	= iter + 1;
					round_next	= 0;
				end else begin
					round_next  = round + 1;
				end
			end
		end
		S_HOLD: begin
			if(!i_module_en) begin
				next_state	= S_WAIT;
			end else begin
				next_state	= S_HOLD;
			end
		end
	endcase
end

// set A and B
always@(*) begin
	for(i=0;i<=15;i=i+1)
		A_next[i]	= A[i];
	B_next		= B;
	o_done_w	= o_done_r;
	// Set A and B when i_module_en 0->1
	if(cur_state == S_WAIT && i_module_en) begin
		for(i=0;i<=15;i=i+1) begin
			for(j=0;j<=15;j=j+1) begin
				//A_next[i][j*16:j*16+15]	= i_a[j*256+i*16:j*256+i*16+15];
				A_next[i][(j<<4):(j<<4)+15]	= i_a[(j<<8)+(i<<4):(j<<8)+(i<<4)+15];
			end
		end
		B_next	= i_b;
	end
end

// Compute X
always@(*) begin
	// compute X for 16 iteration
	if(cur_state == S_EX) begin
		if(iter == 3'd000) begin
			for(i=0;i<=15;i=i+1) begin
				X0[i] = B[i*16:i*16+15] * A[i][i*16:i*16+15];
			end
			
		end else begin
			/*for(i=0;i<=15;i=i+1) begin
				for(j=0;j<=15;j=j+1) begin
					b = B[i*16:i*16+15];
				end
				X_next[i] = A[i][i*16:i*16+15] * (B[i*16:i*16+15] - )
			end*/
			X_next[0] = A[0] * (B[0] - A[0][16:31]*X[1] - A[0][32:47]*X[2] - A[0][48:63]*X[3] 
									- A[0][64:79]*X[4] - A[0][80:95]*X[5] - A[0][96:111]*X[6] - A[0][112:127]*X[7]
								   	- A[0][128:143]*X[8] - A[0][144:159]*X[9] - A[0][160:175]*X[10] - A[0][176:191]*X[11]
								   	- A[0][192:217]*X[12] - A[0][208:223]*X[13] - A[0][224:239]*X[14] - A[0][240:255]*X[15])
/*			X_next[0] = A[0] * (B[0] - A[0][0:15]*X[0] - A[0][16:31]*X[1] - A[0][32:47]*X[2] - A[0][48:63]*X[3] 
									- A[0][64:79]*X[4] - A[0][80:95]*X[5] - A[0][96:111]*X[6] - A[0][112:127]*X[7]
								   	- A[0][128:143]*X[8] - A[0][144:159]*X[9] - A[0][160:175]*X[10] - A[0][176:191]*X[11]
								   	- A[0][192:217]*X[12] - A[0][208:223]*X[13] - A[0][224:239]*X[14] - A[0][240:255]*X[15]) */

		end
	end
end
// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
always@(posedge i_clk or posedge i_reset) begin
	if(i_reset) begin
		o_done_r	<= 0;
		for(i=0;i<=15;i=i+1) begin
			X[i]		<= 0;
			A[i]		<= 0;
		end
		B			<= 0;

		cur_state	<= S_IDLE;
		iter		<= 0;
	end else begin
		o_done_r	<= o_done_w;
		for(i=0;i<=15;i=i+1) begin
			X[i]		<= X_next[i];
			A[i]		<= A_next[i];
		end
		B			<= B_next;

		cur_state	<= next_state;
		iter		<= iter_next;
	end
end
endmodule
