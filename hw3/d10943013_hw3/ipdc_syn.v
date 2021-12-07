/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Tue Dec  7 02:57:58 2021
/////////////////////////////////////////////////////////////


module ipdc ( i_clk, i_rst_n, i_op_valid, i_op_mode, o_op_ready, i_in_valid, 
        i_in_data, o_in_ready, o_out_valid, o_out_data );
  input [3:0] i_op_mode;
  input [23:0] i_in_data;
  output [23:0] o_out_data;
  input i_clk, i_rst_n, i_op_valid, i_in_valid;
  output o_op_ready, o_in_ready, o_out_valid;
  wire   sram_i_CEN, sram_i_WEN, sram_i_CEN_w, sram_i_WEN_w, N129, N130, N131,
         N132, N133, N134, N135, N136, N143, N144, N145, N146, N162, N163,
         N164, N165, N227, N228, N229, N230, N247, N248, N249, N251, N258,
         N259, N260, N261, N262, N265, N266, N267, N269, N311, N312, N313,
         N315, N372, N373, N374, N375, N376, N377, N378, N379, r571_A_3_,
         r571_A_2_, r571_A_1_, r571_A_0_, n1330, n1340, n147, n148, n149, n150,
         n151, n152, n154, n156, n158, n159, n161, n1620, n1630, n1640, n1650,
         n166, n167, n168, n169, n170, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n2270, n2280,
         n2290, n2300, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n2470, n2480, n2490, n250,
         n2510, n252, n253, n254, n255, n256, n257, n2580, n2590, n2600, n2610,
         n2620, n263, n264, n2650, n2660, n2670, n268, n2690, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, N514, N513, N512, N517, N516, N515, N125, N124, N123,
         N122, N121, N157, N1560, N155, N1540, sub_325_A_4_,
         add_1_root_add_0_root_add_188_2_carry_2_,
         add_0_root_add_0_root_add_164_2_carry_4_,
         add_1_root_add_0_root_add_164_2_carry_2_,
         add_1_root_add_0_root_add_164_2_carry_3_, n308, n309, n310, n3110,
         n3120, n3130, n314, n3150, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n3720, n3730, n3740, n3750, n3760,
         n3770, n3780, n3790, n380, n381, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
         SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
         SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15,
         SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17,
         SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19,
         SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21,
         SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23,
         SYNOPSYS_UNCONNECTED_24;
  wire   [7:0] sram_i_A;
  wire   [2:0] step_size;
  wire   [7:0] origin;
  wire   [7:0] cur_A;
  wire   [3:0] cur_state;
  wire   [3:0] count_out;
  wire   [7:0] count_load;
  wire   [7:0] sram_i_A_w;
  wire   [7:0] count_load_next;
  wire   [3:0] count_out_next;
  wire   [3:0] next_state;
  wire   [4:2] sub_325_carry;
  wire   [4:2] sub_291_carry;
  wire   [3:1] sub_181_carry;
  wire   [3:1] sub_174_carry;
  wire   [4:2] r573_carry;
  wire   [3:1] r572_carry;
  wire   [4:2] sub_305_carry;
  wire   [3:1] r565_carry;

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
  ipdc_DW01_inc_0_DW01_inc_1 add_371 ( .A(count_load), .SUM({N379, N378, N377, 
        N376, N375, N374, N373, N372}) );
  DFFRX1 count_load_reg_7_ ( .D(count_load_next[7]), .CK(i_clk), .RN(n324), 
        .Q(count_load[7]), .QN(n161) );
  DFFRX1 count_load_reg_6_ ( .D(count_load_next[6]), .CK(i_clk), .RN(n325), 
        .Q(count_load[6]), .QN(n1620) );
  DFFRX1 count_load_reg_5_ ( .D(count_load_next[5]), .CK(i_clk), .RN(n324), 
        .Q(count_load[5]), .QN(n1630) );
  DFFRX1 count_load_reg_4_ ( .D(count_load_next[4]), .CK(i_clk), .RN(n325), 
        .Q(count_load[4]), .QN(n1640) );
  DFFRX1 count_load_reg_3_ ( .D(count_load_next[3]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[3]), .QN(n1650) );
  DFFRX1 count_load_reg_2_ ( .D(count_load_next[2]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[2]), .QN(n166) );
  DFFRX1 cur_state_reg_1_ ( .D(next_state[1]), .CK(i_clk), .RN(n324), .Q(
        cur_state[1]), .QN(n148) );
  DFFRX1 count_out_reg_2_ ( .D(count_out_next[2]), .CK(i_clk), .RN(n324), .Q(
        count_out[2]), .QN(n170) );
  DFFRX1 count_out_reg_3_ ( .D(count_out_next[3]), .CK(i_clk), .RN(n324), .Q(
        count_out[3]), .QN(n169) );
  DFFRX1 count_load_reg_0_ ( .D(count_load_next[0]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[0]), .QN(n168) );
  DFFRX1 count_load_reg_1_ ( .D(count_load_next[1]), .CK(i_clk), .RN(i_rst_n), 
        .Q(count_load[1]), .QN(n167) );
  DFFRX1 count_out_reg_1_ ( .D(count_out_next[1]), .CK(i_clk), .RN(n324), .Q(
        count_out[1]) );
  DFFRX1 count_out_reg_0_ ( .D(count_out_next[0]), .CK(i_clk), .RN(n324), .Q(
        count_out[0]) );
  DFFRX1 cur_state_reg_0_ ( .D(next_state[0]), .CK(i_clk), .RN(n324), .Q(
        cur_state[0]), .QN(n149) );
  DFFRX1 cur_state_reg_2_ ( .D(n347), .CK(i_clk), .RN(n325), .Q(cur_state[2]), 
        .QN(n147) );
  DFFRX1 origin_reg_2_ ( .D(n302), .CK(i_clk), .RN(i_rst_n), .Q(origin[2]), 
        .QN(n158) );
  DFFRX1 origin_reg_6_ ( .D(n298), .CK(i_clk), .RN(n325), .Q(origin[6]), .QN(
        n154) );
  DFFRX1 cur_A_reg_3_ ( .D(n289), .CK(i_clk), .RN(i_rst_n), .Q(cur_A[3]) );
  DFFRX1 cur_A_reg_6_ ( .D(n294), .CK(i_clk), .RN(n325), .Q(cur_A[6]), .QN(
        n1330) );
  DFFRX1 cur_A_reg_2_ ( .D(n290), .CK(i_clk), .RN(i_rst_n), .Q(cur_A[2]) );
  DFFRX1 step_size_reg_2_ ( .D(n305), .CK(i_clk), .RN(n325), .Q(step_size[2]), 
        .QN(n150) );
  DFFRX1 cur_A_reg_5_ ( .D(n295), .CK(i_clk), .RN(n325), .Q(cur_A[5]), .QN(
        n1340) );
  DFFRX1 cur_A_reg_1_ ( .D(n291), .CK(i_clk), .RN(i_rst_n), .Q(cur_A[1]) );
  DFFRX1 step_size_reg_1_ ( .D(n307), .CK(i_clk), .RN(n325), .Q(step_size[1]), 
        .QN(n151) );
  DFFRX1 cur_A_reg_4_ ( .D(n296), .CK(i_clk), .RN(n324), .Q(cur_A[4]) );
  DFFRX1 cur_A_reg_0_ ( .D(n292), .CK(i_clk), .RN(n324), .Q(cur_A[0]) );
  DFFSX1 step_size_reg_0_ ( .D(n306), .CK(i_clk), .SN(n325), .Q(step_size[0]), 
        .QN(n152) );
  DFFRX1 sram_i_A_r_reg_1_ ( .D(sram_i_A_w[1]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[1]) );
  DFFRX1 sram_i_A_r_reg_2_ ( .D(sram_i_A_w[2]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[2]) );
  DFFRX1 sram_i_A_r_reg_3_ ( .D(sram_i_A_w[3]), .CK(i_clk), .RN(n324), .Q(
        sram_i_A[3]) );
  DFFRX1 sram_i_A_r_reg_4_ ( .D(sram_i_A_w[4]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[4]) );
  DFFRX1 sram_i_A_r_reg_5_ ( .D(sram_i_A_w[5]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[5]) );
  DFFRX1 sram_i_A_r_reg_6_ ( .D(sram_i_A_w[6]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[6]) );
  DFFRX1 sram_i_A_r_reg_7_ ( .D(sram_i_A_w[7]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[7]) );
  DFFRX1 sram_i_A_r_reg_0_ ( .D(sram_i_A_w[0]), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_A[0]) );
  DFFRX1 sram_i_CEN_r_reg ( .D(sram_i_CEN_w), .CK(i_clk), .RN(n325), .Q(
        sram_i_CEN) );
  DFFRX1 sram_i_WEN_r_reg ( .D(sram_i_WEN_w), .CK(i_clk), .RN(i_rst_n), .Q(
        sram_i_WEN) );
  DFFRX1 cur_state_reg_3_ ( .D(next_state[3]), .CK(i_clk), .RN(n324), .Q(
        cur_state[3]) );
  DFFRX1 cur_A_reg_7_ ( .D(n293), .CK(i_clk), .RN(n325), .Q(cur_A[7]) );
  DFFRX1 origin_reg_1_ ( .D(n303), .CK(i_clk), .RN(i_rst_n), .Q(origin[1]), 
        .QN(n159) );
  DFFRX1 o_in_ready_r_reg ( .D(1'b1), .CK(i_clk), .RN(n324), .Q(o_in_ready) );
  DFFRX1 o_out_valid_r_reg ( .D(n366), .CK(i_clk), .RN(n324), .Q(o_out_valid)
         );
  DFFRX1 o_op_ready_r_reg ( .D(n365), .CK(i_clk), .RN(n324), .Q(o_op_ready) );
  DFFRX1 origin_reg_3_ ( .D(n301), .CK(i_clk), .RN(i_rst_n), .Q(origin[3]), 
        .QN(n336) );
  DFFRX1 origin_reg_7_ ( .D(n297), .CK(i_clk), .RN(n325), .Q(origin[7]), .QN(
        n340) );
  DFFRX1 origin_reg_5_ ( .D(n299), .CK(i_clk), .RN(n325), .Q(origin[5]), .QN(
        n369) );
  DFFRX1 origin_reg_4_ ( .D(n300), .CK(i_clk), .RN(n325), .Q(origin[4]), .QN(
        n156) );
  DFFRX2 origin_reg_0_ ( .D(n304), .CK(i_clk), .RN(n325), .Q(origin[0]), .QN(
        N121) );
  NOR2X1 U200 ( .A(N262), .B(r573_carry[4]), .Y(n308) );
  NOR2X1 U201 ( .A(sub_325_A_4_), .B(sub_305_carry[4]), .Y(n309) );
  NOR2X1 U202 ( .A(sub_325_A_4_), .B(sub_325_carry[4]), .Y(n310) );
  OR2X1 U203 ( .A(n321), .B(n371), .Y(n3110) );
  XNOR2X1 U204 ( .A(N125), .B(add_0_root_add_0_root_add_164_2_carry_4_), .Y(
        n3120) );
  OR2X1 U205 ( .A(origin[2]), .B(n3770), .Y(n3130) );
  ADDFXL U206 ( .A(cur_A[1]), .B(n323), .CI(r565_carry[1]), .CO(r565_carry[2]), 
        .S(r571_A_1_) );
  NOR2X1 U207 ( .A(origin[3]), .B(sub_174_carry[3]), .Y(n314) );
  NOR2X1 U208 ( .A(origin[7]), .B(sub_181_carry[3]), .Y(n3150) );
  XNOR2XL U209 ( .A(origin[4]), .B(n152), .Y(N143) );
  XOR2XL U210 ( .A(origin[3]), .B(add_1_root_add_0_root_add_164_2_carry_3_), 
        .Y(N124) );
  CLKINVX1 U211 ( .A(i_op_mode[2]), .Y(n358) );
  NAND3X1 U212 ( .A(i_op_mode[3]), .B(n358), .C(n2300), .Y(n218) );
  ADDFXL U213 ( .A(cur_A[5]), .B(n323), .CI(r572_carry[1]), .CO(r572_carry[2]), 
        .S(N259) );
  ADDFXL U214 ( .A(cur_A[6]), .B(n322), .CI(r572_carry[2]), .CO(r572_carry[3]), 
        .S(N260) );
  NOR2X1 U215 ( .A(cur_state[2]), .B(cur_state[3]), .Y(n221) );
  NOR2X1 U216 ( .A(n244), .B(n357), .Y(n215) );
  NOR2X1 U217 ( .A(n356), .B(n253), .Y(n214) );
  CLKINVX1 U218 ( .A(n190), .Y(n347) );
  AOI211X1 U219 ( .A0(n191), .A1(n354), .B0(n363), .C0(n192), .Y(n190) );
  AOI211X1 U220 ( .A0(n367), .A1(n238), .B0(n364), .C0(n363), .Y(n232) );
  INVX3 U221 ( .A(n240), .Y(n348) );
  CLKINVX1 U222 ( .A(n179), .Y(n362) );
  CLKINVX1 U223 ( .A(n184), .Y(n363) );
  NOR3X1 U224 ( .A(n367), .B(n363), .C(n364), .Y(n234) );
  NAND2X1 U225 ( .A(n180), .B(n181), .Y(sram_i_CEN_w) );
  CLKINVX1 U226 ( .A(n180), .Y(n365) );
  AOI211X1 U227 ( .A0(n357), .A1(n3150), .B0(n215), .C0(n320), .Y(n241) );
  NOR3BX2 U228 ( .AN(n2490), .B(n360), .C(n359), .Y(n244) );
  CLKINVX1 U229 ( .A(n2480), .Y(n357) );
  NAND4X1 U230 ( .A(n214), .B(n215), .C(n216), .D(n217), .Y(n191) );
  AND2X2 U231 ( .A(n218), .B(n219), .Y(n216) );
  NAND4X1 U232 ( .A(n193), .B(n180), .C(n194), .D(n195), .Y(next_state[1]) );
  AOI2BB1X1 U233 ( .A0N(n184), .A1N(n183), .B0(n192), .Y(n195) );
  OAI21XL U234 ( .A0(n361), .A1(n222), .B0(n362), .Y(n193) );
  OAI31XL U235 ( .A0(n191), .A1(n212), .A2(n353), .B0(n213), .Y(n194) );
  AOI211X1 U236 ( .A0(n356), .A1(n314), .B0(n214), .C0(n320), .Y(n250) );
  AND2X2 U237 ( .A(n2300), .B(n2490), .Y(n253) );
  CLKINVX1 U238 ( .A(n257), .Y(n356) );
  AOI21X1 U239 ( .A0(n218), .A1(n219), .B0(n2600), .Y(n2580) );
  NAND2X1 U240 ( .A(n188), .B(n358), .Y(n219) );
  NOR2X1 U241 ( .A(n2480), .B(n3150), .Y(n243) );
  NOR2X1 U242 ( .A(n257), .B(n314), .Y(n252) );
  CLKINVX1 U243 ( .A(n320), .Y(n354) );
  NOR3BXL U244 ( .AN(n217), .B(n212), .C(n189), .Y(n2280) );
  OAI211X1 U245 ( .A0(n184), .A1(n368), .B0(n223), .C0(n224), .Y(next_state[0]) );
  NOR4BX1 U246 ( .AN(n181), .B(n203), .C(n362), .D(n200), .Y(n224) );
  AOI2BB2X1 U247 ( .B0(n366), .B1(n2270), .A0N(n2280), .A1N(n320), .Y(n223) );
  OAI22XL U248 ( .A0(n209), .A1(n211), .B0(n231), .B1(n210), .Y(n2270) );
  AND3X2 U249 ( .A(n2300), .B(n358), .C(n355), .Y(n212) );
  NAND2BX2 U250 ( .AN(n319), .B(n222), .Y(n286) );
  NOR2BX1 U251 ( .AN(N378), .B(n286), .Y(count_load_next[6]) );
  NOR2BX1 U252 ( .AN(N377), .B(n286), .Y(count_load_next[5]) );
  NOR2BX1 U253 ( .AN(N376), .B(n286), .Y(count_load_next[4]) );
  NOR2BX1 U254 ( .AN(N375), .B(n286), .Y(count_load_next[3]) );
  NOR2BX1 U255 ( .AN(N374), .B(n286), .Y(count_load_next[2]) );
  NOR2BX1 U256 ( .AN(N373), .B(n286), .Y(count_load_next[1]) );
  CLKINVX1 U257 ( .A(n2650), .Y(n346) );
  OAI211X1 U258 ( .A0(n199), .A1(n239), .B0(n207), .C0(n2660), .Y(n2650) );
  AOI2BB2X1 U259 ( .B0(n197), .B1(n367), .A0N(n368), .A1N(n184), .Y(n2660) );
  NOR2X1 U260 ( .A(n274), .B(N251), .Y(n238) );
  NAND2BX1 U261 ( .AN(n238), .B(n273), .Y(n197) );
  OAI211X1 U262 ( .A0(n196), .A1(n197), .B0(n185), .C0(n198), .Y(n192) );
  AOI21X1 U263 ( .A0(n199), .A1(n364), .B0(n200), .Y(n198) );
  OA21XL U264 ( .A0(n274), .A1(N315), .B0(n273), .Y(n199) );
  NOR2X1 U265 ( .A(n196), .B(n238), .Y(n240) );
  CLKINVX1 U266 ( .A(r571_A_1_), .Y(n337) );
  CLKINVX1 U267 ( .A(N259), .Y(n341) );
  OAI21X1 U268 ( .A0(n3730), .A1(n369), .B0(n3740), .Y(n371) );
  OAI2BB1X1 U269 ( .A0N(n3730), .A1N(n369), .B0(N516), .Y(n3740) );
  AO22X1 U270 ( .A0(n3110), .A1(N517), .B0(n371), .B1(n321), .Y(n370) );
  AND2X2 U271 ( .A(n318), .B(n316), .Y(N515) );
  OAI21X1 U272 ( .A0(n3790), .A1(n159), .B0(n380), .Y(n3770) );
  OAI2BB1X1 U273 ( .A0N(n3790), .A1N(n159), .B0(N513), .Y(n380) );
  AND2X2 U274 ( .A(n318), .B(n3120), .Y(N512) );
  AO22X1 U275 ( .A0(n3130), .A1(N514), .B0(n3770), .B1(origin[2]), .Y(n3760)
         );
  AND2X2 U276 ( .A(n323), .B(n316), .Y(N516) );
  AND2X2 U277 ( .A(n323), .B(n3120), .Y(N513) );
  AND2X2 U278 ( .A(n316), .B(n322), .Y(N517) );
  CLKINVX1 U279 ( .A(n183), .Y(n368) );
  AND2X2 U280 ( .A(n3120), .B(n322), .Y(N514) );
  CLKINVX1 U281 ( .A(r571_A_3_), .Y(n349) );
  CLKINVX1 U282 ( .A(r571_A_2_), .Y(n350) );
  CLKINVX1 U283 ( .A(N260), .Y(n352) );
  ADDFXL U284 ( .A(origin[2]), .B(n150), .CI(sub_174_carry[2]), .CO(
        sub_174_carry[3]), .S(N135) );
  ADDFXL U285 ( .A(n321), .B(n150), .CI(sub_181_carry[2]), .CO(
        sub_181_carry[3]), .S(N145) );
  AND2X2 U286 ( .A(n202), .B(n221), .Y(n213) );
  NAND2X1 U287 ( .A(n221), .B(n225), .Y(n179) );
  NAND2X1 U288 ( .A(n201), .B(n225), .Y(n184) );
  CLKINVX1 U289 ( .A(n196), .Y(n367) );
  CLKINVX1 U290 ( .A(n239), .Y(n364) );
  AND2X2 U291 ( .A(n201), .B(n220), .Y(n200) );
  NAND2X1 U292 ( .A(n226), .B(n221), .Y(n181) );
  NAND2X1 U293 ( .A(n220), .B(n221), .Y(n180) );
  CLKINVX1 U294 ( .A(n207), .Y(n366) );
  NOR2X1 U295 ( .A(n358), .B(i_op_mode[3]), .Y(n2490) );
  OAI22XL U296 ( .A0(n241), .A1(n369), .B0(n246), .B1(n320), .Y(n299) );
  AOI22X1 U297 ( .A0(N144), .A1(n243), .B0(N163), .B1(n244), .Y(n246) );
  XOR2X1 U298 ( .A(n3730), .B(n3750), .Y(N163) );
  XOR2X1 U299 ( .A(n369), .B(N516), .Y(n3750) );
  OAI22XL U300 ( .A0(n241), .A1(n154), .B0(n245), .B1(n320), .Y(n298) );
  AOI22X1 U301 ( .A0(N145), .A1(n243), .B0(N164), .B1(n244), .Y(n245) );
  XNOR2X1 U302 ( .A(n3720), .B(n371), .Y(N164) );
  XNOR2X1 U303 ( .A(n321), .B(N517), .Y(n3720) );
  OAI22XL U304 ( .A0(n241), .A1(n340), .B0(n242), .B1(n320), .Y(n297) );
  AOI22X1 U305 ( .A0(N146), .A1(n243), .B0(N165), .B1(n244), .Y(n242) );
  XOR2X1 U306 ( .A(n370), .B(origin[7]), .Y(N165) );
  OAI22XL U307 ( .A0(n241), .A1(n156), .B0(n2470), .B1(n320), .Y(n300) );
  AOI22X1 U308 ( .A0(N143), .A1(n243), .B0(N162), .B1(n244), .Y(n2470) );
  XOR2X1 U309 ( .A(N515), .B(origin[4]), .Y(N162) );
  NAND3X1 U310 ( .A(i_op_mode[1]), .B(n360), .C(n2490), .Y(n2480) );
  OAI22XL U311 ( .A0(n250), .A1(n159), .B0(n255), .B1(n320), .Y(n303) );
  AOI22X1 U312 ( .A0(N134), .A1(n252), .B0(N130), .B1(n253), .Y(n255) );
  XOR2X1 U313 ( .A(n3790), .B(n381), .Y(N130) );
  XOR2X1 U314 ( .A(n159), .B(N513), .Y(n381) );
  OAI22XL U315 ( .A0(n250), .A1(n158), .B0(n254), .B1(n320), .Y(n302) );
  AOI22X1 U316 ( .A0(N135), .A1(n252), .B0(N131), .B1(n253), .Y(n254) );
  XNOR2X1 U317 ( .A(n3780), .B(n3770), .Y(N131) );
  XNOR2X1 U318 ( .A(origin[2]), .B(N514), .Y(n3780) );
  OAI22XL U319 ( .A0(n250), .A1(n336), .B0(n2510), .B1(n320), .Y(n301) );
  AOI22X1 U320 ( .A0(N136), .A1(n252), .B0(N132), .B1(n253), .Y(n2510) );
  XOR2X1 U321 ( .A(n3760), .B(origin[3]), .Y(N132) );
  OAI22XL U322 ( .A0(n250), .A1(N121), .B0(n256), .B1(n320), .Y(n304) );
  AOI22X1 U323 ( .A0(N133), .A1(n252), .B0(N129), .B1(n253), .Y(n256) );
  XOR2X1 U324 ( .A(N512), .B(origin[0]), .Y(N129) );
  NAND3X1 U325 ( .A(i_op_mode[0]), .B(n359), .C(n2490), .Y(n257) );
  CLKINVX1 U326 ( .A(i_op_mode[1]), .Y(n359) );
  CLKINVX1 U327 ( .A(i_op_mode[0]), .Y(n360) );
  OAI221X1 U328 ( .A0(n152), .A1(n219), .B0(n218), .B1(n150), .C0(n354), .Y(
        n2600) );
  OAI22XL U329 ( .A0(n2580), .A1(n151), .B0(n2610), .B1(n2600), .Y(n307) );
  OA22X1 U330 ( .A0(n152), .A1(n218), .B0(n150), .B1(n219), .Y(n2610) );
  NOR3X1 U331 ( .A(n355), .B(i_op_mode[1]), .C(n360), .Y(n188) );
  OAI22XL U332 ( .A0(n2580), .A1(n150), .B0(n218), .B1(n2590), .Y(n305) );
  NOR2X1 U333 ( .A(i_op_mode[0]), .B(i_op_mode[1]), .Y(n2300) );
  CLKINVX1 U334 ( .A(i_op_mode[3]), .Y(n355) );
  OAI22XL U335 ( .A0(n2580), .A1(n152), .B0(n219), .B1(n2590), .Y(n306) );
  OR2X1 U336 ( .A(n2600), .B(n151), .Y(n2590) );
  CLKBUFX3 U337 ( .A(n2290), .Y(n320) );
  NAND2X1 U338 ( .A(i_op_valid), .B(n213), .Y(n2290) );
  NOR4X1 U339 ( .A(n355), .B(n358), .C(n359), .D(i_op_mode[0]), .Y(n189) );
  OAI211X1 U340 ( .A0(n183), .A1(n184), .B0(n185), .C0(n186), .Y(next_state[3]) );
  AOI211X1 U341 ( .A0(n354), .A1(n187), .B0(n367), .C0(n364), .Y(n186) );
  AO21X1 U342 ( .A0(i_op_mode[2]), .A1(n188), .B0(n189), .Y(n187) );
  NAND3X1 U343 ( .A(i_op_mode[3]), .B(i_op_mode[2]), .C(n2300), .Y(n217) );
  NOR2BX1 U344 ( .AN(N379), .B(n286), .Y(count_load_next[7]) );
  NOR2BX1 U345 ( .AN(N372), .B(n286), .Y(count_load_next[0]) );
  CLKBUFX3 U346 ( .A(n182), .Y(n319) );
  NAND2X1 U347 ( .A(i_in_valid), .B(n362), .Y(n182) );
  CLKINVX1 U348 ( .A(i_op_valid), .Y(n353) );
  NOR2X1 U349 ( .A(n319), .B(n168), .Y(sram_i_A_w[0]) );
  NOR2X1 U350 ( .A(n319), .B(n1640), .Y(sram_i_A_w[4]) );
  NOR2X1 U351 ( .A(n319), .B(n1630), .Y(sram_i_A_w[5]) );
  NOR2X1 U352 ( .A(n319), .B(n167), .Y(sram_i_A_w[1]) );
  NOR2X1 U353 ( .A(n319), .B(n1620), .Y(sram_i_A_w[6]) );
  NOR2X1 U354 ( .A(n319), .B(n166), .Y(sram_i_A_w[2]) );
  NOR2X1 U355 ( .A(n319), .B(n161), .Y(sram_i_A_w[7]) );
  NOR2X1 U356 ( .A(n319), .B(n1650), .Y(sram_i_A_w[3]) );
  CLKINVX1 U357 ( .A(i_in_valid), .Y(n361) );
  OAI22XL U358 ( .A0(i_in_valid), .A1(n179), .B0(sram_i_CEN_w), .B1(n362), .Y(
        sram_i_WEN_w) );
  NOR2X1 U359 ( .A(count_out[0]), .B(n346), .Y(count_out_next[0]) );
  ADDFXL U360 ( .A(r571_A_3_), .B(n336), .CI(sub_305_carry[3]), .CO(
        sub_305_carry[4]), .S(N248) );
  CLKBUFX3 U361 ( .A(step_size[0]), .Y(n318) );
  ADDFXL U362 ( .A(r571_A_2_), .B(n158), .CI(sub_305_carry[2]), .CO(
        sub_305_carry[3]), .S(N247) );
  NOR2X1 U363 ( .A(n346), .B(n2620), .Y(count_out_next[3]) );
  XNOR2X1 U364 ( .A(count_out[3]), .B(n208), .Y(n2620) );
  NOR2X1 U365 ( .A(n346), .B(n263), .Y(count_out_next[2]) );
  XNOR2X1 U366 ( .A(n210), .B(n170), .Y(n263) );
  NOR2X1 U367 ( .A(n346), .B(n264), .Y(count_out_next[1]) );
  XNOR2X1 U368 ( .A(count_out[0]), .B(count_out[1]), .Y(n264) );
  OAI221XL U369 ( .A0(n336), .A1(n348), .B0(n232), .B1(n349), .C0(n233), .Y(
        n289) );
  NAND2X1 U370 ( .A(cur_A[3]), .B(n234), .Y(n233) );
  OAI221XL U371 ( .A0(n159), .A1(n348), .B0(n232), .B1(n337), .C0(n236), .Y(
        n291) );
  NAND2X1 U372 ( .A(cur_A[1]), .B(n234), .Y(n236) );
  OAI221XL U373 ( .A0(n158), .A1(n348), .B0(n232), .B1(n350), .C0(n235), .Y(
        n290) );
  NAND2X1 U374 ( .A(cur_A[2]), .B(n234), .Y(n235) );
  OAI221XL U375 ( .A0(N121), .A1(n348), .B0(n232), .B1(n351), .C0(n237), .Y(
        n292) );
  NAND2X1 U376 ( .A(cur_A[0]), .B(n234), .Y(n237) );
  CLKINVX1 U377 ( .A(r571_A_0_), .Y(n351) );
  ADDFXL U378 ( .A(r571_A_3_), .B(n336), .CI(sub_325_carry[3]), .CO(
        sub_325_carry[4]), .S(N312) );
  ADDFXL U379 ( .A(r571_A_2_), .B(n158), .CI(sub_325_carry[2]), .CO(
        sub_325_carry[3]), .S(N311) );
  AO21X1 U380 ( .A0(n275), .A1(n276), .B0(N269), .Y(n273) );
  NAND2X1 U381 ( .A(N261), .B(n340), .Y(n275) );
  OAI21XL U382 ( .A0(N261), .A1(n340), .B0(n277), .Y(n276) );
  ADDFXL U383 ( .A(N261), .B(n340), .CI(r573_carry[3]), .CO(r573_carry[4]), 
        .S(N266) );
  ADDFXL U384 ( .A(N260), .B(n154), .CI(r573_carry[2]), .CO(r573_carry[3]), 
        .S(N265) );
  AO22X1 U385 ( .A0(n348), .A1(cur_A[7]), .B0(N261), .B1(n240), .Y(n293) );
  AO22X1 U386 ( .A0(n348), .A1(cur_A[4]), .B0(n240), .B1(N258), .Y(n296) );
  OAI22XL U387 ( .A0(n240), .A1(n1330), .B0(n352), .B1(n348), .Y(n294) );
  OAI22XL U388 ( .A0(n240), .A1(n1340), .B0(n341), .B1(n348), .Y(n295) );
  ADDFX2 U389 ( .A(cur_A[2]), .B(n322), .CI(r565_carry[2]), .CO(r565_carry[3]), 
        .S(r571_A_2_) );
  AOI21X1 U390 ( .A0(n333), .A1(origin[7]), .B0(n317), .Y(n316) );
  OA21XL U391 ( .A0(origin[7]), .A1(n333), .B0(N157), .Y(n317) );
  NAND2X1 U392 ( .A(N515), .B(origin[4]), .Y(n3730) );
  CLKBUFX3 U393 ( .A(step_size[1]), .Y(n323) );
  NAND2X1 U394 ( .A(N512), .B(origin[0]), .Y(n3790) );
  CLKBUFX3 U395 ( .A(step_size[2]), .Y(n322) );
  AOI21X1 U396 ( .A0(n2670), .A1(n268), .B0(N230), .Y(n183) );
  NAND2X1 U397 ( .A(cur_A[7]), .B(n340), .Y(n2670) );
  OAI21XL U398 ( .A0(cur_A[7]), .A1(n340), .B0(n2690), .Y(n268) );
  ADDFXL U399 ( .A(cur_A[6]), .B(n154), .CI(sub_291_carry[2]), .CO(
        sub_291_carry[3]), .S(N227) );
  ADDFXL U400 ( .A(cur_A[7]), .B(n340), .CI(sub_291_carry[3]), .CO(
        sub_291_carry[4]), .S(N228) );
  OA21XL U401 ( .A0(origin[3]), .A1(n349), .B0(n281), .Y(n274) );
  OAI21XL U402 ( .A0(r571_A_3_), .A1(n336), .B0(n282), .Y(n281) );
  OAI21XL U403 ( .A0(origin[2]), .A1(n350), .B0(n283), .Y(n282) );
  OAI21XL U404 ( .A0(r571_A_2_), .A1(n158), .B0(n284), .Y(n283) );
  CLKBUFX3 U405 ( .A(origin[6]), .Y(n321) );
  OAI21XL U406 ( .A0(origin[1]), .A1(n337), .B0(n285), .Y(n284) );
  OAI22XL U407 ( .A0(r571_A_1_), .A1(n159), .B0(r571_A_0_), .B1(N121), .Y(n285) );
  OAI21XL U408 ( .A0(n321), .A1(n352), .B0(n278), .Y(n277) );
  OAI21XL U409 ( .A0(N260), .A1(n154), .B0(n279), .Y(n278) );
  OAI21XL U410 ( .A0(origin[5]), .A1(n341), .B0(n280), .Y(n279) );
  OAI22XL U411 ( .A0(N259), .A1(n369), .B0(N258), .B1(n156), .Y(n280) );
  ADDFXL U412 ( .A(origin[1]), .B(n151), .CI(sub_174_carry[1]), .CO(
        sub_174_carry[2]), .S(N134) );
  ADDFXL U413 ( .A(origin[5]), .B(n151), .CI(sub_181_carry[1]), .CO(
        sub_181_carry[2]), .S(N144) );
  OAI21XL U414 ( .A0(n321), .A1(n1330), .B0(n270), .Y(n2690) );
  OAI21XL U415 ( .A0(cur_A[6]), .A1(n154), .B0(n271), .Y(n270) );
  OAI21XL U416 ( .A0(origin[5]), .A1(n1340), .B0(n272), .Y(n271) );
  OAI22XL U417 ( .A0(cur_A[5]), .A1(n369), .B0(cur_A[4]), .B1(n156), .Y(n272)
         );
  NOR2X1 U418 ( .A(n148), .B(cur_state[0]), .Y(n202) );
  NAND2X1 U419 ( .A(count_out[1]), .B(count_out[0]), .Y(n210) );
  NOR2X1 U420 ( .A(n170), .B(n210), .Y(n208) );
  AOI211X1 U421 ( .A0(n201), .A1(n202), .B0(n203), .C0(n204), .Y(n185) );
  AOI21X1 U422 ( .A0(n205), .A1(n206), .B0(n207), .Y(n204) );
  OAI31XL U423 ( .A0(n210), .A1(count_out[3]), .A2(count_out[2]), .B0(n211), 
        .Y(n205) );
  OAI2BB1X1 U424 ( .A0N(n208), .A1N(count_out[3]), .B0(n209), .Y(n206) );
  NOR3X1 U425 ( .A(n318), .B(n322), .C(n151), .Y(n211) );
  NOR3X1 U426 ( .A(n323), .B(n322), .C(n152), .Y(n209) );
  NOR2X1 U427 ( .A(n147), .B(cur_state[3]), .Y(n201) );
  NAND3X1 U428 ( .A(cur_state[2]), .B(cur_state[3]), .C(n202), .Y(n207) );
  NAND3X1 U429 ( .A(n226), .B(n147), .C(cur_state[3]), .Y(n196) );
  NOR2X1 U430 ( .A(cur_state[0]), .B(cur_state[1]), .Y(n226) );
  AND3X2 U431 ( .A(cur_state[3]), .B(n225), .C(cur_state[2]), .Y(n203) );
  NAND3X1 U432 ( .A(n220), .B(n147), .C(cur_state[3]), .Y(n239) );
  NOR2X1 U433 ( .A(n149), .B(cur_state[1]), .Y(n220) );
  AOI33X1 U434 ( .A0(n170), .A1(n169), .A2(n211), .B0(count_out[3]), .B1(
        count_out[2]), .B2(n209), .Y(n231) );
  NOR2X1 U435 ( .A(n148), .B(n149), .Y(n225) );
  NAND2X1 U436 ( .A(n287), .B(n288), .Y(n222) );
  NOR4X1 U437 ( .A(n1650), .B(n166), .C(n167), .D(n168), .Y(n287) );
  NOR4X1 U438 ( .A(n161), .B(n1620), .C(n1630), .D(n1640), .Y(n288) );
  CLKBUFX3 U439 ( .A(i_rst_n), .Y(n325) );
  CLKBUFX3 U440 ( .A(i_rst_n), .Y(n324) );
  AND2X1 U441 ( .A(add_1_root_add_0_root_add_164_2_carry_3_), .B(origin[3]), 
        .Y(N125) );
  AND2X1 U442 ( .A(add_1_root_add_0_root_add_164_2_carry_2_), .B(origin[2]), 
        .Y(add_1_root_add_0_root_add_164_2_carry_3_) );
  XOR2X1 U443 ( .A(origin[2]), .B(add_1_root_add_0_root_add_164_2_carry_2_), 
        .Y(N123) );
  OR2X1 U444 ( .A(origin[1]), .B(origin[0]), .Y(
        add_1_root_add_0_root_add_164_2_carry_2_) );
  XNOR2X1 U445 ( .A(origin[0]), .B(origin[1]), .Y(N122) );
  XNOR2X1 U446 ( .A(sub_174_carry[3]), .B(origin[3]), .Y(N136) );
  OR2X1 U447 ( .A(n152), .B(origin[0]), .Y(sub_174_carry[1]) );
  XNOR2X1 U448 ( .A(origin[0]), .B(N1540), .Y(N133) );
  AND2X1 U449 ( .A(add_1_root_add_0_root_add_188_2_carry_2_), .B(n322), .Y(
        N157) );
  XOR2X1 U450 ( .A(n322), .B(add_1_root_add_0_root_add_188_2_carry_2_), .Y(
        N1560) );
  OR2X1 U451 ( .A(n323), .B(n318), .Y(add_1_root_add_0_root_add_188_2_carry_2_) );
  XNOR2X1 U452 ( .A(n318), .B(n323), .Y(N155) );
  XNOR2X1 U453 ( .A(sub_181_carry[3]), .B(origin[7]), .Y(N146) );
  OR2X1 U454 ( .A(n152), .B(origin[4]), .Y(sub_181_carry[1]) );
  XNOR2X1 U455 ( .A(sub_305_carry[4]), .B(sub_325_A_4_), .Y(N249) );
  XNOR2X1 U456 ( .A(r573_carry[4]), .B(N262), .Y(N267) );
  AND2X1 U457 ( .A(r572_carry[3]), .B(cur_A[7]), .Y(N262) );
  XOR2X1 U458 ( .A(cur_A[7]), .B(r572_carry[3]), .Y(N261) );
  AND2X1 U459 ( .A(cur_A[4]), .B(n318), .Y(r572_carry[1]) );
  XOR2X1 U460 ( .A(n318), .B(cur_A[4]), .Y(N258) );
  XNOR2X1 U461 ( .A(sub_325_carry[4]), .B(sub_325_A_4_), .Y(N313) );
  AND2X1 U462 ( .A(r565_carry[3]), .B(cur_A[3]), .Y(sub_325_A_4_) );
  XOR2X1 U463 ( .A(cur_A[3]), .B(r565_carry[3]), .Y(r571_A_3_) );
  AND2X1 U464 ( .A(n318), .B(cur_A[0]), .Y(r565_carry[1]) );
  XOR2X1 U465 ( .A(n318), .B(cur_A[0]), .Y(r571_A_0_) );
  OAI211X1 U466 ( .A0(n323), .A1(N122), .B0(n318), .C0(N121), .Y(n326) );
  OAI2BB1X1 U467 ( .A0N(n323), .A1N(N122), .B0(n326), .Y(n328) );
  OAI21XL U468 ( .A0(n322), .A1(n328), .B0(N123), .Y(n327) );
  OAI2BB1X1 U469 ( .A0N(n328), .A1N(n322), .B0(n327), .Y(n329) );
  AND2X1 U470 ( .A(N124), .B(n329), .Y(
        add_0_root_add_0_root_add_164_2_carry_4_) );
  CLKINVX1 U471 ( .A(n318), .Y(N1540) );
  OAI211X1 U472 ( .A0(origin[5]), .A1(N155), .B0(origin[4]), .C0(N1540), .Y(
        n330) );
  OAI2BB1X1 U473 ( .A0N(origin[5]), .A1N(N155), .B0(n330), .Y(n332) );
  OAI21XL U474 ( .A0(n321), .A1(n332), .B0(N1560), .Y(n331) );
  OAI2BB1X1 U475 ( .A0N(n332), .A1N(n321), .B0(n331), .Y(n333) );
  NOR2BX1 U476 ( .AN(origin[0]), .B(r571_A_0_), .Y(n335) );
  AND2X1 U477 ( .A(n335), .B(n337), .Y(n334) );
  OAI22XL U478 ( .A0(n335), .A1(n337), .B0(origin[1]), .B1(n334), .Y(
        sub_305_carry[2]) );
  NOR2BX1 U479 ( .AN(origin[4]), .B(N258), .Y(n339) );
  AND2X1 U480 ( .A(n339), .B(n341), .Y(n338) );
  OAI22XL U481 ( .A0(n339), .A1(n341), .B0(origin[5]), .B1(n338), .Y(
        r573_carry[2]) );
  CLKINVX1 U482 ( .A(sub_291_carry[4]), .Y(N229) );
  NOR2BX1 U483 ( .AN(origin[4]), .B(cur_A[4]), .Y(n343) );
  AND2X1 U484 ( .A(n343), .B(n1340), .Y(n342) );
  OAI22XL U485 ( .A0(n343), .A1(n1340), .B0(origin[5]), .B1(n342), .Y(
        sub_291_carry[2]) );
  NOR2BX1 U486 ( .AN(origin[0]), .B(r571_A_0_), .Y(n345) );
  AND2X1 U487 ( .A(n345), .B(n337), .Y(n344) );
  OAI22XL U488 ( .A0(n345), .A1(n337), .B0(origin[1]), .B1(n344), .Y(
        sub_325_carry[2]) );
  OR4X1 U489 ( .A(N248), .B(N247), .C(n309), .D(N249), .Y(N251) );
  OR4X1 U490 ( .A(N266), .B(N265), .C(n308), .D(N267), .Y(N269) );
  OR3X1 U491 ( .A(N229), .B(N228), .C(N227), .Y(N230) );
  OR4X1 U492 ( .A(N312), .B(N311), .C(n310), .D(N313), .Y(N315) );
endmodule


module ipdc_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule

