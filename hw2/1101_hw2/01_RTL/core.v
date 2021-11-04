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
reg	[ ADDR_W-1 : 0 ] o_i_addr_w, o_i_addr_r;
reg					 o_d_wen_w, o_d_wen_r;
reg	[ ADDR_W-1 : 0 ] o_d_addr_w, o_d_addr_r;
reg	[ DATA_W-1 : 0 ] o_d_wdata_w, o_d_wdata_r;
reg					 o_status_w, o_status_r;
reg					 o_status_valid_w, o_status_valid_r;

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
always@(*) begin
	o_i_addr_w = ;
	o_d_wen_w = ;
	o_d_addr_w = ;
	o_d_wdata_w = ;
	o_status_w = ;
	o_status_valid_w = ;

end


// ---------------------------------------------------------------------------
// Sequential Block
// ---------------------------------------------------------------------------
// ---- Write your sequential block design here ---- //
always@(posedge i_clk or negedge i_rst_n) begin
	if(!i_rst_n) begin
		o_i_addr_r <= 0;
		o_d_wen_r <= 0;
		o_d_addr_r <= 0;
		o_d_wdata_r <= 0;
		o_status_r <= 0;
		o_status_valid_r <= 0;
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
	
	end else begin

	end
end
endmodule
