`timescale 1ns/100ps
`define CYCLE       10.0     // CLK period.
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   10000000
`define RST_DELAY   2


`ifdef tb1
    `define INFILE "../00_TESTBED/PATTERN/indata1.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode1.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden1.dat"
`elsif tb2
    `define INFILE "../00_TESTBED/PATTERN/indata2.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode2.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden2.dat"
`elsif tb3
    `define INFILE "../00_TESTBED/PATTERN/indata3.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode3.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden3.dat"
`else
    `define INFILE "../00_TESTBED/PATTERN/indata0.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode0.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden0.dat"
`endif

`define SDFFILE "ipdc_syn.sdf"  // Modify your sdf file name


module testbed;

reg clk, rst_n;
reg        op_valid;
reg [ 3:0] op_mode;
wire        op_ready;
reg        in_valid;
reg [23:0] in_data;
wire        in_ready;
wire        out_valid;
wire [23:0] out_data;

reg [23:0] indata_mem [ 0:255];
reg [ 3:0] opmode_mem [ 0:63];
reg [23:0] golden_mem [ 0:1024];


// ==============================================
// TODO: Declare regs and wires you need
// ==============================================
integer i,j;
initial i=0;
initial j=0;
time latency_begin;
always@(negedge clk)begin
    if(!rst_n)begin
        op_valid=1'b0;
        in_valid=1'b0;
    end
    else if(op_ready)begin
        op_valid=1'b1;
        in_valid=1'b0;
        op_mode=opmode_mem[j];
        $display("input mode : %b",op_mode);
        if(op_mode!=0)begin
            latency_begin=$time();
            if($time()-latency_begin>1000)begin
                $display("latency is : %d",$time()-latency_begin);
            end
        end
        j=j+1;
    end
    else begin
        op_valid=1'b0;
        op_mode=0;
    end
    if(op_mode==4'b0000)begin
        if(in_ready)begin
            in_valid=1;
            in_data=indata_mem[i];
            i=i+1;
        end
        else begin
            in_valid=0;
        end
    end
end
// For gate-level simulation only
`ifdef SDF
    initial $sdf_annotate(`SDFFILE, u_ipdc);
    initial #1 $display("SDF File %s were used for this simulation.", `SDFFILE);
`endif

// Write out waveform file
initial begin
  $fsdbDumpfile("ipdc.fsdb");
  $fsdbDumpvars(3, "+mda");
  //$dumpfile("ipdc.vcd");
  //$dumpvars(0);
end


ipdc u_ipdc (
	.i_clk(clk),
	.i_rst_n(rst_n),
	.i_op_valid(op_valid),
	.i_op_mode(op_mode),
    .o_op_ready(op_ready),
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
initial clk = 1'b0;
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
integer k;
initial k=0;
integer error;
initial error=0;
reg [23:0] answer;
integer ll;
always@(negedge clk)begin
    if(out_valid)begin
        answer = golden_mem[k];
        if(out_data!=golden_mem[k])begin
            $display("get error at golden mem [%d], yours : %h , golden : %h",k,out_data,golden_mem[k]);
            error=error+1;
            //$display("operation is %b,step now is %d",opmode_mem[j-1],u_ipdc.step_r);
            //$display("origin : (%d,%d)",u_ipdc.origin_x,u_ipdc.origin_y);
            //$display("grid num : %d",u_ipdc.grid_num);
            
        end
        k=k+1;
    end
end
always@(negedge clk)begin
    if(opmode_mem[j+1]===4'bx&&op_ready)begin
        if(error==0)begin
            $display("success! pass the testbench\n");
        end
        else begin
            $display("total number of error is : %d\n",error);
        end
        for(ll=0;ll<256;ll=ll+1)begin
                //$display("r[%h] is : %h",ll,u_ipdc.r.mem[ll]);
            end
        $finish;
    end
end
endmodule
