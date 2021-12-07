/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Tue Dec  7 03:27:59 2021
/////////////////////////////////////////////////////////////


module ipdc ( i_clk, i_rst_n, i_op_valid, i_op_mode, o_op_ready, i_in_valid, 
        i_in_data, o_in_ready, o_out_valid, o_out_data );
  input [3:0] i_op_mode;
  input [23:0] i_in_data;
  output [23:0] o_out_data;
  input i_clk, i_rst_n, i_op_valid, i_in_valid;
  output o_op_ready, o_in_ready, o_out_valid;
  wire   sram_i_CEN, sram_i_WEN, sram_i_CEN_w, sram_i_WEN_w, o_op_ready_w,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24;
  wire   [7:0] sram_i_A;
  wire   [2:0] step_size;
  wire   [7:0] origin;
  wire   [7:0] cur_A;
  wire   [3:0] cur_state;
  wire   [3:0] count_out;
  wire   [6:0] count_load;
  wire   [7:0] sram_i_A_w;
  wire   [7:0] count_load_next;
  wire   [3:0] count_out_next;
  wire   [3:0] next_state;

  sram_256x8 sram_R ( .Q({SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8}), .A(sram_i_A), .D(i_in_data[23:16]), .CLK(i_clk), .CEN(sram_i_CEN), .WEN(
        sram_i_WEN) );
  sram_256x8 sram_G ( .Q({SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12, 
        SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14, 
        SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16}), .A(sram_i_A), .D(
        i_in_data[15:8]), .CLK(i_clk), .CEN(sram_i_CEN), .WEN(sram_i_WEN) );
  sram_256x8 sram_B ( .Q({SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18, 
        SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20, 
        SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22, 
        SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24}), .A(sram_i_A), .D(
        i_in_data[7:0]), .CLK(i_clk), .CEN(sram_i_CEN), .WEN(sram_i_WEN) );
  DFFRX1 count_out_reg_0_ ( .D(count_out_next[0]), .CK(i_clk), .RN(n438), .Q(
        count_out[0]) );
  DFFRX1 cur_state_reg_3_ ( .D(next_state[3]), .CK(i_clk), .RN(n438), .Q(
        cur_state[3]), .QN(n419) );
  DFFRX1 cur_A_reg_7_ ( .D(n192), .CK(i_clk), .RN(n438), .Q(cur_A[7]) );
  DFFRX1 cur_state_reg_0_ ( .D(next_state[0]), .CK(i_clk), .RN(n438), .Q(
        cur_state[0]), .QN(n418) );
  DFFRX1 cur_state_reg_1_ ( .D(next_state[1]), .CK(i_clk), .RN(n438), .Q(
        cur_state[1]), .QN(n431) );
  DFFRX1 sram_i_WEN_r_reg ( .D(sram_i_WEN_w), .CK(i_clk), .RN(n438), .Q(
        sram_i_WEN) );
  DFFRX1 count_load_reg_0_ ( .D(count_load_next[0]), .CK(i_clk), .RN(n438), 
        .Q(count_load[0]), .QN(n422) );
  DFFRX1 count_load_reg_1_ ( .D(count_load_next[1]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[1]), .QN(n436) );
  DFFRX1 count_load_reg_2_ ( .D(count_load_next[2]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[2]) );
  DFFRX1 count_load_reg_3_ ( .D(count_load_next[3]), .CK(i_clk), .RN(i_rst_n), 
        .QN(n433) );
  DFFRX1 count_load_reg_4_ ( .D(count_load_next[4]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[4]) );
  DFFRX1 count_load_reg_5_ ( .D(count_load_next[5]), .CK(i_clk), .RN(i_rst_n), 
        .QN(n434) );
  DFFRX1 count_load_reg_6_ ( .D(count_load_next[6]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[6]) );
  DFFRX1 count_load_reg_7_ ( .D(count_load_next[7]), .CK(i_clk), .RN(i_rst_n), 
        .QN(n435) );
  DFFRX1 sram_i_A_r_reg_0_ ( .D(sram_i_A_w[0]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[0]) );
  DFFRX1 sram_i_A_r_reg_1_ ( .D(sram_i_A_w[1]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[1]) );
  DFFRX1 sram_i_A_r_reg_2_ ( .D(sram_i_A_w[2]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[2]) );
  DFFRX1 sram_i_A_r_reg_3_ ( .D(sram_i_A_w[3]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[3]) );
  DFFRX1 sram_i_A_r_reg_4_ ( .D(sram_i_A_w[4]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[4]) );
  DFFRX1 sram_i_A_r_reg_5_ ( .D(sram_i_A_w[5]), .CK(i_clk), .RN(n437), .Q(
        sram_i_A[5]) );
  DFFRX1 sram_i_A_r_reg_6_ ( .D(sram_i_A_w[6]), .CK(i_clk), .RN(n437), .Q(
        sram_i_A[6]) );
  DFFRX1 sram_i_A_r_reg_7_ ( .D(sram_i_A_w[7]), .CK(i_clk), .RN(n437), .Q(
        sram_i_A[7]) );
  DFFRX1 count_out_reg_1_ ( .D(count_out_next[1]), .CK(i_clk), .RN(n437), .Q(
        count_out[1]) );
  DFFRX1 count_out_reg_2_ ( .D(count_out_next[2]), .CK(i_clk), .RN(n437), .Q(
        count_out[2]), .QN(n432) );
  DFFRX1 count_out_reg_3_ ( .D(count_out_next[3]), .CK(i_clk), .RN(n437), .Q(
        count_out[3]) );
  DFFRX1 step_size_reg_1_ ( .D(n208), .CK(i_clk), .RN(n437), .Q(step_size[1])
         );
  DFFRX1 step_size_reg_2_ ( .D(n210), .CK(i_clk), .RN(n437), .Q(step_size[2]), 
        .QN(n428) );
  DFFRX1 origin_reg_0_ ( .D(n207), .CK(i_clk), .RN(n437), .Q(origin[0]), .QN(
        n423) );
  DFFRX1 origin_reg_1_ ( .D(n206), .CK(i_clk), .RN(n437), .Q(origin[1]), .QN(
        n424) );
  DFFRX1 origin_reg_3_ ( .D(n204), .CK(i_clk), .RN(i_rst_n), .Q(origin[3]) );
  DFFRX1 origin_reg_4_ ( .D(n203), .CK(i_clk), .RN(i_rst_n), .Q(origin[4]), 
        .QN(n426) );
  DFFRX1 origin_reg_5_ ( .D(n202), .CK(i_clk), .RN(i_rst_n), .Q(origin[5]), 
        .QN(n420) );
  DFFRX1 cur_A_reg_4_ ( .D(n195), .CK(i_clk), .RN(i_rst_n), .Q(cur_A[4]), .QN(
        n427) );
  DFFRX1 cur_A_reg_5_ ( .D(n194), .CK(i_clk), .RN(i_rst_n), .Q(cur_A[5]) );
  DFFRX1 cur_A_reg_6_ ( .D(n193), .CK(i_clk), .RN(n438), .Q(cur_A[6]), .QN(
        n430) );
  DFFRX1 sram_i_CEN_r_reg ( .D(sram_i_CEN_w), .CK(i_clk), .RN(n437), .Q(
        sram_i_CEN) );
  DFFRX1 cur_A_reg_0_ ( .D(n199), .CK(i_clk), .RN(n438), .Q(cur_A[0]) );
  DFFRX1 cur_A_reg_1_ ( .D(n198), .CK(i_clk), .RN(n437), .Q(cur_A[1]) );
  DFFRX1 cur_A_reg_2_ ( .D(n197), .CK(i_clk), .RN(n438), .Q(cur_A[2]) );
  DFFRX1 cur_A_reg_3_ ( .D(n196), .CK(i_clk), .RN(n437), .Q(cur_A[3]) );
  DFFRX1 o_in_ready_r_reg ( .D(1'b1), .CK(i_clk), .RN(n438), .Q(o_in_ready) );
  DFFRX1 o_op_ready_r_reg ( .D(o_op_ready_w), .CK(i_clk), .RN(n438), .Q(
        o_op_ready) );
  DFFRX1 o_out_valid_r_reg ( .D(n211), .CK(i_clk), .RN(n437), .Q(o_out_valid)
         );
  DFFRX2 origin_reg_6_ ( .D(n201), .CK(i_clk), .RN(i_rst_n), .Q(origin[6]), 
        .QN(n429) );
  DFFRX2 origin_reg_2_ ( .D(n205), .CK(i_clk), .RN(n437), .Q(origin[2]), .QN(
        n425) );
  DFFRX2 origin_reg_7_ ( .D(n200), .CK(i_clk), .RN(n438), .Q(origin[7]) );
  DFFRX2 cur_state_reg_2_ ( .D(next_state[2]), .CK(i_clk), .RN(n438), .Q(
        cur_state[2]), .QN(n421) );
  INVXL U231 ( .A(n246), .Y(n376) );
  INVX2 U232 ( .A(n415), .Y(n417) );
  NOR2X1 U233 ( .A(n238), .B(n237), .Y(n241) );
  NOR3X1 U234 ( .A(i_op_mode[1]), .B(i_op_mode[3]), .C(n282), .Y(n234) );
  NOR2X1 U235 ( .A(n283), .B(n282), .Y(n284) );
  NAND4X1 U236 ( .A(i_op_valid), .B(n374), .C(n384), .D(n401), .Y(n282) );
  NAND3X1 U237 ( .A(i_op_mode[3]), .B(i_op_mode[2]), .C(n400), .Y(n401) );
  OR2X2 U238 ( .A(n350), .B(n423), .Y(n214) );
  ADDFX1 U239 ( .A(cur_A[2]), .B(step_size[2]), .CI(n218), .CO(n219), .S(n343)
         );
  NAND2X4 U240 ( .A(n408), .B(i_in_valid), .Y(n353) );
  OR2X2 U241 ( .A(n395), .B(n431), .Y(n384) );
  INVX2 U242 ( .A(step_size[0]), .Y(n411) );
  INVX2 U243 ( .A(n369), .Y(n289) );
  INVX1 U244 ( .A(i_op_mode[2]), .Y(n398) );
  INVX1 U245 ( .A(i_op_valid), .Y(n391) );
  AOI211XL U246 ( .A0(step_size[0]), .A1(n239), .B0(n246), .C0(n282), .Y(n236)
         );
  NAND2XL U247 ( .A(n285), .B(n284), .Y(n300) );
  NAND2XL U249 ( .A(n234), .B(n285), .Y(n244) );
  OAI32X1 U250 ( .A0(n277), .A1(origin[6]), .A2(n276), .B0(n275), .B1(
        origin[7]), .Y(n278) );
  OAI21X1 U251 ( .A0(cur_A[7]), .A1(n335), .B0(n334), .Y(n388) );
  OAI211XL U252 ( .A0(origin[1]), .A1(n289), .B0(origin[0]), .C0(n411), .Y(
        n228) );
  AND3X1 U253 ( .A(origin[2]), .B(n276), .C(n230), .Y(n229) );
  NAND2XL U254 ( .A(origin[1]), .B(n289), .Y(n227) );
  AND2X1 U255 ( .A(n278), .B(n369), .Y(n288) );
  NOR2XL U257 ( .A(n377), .B(n375), .Y(n239) );
  INVXL U258 ( .A(n264), .Y(n251) );
  INVXL U259 ( .A(n239), .Y(n410) );
  AOI211XL U260 ( .A0(n400), .A1(n392), .B0(n382), .C0(n386), .Y(n383) );
  INVXL U261 ( .A(n346), .Y(n196) );
  AOI211XL U262 ( .A0(n363), .A1(count_out[3]), .B0(n337), .C0(n336), .Y(
        count_out_next[3]) );
  NOR2XL U263 ( .A(n436), .B(n353), .Y(sram_i_A_w[1]) );
  NOR2XL U264 ( .A(cur_state[2]), .B(cur_state[3]), .Y(n212) );
  NAND2X1 U265 ( .A(cur_state[1]), .B(n418), .Y(n370) );
  OAI211XL U266 ( .A0(i_in_valid), .A1(n431), .B0(n212), .C0(n370), .Y(
        sram_i_WEN_w) );
  CLKBUFX3 U267 ( .A(i_rst_n), .Y(n438) );
  CLKBUFX3 U268 ( .A(i_rst_n), .Y(n437) );
  BUFX2 U269 ( .A(step_size[1]), .Y(n369) );
  NOR2BX1 U271 ( .AN(cur_A[0]), .B(n411), .Y(n213) );
  ADDFXL U272 ( .A(cur_A[1]), .B(n369), .CI(n213), .CO(n218), .S(n347) );
  AOI2BB1X1 U273 ( .A0N(step_size[0]), .A1N(cur_A[0]), .B0(n213), .Y(n350) );
  AOI222XL U274 ( .A0(n347), .A1(n424), .B0(n347), .B1(n214), .C0(n424), .C1(
        n214), .Y(n215) );
  NOR2BX1 U275 ( .AN(n343), .B(n215), .Y(n217) );
  NOR2BX1 U276 ( .AN(n215), .B(n343), .Y(n216) );
  NOR2XL U277 ( .A(n217), .B(n216), .Y(n226) );
  AOI2BB2X1 U278 ( .B0(n219), .B1(cur_A[3]), .A0N(n219), .A1N(cur_A[3]), .Y(
        n345) );
  NOR2XL U279 ( .A(n343), .B(n425), .Y(n220) );
  NOR2XL U280 ( .A(origin[3]), .B(n220), .Y(n223) );
  NAND2XL U281 ( .A(n219), .B(cur_A[3]), .Y(n222) );
  AOI22XL U282 ( .A0(origin[3]), .A1(n220), .B0(n345), .B1(n223), .Y(n221) );
  OAI211XL U283 ( .A0(n345), .A1(n223), .B0(n222), .C0(n221), .Y(n225) );
  NOR2XL U284 ( .A(origin[2]), .B(n226), .Y(n224) );
  AOI211XL U285 ( .A0(origin[2]), .A1(n226), .B0(n225), .C0(n224), .Y(n325) );
  NOR2XL U286 ( .A(cur_state[0]), .B(n325), .Y(n342) );
  NAND2X1 U287 ( .A(n431), .B(n421), .Y(n374) );
  NOR2X1 U288 ( .A(n419), .B(n374), .Y(n340) );
  NAND2X1 U289 ( .A(n342), .B(n340), .Y(n415) );
  NOR2XL U290 ( .A(n411), .B(n427), .Y(n315) );
  AO21X1 U291 ( .A0(n411), .A1(n427), .B0(n315), .Y(n313) );
  OAI22XL U292 ( .A0(n417), .A1(n427), .B0(n415), .B1(n313), .Y(n195) );
  NOR3X1 U293 ( .A(cur_state[2]), .B(cur_state[3]), .C(n370), .Y(n390) );
  NAND2X1 U294 ( .A(n419), .B(cur_state[0]), .Y(n395) );
  INVXL U295 ( .A(n390), .Y(n238) );
  NOR2X1 U296 ( .A(n238), .B(n391), .Y(n400) );
  NAND2X1 U297 ( .A(n390), .B(n234), .Y(n268) );
  NOR2X1 U298 ( .A(i_op_mode[3]), .B(n398), .Y(n246) );
  NOR2X1 U299 ( .A(i_op_mode[1]), .B(i_op_mode[0]), .Y(n399) );
  NAND2X1 U300 ( .A(n246), .B(n399), .Y(n264) );
  NOR2X1 U301 ( .A(origin[0]), .B(n411), .Y(n257) );
  AOI2BB2X1 U302 ( .B0(n257), .B1(n227), .A0N(n289), .A1N(origin[1]), .Y(n259)
         );
  OAI22XL U303 ( .A0(step_size[0]), .A1(n289), .B0(n411), .B1(n369), .Y(n274)
         );
  OAI21XL U304 ( .A0(n274), .A1(n424), .B0(n228), .Y(n230) );
  NOR2XL U305 ( .A(step_size[0]), .B(n369), .Y(n365) );
  NOR2X1 U306 ( .A(n365), .B(n428), .Y(n276) );
  OAI32X1 U307 ( .A0(n230), .A1(origin[2]), .A2(n276), .B0(n229), .B1(
        origin[3]), .Y(n231) );
  NAND2X1 U308 ( .A(step_size[2]), .B(n231), .Y(n260) );
  AND2X1 U309 ( .A(n231), .B(n369), .Y(n245) );
  NAND2XL U310 ( .A(step_size[0]), .B(n231), .Y(n254) );
  NOR2XL U311 ( .A(n423), .B(n254), .Y(n253) );
  AOI2BB1X1 U312 ( .A0N(n425), .A1N(n260), .B0(n262), .Y(n232) );
  AOI211XL U313 ( .A0(n425), .A1(n260), .B0(n232), .C0(n264), .Y(n233) );
  OAI22XL U314 ( .A0(n251), .A1(n243), .B0(origin[3]), .B1(n233), .Y(n235) );
  INVXL U315 ( .A(i_op_mode[1]), .Y(n283) );
  NAND2XL U316 ( .A(i_op_mode[3]), .B(n283), .Y(n377) );
  AOI211X1 U317 ( .A0(n377), .A1(n376), .B0(cur_state[2]), .C0(cur_state[3]), 
        .Y(n285) );
  OAI2BB2XL U318 ( .B0(n268), .B1(n235), .A0N(origin[3]), .A1N(n244), .Y(n204)
         );
  NAND2XL U319 ( .A(i_op_mode[3]), .B(n399), .Y(n242) );
  INVXL U320 ( .A(i_op_mode[0]), .Y(n375) );
  OAI21XL U321 ( .A0(n428), .A1(n242), .B0(n236), .Y(n237) );
  NOR2BX1 U322 ( .AN(n285), .B(n237), .Y(n412) );
  OAI22XL U323 ( .A0(n428), .A1(n410), .B0(n411), .B1(n242), .Y(n240) );
  OAI2BB2XL U324 ( .B0(n412), .B1(n289), .A0N(n241), .A1N(n240), .Y(n208) );
  NAND2XL U325 ( .A(n369), .B(n241), .Y(n409) );
  OAI22XL U326 ( .A0(n412), .A1(n428), .B0(n242), .B1(n409), .Y(n210) );
  NOR2XL U327 ( .A(origin[3]), .B(n243), .Y(n247) );
  AOI21X1 U328 ( .A0(n247), .A1(i_op_mode[0]), .B0(n244), .Y(n267) );
  ADDFXL U329 ( .A(origin[1]), .B(n245), .CI(n253), .CO(n262), .S(n250) );
  NOR2X1 U330 ( .A(n247), .B(n272), .Y(n265) );
  OAI22XL U331 ( .A0(n369), .A1(n424), .B0(n289), .B1(origin[1]), .Y(n248) );
  AOI2BB2X1 U332 ( .B0(n257), .B1(n248), .A0N(n257), .A1N(n248), .Y(n249) );
  AOI22XL U333 ( .A0(n251), .A1(n250), .B0(n265), .B1(n249), .Y(n252) );
  OAI22XL U334 ( .A0(n267), .A1(n424), .B0(n252), .B1(n268), .Y(n206) );
  NOR2XL U335 ( .A(step_size[0]), .B(n423), .Y(n256) );
  AOI211XL U336 ( .A0(n423), .A1(n254), .B0(n253), .C0(n264), .Y(n255) );
  AOI211XL U337 ( .A0(n265), .A1(n257), .B0(n256), .C0(n255), .Y(n258) );
  OAI22XL U338 ( .A0(n267), .A1(n423), .B0(n258), .B1(n268), .Y(n207) );
  ADDFXL U339 ( .A(origin[2]), .B(n428), .CI(n259), .CO(n243), .S(n266) );
  AOI2BB2X1 U340 ( .B0(origin[2]), .B1(n260), .A0N(origin[2]), .A1N(n260), .Y(
        n261) );
  AOI2BB2X1 U341 ( .B0(n262), .B1(n261), .A0N(n262), .A1N(n261), .Y(n263) );
  AOI2BB2X1 U342 ( .B0(n266), .B1(n265), .A0N(n264), .A1N(n263), .Y(n269) );
  OAI22XL U343 ( .A0(n269), .A1(n268), .B0(n267), .B1(n425), .Y(n205) );
  NOR2X1 U344 ( .A(origin[4]), .B(n411), .Y(n308) );
  NAND2XL U345 ( .A(origin[5]), .B(n289), .Y(n270) );
  AOI2BB2X1 U346 ( .B0(n308), .B1(n270), .A0N(n289), .A1N(origin[5]), .Y(n271)
         );
  ADDFXL U347 ( .A(origin[6]), .B(n428), .CI(n271), .CO(n298), .S(n281) );
  NOR2XL U348 ( .A(origin[7]), .B(n298), .Y(n286) );
  NOR3X1 U349 ( .A(i_op_mode[0]), .B(n286), .C(n376), .Y(n309) );
  OAI211XL U351 ( .A0(origin[5]), .A1(n289), .B0(origin[4]), .C0(n411), .Y(
        n273) );
  OAI21XL U352 ( .A0(n274), .A1(n420), .B0(n273), .Y(n277) );
  AND3X1 U353 ( .A(origin[6]), .B(n276), .C(n277), .Y(n275) );
  NAND2XL U354 ( .A(step_size[0]), .B(n278), .Y(n305) );
  NOR2XL U355 ( .A(n426), .B(n305), .Y(n304) );
  NAND2X1 U356 ( .A(step_size[2]), .B(n278), .Y(n296) );
  AOI2BB2X1 U357 ( .B0(origin[6]), .B1(n296), .A0N(origin[6]), .A1N(n296), .Y(
        n279) );
  AOI2BB2X1 U358 ( .B0(n294), .B1(n279), .A0N(n294), .A1N(n279), .Y(n280) );
  AOI2BB2X1 U359 ( .B0(n281), .B1(n309), .A0N(n272), .A1N(n280), .Y(n287) );
  NAND2X1 U360 ( .A(n390), .B(n284), .Y(n310) );
  AOI21X1 U361 ( .A0(n375), .A1(n286), .B0(n300), .Y(n312) );
  OAI22XL U362 ( .A0(n287), .A1(n310), .B0(n312), .B1(n429), .Y(n201) );
  ADDFXL U363 ( .A(origin[5]), .B(n288), .CI(n304), .CO(n294), .S(n292) );
  OAI22XL U364 ( .A0(n369), .A1(n420), .B0(n289), .B1(origin[5]), .Y(n290) );
  AOI2BB2X1 U365 ( .B0(n308), .B1(n290), .A0N(n308), .A1N(n290), .Y(n291) );
  AOI22XL U366 ( .A0(n299), .A1(n292), .B0(n309), .B1(n291), .Y(n293) );
  OAI22XL U367 ( .A0(n312), .A1(n420), .B0(n293), .B1(n310), .Y(n202) );
  AOI2BB1X1 U368 ( .A0N(n429), .A1N(n296), .B0(n294), .Y(n295) );
  AOI211XL U369 ( .A0(n429), .A1(n296), .B0(n295), .C0(n272), .Y(n297) );
  OAI22XL U370 ( .A0(n299), .A1(n298), .B0(origin[7]), .B1(n297), .Y(n301) );
  OAI2BB2XL U371 ( .B0(n310), .B1(n301), .A0N(origin[7]), .A1N(n300), .Y(n200)
         );
  NOR2XL U372 ( .A(step_size[0]), .B(n426), .Y(n307) );
  AOI211XL U373 ( .A0(n426), .A1(n305), .B0(n304), .C0(n272), .Y(n306) );
  AOI211XL U374 ( .A0(n309), .A1(n308), .B0(n307), .C0(n306), .Y(n311) );
  OAI22XL U375 ( .A0(n312), .A1(n426), .B0(n311), .B1(n310), .Y(n203) );
  NOR2XL U376 ( .A(n374), .B(n395), .Y(o_op_ready_w) );
  NOR3X1 U377 ( .A(n370), .B(n421), .C(n419), .Y(n211) );
  NAND2XL U378 ( .A(origin[4]), .B(n313), .Y(n314) );
  AOI222XL U379 ( .A0(n413), .A1(n420), .B0(n413), .B1(n314), .C0(n420), .C1(
        n314), .Y(n317) );
  ADDFXL U380 ( .A(cur_A[5]), .B(n369), .CI(n315), .CO(n318), .S(n413) );
  INVXL U381 ( .A(n319), .Y(n414) );
  OAI22XL U382 ( .A0(origin[6]), .A1(n414), .B0(n429), .B1(n319), .Y(n316) );
  AOI2BB2X1 U383 ( .B0(n317), .B1(n316), .A0N(n317), .A1N(n316), .Y(n328) );
  ADDFXL U384 ( .A(cur_A[6]), .B(step_size[2]), .CI(n318), .CO(n320), .S(n319)
         );
  AOI2BB2X1 U385 ( .B0(cur_A[7]), .B1(n320), .A0N(cur_A[7]), .A1N(n320), .Y(
        n416) );
  NOR2XL U386 ( .A(n319), .B(n429), .Y(n321) );
  NOR2XL U387 ( .A(origin[7]), .B(n321), .Y(n324) );
  NAND2XL U388 ( .A(cur_A[7]), .B(n320), .Y(n323) );
  AOI22XL U389 ( .A0(origin[7]), .A1(n321), .B0(n416), .B1(n324), .Y(n322) );
  OAI211XL U390 ( .A0(n416), .A1(n324), .B0(n323), .C0(n322), .Y(n327) );
  INVXL U391 ( .A(n325), .Y(n326) );
  OAI21XL U392 ( .A0(n328), .A1(n327), .B0(n326), .Y(n380) );
  NOR2X1 U393 ( .A(n421), .B(n384), .Y(n389) );
  INVXL U394 ( .A(n389), .Y(n341) );
  OAI22XL U395 ( .A0(cur_A[5]), .A1(n420), .B0(n426), .B1(cur_A[4]), .Y(n329)
         );
  OAI2BB1XL U396 ( .A0N(n420), .A1N(cur_A[5]), .B0(n329), .Y(n330) );
  NOR2XL U397 ( .A(cur_A[6]), .B(n330), .Y(n333) );
  NOR2XL U398 ( .A(origin[7]), .B(n333), .Y(n335) );
  AOI2BB2X1 U399 ( .B0(n430), .B1(n330), .A0N(n430), .A1N(n330), .Y(n331) );
  AOI2BB2X1 U400 ( .B0(origin[6]), .B1(n331), .A0N(origin[6]), .A1N(n331), .Y(
        n332) );
  AOI221XL U401 ( .A0(n333), .A1(origin[7]), .B0(cur_A[7]), .B1(n335), .C0(
        n332), .Y(n334) );
  NOR2XL U402 ( .A(n341), .B(n388), .Y(n404) );
  AOI211X1 U403 ( .A0(n340), .A1(n380), .B0(n404), .C0(n211), .Y(n337) );
  NOR2XL U404 ( .A(count_out[0]), .B(n337), .Y(count_out_next[0]) );
  NAND2X1 U405 ( .A(count_out[0]), .B(count_out[1]), .Y(n364) );
  NOR2X1 U406 ( .A(n364), .B(n432), .Y(n363) );
  AOI211XL U407 ( .A0(n364), .A1(n432), .B0(n337), .C0(n363), .Y(
        count_out_next[2]) );
  NOR2XL U408 ( .A(n363), .B(count_out[3]), .Y(n336) );
  INVXL U409 ( .A(n337), .Y(n338) );
  OAI211XL U410 ( .A0(count_out[0]), .A1(count_out[1]), .B0(n364), .C0(n338), 
        .Y(n339) );
  INVXL U411 ( .A(n339), .Y(count_out_next[1]) );
  NOR2X1 U412 ( .A(n340), .B(n389), .Y(n351) );
  INVXL U413 ( .A(n340), .Y(n381) );
  OAI21X1 U414 ( .A0(n342), .A1(n381), .B0(n341), .Y(n349) );
  AOI222XL U415 ( .A0(n351), .A1(cur_A[2]), .B0(n343), .B1(n349), .C0(
        origin[2]), .C1(n417), .Y(n344) );
  INVXL U416 ( .A(n344), .Y(n197) );
  AOI222XL U417 ( .A0(n351), .A1(cur_A[3]), .B0(n345), .B1(n349), .C0(
        origin[3]), .C1(n417), .Y(n346) );
  AOI222XL U418 ( .A0(n351), .A1(cur_A[1]), .B0(n347), .B1(n349), .C0(
        origin[1]), .C1(n417), .Y(n348) );
  INVXL U419 ( .A(n348), .Y(n198) );
  AOI222XL U420 ( .A0(n351), .A1(cur_A[0]), .B0(n350), .B1(n349), .C0(
        origin[0]), .C1(n417), .Y(n352) );
  INVXL U421 ( .A(n352), .Y(n199) );
  NOR2XL U422 ( .A(n384), .B(cur_state[2]), .Y(n408) );
  NOR2XL U423 ( .A(n435), .B(n353), .Y(sram_i_A_w[7]) );
  NOR2XL U424 ( .A(n422), .B(n353), .Y(sram_i_A_w[0]) );
  NOR2XL U425 ( .A(n433), .B(n353), .Y(sram_i_A_w[3]) );
  NOR2XL U426 ( .A(n434), .B(n353), .Y(sram_i_A_w[5]) );
  NOR2XL U427 ( .A(count_load[0]), .B(n353), .Y(count_load_next[0]) );
  NOR2BX1 U428 ( .AN(count_load[6]), .B(n353), .Y(sram_i_A_w[6]) );
  NOR2BX1 U429 ( .AN(count_load[2]), .B(n353), .Y(sram_i_A_w[2]) );
  NOR2BX1 U430 ( .AN(count_load[4]), .B(n353), .Y(sram_i_A_w[4]) );
  NAND3XL U431 ( .A(count_load[2]), .B(count_load[1]), .C(count_load[0]), .Y(
        n362) );
  NOR2X1 U432 ( .A(n433), .B(n362), .Y(n361) );
  NAND2XL U433 ( .A(count_load[4]), .B(n361), .Y(n360) );
  OAI21XL U434 ( .A0(count_load[4]), .A1(n361), .B0(n360), .Y(n354) );
  NOR2XL U435 ( .A(n353), .B(n354), .Y(count_load_next[4]) );
  NOR2XL U436 ( .A(n436), .B(n422), .Y(n358) );
  OAI21XL U437 ( .A0(count_load[2]), .A1(n358), .B0(n362), .Y(n355) );
  NOR2XL U438 ( .A(n353), .B(n355), .Y(count_load_next[2]) );
  NOR2X1 U439 ( .A(n434), .B(n360), .Y(n359) );
  NAND2XL U440 ( .A(count_load[6]), .B(n359), .Y(n357) );
  OAI21XL U441 ( .A0(count_load[6]), .A1(n359), .B0(n357), .Y(n356) );
  NOR2XL U442 ( .A(n353), .B(n356), .Y(count_load_next[6]) );
  NOR2XL U443 ( .A(n435), .B(n357), .Y(n385) );
  AOI211XL U444 ( .A0(n435), .A1(n357), .B0(n385), .C0(n353), .Y(
        count_load_next[7]) );
  AOI211XL U445 ( .A0(n436), .A1(n422), .B0(n358), .C0(n353), .Y(
        count_load_next[1]) );
  AOI211XL U446 ( .A0(n434), .A1(n360), .B0(n359), .C0(n353), .Y(
        count_load_next[5]) );
  AOI211XL U447 ( .A0(n433), .A1(n362), .B0(n361), .C0(n353), .Y(
        count_load_next[3]) );
  AOI211XL U448 ( .A0(i_op_mode[1]), .A1(i_op_mode[0]), .B0(n399), .C0(n401), 
        .Y(n373) );
  NOR4X1 U449 ( .A(n418), .B(n431), .C(n421), .D(n419), .Y(n396) );
  NAND2XL U450 ( .A(n363), .B(count_out[3]), .Y(n368) );
  OAI31XL U451 ( .A0(count_out[2]), .A1(count_out[3]), .A2(n364), .B0(n411), 
        .Y(n366) );
  AOI211XL U452 ( .A0(n369), .A1(n366), .B0(step_size[2]), .C0(n365), .Y(n367)
         );
  OAI21XL U453 ( .A0(n369), .A1(n368), .B0(n367), .Y(n405) );
  AOI211XL U454 ( .A0(cur_state[3]), .A1(n405), .B0(n370), .C0(n421), .Y(n371)
         );
  NOR2XL U455 ( .A(n396), .B(n371), .Y(n379) );
  NAND2XL U456 ( .A(n389), .B(n388), .Y(n372) );
  NAND4BX1 U457 ( .AN(n373), .B(n379), .C(n381), .D(n372), .Y(next_state[3])
         );
  NOR2XL U458 ( .A(cur_state[3]), .B(n374), .Y(sram_i_CEN_w) );
  NOR2XL U459 ( .A(n398), .B(n375), .Y(n378) );
  OAI21XL U460 ( .A0(n378), .A1(n377), .B0(n376), .Y(n392) );
  NOR2XL U461 ( .A(n421), .B(n395), .Y(n382) );
  OAI21XL U462 ( .A0(n381), .A1(n380), .B0(n379), .Y(n386) );
  INVXL U463 ( .A(n383), .Y(next_state[2]) );
  AOI211XL U464 ( .A0(i_in_valid), .A1(n385), .B0(cur_state[2]), .C0(n384), 
        .Y(n387) );
  AOI211XL U465 ( .A0(n389), .A1(n388), .B0(n387), .C0(n386), .Y(n394) );
  OAI31XL U466 ( .A0(n399), .A1(n392), .A2(n391), .B0(n390), .Y(n393) );
  OAI211XL U467 ( .A0(cur_state[1]), .A1(n395), .B0(n394), .C0(n393), .Y(
        next_state[1]) );
  NOR3XL U468 ( .A(cur_state[1]), .B(n421), .C(n395), .Y(n397) );
  AOI211XL U469 ( .A0(sram_i_CEN_w), .A1(n418), .B0(n397), .C0(n396), .Y(n407)
         );
  NAND3XL U470 ( .A(n400), .B(n399), .C(n398), .Y(n402) );
  OAI22XL U471 ( .A0(i_op_mode[3]), .A1(n402), .B0(i_op_mode[0]), .B1(n401), 
        .Y(n403) );
  AOI211XL U472 ( .A0(n211), .A1(n405), .B0(n404), .C0(n403), .Y(n406) );
  NAND3BX1 U473 ( .AN(n408), .B(n407), .C(n406), .Y(next_state[0]) );
  OAI22XL U474 ( .A0(n412), .A1(n411), .B0(n410), .B1(n409), .Y(n209) );
  AO22X1 U475 ( .A0(n417), .A1(n413), .B0(n415), .B1(cur_A[5]), .Y(n194) );
  OAI22XL U476 ( .A0(n415), .A1(n414), .B0(n417), .B1(n430), .Y(n193) );
  AO22X1 U477 ( .A0(n417), .A1(n416), .B0(n415), .B1(cur_A[7]), .Y(n192) );
  DFFSX2 step_size_reg_0_ ( .D(n209), .CK(i_clk), .SN(n438), .Q(step_size[0])
         );
  CLKINVX1 U248 ( .A(n272), .Y(n299) );
  NAND2X1 U256 ( .A(i_op_mode[0]), .B(n246), .Y(n272) );
endmodule

