`timescale 1ns/100ps
`define CYCLE       10.0     // CLK period.
`define HCYCLE      (`CYCLE/2)
// `define MAX_CYCLE   10000000
`define MAX_CYCLE   300
`define RST_DELAY   5


`ifdef tb1
    `define INFILE "../00_TESTBED/PATTERN/indata1.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode1.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden1.dat"
`elsif tb2
    `define INFILE "../00_TESTBED/PATTERN/indata2.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode2.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden2.dat"
`else
    `define INFILE "../00_TESTBED/PATTERN/indata0.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode0.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden0.dat"
`endif

`define SDFFILE "ipdc_syn.sdf"  // Modify your sdf file name


module testbed;

parameter N_OP = 13;
parameter N_OUT = 16;
parameter N_IMG = 64;

reg clk, rst_n;
wire        op_valid;
wire [ 2:0] op_mode;
wire        in_valid;
wire [23:0] in_data;
wire        in_ready;
wire        out_valid;
wire [23:0] out_data;

reg [23:0] indata_mem [ 63:0];
reg [ 2:0] opmode_mem [ 63:0];
reg [23:0] golden_mem [511:0];


// ==============================================
// TODO: Declare regs and wires you need
// ==============================================
reg        op_valid_r;
reg [ 2:0] op_mode_r;
reg        in_valid_r;
reg [23:0] in_data_r;
reg        in_ready_r;
reg        out_valid_r;
reg [23:0] out_data_r;

reg [ 3:0] curState_r, nxtState_r;

reg load_flag, wait_flag, out_flag;
integer op_idx, pix_idx, ans_idx, err;

// For gate-level simulation only
`ifdef SDF
    initial $sdf_annotate(`SDFFILE, u_ipdc);
    initial #1 $display("SDF File %s were used for this simulation.", `SDFFILE);
`endif

// Write out waveform file
initial begin
  $fsdbDumpfile("ipdc.fsdb");
  $fsdbDumpvars(3, "+mda");
end


ipdc u_ipdc (
	.i_clk(clk),
	.i_rst_n(rst_n),
	.i_op_valid(op_valid),
	.i_op_mode(op_mode),
	.i_in_valid(in_valid),
	.i_in_data(in_data),
	.o_in_ready(in_ready),
	.o_out_valid(out_valid),
	.o_out_data(out_data)
);

// Read in test pattern and golden pattern
initial $readmemb(`INFILE, indata_mem);
initial $readmemb(`OPFILE, opmode_mem);
initial $readmemb(`GOLDEN, golden_mem);

// Clock generation
initial clk = 1'b1;
always begin #(`CYCLE/2) clk = ~clk; end

// Reset generation
initial begin
    rst_n = 1; # (               0.25 * `CYCLE);
    rst_n = 0; # ((`RST_DELAY - 0.25) * `CYCLE);
    rst_n = 1; # (         `MAX_CYCLE * `CYCLE);
    $display("Error! Runtime exceeded!");
    $finish;
end

// ==============================================
// TODO: Check pattern after process finish
// ==============================================

initial begin
    op_mode_r   = 0;
    op_valid_r  = 0;
    in_data_r   = 0;
    in_valid_r  = 0;
    curState_r  = 0;
    nxtState_r  = 0;

    err = 0;
    op_idx = -1;
    pix_idx = 0;
    ans_idx = 0;
    load_flag = 0;
    wait_flag = 0;
end

assign op_mode  = op_mode_r;
assign op_valid = op_valid_r;
assign in_data  = in_data_r;
assign in_valid = in_valid_r;

parameter IDLE = 0;
parameter FETCH = 1;
parameter LOAD = 2;
parameter LOOP = 3;
parameter WAIT = 4;

always @ (negedge clk) begin
    if (rst_n)
        curState_r <= nxtState_r;
    else
        curState_r <= IDLE;
end

always @ (negedge clk) begin
    if (load_flag) begin
        if (in_ready) begin
            pix_idx = pix_idx + 1;
            if (pix_idx >= N_IMG) begin
                in_data_r = 0;
                in_valid_r = 0;
                load_flag = 0;
                nxtState_r = WAIT;                        
            end
            else begin
                in_data_r = indata_mem[pix_idx];
                in_valid_r = 1;
                nxtState_r = LOAD;
            end
        end
        else begin
            in_data_r = in_data_r;
            in_valid_r = 1;
            nxtState_r = LOAD;
        end
    end
end

always @ (negedge clk) begin
    if (wait_flag) begin
        if (out_flag) begin
            if (out_valid) begin
                $display("[%0d] Gold: %h, Your: %h, Check: %d", ans_idx, golden_mem[ans_idx], out_data, golden_mem[ans_idx] == out_data);
                if (golden_mem[ans_idx] != out_data) err = err + 1;            
                ans_idx = ans_idx + 1;
                pix_idx = pix_idx + 1;
                if (pix_idx >= N_OUT) begin
                    nxtState_r = FETCH;                        
                end
            end
        end
        else begin
            if (out_valid) 
                nxtState_r = FETCH;
            else
                nxtState_r = WAIT;
        end
    end
end

always @ (*) begin
    if (rst_n) begin
        op_valid_r = 0;
        op_mode_r = 0;

        case (curState_r)
            IDLE: nxtState_r = FETCH;
            FETCH: begin
                op_idx = op_idx + 1;
                if (op_idx >= N_OP) begin
                    $display("Complete!, Error: %0d", err);
                    $finish;
                end
                else begin
                    op_mode_r = opmode_mem[op_idx];
                    op_valid_r = 1;

                    if (op_mode_r > 0 && op_mode_r < 5)
                        out_flag = 1;
                    else
                        out_flag = 0;
                        
                    if (op_mode_r == 0)
                        nxtState_r = LOAD;
                    else
                        nxtState_r = WAIT;
                end
            end

            LOAD: begin
                load_flag = 1;
                in_valid_r = 1;
                in_data_r = indata_mem[0];
                nxtState_r = LOAD;
            end

            LOOP: begin
                
            end

            WAIT: begin
                pix_idx = 0;
                wait_flag = 1;
                nxtState_r = WAIT;
            end
        endcase
    end
end

endmodule
