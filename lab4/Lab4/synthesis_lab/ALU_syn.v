/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Tue Nov  9 17:43:29 2021
/////////////////////////////////////////////////////////////


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:0] carry;

  XOR3X1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .Y(DIFF[7]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n8), .CI(n1), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  OR2X1 U1 ( .A(A[0]), .B(n9), .Y(n1) );
  CLKINVX1 U2 ( .A(B[6]), .Y(n3) );
  CLKINVX1 U3 ( .A(B[5]), .Y(n4) );
  CLKINVX1 U4 ( .A(B[4]), .Y(n5) );
  CLKINVX1 U5 ( .A(B[3]), .Y(n6) );
  CLKINVX1 U6 ( .A(B[2]), .Y(n7) );
  CLKINVX1 U7 ( .A(B[1]), .Y(n8) );
  CLKINVX1 U8 ( .A(B[7]), .Y(n2) );
  CLKINVX1 U9 ( .A(B[0]), .Y(n9) );
  XNOR2X1 U10 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU ( alu_out, instruction, inputA, inputB, clk, reset );
  output [7:0] alu_out;
  input [3:0] instruction;
  input [7:0] inputA;
  input [7:0] inputB;
  input clk, reset;
  wire   N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52,
         N53, N54, n5, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69;
  wire   [7:0] reg_A;
  wire   [7:0] reg_B;
  wire   [3:0] reg_ins;
  wire   [7:0] X;

  ALU_DW01_sub_0 sub_43 ( .A(reg_A), .B(reg_B), .CI(1'b0), .DIFF({N54, N53, 
        N52, N51, N50, N49, N48, N47}) );
  ALU_DW01_add_0 add_42 ( .A(reg_A), .B(reg_B), .CI(1'b0), .SUM({N46, N45, N44, 
        N43, N42, N41, N40, N39}) );
  DFFRX1 \reg_A_reg[7]  ( .D(inputA[7]), .CK(clk), .RN(n67), .Q(reg_A[7]), 
        .QN(n16) );
  DFFRX1 \reg_ins_reg[0]  ( .D(instruction[0]), .CK(clk), .RN(n68), .Q(
        reg_ins[0]), .QN(n15) );
  DFFRX1 \reg_B_reg[7]  ( .D(inputB[7]), .CK(clk), .RN(reset), .Q(reg_B[7]), 
        .QN(n5) );
  DFFRX1 \reg_ins_reg[1]  ( .D(instruction[1]), .CK(clk), .RN(n68), .Q(
        reg_ins[1]) );
  DFFRX1 \reg_ins_reg[2]  ( .D(instruction[2]), .CK(clk), .RN(n68), .Q(
        reg_ins[2]), .QN(n14) );
  DFFRX1 \reg_A_reg[6]  ( .D(inputA[6]), .CK(clk), .RN(n67), .Q(reg_A[6]), 
        .QN(n17) );
  DFFRX1 \reg_B_reg[6]  ( .D(inputB[6]), .CK(clk), .RN(reset), .Q(reg_B[6]), 
        .QN(n6) );
  DFFRX1 \reg_B_reg[5]  ( .D(inputB[5]), .CK(clk), .RN(reset), .Q(reg_B[5]), 
        .QN(n7) );
  DFFRX1 \reg_A_reg[5]  ( .D(inputA[5]), .CK(clk), .RN(n67), .Q(reg_A[5]), 
        .QN(n18) );
  DFFRX1 \reg_B_reg[4]  ( .D(inputB[4]), .CK(clk), .RN(reset), .Q(reg_B[4]), 
        .QN(n8) );
  DFFRX1 \reg_A_reg[4]  ( .D(inputA[4]), .CK(clk), .RN(n67), .Q(reg_A[4]), 
        .QN(n19) );
  DFFRX1 \reg_A_reg[3]  ( .D(inputA[3]), .CK(clk), .RN(n67), .Q(reg_A[3]), 
        .QN(n20) );
  DFFRX1 \reg_B_reg[3]  ( .D(inputB[3]), .CK(clk), .RN(n68), .Q(reg_B[3]), 
        .QN(n9) );
  DFFRX1 \reg_B_reg[2]  ( .D(inputB[2]), .CK(clk), .RN(n68), .Q(reg_B[2]), 
        .QN(n10) );
  DFFRX1 \reg_A_reg[2]  ( .D(inputA[2]), .CK(clk), .RN(n67), .Q(reg_A[2]), 
        .QN(n21) );
  DFFRX1 \reg_A_reg[1]  ( .D(inputA[1]), .CK(clk), .RN(n67), .Q(reg_A[1]), 
        .QN(n22) );
  DFFRX1 \reg_B_reg[0]  ( .D(inputB[0]), .CK(clk), .RN(n68), .Q(reg_B[0]), 
        .QN(n12) );
  DFFRX1 \reg_B_reg[1]  ( .D(inputB[1]), .CK(clk), .RN(n68), .Q(reg_B[1]), 
        .QN(n11) );
  DFFRX1 \reg_A_reg[0]  ( .D(inputA[0]), .CK(clk), .RN(n67), .Q(reg_A[0]), 
        .QN(n23) );
  DFFRX1 \reg_ins_reg[3]  ( .D(instruction[3]), .CK(clk), .RN(n68), .Q(
        reg_ins[3]), .QN(n64) );
  DFFRX1 \alu_out_reg[1]  ( .D(X[1]), .CK(clk), .RN(n66), .Q(alu_out[1]) );
  DFFRX1 \alu_out_reg[2]  ( .D(X[2]), .CK(clk), .RN(n66), .Q(alu_out[2]) );
  DFFRX1 \alu_out_reg[3]  ( .D(X[3]), .CK(clk), .RN(n66), .Q(alu_out[3]) );
  DFFRX1 \alu_out_reg[4]  ( .D(X[4]), .CK(clk), .RN(n66), .Q(alu_out[4]) );
  DFFRX1 \alu_out_reg[5]  ( .D(X[5]), .CK(clk), .RN(n66), .Q(alu_out[5]) );
  DFFRX1 \alu_out_reg[6]  ( .D(X[6]), .CK(clk), .RN(n66), .Q(alu_out[6]) );
  DFFRX1 \alu_out_reg[7]  ( .D(X[7]), .CK(clk), .RN(n66), .Q(alu_out[7]) );
  DFFRX1 \alu_out_reg[0]  ( .D(X[0]), .CK(clk), .RN(n66), .Q(alu_out[0]) );
  CLKBUFX3 U53 ( .A(n27), .Y(n63) );
  CLKINVX1 U54 ( .A(n64), .Y(n65) );
  NOR2X1 U55 ( .A(reg_ins[2]), .B(reg_ins[3]), .Y(n27) );
  NOR3X1 U56 ( .A(reg_ins[1]), .B(reg_ins[2]), .C(n15), .Y(n29) );
  CLKINVX1 U57 ( .A(n27), .Y(n69) );
  OAI21XL U58 ( .A0(reg_ins[3]), .A1(n24), .B0(n25), .Y(X[7]) );
  AOI32X1 U59 ( .A0(n69), .A1(n5), .A2(reg_A[7]), .B0(reg_B[7]), .B1(n26), .Y(
        n25) );
  AOI221XL U60 ( .A0(N54), .A1(n29), .B0(N46), .B1(n30), .C0(n31), .Y(n24) );
  OAI21XL U61 ( .A0(reg_A[7]), .A1(n27), .B0(n28), .Y(n26) );
  OAI21XL U62 ( .A0(reg_ins[3]), .A1(n34), .B0(n35), .Y(X[6]) );
  AOI32X1 U63 ( .A0(n69), .A1(n17), .A2(reg_B[6]), .B0(reg_A[6]), .B1(n36), 
        .Y(n35) );
  AOI221XL U64 ( .A0(N53), .A1(n29), .B0(N45), .B1(n30), .C0(n37), .Y(n34) );
  OAI21XL U65 ( .A0(reg_B[6]), .A1(n27), .B0(n28), .Y(n36) );
  OAI21XL U66 ( .A0(reg_ins[3]), .A1(n38), .B0(n39), .Y(X[5]) );
  AOI32X1 U67 ( .A0(n69), .A1(n7), .A2(reg_A[5]), .B0(reg_B[5]), .B1(n40), .Y(
        n39) );
  AOI221XL U68 ( .A0(N52), .A1(n29), .B0(N44), .B1(n30), .C0(n41), .Y(n38) );
  OAI21XL U69 ( .A0(reg_A[5]), .A1(n27), .B0(n28), .Y(n40) );
  OAI21XL U70 ( .A0(reg_ins[3]), .A1(n42), .B0(n43), .Y(X[4]) );
  AOI32X1 U71 ( .A0(n69), .A1(n8), .A2(reg_A[4]), .B0(reg_B[4]), .B1(n44), .Y(
        n43) );
  AOI221XL U72 ( .A0(N51), .A1(n29), .B0(N43), .B1(n30), .C0(n45), .Y(n42) );
  OAI21XL U73 ( .A0(reg_A[4]), .A1(n27), .B0(n28), .Y(n44) );
  OAI21XL U74 ( .A0(reg_ins[3]), .A1(n46), .B0(n47), .Y(X[3]) );
  AOI32X1 U75 ( .A0(n69), .A1(n20), .A2(reg_B[3]), .B0(reg_A[3]), .B1(n48), 
        .Y(n47) );
  AOI221XL U76 ( .A0(N50), .A1(n29), .B0(N42), .B1(n30), .C0(n49), .Y(n46) );
  OAI21XL U77 ( .A0(reg_B[3]), .A1(n27), .B0(n28), .Y(n48) );
  OAI21XL U78 ( .A0(reg_ins[3]), .A1(n50), .B0(n51), .Y(X[2]) );
  AOI32X1 U79 ( .A0(n69), .A1(n10), .A2(reg_A[2]), .B0(reg_B[2]), .B1(n52), 
        .Y(n51) );
  AOI221XL U80 ( .A0(N49), .A1(n29), .B0(N41), .B1(n30), .C0(n53), .Y(n50) );
  OAI21XL U81 ( .A0(reg_A[2]), .A1(n27), .B0(n28), .Y(n52) );
  OAI21XL U82 ( .A0(n65), .A1(n58), .B0(n59), .Y(X[0]) );
  AOI221XL U83 ( .A0(N47), .A1(n29), .B0(N39), .B1(n30), .C0(n62), .Y(n58) );
  AOI32X1 U84 ( .A0(n69), .A1(n12), .A2(reg_A[0]), .B0(reg_B[0]), .B1(n60), 
        .Y(n59) );
  OAI21XL U85 ( .A0(n65), .A1(n54), .B0(n55), .Y(X[1]) );
  AOI221XL U86 ( .A0(N48), .A1(n29), .B0(N40), .B1(n30), .C0(n57), .Y(n54) );
  AOI32X1 U87 ( .A0(n69), .A1(n22), .A2(reg_B[1]), .B0(reg_A[1]), .B1(n56), 
        .Y(n55) );
  OAI32X1 U88 ( .A0(n11), .A1(n32), .A2(n22), .B0(reg_B[1]), .B1(n33), .Y(n57)
         );
  NAND3BX1 U89 ( .AN(reg_ins[3]), .B(n61), .C(reg_ins[2]), .Y(n28) );
  OAI21XL U90 ( .A0(reg_A[0]), .A1(n63), .B0(n28), .Y(n60) );
  OAI21XL U91 ( .A0(reg_B[1]), .A1(n63), .B0(n28), .Y(n56) );
  NAND3X1 U92 ( .A(reg_ins[0]), .B(n14), .C(reg_ins[1]), .Y(n32) );
  OAI32X1 U93 ( .A0(n12), .A1(n32), .A2(n23), .B0(reg_B[0]), .B1(n33), .Y(n62)
         );
  OAI32X1 U94 ( .A0(n6), .A1(n32), .A2(n17), .B0(reg_B[6]), .B1(n33), .Y(n37)
         );
  OAI32X1 U95 ( .A0(n7), .A1(n32), .A2(n18), .B0(reg_B[5]), .B1(n33), .Y(n41)
         );
  OAI32X1 U96 ( .A0(n8), .A1(n32), .A2(n19), .B0(reg_B[4]), .B1(n33), .Y(n45)
         );
  OAI32X1 U97 ( .A0(n9), .A1(n32), .A2(n20), .B0(reg_B[3]), .B1(n33), .Y(n49)
         );
  OAI32X1 U98 ( .A0(n10), .A1(n32), .A2(n21), .B0(reg_B[2]), .B1(n33), .Y(n53)
         );
  OAI32X1 U99 ( .A0(n32), .A1(n16), .A2(n5), .B0(reg_B[7]), .B1(n33), .Y(n31)
         );
  NAND3X1 U100 ( .A(n15), .B(n14), .C(reg_ins[1]), .Y(n33) );
  NOR2X1 U101 ( .A(reg_ins[1]), .B(reg_ins[0]), .Y(n61) );
  AND2X2 U102 ( .A(n61), .B(n14), .Y(n30) );
  CLKBUFX3 U103 ( .A(reset), .Y(n66) );
  CLKBUFX3 U104 ( .A(reset), .Y(n67) );
  CLKBUFX3 U105 ( .A(reset), .Y(n68) );
endmodule

