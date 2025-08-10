/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Oct 14 14:10:24 2024
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module fsm_test_1 ( clk, rstn, data_valid, par_en, ser_done, ser_en, mux_sel, 
        busy, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input clk, rstn, data_valid, par_en, ser_done, test_si, test_se;
  output ser_en, busy, test_so;
  wire   n20, n9, n10, n11, n12, n4, n5, n8, n16, n17, n18, n19, n24;
  wire   [2:0] curent_state;
  wire   [2:0] next_state;
  assign test_so = n4;

  SDFFRX2M \curent_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(rstn), .Q(curent_state[0]), .QN(n18) );
  INVXLM U7 ( .A(n20), .Y(n5) );
  INVX4M U8 ( .A(n5), .Y(busy) );
  OAI211X1M U9 ( .A0(curent_state[0]), .A1(n8), .B0(n12), .C0(n17), .Y(n20) );
  CLKINVX2M U11 ( .A(curent_state[1]), .Y(n8) );
  NAND3X3M U12 ( .A(curent_state[0]), .B(n4), .C(curent_state[1]), .Y(n9) );
  NAND3XLM U14 ( .A(n8), .B(n4), .C(data_valid), .Y(n11) );
  CLKNAND2X2M U15 ( .A(curent_state[0]), .B(n4), .Y(mux_sel[0]) );
  NAND3X1M U16 ( .A(n19), .B(n4), .C(curent_state[0]), .Y(n12) );
  NOR2X2M U20 ( .A(ser_done), .B(n9), .Y(ser_en) );
  NAND2X2M U21 ( .A(n9), .B(n10), .Y(mux_sel[1]) );
  OAI211X2M U22 ( .A0(ser_done), .A1(n9), .B0(n11), .C0(n12), .Y(next_state[0]) );
  OAI31X2M U23 ( .A0(n16), .A1(par_en), .A2(n9), .B0(n10), .Y(next_state[2])
         );
  INVX2M U24 ( .A(ser_done), .Y(n16) );
  INVX2M U25 ( .A(mux_sel[1]), .Y(n17) );
  AOI21X2M U26 ( .A0(n18), .A1(n8), .B0(curent_state[2]), .Y(next_state[1]) );
  DLY1X1M U27 ( .A(test_se), .Y(n24) );
  SDFFRX2M \curent_state_reg[1]  ( .D(next_state[1]), .SI(n18), .SE(n24), .CK(
        clk), .RN(rstn), .Q(curent_state[1]), .QN(n19) );
  SDFFSRX4M \curent_state_reg[2]  ( .D(next_state[2]), .SI(curent_state[1]), 
        .SE(n24), .CK(clk), .SN(1'b1), .RN(rstn), .Q(curent_state[2]), .QN(n4)
         );
  NAND3X2M U3 ( .A(n18), .B(n4), .C(curent_state[1]), .Y(n10) );
endmodule


module mux ( mux_sel, start_bit, stop_bit, ser_data, par_bit, TX_OUT );
  input [1:0] mux_sel;
  input start_bit, stop_bit, ser_data, par_bit;
  output TX_OUT;
  wire   n2, n3, n1;

  OAI2B2X8M U1 ( .A1N(mux_sel[1]), .A0(n2), .B0(mux_sel[1]), .B1(n3), .Y(
        TX_OUT) );
  AOI22X1M U2 ( .A0(start_bit), .A1(n1), .B0(stop_bit), .B1(mux_sel[0]), .Y(n3) );
  AOI22X1M U3 ( .A0(ser_data), .A1(n1), .B0(par_bit), .B1(mux_sel[0]), .Y(n2)
         );
  INVX2M U4 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module parity_calc_test_1 ( clk, rst, P_DATA, data_valid, busy, par_en, 
        par_typ, par_bit, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input clk, rst, data_valid, busy, par_en, par_typ, test_si, test_se;
  output par_bit, test_so;
  wire   n1, n2, n3, n4, n5, n6, n8, n10, n12, n14, n16, n18, n20, n22, n31,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46;
  wire   [7:0] saved_data;

  SDFFRQX1M \saved_data_reg[7]  ( .D(n22), .SI(n40), .SE(n36), .CK(clk), .RN(
        rst), .Q(saved_data[7]) );
  SDFFRQX1M \saved_data_reg[6]  ( .D(n20), .SI(n42), .SE(n35), .CK(clk), .RN(
        rst), .Q(saved_data[6]) );
  SDFFRQX1M \saved_data_reg[5]  ( .D(n18), .SI(n44), .SE(n39), .CK(clk), .RN(
        rst), .Q(saved_data[5]) );
  SDFFRQX1M \saved_data_reg[4]  ( .D(n16), .SI(n46), .SE(n36), .CK(clk), .RN(
        rst), .Q(saved_data[4]) );
  SDFFRQX1M \saved_data_reg[3]  ( .D(n14), .SI(n45), .SE(n35), .CK(clk), .RN(
        rst), .Q(saved_data[3]) );
  SDFFRQX1M \saved_data_reg[2]  ( .D(n12), .SI(n41), .SE(n39), .CK(clk), .RN(
        rst), .Q(saved_data[2]) );
  SDFFRQX1M \saved_data_reg[1]  ( .D(n10), .SI(n43), .SE(n38), .CK(clk), .RN(
        rst), .Q(saved_data[1]) );
  SDFFRQX1M \saved_data_reg[0]  ( .D(n8), .SI(test_si), .SE(n37), .CK(clk), 
        .RN(rst), .Q(saved_data[0]) );
  CLKBUFX8M U10 ( .A(n6), .Y(n31) );
  NOR2BX2M U11 ( .AN(data_valid), .B(busy), .Y(n6) );
  NOR2BX2M U12 ( .AN(par_en), .B(n1), .Y(par_bit) );
  XOR3XLM U13 ( .A(n2), .B(par_typ), .C(n3), .Y(n1) );
  XOR3XLM U14 ( .A(saved_data[1]), .B(saved_data[0]), .C(n4), .Y(n3) );
  XOR3XLM U15 ( .A(saved_data[5]), .B(saved_data[4]), .C(n5), .Y(n2) );
  CLKXOR2X2M U16 ( .A(saved_data[7]), .B(saved_data[6]), .Y(n5) );
  XNOR2X2M U25 ( .A(saved_data[2]), .B(saved_data[3]), .Y(n4) );
  AO2B2X2M U26 ( .B0(P_DATA[0]), .B1(n31), .A0(n43), .A1N(n31), .Y(n8) );
  AO2B2X2M U27 ( .B0(P_DATA[1]), .B1(n31), .A0(n41), .A1N(n31), .Y(n10) );
  AO2B2X2M U28 ( .B0(P_DATA[2]), .B1(n31), .A0(n45), .A1N(n31), .Y(n12) );
  AO2B2X2M U29 ( .B0(P_DATA[3]), .B1(n31), .A0(n46), .A1N(n31), .Y(n14) );
  AO2B2X2M U30 ( .B0(P_DATA[4]), .B1(n31), .A0(n44), .A1N(n31), .Y(n16) );
  AO2B2X2M U31 ( .B0(P_DATA[5]), .B1(n31), .A0(n42), .A1N(n31), .Y(n18) );
  AO2B2X2M U32 ( .B0(P_DATA[6]), .B1(n31), .A0(n40), .A1N(n31), .Y(n20) );
  AO2B2X2M U33 ( .B0(P_DATA[7]), .B1(n31), .A0(test_so), .A1N(n31), .Y(n22) );
  DLY1X1M U34 ( .A(test_se), .Y(n34) );
  DLY1X1M U35 ( .A(n37), .Y(n35) );
  DLY1X1M U36 ( .A(n38), .Y(n36) );
  DLY1X1M U37 ( .A(n34), .Y(n37) );
  DLY1X1M U38 ( .A(n34), .Y(n38) );
  DLY1X1M U39 ( .A(test_se), .Y(n39) );
  DLY1X1M U40 ( .A(saved_data[6]), .Y(n40) );
  DLY1X1M U41 ( .A(saved_data[1]), .Y(n41) );
  DLY1X1M U42 ( .A(saved_data[5]), .Y(n42) );
  DLY1X1M U43 ( .A(saved_data[0]), .Y(n43) );
  DLY1X1M U44 ( .A(saved_data[4]), .Y(n44) );
  DLY1X1M U45 ( .A(saved_data[2]), .Y(n45) );
  DLY1X1M U46 ( .A(saved_data[3]), .Y(n46) );
  DLY1X1M U47 ( .A(saved_data[7]), .Y(test_so) );
endmodule


module ser_test_1 ( clk, rstn, P_DATA, data_valid, busy, ser_en, ser_done, 
        ser_data, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input clk, rstn, data_valid, busy, ser_en, test_si, test_se;
  output ser_done, ser_data, test_so;
  wire   N2, N3, N11, N12, N13, N15, n1, n4, n5, n13, n15, n17, n19, n21, n23,
         n25, n27, n2, n3, n6, n7, n8, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n50, n51, n52, n53, n54, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n72, n73, n74;
  wire   [7:0] saved_data;

  SDFFRX1M \cnt_reg[1]  ( .D(N12), .SI(n7), .SE(n56), .CK(clk), .RN(rstn), .Q(
        N3), .QN(n44) );
  SDFFRX1M \cnt_reg[0]  ( .D(N11), .SI(test_si), .SE(n51), .CK(clk), .RN(rstn), 
        .Q(N2), .QN(n43) );
  SDFFRX1M \cnt_reg[2]  ( .D(N13), .SI(N3), .SE(n52), .CK(clk), .RN(rstn), .Q(
        n47), .QN(n45) );
  SDFFSQX1M \saved_data_reg[6]  ( .D(n25), .SI(n63), .SE(n56), .CK(clk), .SN(
        rstn), .Q(saved_data[6]) );
  SDFFSQX1M \saved_data_reg[5]  ( .D(n23), .SI(n66), .SE(n51), .CK(clk), .SN(
        rstn), .Q(saved_data[5]) );
  SDFFSQX1M \saved_data_reg[4]  ( .D(n21), .SI(n64), .SE(n58), .CK(clk), .SN(
        rstn), .Q(saved_data[4]) );
  SDFFSQX1M \saved_data_reg[3]  ( .D(n19), .SI(n60), .SE(n59), .CK(clk), .SN(
        rstn), .Q(saved_data[3]) );
  SDFFSQX1M \saved_data_reg[2]  ( .D(n17), .SI(n62), .SE(n58), .CK(clk), .SN(
        rstn), .Q(saved_data[2]) );
  SDFFSQX1M \saved_data_reg[1]  ( .D(n15), .SI(n65), .SE(n57), .CK(clk), .SN(
        rstn), .Q(saved_data[1]) );
  SDFFSQX1M \saved_data_reg[0]  ( .D(n13), .SI(n47), .SE(n52), .CK(clk), .SN(
        rstn), .Q(saved_data[0]) );
  INVXLM U3 ( .A(n44), .Y(n2) );
  INVX2M U4 ( .A(n2), .Y(n3) );
  INVXLM U5 ( .A(N2), .Y(n6) );
  INVX2M U6 ( .A(n6), .Y(n7) );
  INVX2M U7 ( .A(n45), .Y(n8) );
  BUFX4M U19 ( .A(n4), .Y(n39) );
  INVX4M U20 ( .A(n39), .Y(n46) );
  NOR2X4M U21 ( .A(n3), .B(n43), .Y(n1) );
  INVX2M U22 ( .A(ser_en), .Y(n42) );
  NOR2BX2M U23 ( .AN(data_valid), .B(busy), .Y(n4) );
  AOI211X2M U35 ( .A0(n43), .A1(n3), .B0(n42), .C0(n1), .Y(N12) );
  AND2X2M U36 ( .A(n1), .B(n8), .Y(ser_done) );
  OR2X2M U37 ( .A(N15), .B(n42), .Y(ser_data) );
  MX2X2M U38 ( .A(n41), .B(n40), .S0(n8), .Y(N15) );
  MX4X1M U39 ( .A(saved_data[0]), .B(saved_data[1]), .C(saved_data[2]), .D(
        saved_data[3]), .S0(n7), .S1(N3), .Y(n41) );
  MX4X1M U40 ( .A(saved_data[4]), .B(saved_data[5]), .C(saved_data[6]), .D(n72), .S0(n7), .S1(n67), .Y(n40) );
  AO22X1M U41 ( .A0(n65), .A1(n46), .B0(P_DATA[0]), .B1(n39), .Y(n13) );
  AO22X1M U42 ( .A0(n62), .A1(n46), .B0(P_DATA[1]), .B1(n39), .Y(n15) );
  AO22X1M U43 ( .A0(n60), .A1(n46), .B0(P_DATA[2]), .B1(n39), .Y(n17) );
  AO22X1M U44 ( .A0(n64), .A1(n46), .B0(P_DATA[3]), .B1(n39), .Y(n19) );
  AO22X1M U45 ( .A0(n66), .A1(n46), .B0(P_DATA[4]), .B1(n39), .Y(n21) );
  AO22X1M U46 ( .A0(n63), .A1(n46), .B0(P_DATA[5]), .B1(n39), .Y(n23) );
  AO22X1M U47 ( .A0(n61), .A1(n46), .B0(P_DATA[6]), .B1(n39), .Y(n25) );
  AO22X1M U48 ( .A0(n73), .A1(n46), .B0(P_DATA[7]), .B1(n39), .Y(n27) );
  NOR2X2M U49 ( .A(n42), .B(n7), .Y(N11) );
  OAI2BB2X1M U50 ( .B0(n5), .B1(n42), .A0N(n8), .A1N(N11), .Y(N13) );
  AOI22X1M U51 ( .A0(n1), .A1(n45), .B0(n8), .B1(n3), .Y(n5) );
  DLY1X1M U52 ( .A(n54), .Y(n50) );
  DLY1X1M U53 ( .A(n57), .Y(n51) );
  DLY1X1M U54 ( .A(n54), .Y(n52) );
  DLY1X1M U55 ( .A(test_se), .Y(n53) );
  DLY1X1M U56 ( .A(test_se), .Y(n54) );
  DLY1X1M U58 ( .A(n50), .Y(n56) );
  DLY1X1M U59 ( .A(n53), .Y(n57) );
  DLY1X1M U60 ( .A(n50), .Y(n58) );
  DLY1X1M U61 ( .A(n53), .Y(n59) );
  DLY1X1M U62 ( .A(saved_data[2]), .Y(n60) );
  DLY1X1M U63 ( .A(saved_data[6]), .Y(n61) );
  DLY1X1M U64 ( .A(saved_data[1]), .Y(n62) );
  DLY1X1M U65 ( .A(saved_data[5]), .Y(n63) );
  DLY1X1M U66 ( .A(saved_data[3]), .Y(n64) );
  DLY1X1M U67 ( .A(saved_data[0]), .Y(n65) );
  DLY1X1M U68 ( .A(saved_data[4]), .Y(n66) );
  INVXLM U69 ( .A(n44), .Y(n67) );
  DLY1X1M U70 ( .A(n70), .Y(n68) );
  INVXLM U75 ( .A(n68), .Y(n73) );
  INVXLM U76 ( .A(n68), .Y(n74) );
  SDFFSX1M \saved_data_reg[7]  ( .D(n27), .SI(n61), .SE(n59), .CK(clk), .SN(
        rstn), .Q(n72), .QN(n70) );
  BUFX2M U8 ( .A(n69), .Y(test_so) );
  BUFX2M U9 ( .A(n74), .Y(n69) );
endmodule


module uart_tx ( scan_clk, scan_rst, test_mode, SI, SE, SO, clk, rstn, P_DATA, 
        data_valid, par_typ, par_en, TX_OUT, busy );
  input [7:0] P_DATA;
  input scan_clk, scan_rst, test_mode, SI, SE, clk, rstn, data_valid, par_typ,
         par_en;
  output SO, TX_OUT, busy;
  wire   scan_fun_clk, scan_fun_rst, ser_done, ser_en, ser_data, par_bit, n1,
         n2, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [1:0] mux_sel;

  BUFX2M U6 ( .A(data_valid), .Y(n1) );
  BUFX2M U7 ( .A(test_mode), .Y(n2) );
  DLY1X1M U8 ( .A(n14), .Y(n8) );
  DLY1X1M U9 ( .A(n15), .Y(n9) );
  INVXLM U10 ( .A(SE), .Y(n10) );
  INVXLM U11 ( .A(SE), .Y(n11) );
  INVXLM U12 ( .A(SE), .Y(n12) );
  DLY1X1M U13 ( .A(n18), .Y(n13) );
  DLY1X1M U14 ( .A(n17), .Y(n14) );
  DLY1X1M U15 ( .A(n16), .Y(n15) );
  INVXLM U16 ( .A(n11), .Y(n16) );
  INVXLM U17 ( .A(n12), .Y(n17) );
  INVXLM U18 ( .A(n10), .Y(n18) );
  mux2X1_1 U0_clk_mux ( .IN_0(clk), .IN_1(scan_clk), .SEL(n2), .OUT(
        scan_fun_clk) );
  mux2X1_0 U0_rst_mux ( .IN_0(rstn), .IN_1(scan_rst), .SEL(n2), .OUT(
        scan_fun_rst) );
  fsm_test_1 U0 ( .clk(scan_fun_clk), .rstn(scan_fun_rst), .data_valid(n1), 
        .par_en(par_en), .ser_done(ser_done), .ser_en(ser_en), .mux_sel(
        mux_sel), .busy(busy), .test_si(SI), .test_so(n6), .test_se(n13) );
  mux U1 ( .mux_sel(mux_sel), .start_bit(1'b0), .stop_bit(1'b1), .ser_data(
        ser_data), .par_bit(par_bit), .TX_OUT(TX_OUT) );
  parity_calc_test_1 U2 ( .clk(scan_fun_clk), .rst(scan_fun_rst), .P_DATA(
        P_DATA), .data_valid(n1), .busy(busy), .par_en(par_en), .par_typ(
        par_typ), .par_bit(par_bit), .test_si(n6), .test_so(n5), .test_se(n8)
         );
  ser_test_1 U3 ( .clk(scan_fun_clk), .rstn(scan_fun_rst), .P_DATA(P_DATA), 
        .data_valid(n1), .busy(busy), .ser_en(ser_en), .ser_done(ser_done), 
        .ser_data(ser_data), .test_si(n5), .test_so(SO), .test_se(n9) );
endmodule

