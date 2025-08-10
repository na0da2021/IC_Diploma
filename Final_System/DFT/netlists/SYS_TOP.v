/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Oct 28 22:56:01 2024
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X8M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_test_1 ( clk, rst, sync_rst, test_si, test_se );
  input clk, rst, test_si, test_se;
  output sync_rst;
  wire   meta_flop;

  SDFFRQX2M sync_rst_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_rst) );
  SDFFRQX2M meta_flop_reg ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(meta_flop) );
endmodule


module RST_SYNC_test_0 ( clk, rst, sync_rst, test_si, test_se );
  input clk, rst, test_si, test_se;
  output sync_rst;
  wire   meta_flop;

  SDFFRQX2M sync_rst_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_rst) );
  SDFFRQX2M meta_flop_reg ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(meta_flop) );
endmodule


module DATA_SYNCH_bus_width8_test_1 ( unsync_bus, bus_enable, clk, rst, 
        sync_bus, enable_pulse, test_si, test_so, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, clk, rst, test_si, test_se;
  output enable_pulse, test_so;
  wire   sync_flop, meta_flop, enable_flop, n1, n3, n5, n7, n9, n11, n13, n15,
         n17, n31;
  assign test_so = sync_flop;

  SDFFRQX2M \sync_bus_reg[7]  ( .D(n17), .SI(sync_bus[6]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n7), .SI(sync_bus[1]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[2]) );
  SDFFRQX2M enable_pulse_reg ( .D(n31), .SI(enable_flop), .SE(test_se), .CK(
        clk), .RN(rst), .Q(enable_pulse) );
  SDFFRQX1M sync_flop_reg ( .D(meta_flop), .SI(sync_bus[7]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(sync_flop) );
  SDFFRQX1M enable_flop_reg ( .D(sync_flop), .SI(test_si), .SE(test_se), .CK(
        clk), .RN(rst), .Q(enable_flop) );
  SDFFRQX1M \sync_bus_reg[6]  ( .D(n15), .SI(sync_bus[5]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[6]) );
  SDFFRQX1M \sync_bus_reg[5]  ( .D(n13), .SI(sync_bus[4]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[5]) );
  SDFFRQX1M \sync_bus_reg[4]  ( .D(n11), .SI(sync_bus[3]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[4]) );
  SDFFRQX1M \sync_bus_reg[3]  ( .D(n9), .SI(sync_bus[2]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[3]) );
  SDFFRQX1M \sync_bus_reg[1]  ( .D(n5), .SI(sync_bus[0]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[1]) );
  SDFFRQX1M \sync_bus_reg[0]  ( .D(n3), .SI(meta_flop), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(sync_bus[0]) );
  SDFFRQX1M meta_flop_reg ( .D(bus_enable), .SI(enable_pulse), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(meta_flop) );
  INVX2M U12 ( .A(n1), .Y(n31) );
  NAND2BX2M U25 ( .AN(enable_flop), .B(sync_flop), .Y(n1) );
  AO22X1M U26 ( .A0(unsync_bus[0]), .A1(n31), .B0(sync_bus[0]), .B1(n1), .Y(n3) );
  AO22X1M U27 ( .A0(unsync_bus[1]), .A1(n31), .B0(sync_bus[1]), .B1(n1), .Y(n5) );
  AO22X1M U28 ( .A0(unsync_bus[2]), .A1(n31), .B0(sync_bus[2]), .B1(n1), .Y(n7) );
  AO22X1M U29 ( .A0(unsync_bus[3]), .A1(n31), .B0(sync_bus[3]), .B1(n1), .Y(n9) );
  AO22X1M U30 ( .A0(unsync_bus[4]), .A1(n31), .B0(sync_bus[4]), .B1(n1), .Y(
        n11) );
  AO22X1M U31 ( .A0(unsync_bus[5]), .A1(n31), .B0(sync_bus[5]), .B1(n1), .Y(
        n13) );
  AO22X1M U32 ( .A0(unsync_bus[6]), .A1(n31), .B0(sync_bus[6]), .B1(n1), .Y(
        n15) );
  AO22X1M U33 ( .A0(unsync_bus[7]), .A1(n31), .B0(sync_bus[7]), .B1(n1), .Y(
        n17) );
endmodule


module FIFO_WR_address_width3_test_1 ( w_inc, w_clk, wrst_n, wq2_rptr, wptr, 
        waddr, wfull, test_si, test_se );
  input [3:0] wq2_rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input w_inc, w_clk, wrst_n, test_si, test_se;
  output wfull;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;

  SDFFRQX1M \waddr_intermid_reg[1]  ( .D(n17), .SI(waddr[0]), .SE(test_se), 
        .CK(w_clk), .RN(wrst_n), .Q(waddr[1]) );
  SDFFRQX1M \waddr_intermid_reg[2]  ( .D(n16), .SI(waddr[1]), .SE(test_se), 
        .CK(w_clk), .RN(wrst_n), .Q(waddr[2]) );
  SDFFRQX1M \waddr_intermid_reg[3]  ( .D(n15), .SI(waddr[2]), .SE(test_se), 
        .CK(w_clk), .RN(wrst_n), .Q(wptr[3]) );
  SDFFRX1M \waddr_intermid_reg[0]  ( .D(n18), .SI(test_si), .SE(test_se), .CK(
        w_clk), .RN(wrst_n), .Q(waddr[0]), .QN(n5) );
  INVX2M U11 ( .A(n6), .Y(wfull) );
  NAND2X2M U12 ( .A(w_inc), .B(n6), .Y(n10) );
  XNOR2X2M U13 ( .A(wptr[1]), .B(wq2_rptr[1]), .Y(n11) );
  XNOR2X2M U14 ( .A(n5), .B(waddr[1]), .Y(wptr[0]) );
  NOR2X2M U15 ( .A(n10), .B(n5), .Y(n9) );
  XNOR2X2M U16 ( .A(waddr[2]), .B(n8), .Y(n16) );
  XNOR2X2M U17 ( .A(wptr[3]), .B(n7), .Y(n15) );
  NAND2BX2M U18 ( .AN(n8), .B(waddr[2]), .Y(n7) );
  NAND4X2M U19 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n6) );
  CLKXOR2X2M U20 ( .A(wq2_rptr[3]), .B(wptr[3]), .Y(n13) );
  XNOR2X2M U21 ( .A(wptr[0]), .B(wq2_rptr[0]), .Y(n12) );
  CLKXOR2X2M U22 ( .A(wq2_rptr[2]), .B(wptr[2]), .Y(n14) );
  NAND2X2M U23 ( .A(n9), .B(waddr[1]), .Y(n8) );
  CLKXOR2X2M U24 ( .A(wptr[3]), .B(waddr[2]), .Y(wptr[2]) );
  CLKXOR2X2M U25 ( .A(waddr[1]), .B(waddr[2]), .Y(wptr[1]) );
  CLKXOR2X2M U26 ( .A(waddr[1]), .B(n9), .Y(n17) );
  CLKXOR2X2M U27 ( .A(n5), .B(n10), .Y(n18) );
endmodule


module FIFO_RD_address_width3_test_1 ( r_inc, r_clk, rrst_n, rq2_wptr, rptr, 
        raddr, rempty, test_si, test_se );
  input [3:0] rq2_wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input r_inc, r_clk, rrst_n, test_si, test_se;
  output rempty;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;

  SDFFRX1M \raddr_intermid_reg[0]  ( .D(n18), .SI(test_si), .SE(test_se), .CK(
        r_clk), .RN(rrst_n), .Q(raddr[0]), .QN(n5) );
  SDFFRQX2M \raddr_intermid_reg[3]  ( .D(n15), .SI(raddr[2]), .SE(test_se), 
        .CK(r_clk), .RN(rrst_n), .Q(rptr[3]) );
  SDFFRQX2M \raddr_intermid_reg[2]  ( .D(n16), .SI(raddr[1]), .SE(test_se), 
        .CK(r_clk), .RN(rrst_n), .Q(raddr[2]) );
  SDFFRQX2M \raddr_intermid_reg[1]  ( .D(n17), .SI(n5), .SE(test_se), .CK(
        r_clk), .RN(rrst_n), .Q(raddr[1]) );
  INVX2M U7 ( .A(n6), .Y(rempty) );
  XNOR2X2M U8 ( .A(rptr[1]), .B(rq2_wptr[1]), .Y(n11) );
  XNOR2X2M U9 ( .A(n5), .B(raddr[1]), .Y(rptr[0]) );
  NOR2X2M U10 ( .A(n10), .B(n5), .Y(n9) );
  XNOR2X2M U11 ( .A(raddr[2]), .B(n8), .Y(n16) );
  XNOR2X2M U12 ( .A(rptr[3]), .B(n7), .Y(n15) );
  NAND2BX2M U13 ( .AN(n8), .B(raddr[2]), .Y(n7) );
  NAND4X2M U14 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n6) );
  XNOR2X2M U15 ( .A(rptr[3]), .B(rq2_wptr[3]), .Y(n13) );
  XNOR2X2M U16 ( .A(rptr[0]), .B(rq2_wptr[0]), .Y(n12) );
  XNOR2X2M U17 ( .A(rptr[2]), .B(rq2_wptr[2]), .Y(n14) );
  NAND2X2M U18 ( .A(n9), .B(raddr[1]), .Y(n8) );
  NAND2X2M U19 ( .A(r_inc), .B(n6), .Y(n10) );
  CLKXOR2X2M U20 ( .A(raddr[1]), .B(raddr[2]), .Y(rptr[1]) );
  CLKXOR2X2M U21 ( .A(rptr[3]), .B(raddr[2]), .Y(rptr[2]) );
  CLKXOR2X2M U22 ( .A(raddr[1]), .B(n9), .Y(n17) );
  CLKXOR2X2M U23 ( .A(n5), .B(n10), .Y(n18) );
endmodule


module DF_SYNC_addr_width3_test_1 ( clk, rst, ptr, synch_ptr, test_si, test_se
 );
  input [3:0] ptr;
  output [3:0] synch_ptr;
  input clk, rst, test_si, test_se;

  wire   [3:0] meta_flop;

  SDFFRQX2M \synch_ptr_reg[3]  ( .D(meta_flop[3]), .SI(synch_ptr[2]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[3]) );
  SDFFRQX2M \synch_ptr_reg[2]  ( .D(meta_flop[2]), .SI(synch_ptr[1]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[2]) );
  SDFFRQX2M \synch_ptr_reg[1]  ( .D(meta_flop[1]), .SI(synch_ptr[0]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[1]) );
  SDFFRQX2M \synch_ptr_reg[0]  ( .D(meta_flop[0]), .SI(meta_flop[3]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[0]) );
  SDFFRQX2M \meta_flop_reg[2]  ( .D(ptr[2]), .SI(meta_flop[1]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(meta_flop[2]) );
  SDFFRQX2M \meta_flop_reg[1]  ( .D(ptr[1]), .SI(meta_flop[0]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(meta_flop[1]) );
  SDFFRQX2M \meta_flop_reg[0]  ( .D(ptr[0]), .SI(test_si), .SE(test_se), .CK(
        clk), .RN(rst), .Q(meta_flop[0]) );
  SDFFRQX1M \meta_flop_reg[3]  ( .D(ptr[3]), .SI(meta_flop[2]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(meta_flop[3]) );
endmodule


module DF_SYNC_addr_width3_test_0 ( clk, rst, ptr, synch_ptr, test_si, test_se
 );
  input [3:0] ptr;
  output [3:0] synch_ptr;
  input clk, rst, test_si, test_se;

  wire   [3:0] meta_flop;

  SDFFRQX1M \synch_ptr_reg[3]  ( .D(meta_flop[3]), .SI(synch_ptr[2]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[3]) );
  SDFFRQX1M \synch_ptr_reg[1]  ( .D(meta_flop[1]), .SI(synch_ptr[0]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[1]) );
  SDFFRQX1M \synch_ptr_reg[0]  ( .D(meta_flop[0]), .SI(meta_flop[3]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[0]) );
  SDFFRQX1M \meta_flop_reg[3]  ( .D(ptr[3]), .SI(meta_flop[2]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(meta_flop[3]) );
  SDFFRQX1M \meta_flop_reg[2]  ( .D(ptr[2]), .SI(meta_flop[1]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(meta_flop[2]) );
  SDFFRQX1M \meta_flop_reg[1]  ( .D(ptr[1]), .SI(meta_flop[0]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(meta_flop[1]) );
  SDFFRQX1M \meta_flop_reg[0]  ( .D(ptr[0]), .SI(test_si), .SE(test_se), .CK(
        clk), .RN(rst), .Q(meta_flop[0]) );
  SDFFRQX1M \synch_ptr_reg[2]  ( .D(meta_flop[2]), .SI(synch_ptr[1]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(synch_ptr[2]) );
endmodule


module FIFO_mem_data_width8_address_width3_test_1 ( w_data, w_clk, w_clk_en, 
        w_addr, r_addr, r_data, test_si2, test_si1, test_so2, test_so1, 
        test_se );
  input [7:0] w_data;
  input [2:0] w_addr;
  input [2:0] r_addr;
  output [7:0] r_data;
  input w_clk, w_clk_en, test_si2, test_si1, test_se;
  output test_so2, test_so1;
  wire   N10, N11, N12, \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] ,
         \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[3][7] , \mem[3][6] ,
         \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] , \mem[3][1] ,
         \mem[3][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[1][7] ,
         \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] ,
         \mem[1][1] , \mem[1][0] , \mem[0][7] , \mem[0][6] , \mem[0][5] ,
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n66, n67, n68, n69, n70, n71, n72, n73, n74, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n176, n177, n178, n179, n180, n1;
  assign N10 = r_addr[0];
  assign N11 = r_addr[1];
  assign N12 = r_addr[2];
  assign test_so2 = \mem[7][7] ;

  SDFFQX2M \mem_reg[5][6]  ( .D(n131), .SI(\mem[5][5] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[5][6] ) );
  SDFFQX2M \mem_reg[5][5]  ( .D(n130), .SI(\mem[5][4] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[5][5] ) );
  SDFFQX2M \mem_reg[5][4]  ( .D(n129), .SI(\mem[5][3] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[5][4] ) );
  SDFFQX2M \mem_reg[5][3]  ( .D(n128), .SI(\mem[5][2] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[5][3] ) );
  SDFFQX2M \mem_reg[5][2]  ( .D(n127), .SI(\mem[5][1] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[5][2] ) );
  SDFFQX2M \mem_reg[5][1]  ( .D(n126), .SI(\mem[5][0] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[5][1] ) );
  SDFFQX2M \mem_reg[5][0]  ( .D(n125), .SI(\mem[4][7] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[5][0] ) );
  SDFFQX2M \mem_reg[1][7]  ( .D(n100), .SI(\mem[1][6] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[1][7] ) );
  SDFFQX2M \mem_reg[1][6]  ( .D(n99), .SI(\mem[1][5] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[1][6] ) );
  SDFFQX2M \mem_reg[1][5]  ( .D(n98), .SI(\mem[1][4] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[1][5] ) );
  SDFFQX2M \mem_reg[1][4]  ( .D(n97), .SI(\mem[1][3] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[1][4] ) );
  SDFFQX2M \mem_reg[1][3]  ( .D(n96), .SI(\mem[1][2] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[1][3] ) );
  SDFFQX2M \mem_reg[1][2]  ( .D(n95), .SI(\mem[1][1] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[1][2] ) );
  SDFFQX2M \mem_reg[1][1]  ( .D(n94), .SI(\mem[1][0] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[1][1] ) );
  SDFFQX2M \mem_reg[1][0]  ( .D(n93), .SI(\mem[0][7] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[1][0] ) );
  SDFFQX2M \mem_reg[7][7]  ( .D(n148), .SI(\mem[7][6] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[7][7] ) );
  SDFFQX2M \mem_reg[7][6]  ( .D(n147), .SI(\mem[7][5] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[7][6] ) );
  SDFFQX2M \mem_reg[7][5]  ( .D(n146), .SI(\mem[7][4] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[7][5] ) );
  SDFFQX2M \mem_reg[7][4]  ( .D(n145), .SI(test_si2), .SE(n178), .CK(w_clk), 
        .Q(\mem[7][4] ) );
  SDFFQX2M \mem_reg[7][3]  ( .D(n144), .SI(\mem[7][2] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[7][3] ) );
  SDFFQX2M \mem_reg[7][2]  ( .D(n143), .SI(\mem[7][1] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[7][2] ) );
  SDFFQX2M \mem_reg[7][1]  ( .D(n142), .SI(\mem[7][0] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[7][1] ) );
  SDFFQX2M \mem_reg[7][0]  ( .D(n141), .SI(\mem[6][7] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[7][0] ) );
  SDFFQX2M \mem_reg[3][7]  ( .D(n116), .SI(\mem[3][6] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[3][7] ) );
  SDFFQX2M \mem_reg[3][6]  ( .D(n115), .SI(\mem[3][5] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[3][6] ) );
  SDFFQX2M \mem_reg[3][5]  ( .D(n114), .SI(\mem[3][4] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[3][5] ) );
  SDFFQX2M \mem_reg[3][4]  ( .D(n113), .SI(\mem[3][3] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[3][4] ) );
  SDFFQX2M \mem_reg[3][3]  ( .D(n112), .SI(\mem[3][2] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[3][3] ) );
  SDFFQX2M \mem_reg[3][2]  ( .D(n111), .SI(\mem[3][1] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[3][2] ) );
  SDFFQX2M \mem_reg[3][1]  ( .D(n110), .SI(\mem[3][0] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[3][1] ) );
  SDFFQX2M \mem_reg[3][0]  ( .D(n109), .SI(\mem[2][7] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[3][0] ) );
  SDFFQX2M \mem_reg[6][7]  ( .D(n140), .SI(\mem[6][6] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[6][7] ) );
  SDFFQX2M \mem_reg[6][6]  ( .D(n139), .SI(\mem[6][5] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[6][6] ) );
  SDFFQX2M \mem_reg[6][5]  ( .D(n138), .SI(\mem[6][4] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[6][5] ) );
  SDFFQX2M \mem_reg[6][4]  ( .D(n137), .SI(\mem[6][3] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[6][4] ) );
  SDFFQX2M \mem_reg[6][3]  ( .D(n136), .SI(\mem[6][2] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[6][3] ) );
  SDFFQX2M \mem_reg[6][2]  ( .D(n135), .SI(\mem[6][1] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[6][2] ) );
  SDFFQX2M \mem_reg[6][1]  ( .D(n134), .SI(\mem[6][0] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[6][1] ) );
  SDFFQX2M \mem_reg[6][0]  ( .D(n133), .SI(\mem[5][7] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[6][0] ) );
  SDFFQX2M \mem_reg[2][7]  ( .D(n108), .SI(\mem[2][6] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[2][7] ) );
  SDFFQX2M \mem_reg[2][6]  ( .D(n107), .SI(\mem[2][5] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[2][6] ) );
  SDFFQX2M \mem_reg[2][5]  ( .D(n106), .SI(\mem[2][4] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[2][5] ) );
  SDFFQX2M \mem_reg[2][4]  ( .D(n105), .SI(\mem[2][3] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[2][4] ) );
  SDFFQX2M \mem_reg[2][3]  ( .D(n104), .SI(\mem[2][2] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[2][3] ) );
  SDFFQX2M \mem_reg[2][2]  ( .D(n103), .SI(\mem[2][1] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[2][2] ) );
  SDFFQX2M \mem_reg[2][1]  ( .D(n102), .SI(\mem[2][0] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[2][1] ) );
  SDFFQX2M \mem_reg[2][0]  ( .D(n101), .SI(\mem[1][7] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[2][0] ) );
  SDFFQX2M \mem_reg[4][7]  ( .D(n124), .SI(\mem[4][6] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[4][7] ) );
  SDFFQX2M \mem_reg[4][6]  ( .D(n123), .SI(\mem[4][5] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[4][6] ) );
  SDFFQX2M \mem_reg[4][5]  ( .D(n122), .SI(\mem[4][4] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[4][5] ) );
  SDFFQX2M \mem_reg[4][4]  ( .D(n121), .SI(\mem[4][3] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[4][4] ) );
  SDFFQX2M \mem_reg[4][3]  ( .D(n120), .SI(\mem[4][2] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[4][3] ) );
  SDFFQX2M \mem_reg[4][2]  ( .D(n119), .SI(\mem[4][1] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[4][2] ) );
  SDFFQX2M \mem_reg[4][1]  ( .D(n118), .SI(\mem[4][0] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[4][1] ) );
  SDFFQX2M \mem_reg[4][0]  ( .D(n117), .SI(\mem[3][7] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[4][0] ) );
  SDFFQX2M \mem_reg[0][7]  ( .D(n92), .SI(\mem[0][6] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[0][7] ) );
  SDFFQX2M \mem_reg[0][6]  ( .D(n91), .SI(\mem[0][5] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[0][6] ) );
  SDFFQX2M \mem_reg[0][5]  ( .D(n90), .SI(\mem[0][4] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[0][5] ) );
  SDFFQX2M \mem_reg[0][4]  ( .D(n89), .SI(\mem[0][3] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[0][4] ) );
  SDFFQX2M \mem_reg[0][3]  ( .D(n88), .SI(\mem[0][2] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[0][3] ) );
  SDFFQX2M \mem_reg[0][2]  ( .D(n87), .SI(\mem[0][1] ), .SE(n178), .CK(w_clk), 
        .Q(\mem[0][2] ) );
  SDFFQX2M \mem_reg[0][1]  ( .D(n86), .SI(\mem[0][0] ), .SE(n177), .CK(w_clk), 
        .Q(\mem[0][1] ) );
  SDFFQX2M \mem_reg[0][0]  ( .D(n85), .SI(test_si1), .SE(n176), .CK(w_clk), 
        .Q(\mem[0][0] ) );
  SDFFQX1M \mem_reg[5][7]  ( .D(n132), .SI(\mem[5][6] ), .SE(n176), .CK(w_clk), 
        .Q(\mem[5][7] ) );
  BUFX2M U67 ( .A(n78), .Y(n161) );
  BUFX2M U68 ( .A(n79), .Y(n160) );
  BUFX2M U69 ( .A(n83), .Y(n158) );
  BUFX2M U70 ( .A(n84), .Y(n157) );
  BUFX2M U71 ( .A(n77), .Y(n162) );
  NAND3X2M U72 ( .A(n163), .B(n164), .C(n81), .Y(n80) );
  NAND3X2M U73 ( .A(n163), .B(n164), .C(n76), .Y(n75) );
  NOR2BX2M U74 ( .AN(w_clk_en), .B(w_addr[2]), .Y(n76) );
  OAI2BB2X1M U75 ( .B0(n75), .B1(n172), .A0N(\mem[0][0] ), .A1N(n75), .Y(n85)
         );
  OAI2BB2X1M U76 ( .B0(n75), .B1(n171), .A0N(\mem[0][1] ), .A1N(n75), .Y(n86)
         );
  OAI2BB2X1M U77 ( .B0(n75), .B1(n170), .A0N(\mem[0][2] ), .A1N(n75), .Y(n87)
         );
  OAI2BB2X1M U78 ( .B0(n75), .B1(n169), .A0N(\mem[0][3] ), .A1N(n75), .Y(n88)
         );
  OAI2BB2X1M U79 ( .B0(n75), .B1(n168), .A0N(\mem[0][4] ), .A1N(n75), .Y(n89)
         );
  OAI2BB2X1M U80 ( .B0(n75), .B1(n167), .A0N(\mem[0][5] ), .A1N(n75), .Y(n90)
         );
  OAI2BB2X1M U81 ( .B0(n75), .B1(n166), .A0N(\mem[0][6] ), .A1N(n75), .Y(n91)
         );
  OAI2BB2X1M U82 ( .B0(n75), .B1(n165), .A0N(\mem[0][7] ), .A1N(n75), .Y(n92)
         );
  OAI2BB2X1M U83 ( .B0(n172), .B1(n80), .A0N(\mem[4][0] ), .A1N(n80), .Y(n117)
         );
  OAI2BB2X1M U84 ( .B0(n171), .B1(n80), .A0N(\mem[4][1] ), .A1N(n80), .Y(n118)
         );
  OAI2BB2X1M U85 ( .B0(n170), .B1(n80), .A0N(\mem[4][2] ), .A1N(n80), .Y(n119)
         );
  OAI2BB2X1M U86 ( .B0(n169), .B1(n80), .A0N(\mem[4][3] ), .A1N(n80), .Y(n120)
         );
  OAI2BB2X1M U87 ( .B0(n168), .B1(n80), .A0N(\mem[4][4] ), .A1N(n80), .Y(n121)
         );
  OAI2BB2X1M U88 ( .B0(n167), .B1(n80), .A0N(\mem[4][5] ), .A1N(n80), .Y(n122)
         );
  OAI2BB2X1M U89 ( .B0(n166), .B1(n80), .A0N(\mem[4][6] ), .A1N(n80), .Y(n123)
         );
  OAI2BB2X1M U90 ( .B0(n165), .B1(n80), .A0N(\mem[4][7] ), .A1N(n80), .Y(n124)
         );
  BUFX4M U91 ( .A(N10), .Y(n156) );
  INVX2M U92 ( .A(w_data[0]), .Y(n172) );
  INVX2M U93 ( .A(w_data[1]), .Y(n171) );
  INVX2M U94 ( .A(w_data[2]), .Y(n170) );
  INVX2M U95 ( .A(w_data[3]), .Y(n169) );
  INVX2M U96 ( .A(w_data[4]), .Y(n168) );
  INVX2M U97 ( .A(w_data[5]), .Y(n167) );
  INVX2M U98 ( .A(w_data[6]), .Y(n166) );
  INVX2M U99 ( .A(w_data[7]), .Y(n165) );
  BUFX2M U100 ( .A(n82), .Y(n159) );
  NAND3X2M U101 ( .A(w_addr[0]), .B(n164), .C(n81), .Y(n82) );
  OAI2BB2X1M U102 ( .B0(n172), .B1(n162), .A0N(\mem[1][0] ), .A1N(n162), .Y(
        n93) );
  OAI2BB2X1M U103 ( .B0(n171), .B1(n162), .A0N(\mem[1][1] ), .A1N(n162), .Y(
        n94) );
  OAI2BB2X1M U104 ( .B0(n170), .B1(n162), .A0N(\mem[1][2] ), .A1N(n162), .Y(
        n95) );
  OAI2BB2X1M U105 ( .B0(n169), .B1(n162), .A0N(\mem[1][3] ), .A1N(n162), .Y(
        n96) );
  OAI2BB2X1M U106 ( .B0(n168), .B1(n162), .A0N(\mem[1][4] ), .A1N(n162), .Y(
        n97) );
  OAI2BB2X1M U107 ( .B0(n167), .B1(n162), .A0N(\mem[1][5] ), .A1N(n162), .Y(
        n98) );
  OAI2BB2X1M U108 ( .B0(n166), .B1(n162), .A0N(\mem[1][6] ), .A1N(n162), .Y(
        n99) );
  OAI2BB2X1M U109 ( .B0(n165), .B1(n162), .A0N(\mem[1][7] ), .A1N(n162), .Y(
        n100) );
  OAI2BB2X1M U110 ( .B0(n172), .B1(n161), .A0N(\mem[2][0] ), .A1N(n161), .Y(
        n101) );
  OAI2BB2X1M U111 ( .B0(n171), .B1(n161), .A0N(\mem[2][1] ), .A1N(n161), .Y(
        n102) );
  OAI2BB2X1M U112 ( .B0(n170), .B1(n161), .A0N(\mem[2][2] ), .A1N(n161), .Y(
        n103) );
  OAI2BB2X1M U113 ( .B0(n169), .B1(n161), .A0N(\mem[2][3] ), .A1N(n161), .Y(
        n104) );
  OAI2BB2X1M U114 ( .B0(n168), .B1(n161), .A0N(\mem[2][4] ), .A1N(n161), .Y(
        n105) );
  OAI2BB2X1M U115 ( .B0(n167), .B1(n161), .A0N(\mem[2][5] ), .A1N(n161), .Y(
        n106) );
  OAI2BB2X1M U116 ( .B0(n166), .B1(n161), .A0N(\mem[2][6] ), .A1N(n161), .Y(
        n107) );
  OAI2BB2X1M U117 ( .B0(n165), .B1(n161), .A0N(\mem[2][7] ), .A1N(n161), .Y(
        n108) );
  OAI2BB2X1M U118 ( .B0(n172), .B1(n160), .A0N(\mem[3][0] ), .A1N(n160), .Y(
        n109) );
  OAI2BB2X1M U119 ( .B0(n171), .B1(n160), .A0N(\mem[3][1] ), .A1N(n160), .Y(
        n110) );
  OAI2BB2X1M U120 ( .B0(n170), .B1(n160), .A0N(\mem[3][2] ), .A1N(n160), .Y(
        n111) );
  OAI2BB2X1M U121 ( .B0(n169), .B1(n160), .A0N(\mem[3][3] ), .A1N(n160), .Y(
        n112) );
  OAI2BB2X1M U122 ( .B0(n168), .B1(n160), .A0N(\mem[3][4] ), .A1N(n160), .Y(
        n113) );
  OAI2BB2X1M U123 ( .B0(n167), .B1(n160), .A0N(\mem[3][5] ), .A1N(n160), .Y(
        n114) );
  OAI2BB2X1M U124 ( .B0(n166), .B1(n160), .A0N(\mem[3][6] ), .A1N(n160), .Y(
        n115) );
  OAI2BB2X1M U125 ( .B0(n165), .B1(n160), .A0N(\mem[3][7] ), .A1N(n160), .Y(
        n116) );
  OAI2BB2X1M U126 ( .B0(n172), .B1(n159), .A0N(\mem[5][0] ), .A1N(n159), .Y(
        n125) );
  OAI2BB2X1M U127 ( .B0(n171), .B1(n159), .A0N(\mem[5][1] ), .A1N(n159), .Y(
        n126) );
  OAI2BB2X1M U128 ( .B0(n170), .B1(n159), .A0N(\mem[5][2] ), .A1N(n159), .Y(
        n127) );
  OAI2BB2X1M U129 ( .B0(n169), .B1(n159), .A0N(\mem[5][3] ), .A1N(n159), .Y(
        n128) );
  OAI2BB2X1M U130 ( .B0(n168), .B1(n159), .A0N(\mem[5][4] ), .A1N(n159), .Y(
        n129) );
  OAI2BB2X1M U131 ( .B0(n167), .B1(n159), .A0N(\mem[5][5] ), .A1N(n159), .Y(
        n130) );
  OAI2BB2X1M U132 ( .B0(n166), .B1(n159), .A0N(\mem[5][6] ), .A1N(n159), .Y(
        n131) );
  OAI2BB2X1M U133 ( .B0(n165), .B1(n159), .A0N(\mem[5][7] ), .A1N(n159), .Y(
        n132) );
  OAI2BB2X1M U134 ( .B0(n172), .B1(n158), .A0N(\mem[6][0] ), .A1N(n158), .Y(
        n133) );
  OAI2BB2X1M U135 ( .B0(n171), .B1(n158), .A0N(\mem[6][1] ), .A1N(n158), .Y(
        n134) );
  OAI2BB2X1M U136 ( .B0(n170), .B1(n158), .A0N(\mem[6][2] ), .A1N(n158), .Y(
        n135) );
  OAI2BB2X1M U137 ( .B0(n169), .B1(n158), .A0N(\mem[6][3] ), .A1N(n158), .Y(
        n136) );
  OAI2BB2X1M U138 ( .B0(n168), .B1(n158), .A0N(\mem[6][4] ), .A1N(n158), .Y(
        n137) );
  OAI2BB2X1M U139 ( .B0(n167), .B1(n158), .A0N(\mem[6][5] ), .A1N(n158), .Y(
        n138) );
  OAI2BB2X1M U140 ( .B0(n166), .B1(n158), .A0N(\mem[6][6] ), .A1N(n158), .Y(
        n139) );
  OAI2BB2X1M U141 ( .B0(n165), .B1(n158), .A0N(\mem[6][7] ), .A1N(n158), .Y(
        n140) );
  OAI2BB2X1M U142 ( .B0(n172), .B1(n157), .A0N(\mem[7][0] ), .A1N(n157), .Y(
        n141) );
  OAI2BB2X1M U143 ( .B0(n171), .B1(n157), .A0N(\mem[7][1] ), .A1N(n157), .Y(
        n142) );
  OAI2BB2X1M U144 ( .B0(n170), .B1(n157), .A0N(\mem[7][2] ), .A1N(n157), .Y(
        n143) );
  OAI2BB2X1M U145 ( .B0(n169), .B1(n157), .A0N(n180), .A1N(n157), .Y(n144) );
  OAI2BB2X1M U146 ( .B0(n168), .B1(n157), .A0N(\mem[7][4] ), .A1N(n157), .Y(
        n145) );
  OAI2BB2X1M U147 ( .B0(n167), .B1(n157), .A0N(\mem[7][5] ), .A1N(n157), .Y(
        n146) );
  OAI2BB2X1M U148 ( .B0(n166), .B1(n157), .A0N(\mem[7][6] ), .A1N(n157), .Y(
        n147) );
  OAI2BB2X1M U149 ( .B0(n165), .B1(n157), .A0N(\mem[7][7] ), .A1N(n157), .Y(
        n148) );
  AND2X2M U150 ( .A(w_addr[2]), .B(w_clk_en), .Y(n81) );
  NAND3X2M U151 ( .A(n76), .B(n164), .C(w_addr[0]), .Y(n77) );
  NAND3X2M U152 ( .A(n76), .B(n163), .C(w_addr[1]), .Y(n78) );
  NAND3X2M U153 ( .A(w_addr[0]), .B(n76), .C(w_addr[1]), .Y(n79) );
  NAND3X2M U154 ( .A(w_addr[1]), .B(w_addr[0]), .C(n81), .Y(n84) );
  NAND3X2M U155 ( .A(w_addr[1]), .B(n163), .C(n81), .Y(n83) );
  MX2X2M U156 ( .A(n67), .B(n66), .S0(N12), .Y(r_data[0]) );
  MX4X1M U157 ( .A(\mem[0][0] ), .B(\mem[1][0] ), .C(\mem[2][0] ), .D(
        \mem[3][0] ), .S0(n156), .S1(N11), .Y(n67) );
  MX4X1M U158 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n156), .S1(N11), .Y(n66) );
  MX2X2M U159 ( .A(n69), .B(n68), .S0(N12), .Y(r_data[1]) );
  MX4X1M U160 ( .A(\mem[0][1] ), .B(\mem[1][1] ), .C(\mem[2][1] ), .D(
        \mem[3][1] ), .S0(n156), .S1(N11), .Y(n69) );
  MX4X1M U161 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n156), .S1(N11), .Y(n68) );
  MX2X2M U162 ( .A(n71), .B(n70), .S0(N12), .Y(r_data[2]) );
  MX4X1M U163 ( .A(\mem[0][2] ), .B(\mem[1][2] ), .C(\mem[2][2] ), .D(
        \mem[3][2] ), .S0(n156), .S1(N11), .Y(n71) );
  MX4X1M U164 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n156), .S1(N11), .Y(n70) );
  MX2X2M U165 ( .A(n73), .B(n72), .S0(N12), .Y(r_data[3]) );
  MX4X1M U166 ( .A(\mem[0][3] ), .B(\mem[1][3] ), .C(\mem[2][3] ), .D(
        \mem[3][3] ), .S0(n156), .S1(N11), .Y(n73) );
  MX4X1M U167 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(n180), 
        .S0(n156), .S1(N11), .Y(n72) );
  MX2X2M U168 ( .A(n149), .B(n74), .S0(N12), .Y(r_data[4]) );
  MX4X1M U169 ( .A(\mem[0][4] ), .B(\mem[1][4] ), .C(\mem[2][4] ), .D(
        \mem[3][4] ), .S0(n156), .S1(N11), .Y(n149) );
  MX4X1M U170 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n156), .S1(N11), .Y(n74) );
  MX2X2M U171 ( .A(n151), .B(n150), .S0(N12), .Y(r_data[5]) );
  MX4X1M U172 ( .A(\mem[0][5] ), .B(\mem[1][5] ), .C(\mem[2][5] ), .D(
        \mem[3][5] ), .S0(n156), .S1(N11), .Y(n151) );
  MX4X1M U173 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n156), .S1(N11), .Y(n150) );
  MX2X2M U174 ( .A(n153), .B(n152), .S0(N12), .Y(r_data[6]) );
  MX4X1M U175 ( .A(\mem[0][6] ), .B(\mem[1][6] ), .C(\mem[2][6] ), .D(
        \mem[3][6] ), .S0(n156), .S1(N11), .Y(n153) );
  MX4X1M U176 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n156), .S1(N11), .Y(n152) );
  MX2X2M U177 ( .A(n155), .B(n154), .S0(N12), .Y(r_data[7]) );
  MX4X1M U178 ( .A(\mem[0][7] ), .B(\mem[1][7] ), .C(\mem[2][7] ), .D(
        \mem[3][7] ), .S0(n156), .S1(N11), .Y(n155) );
  MX4X1M U179 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n156), .S1(N11), .Y(n154) );
  INVX2M U180 ( .A(w_addr[0]), .Y(n163) );
  INVX2M U181 ( .A(w_addr[1]), .Y(n164) );
  DLY1X1M U182 ( .A(test_se), .Y(n176) );
  DLY1X1M U183 ( .A(test_se), .Y(n177) );
  DLY1X1M U184 ( .A(test_se), .Y(n178) );
  INVXLM U185 ( .A(test_so1), .Y(n179) );
  INVXLM U186 ( .A(n179), .Y(n180) );
  INVXLM U2 ( .A(\mem[7][3] ), .Y(n1) );
  INVX8M U3 ( .A(n1), .Y(test_so1) );
endmodule


module FIFO_TOP_data_width8_address_width3_test_1 ( w_clk, wrst_n, w_inc, 
        w_data, r_clk, rrst_n, r_inc, wfull, rempty, r_data, test_si2, 
        test_si1, test_so2, test_so1, test_se );
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, wrst_n, w_inc, r_clk, rrst_n, r_inc, test_si2, test_si1,
         test_se;
  output wfull, rempty, test_so2, test_so1;
  wire   _0_net_, n1;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [2:0] w_addr;
  wire   [3:0] rq2_wptr;
  wire   [3:0] rptr;
  wire   [2:0] r_addr;
  assign test_so2 = rq2_wptr[3];

  NOR2BX2M U1 ( .AN(w_inc), .B(wfull), .Y(_0_net_) );
  FIFO_WR_address_width3_test_1 FIFO_WR ( .w_inc(w_inc), .w_clk(w_clk), 
        .wrst_n(wrst_n), .wq2_rptr(wq2_rptr), .wptr(wptr), .waddr(w_addr), 
        .wfull(wfull), .test_si(rptr[3]), .test_se(test_se) );
  FIFO_RD_address_width3_test_1 FIFO_RD ( .r_inc(r_inc), .r_clk(r_clk), 
        .rrst_n(rrst_n), .rq2_wptr(rq2_wptr), .rptr(rptr), .raddr(r_addr), 
        .rempty(rempty), .test_si(test_si1), .test_se(test_se) );
  DF_SYNC_addr_width3_test_1 W2R ( .clk(r_clk), .rst(rrst_n), .ptr(wptr), 
        .synch_ptr(rq2_wptr), .test_si(wq2_rptr[3]), .test_se(test_se) );
  DF_SYNC_addr_width3_test_0 R2W ( .clk(w_clk), .rst(wrst_n), .ptr(rptr), 
        .synch_ptr(wq2_rptr), .test_si(n1), .test_se(test_se) );
  FIFO_mem_data_width8_address_width3_test_1 FIFO_mem ( .w_data(w_data), 
        .w_clk(w_clk), .w_clk_en(_0_net_), .w_addr(w_addr), .r_addr(r_addr), 
        .r_data(r_data), .test_si2(test_si2), .test_si1(wptr[3]), .test_so2(n1), .test_so1(test_so1), .test_se(test_se) );
endmodule


module PULSE_GEN_test_1 ( clk, rst, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input clk, rst, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pls_flop, rcv_flop;
  assign test_so = rcv_flop;

  SDFFRQX2M rcv_flop_reg ( .D(lvl_sig), .SI(pls_flop), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(rcv_flop) );
  SDFFRQX2M pls_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(pls_flop) );
  NOR2BX2M U5 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module CLK_DIV_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_test_1 ( i_ref_clk, i_rstn, i_clk_en, i_divide_ratio, gen_clk, 
        test_si, test_so, test_se );
  input [7:0] i_divide_ratio;
  input i_ref_clk, i_rstn, i_clk_en, test_si, test_se;
  output gen_clk, test_so;
  wire   divided_clk, N6, N7, N8, N9, N10, N11, N12, N15, N16, N18, N19, N20,
         N21, N22, N23, N24, N25, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n1, n2, n3, n4, n5, n6, n16, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63;
  wire   [7:0] cnt;
  assign test_so = divided_clk;

  SDFFRQX2M divided_clk_reg ( .D(n21), .SI(cnt[7]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rstn), .Q(divided_clk) );
  SDFFRQX2M \cnt_reg[7]  ( .D(n22), .SI(cnt[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[7]) );
  SDFFRQX2M \cnt_reg[6]  ( .D(n23), .SI(cnt[5]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[6]) );
  SDFFRQX2M \cnt_reg[0]  ( .D(n29), .SI(test_si), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[0]) );
  SDFFRQX2M \cnt_reg[1]  ( .D(n28), .SI(cnt[0]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[1]) );
  SDFFRQX2M \cnt_reg[4]  ( .D(n25), .SI(cnt[3]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[4]) );
  SDFFRQX2M \cnt_reg[2]  ( .D(n27), .SI(cnt[1]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[2]) );
  SDFFRQX2M \cnt_reg[5]  ( .D(n24), .SI(cnt[4]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[5]) );
  SDFFRQX2M \cnt_reg[3]  ( .D(n26), .SI(cnt[2]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[3]) );
  INVX2M U5 ( .A(n3), .Y(n63) );
  INVX2M U6 ( .A(N12), .Y(n61) );
  INVX2M U7 ( .A(N10), .Y(n59) );
  INVX2M U8 ( .A(N11), .Y(n60) );
  INVX2M U16 ( .A(N9), .Y(n58) );
  OR2X2M U17 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[0]), .Y(n4) );
  AND2X2M U18 ( .A(N16), .B(n63), .Y(n18) );
  INVX2M U19 ( .A(N15), .Y(n62) );
  AOI21X2M U20 ( .A0(n31), .A1(i_divide_ratio[7]), .B0(N15), .Y(n1) );
  AOI21BX2M U21 ( .A0(n30), .A1(i_divide_ratio[6]), .B0N(n31), .Y(n2) );
  AO22X1M U22 ( .A0(cnt[1]), .A1(n3), .B0(N19), .B1(n18), .Y(n28) );
  AO22X1M U23 ( .A0(cnt[2]), .A1(n3), .B0(N20), .B1(n18), .Y(n27) );
  AO22X1M U24 ( .A0(cnt[3]), .A1(n3), .B0(N21), .B1(n18), .Y(n26) );
  AO22X1M U25 ( .A0(cnt[4]), .A1(n3), .B0(N22), .B1(n18), .Y(n25) );
  AO22X1M U26 ( .A0(cnt[5]), .A1(n3), .B0(N23), .B1(n18), .Y(n24) );
  AO22X1M U27 ( .A0(cnt[6]), .A1(n3), .B0(N24), .B1(n18), .Y(n23) );
  AO22X1M U28 ( .A0(cnt[7]), .A1(n3), .B0(N25), .B1(n18), .Y(n22) );
  AO22X1M U29 ( .A0(cnt[0]), .A1(n3), .B0(N18), .B1(n18), .Y(n29) );
  INVX2M U30 ( .A(cnt[2]), .Y(n40) );
  INVX2M U31 ( .A(cnt[4]), .Y(n41) );
  AO22X1M U32 ( .A0(N6), .A1(n63), .B0(divided_clk), .B1(n3), .Y(n21) );
  INVX2M U33 ( .A(cnt[3]), .Y(n56) );
  INVX2M U34 ( .A(cnt[5]), .Y(n57) );
  INVX2M U35 ( .A(i_divide_ratio[4]), .Y(n43) );
  INVX2M U36 ( .A(i_divide_ratio[5]), .Y(n44) );
  INVX2M U37 ( .A(i_divide_ratio[3]), .Y(n42) );
  BUFX2M U38 ( .A(n17), .Y(n3) );
  OAI2BB1X2M U39 ( .A0N(n19), .A1N(n20), .B0(i_clk_en), .Y(n17) );
  NOR3X2M U40 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[3]), .C(
        i_divide_ratio[2]), .Y(n19) );
  NOR4X1M U41 ( .A(i_divide_ratio[7]), .B(i_divide_ratio[6]), .C(
        i_divide_ratio[5]), .D(i_divide_ratio[4]), .Y(n20) );
  INVX2M U42 ( .A(i_divide_ratio[7]), .Y(n46) );
  INVX2M U43 ( .A(i_divide_ratio[6]), .Y(n45) );
  MX2X2M U44 ( .A(i_ref_clk), .B(divided_clk), .S0(n63), .Y(gen_clk) );
  CLKINVX1M U45 ( .A(i_divide_ratio[0]), .Y(N7) );
  OAI2BB1X1M U46 ( .A0N(i_divide_ratio[0]), .A1N(i_divide_ratio[1]), .B0(n4), 
        .Y(N8) );
  OR2X1M U47 ( .A(n4), .B(i_divide_ratio[2]), .Y(n5) );
  OAI2BB1X1M U48 ( .A0N(n4), .A1N(i_divide_ratio[2]), .B0(n5), .Y(N9) );
  OR2X1M U49 ( .A(n5), .B(i_divide_ratio[3]), .Y(n6) );
  OAI2BB1X1M U50 ( .A0N(n5), .A1N(i_divide_ratio[3]), .B0(n6), .Y(N10) );
  OR2X1M U51 ( .A(n6), .B(i_divide_ratio[4]), .Y(n16) );
  OAI2BB1X1M U52 ( .A0N(n6), .A1N(i_divide_ratio[4]), .B0(n16), .Y(N11) );
  OR2X1M U53 ( .A(n16), .B(i_divide_ratio[5]), .Y(n30) );
  OAI2BB1X1M U54 ( .A0N(n16), .A1N(i_divide_ratio[5]), .B0(n30), .Y(N12) );
  OR2X1M U55 ( .A(n30), .B(i_divide_ratio[6]), .Y(n31) );
  NOR2X1M U56 ( .A(n31), .B(i_divide_ratio[7]), .Y(N15) );
  NAND2BX1M U57 ( .AN(cnt[0]), .B(i_divide_ratio[1]), .Y(n33) );
  AOI2BB1X1M U58 ( .A0N(n33), .A1N(cnt[1]), .B0(i_divide_ratio[2]), .Y(n32) );
  AOI221XLM U59 ( .A0(cnt[2]), .A1(n42), .B0(cnt[1]), .B1(n33), .C0(n32), .Y(
        n34) );
  AOI221XLM U60 ( .A0(i_divide_ratio[4]), .A1(n56), .B0(i_divide_ratio[3]), 
        .B1(n40), .C0(n34), .Y(n35) );
  AOI221XLM U61 ( .A0(cnt[4]), .A1(n44), .B0(cnt[3]), .B1(n43), .C0(n35), .Y(
        n36) );
  AOI221XLM U62 ( .A0(i_divide_ratio[6]), .A1(n57), .B0(i_divide_ratio[5]), 
        .B1(n41), .C0(n36), .Y(n37) );
  AOI221XLM U63 ( .A0(cnt[6]), .A1(n46), .B0(cnt[5]), .B1(n45), .C0(n37), .Y(
        n38) );
  AOI2B1X1M U64 ( .A1N(cnt[6]), .A0(i_divide_ratio[7]), .B0(n38), .Y(n39) );
  NOR2X1M U65 ( .A(cnt[7]), .B(n39), .Y(N6) );
  NOR2X1M U66 ( .A(cnt[6]), .B(n2), .Y(n54) );
  NAND2BX1M U67 ( .AN(cnt[0]), .B(N7), .Y(n48) );
  AOI2BB1X1M U68 ( .A0N(n48), .A1N(cnt[1]), .B0(N8), .Y(n47) );
  AOI221XLM U69 ( .A0(cnt[2]), .A1(n58), .B0(cnt[1]), .B1(n48), .C0(n47), .Y(
        n49) );
  AOI221XLM U70 ( .A0(N10), .A1(n56), .B0(N9), .B1(n40), .C0(n49), .Y(n50) );
  AOI221XLM U71 ( .A0(cnt[4]), .A1(n60), .B0(cnt[3]), .B1(n59), .C0(n50), .Y(
        n51) );
  AOI221XLM U72 ( .A0(N12), .A1(n57), .B0(N11), .B1(n41), .C0(n51), .Y(n52) );
  AOI221XLM U73 ( .A0(cnt[6]), .A1(n2), .B0(cnt[5]), .B1(n61), .C0(n52), .Y(
        n53) );
  OAI2BB2X1M U74 ( .B0(n54), .B1(n53), .A0N(n1), .A1N(cnt[7]), .Y(n55) );
  OAI211X1M U75 ( .A0(cnt[7]), .A1(n1), .B0(n55), .C0(n62), .Y(N16) );
  CLK_DIV_0_DW01_inc_0 add_31 ( .A(cnt), .SUM({N25, N24, N23, N22, N21, N20, 
        N19, N18}) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U11 ( .A(IN[2]), .Y(n14) );
  NAND4BX1M U12 ( .AN(IN[4]), .B(IN[3]), .C(n14), .D(n15), .Y(n6) );
  NAND4BX1M U13 ( .AN(IN[3]), .B(IN[4]), .C(n14), .D(n15), .Y(n7) );
  NOR3X2M U14 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR3X2M U15 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  OAI211X2M U16 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NOR4X1M U17 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n14), .Y(n8) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U19 ( .A(IN[1]), .Y(n16) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[5]), .Y(n15) );
  NOR4X1M U22 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U23 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
endmodule


module CLK_DIV_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_DIV_test_0 ( i_ref_clk, i_rstn, i_clk_en, i_divide_ratio, gen_clk, 
        test_si, test_so, test_se );
  input [7:0] i_divide_ratio;
  input i_ref_clk, i_rstn, i_clk_en, test_si, test_se;
  output gen_clk, test_so;
  wire   divided_clk, N6, N7, N8, N9, N10, N11, N12, N15, N16, N18, N19, N20,
         N21, N22, N23, N24, N25, n1, n2, n3, n4, n5, n6, n16, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76;
  wire   [7:0] cnt;
  assign test_so = divided_clk;

  SDFFRQX2M divided_clk_reg ( .D(n72), .SI(cnt[7]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rstn), .Q(divided_clk) );
  SDFFRQX2M \cnt_reg[7]  ( .D(n71), .SI(cnt[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[7]) );
  SDFFRQX2M \cnt_reg[6]  ( .D(n70), .SI(cnt[5]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[6]) );
  SDFFRQX2M \cnt_reg[0]  ( .D(n64), .SI(test_si), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[0]) );
  SDFFRQX2M \cnt_reg[1]  ( .D(n65), .SI(cnt[0]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[1]) );
  SDFFRQX2M \cnt_reg[4]  ( .D(n68), .SI(cnt[3]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[4]) );
  SDFFRQX2M \cnt_reg[2]  ( .D(n66), .SI(cnt[1]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[2]) );
  SDFFRQX2M \cnt_reg[5]  ( .D(n69), .SI(cnt[4]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[5]) );
  SDFFRQX2M \cnt_reg[3]  ( .D(n67), .SI(cnt[2]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rstn), .Q(cnt[3]) );
  OR2X2M U5 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[0]), .Y(n4) );
  INVX2M U6 ( .A(i_divide_ratio[3]), .Y(n44) );
  INVX2M U7 ( .A(n3), .Y(n63) );
  INVX2M U8 ( .A(N12), .Y(n57) );
  INVX2M U16 ( .A(N10), .Y(n59) );
  INVX2M U17 ( .A(N11), .Y(n58) );
  INVX2M U18 ( .A(N9), .Y(n60) );
  AND2X2M U19 ( .A(N16), .B(n63), .Y(n75) );
  INVX2M U20 ( .A(N15), .Y(n56) );
  AOI21X2M U21 ( .A0(n31), .A1(i_divide_ratio[7]), .B0(N15), .Y(n1) );
  AOI21BX2M U22 ( .A0(n30), .A1(i_divide_ratio[6]), .B0N(n31), .Y(n2) );
  AO22X1M U23 ( .A0(cnt[1]), .A1(n3), .B0(N19), .B1(n75), .Y(n65) );
  AO22X1M U24 ( .A0(cnt[2]), .A1(n3), .B0(N20), .B1(n75), .Y(n66) );
  AO22X1M U25 ( .A0(cnt[3]), .A1(n3), .B0(N21), .B1(n75), .Y(n67) );
  AO22X1M U26 ( .A0(cnt[4]), .A1(n3), .B0(N22), .B1(n75), .Y(n68) );
  AO22X1M U27 ( .A0(cnt[5]), .A1(n3), .B0(N23), .B1(n75), .Y(n69) );
  AO22X1M U28 ( .A0(cnt[6]), .A1(n3), .B0(N24), .B1(n75), .Y(n70) );
  AO22X1M U29 ( .A0(cnt[7]), .A1(n3), .B0(N25), .B1(n75), .Y(n71) );
  AO22X1M U30 ( .A0(cnt[0]), .A1(n3), .B0(N18), .B1(n75), .Y(n64) );
  INVX2M U31 ( .A(cnt[2]), .Y(n45) );
  INVX2M U32 ( .A(cnt[5]), .Y(n46) );
  AO22X1M U33 ( .A0(N6), .A1(n63), .B0(divided_clk), .B1(n3), .Y(n72) );
  BUFX2M U34 ( .A(n76), .Y(n3) );
  OAI2BB1X2M U35 ( .A0N(n74), .A1N(n73), .B0(i_clk_en), .Y(n76) );
  NOR4X1M U36 ( .A(i_divide_ratio[7]), .B(i_divide_ratio[6]), .C(
        i_divide_ratio[5]), .D(i_divide_ratio[4]), .Y(n73) );
  NOR3X2M U37 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[3]), .C(
        i_divide_ratio[2]), .Y(n74) );
  INVX2M U38 ( .A(cnt[3]), .Y(n61) );
  INVX2M U39 ( .A(cnt[4]), .Y(n62) );
  INVX2M U40 ( .A(i_divide_ratio[5]), .Y(n42) );
  INVX2M U41 ( .A(i_divide_ratio[7]), .Y(n40) );
  INVX2M U42 ( .A(i_divide_ratio[4]), .Y(n43) );
  INVX2M U43 ( .A(i_divide_ratio[6]), .Y(n41) );
  MX2X2M U44 ( .A(i_ref_clk), .B(divided_clk), .S0(n63), .Y(gen_clk) );
  CLKINVX1M U45 ( .A(i_divide_ratio[0]), .Y(N7) );
  OAI2BB1X1M U46 ( .A0N(i_divide_ratio[0]), .A1N(i_divide_ratio[1]), .B0(n4), 
        .Y(N8) );
  OR2X1M U47 ( .A(n4), .B(i_divide_ratio[2]), .Y(n5) );
  OAI2BB1X1M U48 ( .A0N(n4), .A1N(i_divide_ratio[2]), .B0(n5), .Y(N9) );
  OR2X1M U49 ( .A(n5), .B(i_divide_ratio[3]), .Y(n6) );
  OAI2BB1X1M U50 ( .A0N(n5), .A1N(i_divide_ratio[3]), .B0(n6), .Y(N10) );
  OR2X1M U51 ( .A(n6), .B(i_divide_ratio[4]), .Y(n16) );
  OAI2BB1X1M U52 ( .A0N(n6), .A1N(i_divide_ratio[4]), .B0(n16), .Y(N11) );
  OR2X1M U53 ( .A(n16), .B(i_divide_ratio[5]), .Y(n30) );
  OAI2BB1X1M U54 ( .A0N(n16), .A1N(i_divide_ratio[5]), .B0(n30), .Y(N12) );
  OR2X1M U55 ( .A(n30), .B(i_divide_ratio[6]), .Y(n31) );
  NOR2X1M U56 ( .A(n31), .B(i_divide_ratio[7]), .Y(N15) );
  NAND2BX1M U57 ( .AN(cnt[0]), .B(i_divide_ratio[1]), .Y(n33) );
  AOI2BB1X1M U58 ( .A0N(n33), .A1N(cnt[1]), .B0(i_divide_ratio[2]), .Y(n32) );
  AOI221XLM U59 ( .A0(cnt[2]), .A1(n44), .B0(cnt[1]), .B1(n33), .C0(n32), .Y(
        n34) );
  AOI221XLM U60 ( .A0(i_divide_ratio[4]), .A1(n61), .B0(i_divide_ratio[3]), 
        .B1(n45), .C0(n34), .Y(n35) );
  AOI221XLM U61 ( .A0(cnt[4]), .A1(n42), .B0(cnt[3]), .B1(n43), .C0(n35), .Y(
        n36) );
  AOI221XLM U62 ( .A0(i_divide_ratio[6]), .A1(n46), .B0(i_divide_ratio[5]), 
        .B1(n62), .C0(n36), .Y(n37) );
  AOI221XLM U63 ( .A0(cnt[6]), .A1(n40), .B0(cnt[5]), .B1(n41), .C0(n37), .Y(
        n38) );
  AOI2B1X1M U64 ( .A1N(cnt[6]), .A0(i_divide_ratio[7]), .B0(n38), .Y(n39) );
  NOR2X1M U65 ( .A(cnt[7]), .B(n39), .Y(N6) );
  NOR2X1M U66 ( .A(cnt[6]), .B(n2), .Y(n54) );
  NAND2BX1M U67 ( .AN(cnt[0]), .B(N7), .Y(n48) );
  AOI2BB1X1M U68 ( .A0N(n48), .A1N(cnt[1]), .B0(N8), .Y(n47) );
  AOI221XLM U69 ( .A0(cnt[2]), .A1(n60), .B0(cnt[1]), .B1(n48), .C0(n47), .Y(
        n49) );
  AOI221XLM U70 ( .A0(N10), .A1(n61), .B0(N9), .B1(n45), .C0(n49), .Y(n50) );
  AOI221XLM U71 ( .A0(cnt[4]), .A1(n58), .B0(cnt[3]), .B1(n59), .C0(n50), .Y(
        n51) );
  AOI221XLM U72 ( .A0(N12), .A1(n46), .B0(N11), .B1(n62), .C0(n51), .Y(n52) );
  AOI221XLM U73 ( .A0(cnt[6]), .A1(n2), .B0(cnt[5]), .B1(n57), .C0(n52), .Y(
        n53) );
  OAI2BB2X1M U74 ( .B0(n54), .B1(n53), .A0N(n1), .A1N(cnt[7]), .Y(n55) );
  OAI211X1M U75 ( .A0(cnt[7]), .A1(n1), .B0(n55), .C0(n56), .Y(N16) );
  CLK_DIV_1_DW01_inc_0 add_31 ( .A(cnt), .SUM({N25, N24, N23, N22, N21, N20, 
        N19, N18}) );
endmodule


module FSM_UART_RX_test_1 ( clk, rstn, parity_enable, RX_IN, prescale, 
        edge_count, bit_count, stop_error, parity_error, start_glitch, 
        data_sample_en, edge_bit_count_en, des_en, stp_chk_en, strt_chk_en, 
        parity_chk_en, data_valid, test_si, test_so, test_se );
  input [5:0] prescale;
  input [5:0] edge_count;
  input [3:0] bit_count;
  input clk, rstn, parity_enable, RX_IN, stop_error, parity_error,
         start_glitch, test_si, test_se;
  output data_sample_en, edge_bit_count_en, des_en, stp_chk_en, strt_chk_en,
         parity_chk_en, data_valid, test_so;
  wire   N35, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n2, n3, n4, n5, n6, n10, n11, n12, n13, n14, n15, n16,
         n17, n34, n35, n36, n37, n39, n40, n41, n42;
  wire   [5:0] check_edge;
  wire   [2:0] curent_state;
  wire   [2:0] next_state;
  assign test_so = curent_state[2];

  SDFFRQX2M \curent_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(rstn), .Q(curent_state[0]) );
  SDFFRQX2M \curent_state_reg[1]  ( .D(next_state[1]), .SI(n40), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(curent_state[1]) );
  SDFFRQX2M \curent_state_reg[2]  ( .D(next_state[2]), .SI(curent_state[1]), 
        .SE(test_se), .CK(clk), .RN(rstn), .Q(curent_state[2]) );
  NOR4XLM U4 ( .A(n33), .B(curent_state[1]), .C(stop_error), .D(parity_error), 
        .Y(data_valid) );
  NOR3X2M U7 ( .A(n40), .B(curent_state[2]), .C(n41), .Y(des_en) );
  OAI2B1X2M U8 ( .A1N(parity_chk_en), .A0(n18), .B0(n19), .Y(next_state[2]) );
  AOI31X2M U9 ( .A0(des_en), .A1(n42), .A2(n20), .B0(stp_chk_en), .Y(n19) );
  INVX2M U10 ( .A(n21), .Y(stp_chk_en) );
  OAI21X2M U11 ( .A0(n22), .A1(n41), .B0(n23), .Y(next_state[1]) );
  NOR2BX2M U12 ( .AN(n24), .B(n25), .Y(n22) );
  INVX2M U13 ( .A(n31), .Y(n35) );
  NOR2X2M U14 ( .A(parity_chk_en), .B(des_en), .Y(n24) );
  INVX2M U15 ( .A(strt_chk_en), .Y(n39) );
  OAI22X1M U16 ( .A0(n28), .A1(n39), .B0(n29), .B1(n21), .Y(n25) );
  AOI21X2M U17 ( .A0(n18), .A1(n42), .B0(n30), .Y(n29) );
  AOI31X2M U18 ( .A0(n35), .A1(n36), .A2(bit_count[1]), .B0(n42), .Y(n30) );
  NAND3BX2M U19 ( .AN(bit_count[2]), .B(N35), .C(bit_count[3]), .Y(n31) );
  NOR3X2M U20 ( .A(bit_count[0]), .B(bit_count[1]), .C(n31), .Y(n20) );
  NAND3BX2M U21 ( .AN(start_glitch), .B(strt_chk_en), .C(n28), .Y(n23) );
  OAI21BX1M U22 ( .A0(n26), .A1(n40), .B0N(n27), .Y(next_state[0]) );
  OAI31X1M U23 ( .A0(RX_IN), .A1(curent_state[1]), .A2(curent_state[0]), .B0(
        n23), .Y(n27) );
  AOI2B1X1M U24 ( .A1N(n20), .A0(des_en), .B0(n25), .Y(n26) );
  OR2X2M U25 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  NAND3X2M U26 ( .A(n35), .B(n37), .C(bit_count[0]), .Y(n18) );
  AND4X2M U27 ( .A(N35), .B(n36), .C(n32), .D(n37), .Y(n28) );
  NOR2X2M U28 ( .A(bit_count[3]), .B(bit_count[2]), .Y(n32) );
  INVX2M U29 ( .A(prescale[3]), .Y(n6) );
  NOR3X2M U30 ( .A(curent_state[0]), .B(curent_state[2]), .C(n41), .Y(
        parity_chk_en) );
  NOR3X2M U31 ( .A(curent_state[1]), .B(curent_state[2]), .C(n40), .Y(
        strt_chk_en) );
  NAND3X2M U32 ( .A(curent_state[1]), .B(n40), .C(curent_state[2]), .Y(n21) );
  INVX2M U33 ( .A(curent_state[0]), .Y(n40) );
  INVX2M U34 ( .A(curent_state[1]), .Y(n41) );
  NAND2X2M U35 ( .A(curent_state[2]), .B(n40), .Y(n33) );
  INVX2M U36 ( .A(bit_count[1]), .Y(n37) );
  INVX2M U37 ( .A(bit_count[0]), .Y(n36) );
  INVX2M U38 ( .A(parity_enable), .Y(n42) );
  BUFX2M U39 ( .A(edge_bit_count_en), .Y(data_sample_en) );
  NAND3X2M U40 ( .A(n39), .B(n21), .C(n24), .Y(edge_bit_count_en) );
  CLKINVX1M U41 ( .A(prescale[0]), .Y(check_edge[0]) );
  OAI2BB1X1M U42 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(
        check_edge[1]) );
  NOR2X1M U43 ( .A(n2), .B(prescale[2]), .Y(n3) );
  AO21XLM U44 ( .A0(n2), .A1(prescale[2]), .B0(n3), .Y(check_edge[2]) );
  CLKNAND2X2M U45 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U46 ( .A0(n3), .A1(n6), .B0(n4), .Y(check_edge[3]) );
  XNOR2X1M U47 ( .A(prescale[4]), .B(n4), .Y(check_edge[4]) );
  NOR2X1M U48 ( .A(prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U49 ( .A(prescale[5]), .B(n5), .Y(check_edge[5]) );
  NOR2BX1M U50 ( .AN(edge_count[0]), .B(check_edge[0]), .Y(n10) );
  OAI2B2X1M U51 ( .A1N(check_edge[1]), .A0(n10), .B0(edge_count[1]), .B1(n10), 
        .Y(n14) );
  NOR2BX1M U52 ( .AN(check_edge[0]), .B(edge_count[0]), .Y(n11) );
  OAI2B2X1M U53 ( .A1N(edge_count[1]), .A0(n11), .B0(check_edge[1]), .B1(n11), 
        .Y(n13) );
  XNOR2X1M U54 ( .A(check_edge[5]), .B(edge_count[5]), .Y(n12) );
  NAND3X1M U55 ( .A(n14), .B(n13), .C(n12), .Y(n34) );
  CLKXOR2X2M U56 ( .A(check_edge[4]), .B(edge_count[4]), .Y(n17) );
  CLKXOR2X2M U57 ( .A(check_edge[2]), .B(edge_count[2]), .Y(n16) );
  CLKXOR2X2M U58 ( .A(check_edge[3]), .B(edge_count[3]), .Y(n15) );
  NOR4X1M U59 ( .A(n34), .B(n17), .C(n16), .D(n15), .Y(N35) );
endmodule


module edge_bit_counter_test_1 ( clk, rstn, prescale, enable, edge_count, 
        bit_count, test_si2, test_si1, test_se );
  input [5:0] prescale;
  output [5:0] edge_count;
  output [3:0] bit_count;
  input clk, rstn, enable, test_si2, test_si1, test_se;
  wire   N3, N4, N5, N6, N8, N9, complete_bit, N22, N23, N24, N25, N27, N28,
         N29, N30, N31, N32, n19, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, \add_20/carry[5] , \add_20/carry[4] , \add_20/carry[3] ,
         \add_20/carry[2] , n1, n2, n3, n4, n5, n6, n17, n18, n20, n21, n22,
         n23, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n57, n58;

  SDFFRQX2M \bit_count_reg[0]  ( .D(n34), .SI(test_si1), .SE(test_se), .CK(clk), .RN(rstn), .Q(bit_count[0]) );
  SDFFRQX2M \bit_count_reg[2]  ( .D(n49), .SI(n51), .SE(test_se), .CK(clk), 
        .RN(rstn), .Q(bit_count[2]) );
  SDFFRQX2M \bit_count_reg[1]  ( .D(n33), .SI(n50), .SE(test_se), .CK(clk), 
        .RN(rstn), .Q(bit_count[1]) );
  SDFFRX1M \bit_count_reg[3]  ( .D(n32), .SI(n52), .SE(test_se), .CK(clk), 
        .RN(rstn), .Q(bit_count[3]), .QN(n19) );
  SDFFRQX2M \edge_count_reg[5]  ( .D(N32), .SI(edge_count[4]), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(edge_count[5]) );
  SDFFRQX2M \edge_count_reg[0]  ( .D(N27), .SI(n19), .SE(test_se), .CK(clk), 
        .RN(rstn), .Q(edge_count[0]) );
  SDFFRQX2M \edge_count_reg[4]  ( .D(N31), .SI(edge_count[3]), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(edge_count[4]) );
  SDFFRQX2M \edge_count_reg[3]  ( .D(N30), .SI(edge_count[2]), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(edge_count[3]) );
  SDFFRQX2M \edge_count_reg[2]  ( .D(N29), .SI(test_si2), .SE(test_se), .CK(
        clk), .RN(rstn), .Q(edge_count[2]) );
  INVX2M U7 ( .A(enable), .Y(n53) );
  NOR3X2M U8 ( .A(n53), .B(n30), .C(n50), .Y(n26) );
  AOI21X2M U15 ( .A0(n50), .A1(enable), .B0(n30), .Y(n29) );
  NOR2X2M U16 ( .A(complete_bit), .B(n53), .Y(n30) );
  INVX2M U17 ( .A(n38), .Y(n47) );
  INVX2M U18 ( .A(n23), .Y(n44) );
  NAND2X2M U19 ( .A(n47), .B(enable), .Y(n31) );
  NOR2BX2M U20 ( .AN(N22), .B(n31), .Y(N28) );
  NOR2BX2M U21 ( .AN(N23), .B(n31), .Y(N29) );
  NOR2BX2M U22 ( .AN(N24), .B(n31), .Y(N30) );
  NOR2BX2M U23 ( .AN(N25), .B(n31), .Y(N31) );
  INVX2M U24 ( .A(n39), .Y(n46) );
  OAI32X1M U25 ( .A0(n53), .A1(bit_count[0]), .A2(n30), .B0(n50), .B1(n48), 
        .Y(n34) );
  INVX2M U26 ( .A(n30), .Y(n48) );
  OAI21X2M U27 ( .A0(bit_count[1]), .A1(n53), .B0(n29), .Y(n27) );
  OAI2BB2X1M U28 ( .B0(n29), .B1(n51), .A0N(n51), .A1N(n26), .Y(n33) );
  INVX2M U29 ( .A(bit_count[1]), .Y(n51) );
  OR2X2M U30 ( .A(prescale[1]), .B(prescale[0]), .Y(n3) );
  OAI21X2M U31 ( .A0(n24), .A1(n19), .B0(n25), .Y(n32) );
  NAND4X2M U32 ( .A(bit_count[2]), .B(bit_count[1]), .C(n26), .D(n19), .Y(n25)
         );
  AOI21X2M U33 ( .A0(enable), .A1(n52), .B0(n27), .Y(n24) );
  INVX2M U34 ( .A(n28), .Y(n49) );
  AOI32X1M U35 ( .A0(bit_count[1]), .A1(n52), .A2(n26), .B0(n27), .B1(
        bit_count[2]), .Y(n28) );
  AOI21BX2M U36 ( .A0(n5), .A1(prescale[4]), .B0N(n6), .Y(n1) );
  NOR2X2M U37 ( .A(n2), .B(n31), .Y(N32) );
  XNOR2X2M U38 ( .A(\add_20/carry[5] ), .B(edge_count[5]), .Y(n2) );
  NOR2X2M U39 ( .A(edge_count[0]), .B(n31), .Y(N27) );
  INVX2M U40 ( .A(edge_count[3]), .Y(n43) );
  INVX2M U41 ( .A(edge_count[2]), .Y(n42) );
  INVX2M U42 ( .A(edge_count[5]), .Y(n45) );
  INVX2M U43 ( .A(bit_count[0]), .Y(n50) );
  INVX2M U44 ( .A(bit_count[2]), .Y(n52) );
  ADDHX1M U45 ( .A(edge_count[2]), .B(\add_20/carry[2] ), .CO(
        \add_20/carry[3] ), .S(N23) );
  ADDHX1M U46 ( .A(edge_count[3]), .B(\add_20/carry[3] ), .CO(
        \add_20/carry[4] ), .S(N24) );
  ADDHX1M U47 ( .A(n58), .B(edge_count[0]), .CO(\add_20/carry[2] ), .S(N22) );
  ADDHX1M U48 ( .A(edge_count[4]), .B(\add_20/carry[4] ), .CO(
        \add_20/carry[5] ), .S(N25) );
  CLKINVX1M U49 ( .A(prescale[0]), .Y(N3) );
  OAI2BB1X1M U50 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n3), .Y(N4) );
  OR2X1M U51 ( .A(n3), .B(prescale[2]), .Y(n4) );
  OAI2BB1X1M U52 ( .A0N(n3), .A1N(prescale[2]), .B0(n4), .Y(N5) );
  OR2X1M U53 ( .A(n4), .B(prescale[3]), .Y(n5) );
  OAI2BB1X1M U54 ( .A0N(n4), .A1N(prescale[3]), .B0(n5), .Y(N6) );
  OR2X1M U55 ( .A(n5), .B(prescale[4]), .Y(n6) );
  NOR2X1M U56 ( .A(n6), .B(prescale[5]), .Y(N9) );
  AO21XLM U57 ( .A0(n6), .A1(prescale[5]), .B0(N9), .Y(N8) );
  NOR2X1M U58 ( .A(n43), .B(N6), .Y(n35) );
  CLKNAND2X2M U59 ( .A(edge_count[4]), .B(n1), .Y(n23) );
  NOR2BX1M U60 ( .AN(edge_count[0]), .B(N3), .Y(n17) );
  OAI2B2X1M U61 ( .A1N(N4), .A0(n17), .B0(n17), .B1(n58), .Y(n18) );
  NAND3BX1M U62 ( .AN(n35), .B(n23), .C(n18), .Y(n41) );
  NOR2X1M U63 ( .A(n42), .B(N5), .Y(n40) );
  NAND2BX1M U64 ( .AN(edge_count[0]), .B(N3), .Y(n21) );
  AOI2BB1X1M U65 ( .A0N(n21), .A1N(n58), .B0(N4), .Y(n20) );
  AOI211X1M U66 ( .A0(n58), .A1(n21), .B0(n40), .C0(n20), .Y(n22) );
  AOI221XLM U67 ( .A0(N6), .A1(n43), .B0(N5), .B1(n42), .C0(n22), .Y(n36) );
  OAI32X1M U68 ( .A0(n36), .A1(n35), .A2(n44), .B0(edge_count[4]), .B1(n1), 
        .Y(n37) );
  NOR2X1M U69 ( .A(n45), .B(N8), .Y(n39) );
  AOI221XLM U70 ( .A0(n37), .A1(n46), .B0(N8), .B1(n45), .C0(N9), .Y(n38) );
  NOR4X1M U71 ( .A(n41), .B(n40), .C(n47), .D(n39), .Y(complete_bit) );
  INVXLM U72 ( .A(edge_count[1]), .Y(n57) );
  INVXLM U73 ( .A(n57), .Y(n58) );
  SDFFRHQX8M \edge_count_reg[1]  ( .D(N28), .SI(edge_count[0]), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(edge_count[1]) );
endmodule


module data_sampling_test_1 ( clk, rstn, prescale, RX_IN, enable, edge_count, 
        sampled_bit, test_si, test_se );
  input [5:0] prescale;
  input [5:0] edge_count;
  input clk, rstn, RX_IN, enable, test_si, test_se;
  output sampled_bit;
  wire   n22, n26, n27, n28, \add_19/carry[4] , \add_19/carry[3] ,
         \add_19/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55;
  wire   [5:0] centre_plus_one;
  wire   [5:0] centre_minus_one;
  wire   [2:0] oversamples;

  SDFFSQX2M \oversamples_reg[1]  ( .D(n27), .SI(n37), .SE(test_se), .CK(clk), 
        .SN(rstn), .Q(oversamples[1]) );
  SDFFSQX2M \oversamples_reg[0]  ( .D(n26), .SI(test_si), .SE(test_se), .CK(
        clk), .SN(rstn), .Q(oversamples[0]) );
  SDFFSQX2M \oversamples_reg[2]  ( .D(n28), .SI(n20), .SE(test_se), .CK(clk), 
        .SN(rstn), .Q(oversamples[2]) );
  SDFFSQX2M sampled_bit_reg ( .D(n22), .SI(oversamples[2]), .SE(test_se), .CK(
        clk), .SN(rstn), .Q(sampled_bit) );
  OR2X2M U3 ( .A(prescale[2]), .B(prescale[1]), .Y(n1) );
  ADDHX1M U4 ( .A(prescale[5]), .B(\add_19/carry[4] ), .CO(centre_plus_one[5]), 
        .S(centre_plus_one[4]) );
  ADDHX1M U5 ( .A(prescale[4]), .B(\add_19/carry[3] ), .CO(\add_19/carry[4] ), 
        .S(centre_plus_one[3]) );
  ADDHX1M U6 ( .A(prescale[3]), .B(\add_19/carry[2] ), .CO(\add_19/carry[3] ), 
        .S(centre_plus_one[2]) );
  ADDHX1M U7 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_19/carry[2] ), .S(
        centre_plus_one[1]) );
  CLKINVX1M U8 ( .A(prescale[1]), .Y(centre_minus_one[0]) );
  OAI2BB1X1M U9 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n1), .Y(
        centre_minus_one[1]) );
  OR2X1M U10 ( .A(n1), .B(prescale[3]), .Y(n2) );
  OAI2BB1X1M U11 ( .A0N(n1), .A1N(prescale[3]), .B0(n2), .Y(
        centre_minus_one[2]) );
  XNOR2X1M U12 ( .A(prescale[4]), .B(n2), .Y(centre_minus_one[3]) );
  NOR3X1M U13 ( .A(prescale[4]), .B(prescale[5]), .C(n2), .Y(
        centre_minus_one[5]) );
  OAI21X1M U14 ( .A0(prescale[4]), .A1(n2), .B0(prescale[5]), .Y(n3) );
  NAND2BX1M U15 ( .AN(centre_minus_one[5]), .B(n3), .Y(centre_minus_one[4]) );
  CLKMX2X2M U16 ( .A(oversamples[2]), .B(RX_IN), .S0(n4), .Y(n28) );
  NOR4X1M U17 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(n4) );
  OAI22X1M U18 ( .A0(centre_plus_one[5]), .A1(n9), .B0(centre_plus_one[4]), 
        .B1(n10), .Y(n6) );
  NAND4X1M U19 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n5) );
  AOI2BB2XLM U24 ( .B0(edge_count[0]), .B1(prescale[1]), .A0N(n15), .A1N(
        centre_plus_one[3]), .Y(n14) );
  NAND4BX1M U25 ( .AN(n16), .B(n17), .C(n18), .D(n19), .Y(n13) );
  MXI2X1M U26 ( .A(n20), .B(n29), .S0(n30), .Y(n27) );
  NOR4BX1M U27 ( .AN(n12), .B(n31), .C(n16), .D(n32), .Y(n30) );
  XNOR2X1M U28 ( .A(n10), .B(prescale[5]), .Y(n16) );
  NAND3X1M U29 ( .A(n17), .B(n19), .C(n18), .Y(n31) );
  AND3X1M U30 ( .A(n33), .B(n9), .C(n34), .Y(n18) );
  XNOR2X1M U31 ( .A(edge_count[0]), .B(prescale[1]), .Y(n34) );
  CLKXOR2X2M U32 ( .A(n35), .B(prescale[2]), .Y(n33) );
  CLKXOR2X2M U33 ( .A(n15), .B(prescale[4]), .Y(n19) );
  CLKXOR2X2M U34 ( .A(n36), .B(prescale[3]), .Y(n17) );
  MXI2X1M U35 ( .A(n37), .B(n29), .S0(n38), .Y(n26) );
  NOR2X1M U36 ( .A(n32), .B(n12), .Y(n38) );
  NAND4X1M U37 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n12) );
  NOR3X1M U38 ( .A(n43), .B(n44), .C(n45), .Y(n42) );
  CLKXOR2X2M U39 ( .A(edge_count[4]), .B(centre_minus_one[4]), .Y(n45) );
  CLKXOR2X2M U40 ( .A(edge_count[1]), .B(centre_minus_one[1]), .Y(n44) );
  CLKXOR2X2M U41 ( .A(edge_count[0]), .B(centre_minus_one[0]), .Y(n43) );
  CLKXOR2X2M U42 ( .A(n36), .B(centre_minus_one[2]), .Y(n41) );
  CLKXOR2X2M U43 ( .A(n15), .B(centre_minus_one[3]), .Y(n40) );
  CLKXOR2X2M U44 ( .A(n9), .B(centre_minus_one[5]), .Y(n39) );
  CLKINVX1M U45 ( .A(edge_count[5]), .Y(n9) );
  CLKINVX1M U46 ( .A(enable), .Y(n32) );
  CLKINVX1M U47 ( .A(RX_IN), .Y(n29) );
  CLKMX2X2M U48 ( .A(sampled_bit), .B(n46), .S0(n47), .Y(n22) );
  AOI2B1X1M U49 ( .A1N(n11), .A0(n48), .B0(n8), .Y(n47) );
  OAI21X1M U50 ( .A0(edge_count[5]), .A1(n49), .B0(enable), .Y(n8) );
  CLKNAND2X2M U51 ( .A(edge_count[5]), .B(n49), .Y(n48) );
  CLKINVX1M U52 ( .A(centre_plus_one[5]), .Y(n49) );
  OAI21X1M U53 ( .A0(centre_plus_one[4]), .A1(n10), .B0(n50), .Y(n11) );
  OAI2BB2X1M U54 ( .B0(n51), .B1(n52), .A0N(n10), .A1N(centre_plus_one[4]), 
        .Y(n50) );
  AOI222X1M U55 ( .A0(centre_plus_one[3]), .A1(n15), .B0(n53), .B1(n54), .C0(
        centre_plus_one[2]), .C1(n36), .Y(n52) );
  OAI2BB2X1M U56 ( .B0(edge_count[0]), .B1(prescale[1]), .A0N(n35), .A1N(
        centre_plus_one[1]), .Y(n54) );
  CLKINVX1M U57 ( .A(n7), .Y(n53) );
  OAI22X1M U58 ( .A0(centre_plus_one[2]), .A1(n36), .B0(centre_plus_one[1]), 
        .B1(n35), .Y(n7) );
  CLKINVX1M U59 ( .A(edge_count[1]), .Y(n35) );
  CLKINVX1M U60 ( .A(edge_count[2]), .Y(n36) );
  NOR2X1M U61 ( .A(centre_plus_one[3]), .B(n15), .Y(n51) );
  CLKINVX1M U62 ( .A(edge_count[3]), .Y(n15) );
  CLKINVX1M U63 ( .A(edge_count[4]), .Y(n10) );
  OAI21X1M U64 ( .A0(n20), .A1(n37), .B0(n55), .Y(n46) );
  OAI21X1M U65 ( .A0(oversamples[0]), .A1(oversamples[1]), .B0(oversamples[2]), 
        .Y(n55) );
  CLKINVX1M U66 ( .A(oversamples[0]), .Y(n37) );
  CLKINVX1M U67 ( .A(oversamples[1]), .Y(n20) );
endmodule


module des_test_1 ( clk, rstn, enable, prescale, edge_count, sampled_bit, 
        P_DATA, test_so, test_se );
  input [5:0] prescale;
  input [5:0] edge_count;
  output [7:0] P_DATA;
  input clk, rstn, enable, sampled_bit, test_se;
  output test_so;
  wire   N1, N3, N4, N5, N6, N7, n1, n11, n13, n15, n17, n19, n21, n23, n25,
         \add_16/carry[4] , \add_16/carry[3] , n2, n3, n4, n5, n6, n7, n8, n9,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  assign N1 = prescale[1];
  assign test_so = n29;

  SDFFSQX2M \P_DATA_reg[0]  ( .D(n11), .SI(sampled_bit), .SE(test_se), .CK(clk), .SN(rstn), .Q(P_DATA[0]) );
  SDFFSQX2M \P_DATA_reg[5]  ( .D(n21), .SI(n32), .SE(test_se), .CK(clk), .SN(
        rstn), .Q(P_DATA[5]) );
  SDFFSQX2M \P_DATA_reg[1]  ( .D(n13), .SI(P_DATA[0]), .SE(test_se), .CK(clk), 
        .SN(rstn), .Q(P_DATA[1]) );
  SDFFSQX2M \P_DATA_reg[4]  ( .D(n19), .SI(n33), .SE(test_se), .CK(clk), .SN(
        rstn), .Q(P_DATA[4]) );
  SDFFSQX2M \P_DATA_reg[7]  ( .D(n25), .SI(n30), .SE(test_se), .CK(clk), .SN(
        rstn), .Q(P_DATA[7]) );
  SDFFSQX2M \P_DATA_reg[3]  ( .D(n17), .SI(n34), .SE(test_se), .CK(clk), .SN(
        rstn), .Q(P_DATA[3]) );
  SDFFSQX2M \P_DATA_reg[6]  ( .D(n23), .SI(n31), .SE(test_se), .CK(clk), .SN(
        rstn), .Q(P_DATA[6]) );
  SDFFSQX2M \P_DATA_reg[2]  ( .D(n15), .SI(n35), .SE(test_se), .CK(clk), .SN(
        rstn), .Q(P_DATA[2]) );
  INVX2M U3 ( .A(prescale[2]), .Y(n2) );
  OAI22X1M U4 ( .A0(n28), .A1(n35), .B0(n1), .B1(n34), .Y(n13) );
  OAI22X1M U5 ( .A0(n28), .A1(n34), .B0(n1), .B1(n33), .Y(n15) );
  OAI22X1M U6 ( .A0(n28), .A1(n33), .B0(n1), .B1(n32), .Y(n17) );
  OAI22X1M U7 ( .A0(n28), .A1(n32), .B0(n1), .B1(n31), .Y(n19) );
  OAI22X1M U8 ( .A0(n28), .A1(n31), .B0(n1), .B1(n30), .Y(n21) );
  OAI22X1M U9 ( .A0(n28), .A1(n30), .B0(n1), .B1(n29), .Y(n23) );
  INVX2M U10 ( .A(n1), .Y(n28) );
  NAND2X2M U11 ( .A(enable), .B(N7), .Y(n1) );
  OAI2BB2X1M U12 ( .B0(n1), .B1(n35), .A0N(P_DATA[0]), .A1N(n1), .Y(n11) );
  OAI2BB2X1M U13 ( .B0(n28), .B1(n29), .A0N(sampled_bit), .A1N(n28), .Y(n25)
         );
  INVX2M U14 ( .A(P_DATA[2]), .Y(n34) );
  INVX2M U15 ( .A(P_DATA[6]), .Y(n30) );
  INVX2M U16 ( .A(P_DATA[7]), .Y(n29) );
  INVX2M U17 ( .A(P_DATA[3]), .Y(n33) );
  INVX2M U18 ( .A(P_DATA[1]), .Y(n35) );
  INVX2M U19 ( .A(P_DATA[4]), .Y(n32) );
  INVX2M U28 ( .A(P_DATA[5]), .Y(n31) );
  AND2X1M U29 ( .A(\add_16/carry[4] ), .B(prescale[5]), .Y(N6) );
  CLKXOR2X2M U30 ( .A(prescale[5]), .B(\add_16/carry[4] ), .Y(N5) );
  AND2X1M U31 ( .A(\add_16/carry[3] ), .B(prescale[4]), .Y(\add_16/carry[4] )
         );
  CLKXOR2X2M U32 ( .A(prescale[4]), .B(\add_16/carry[3] ), .Y(N4) );
  AND2X1M U33 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U34 ( .A(prescale[3]), .B(prescale[2]), .Y(N3) );
  NOR2BX1M U35 ( .AN(edge_count[0]), .B(N1), .Y(n3) );
  OAI2B2X1M U36 ( .A1N(n2), .A0(n3), .B0(edge_count[1]), .B1(n3), .Y(n7) );
  NOR2BX1M U37 ( .AN(N1), .B(edge_count[0]), .Y(n4) );
  OAI2B2X1M U38 ( .A1N(edge_count[1]), .A0(n4), .B0(n2), .B1(n4), .Y(n6) );
  XNOR2X1M U39 ( .A(N6), .B(edge_count[5]), .Y(n5) );
  NAND3X1M U40 ( .A(n7), .B(n6), .C(n5), .Y(n27) );
  CLKXOR2X2M U41 ( .A(N5), .B(edge_count[4]), .Y(n26) );
  CLKXOR2X2M U42 ( .A(N3), .B(edge_count[2]), .Y(n9) );
  CLKXOR2X2M U43 ( .A(N4), .B(edge_count[3]), .Y(n8) );
  NOR4X1M U44 ( .A(n27), .B(n26), .C(n9), .D(n8), .Y(N7) );
endmodule


module start_check_test_1 ( clk, rstn, enable, sampled_bit, prescale, 
        edge_count, start_glitch, test_si, test_se );
  input [5:0] prescale;
  input [5:0] edge_count;
  input clk, rstn, enable, sampled_bit, test_si, test_se;
  output start_glitch;
  wire   N2, N4, N5, N6, N7, N8, N11, \add_16/carry[4] , \add_16/carry[3] , n1,
         n2, n3, n4, n6, n7, n8, n9, n10, n11;
  assign N2 = prescale[1];

  SDFFRQX2M start_glitch_reg ( .D(N11), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rstn), .Q(start_glitch) );
  INVX2M U4 ( .A(prescale[2]), .Y(n1) );
  AND3X2M U5 ( .A(enable), .B(N8), .C(sampled_bit), .Y(N11) );
  AND2X1M U6 ( .A(\add_16/carry[4] ), .B(prescale[5]), .Y(N7) );
  CLKXOR2X2M U7 ( .A(prescale[5]), .B(\add_16/carry[4] ), .Y(N6) );
  AND2X1M U8 ( .A(\add_16/carry[3] ), .B(prescale[4]), .Y(\add_16/carry[4] )
         );
  CLKXOR2X2M U9 ( .A(prescale[4]), .B(\add_16/carry[3] ), .Y(N5) );
  AND2X1M U10 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U11 ( .A(prescale[3]), .B(prescale[2]), .Y(N4) );
  NOR2BX1M U12 ( .AN(edge_count[0]), .B(N2), .Y(n2) );
  OAI2B2X1M U13 ( .A1N(n1), .A0(n2), .B0(edge_count[1]), .B1(n2), .Y(n7) );
  NOR2BX1M U14 ( .AN(N2), .B(edge_count[0]), .Y(n3) );
  OAI2B2X1M U15 ( .A1N(edge_count[1]), .A0(n3), .B0(n1), .B1(n3), .Y(n6) );
  XNOR2X1M U16 ( .A(N7), .B(edge_count[5]), .Y(n4) );
  NAND3X1M U17 ( .A(n7), .B(n6), .C(n4), .Y(n11) );
  CLKXOR2X2M U18 ( .A(N6), .B(edge_count[4]), .Y(n10) );
  CLKXOR2X2M U19 ( .A(N4), .B(edge_count[2]), .Y(n9) );
  CLKXOR2X2M U20 ( .A(N5), .B(edge_count[3]), .Y(n8) );
  NOR4X1M U21 ( .A(n11), .B(n10), .C(n9), .D(n8), .Y(N8) );
endmodule


module stop_check_test_1 ( clk, rstn, enable, sampled_bit, prescale, 
        edge_count, bit_count, stop_error, test_si, test_se );
  input [5:0] prescale;
  input [5:0] edge_count;
  input [3:0] bit_count;
  input clk, rstn, enable, sampled_bit, test_si, test_se;
  output stop_error;
  wire   N2, N4, N5, N6, N7, n8, n9, n10, n11, \add_17/carry[4] ,
         \add_17/carry[3] , n1, n3, n4, n6, n7, n12, n13, n14, n15, n16, n17,
         n18;
  assign N2 = prescale[1];

  SDFFRHQX8M stop_error_reg ( .D(n11), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rstn), .Q(stop_error) );
  OR4X1M U4 ( .A(n17), .B(n16), .C(n15), .D(n14), .Y(n1) );
  INVX2M U6 ( .A(prescale[2]), .Y(n3) );
  OAI31X1M U7 ( .A0(n18), .A1(sampled_bit), .A2(n1), .B0(n8), .Y(n11) );
  OAI211X2M U8 ( .A0(n1), .A1(n18), .B0(n9), .C0(stop_error), .Y(n8) );
  INVX2M U9 ( .A(enable), .Y(n18) );
  NAND3BX2M U10 ( .AN(bit_count[1]), .B(bit_count[0]), .C(n10), .Y(n9) );
  NOR2X2M U11 ( .A(bit_count[3]), .B(bit_count[2]), .Y(n10) );
  AND2X1M U12 ( .A(\add_17/carry[4] ), .B(prescale[5]), .Y(N7) );
  CLKXOR2X2M U13 ( .A(prescale[5]), .B(\add_17/carry[4] ), .Y(N6) );
  AND2X1M U14 ( .A(\add_17/carry[3] ), .B(prescale[4]), .Y(\add_17/carry[4] )
         );
  CLKXOR2X2M U15 ( .A(prescale[4]), .B(\add_17/carry[3] ), .Y(N5) );
  AND2X1M U16 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_17/carry[3] ) );
  CLKXOR2X2M U17 ( .A(prescale[3]), .B(prescale[2]), .Y(N4) );
  NOR2BX1M U18 ( .AN(edge_count[0]), .B(N2), .Y(n4) );
  OAI2B2X1M U19 ( .A1N(n3), .A0(n4), .B0(edge_count[1]), .B1(n4), .Y(n13) );
  NOR2BX1M U20 ( .AN(N2), .B(edge_count[0]), .Y(n6) );
  OAI2B2X1M U21 ( .A1N(edge_count[1]), .A0(n6), .B0(n3), .B1(n6), .Y(n12) );
  XNOR2X1M U22 ( .A(N7), .B(edge_count[5]), .Y(n7) );
  NAND3X1M U23 ( .A(n13), .B(n12), .C(n7), .Y(n17) );
  CLKXOR2X2M U24 ( .A(N6), .B(edge_count[4]), .Y(n16) );
  CLKXOR2X2M U25 ( .A(N4), .B(edge_count[2]), .Y(n15) );
  CLKXOR2X2M U26 ( .A(N5), .B(edge_count[3]), .Y(n14) );
endmodule


module parity_check_test_1 ( clk, rstn, enable, parity_type, sampled_bit, 
        P_DATA, prescale, edge_count, bit_count, parity_error, test_se );
  input [7:0] P_DATA;
  input [5:0] prescale;
  input [5:0] edge_count;
  input [3:0] bit_count;
  input clk, rstn, enable, parity_type, sampled_bit, test_se;
  output parity_error;
  wire   N15, N17, N18, N19, N20, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, \add_29/carry[4] , \add_29/carry[3] , n1, n3, n4, n6, n7, n18,
         n19, n20, n21, n22, n23, n24;
  assign N15 = prescale[1];

  SDFFRHQX8M parity_error_reg ( .D(n17), .SI(edge_count[5]), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(parity_error) );
  OR4X1M U4 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(n1) );
  INVX2M U6 ( .A(prescale[2]), .Y(n3) );
  INVX2M U7 ( .A(enable), .Y(n24) );
  OAI31X1M U8 ( .A0(n24), .A1(n8), .A2(n1), .B0(n9), .Y(n17) );
  XOR3XLM U9 ( .A(n12), .B(n13), .C(n14), .Y(n8) );
  OAI211X2M U10 ( .A0(n1), .A1(n24), .B0(n10), .C0(parity_error), .Y(n9) );
  XNOR2X2M U11 ( .A(sampled_bit), .B(parity_type), .Y(n14) );
  XOR3XLM U12 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n15), .Y(n13) );
  XNOR2X2M U13 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n15) );
  XOR3XLM U14 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n16), .Y(n12) );
  XNOR2X2M U15 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n16) );
  NAND3BX2M U16 ( .AN(bit_count[1]), .B(bit_count[0]), .C(n11), .Y(n10) );
  NOR2X2M U17 ( .A(bit_count[3]), .B(bit_count[2]), .Y(n11) );
  AND2X1M U18 ( .A(\add_29/carry[4] ), .B(prescale[5]), .Y(N20) );
  CLKXOR2X2M U19 ( .A(prescale[5]), .B(\add_29/carry[4] ), .Y(N19) );
  AND2X1M U20 ( .A(\add_29/carry[3] ), .B(prescale[4]), .Y(\add_29/carry[4] )
         );
  CLKXOR2X2M U21 ( .A(prescale[4]), .B(\add_29/carry[3] ), .Y(N18) );
  AND2X1M U22 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_29/carry[3] ) );
  CLKXOR2X2M U23 ( .A(prescale[3]), .B(prescale[2]), .Y(N17) );
  NOR2BX1M U24 ( .AN(edge_count[0]), .B(N15), .Y(n4) );
  OAI2B2X1M U25 ( .A1N(n3), .A0(n4), .B0(edge_count[1]), .B1(n4), .Y(n19) );
  NOR2BX1M U26 ( .AN(N15), .B(edge_count[0]), .Y(n6) );
  OAI2B2X1M U27 ( .A1N(edge_count[1]), .A0(n6), .B0(n3), .B1(n6), .Y(n18) );
  XNOR2X1M U28 ( .A(N20), .B(edge_count[5]), .Y(n7) );
  NAND3X1M U29 ( .A(n19), .B(n18), .C(n7), .Y(n23) );
  CLKXOR2X2M U30 ( .A(N19), .B(edge_count[4]), .Y(n22) );
  CLKXOR2X2M U31 ( .A(N17), .B(edge_count[2]), .Y(n21) );
  CLKXOR2X2M U32 ( .A(N18), .B(edge_count[3]), .Y(n20) );
endmodule


module UART_RX_TOP_test_1 ( clk, rstn, RX_IN, prescale, parity_enable, 
        parity_type, P_DATA, parity_error, stop_error, data_valid, test_si2, 
        test_si1, test_so2, test_so1, test_se );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input clk, rstn, RX_IN, parity_enable, parity_type, test_si2, test_si1,
         test_se;
  output parity_error, stop_error, data_valid, test_so2, test_so1;
  wire   start_glitch, data_sample_en, edge_bit_count_en, des_en, stp_chk_en,
         strt_chk_en, parity_chk_en, sampled_bit, n1, n2, n3, n4, n8, n9;
  wire   [5:0] edge_count;
  wire   [3:0] bit_count;
  assign test_so1 = edge_count[1];
  assign test_so2 = start_glitch;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(prescale[2]), .Y(n2) );
  INVXLM U3 ( .A(edge_count[1]), .Y(n8) );
  INVXLM U4 ( .A(n8), .Y(n9) );
  FSM_UART_RX_test_1 FSM ( .clk(clk), .rstn(rstn), .parity_enable(
        parity_enable), .RX_IN(RX_IN), .prescale({prescale[5:3], n1, 
        prescale[1:0]}), .edge_count({edge_count[5:2], n9, edge_count[0]}), 
        .bit_count(bit_count), .stop_error(stop_error), .parity_error(
        parity_error), .start_glitch(start_glitch), .data_sample_en(
        data_sample_en), .edge_bit_count_en(edge_bit_count_en), .des_en(des_en), .stp_chk_en(stp_chk_en), .strt_chk_en(strt_chk_en), .parity_chk_en(
        parity_chk_en), .data_valid(data_valid), .test_si(test_si1), .test_so(
        n4), .test_se(test_se) );
  edge_bit_counter_test_1 edge_bit_counter ( .clk(clk), .rstn(rstn), 
        .prescale({prescale[5:3], n1, prescale[1:0]}), .enable(
        edge_bit_count_en), .edge_count(edge_count), .bit_count(bit_count), 
        .test_si2(test_si2), .test_si1(n3), .test_se(test_se) );
  data_sampling_test_1 data_sampling ( .clk(clk), .rstn(rstn), .prescale({
        prescale[5:3], n1, prescale[1:0]}), .RX_IN(RX_IN), .enable(
        data_sample_en), .edge_count({edge_count[5:2], n9, edge_count[0]}), 
        .sampled_bit(sampled_bit), .test_si(n4), .test_se(test_se) );
  des_test_1 des ( .clk(clk), .rstn(rstn), .enable(des_en), .prescale({
        prescale[5:3], n1, prescale[1:0]}), .edge_count({edge_count[5:2], n9, 
        edge_count[0]}), .sampled_bit(sampled_bit), .P_DATA(P_DATA), .test_so(
        n3), .test_se(test_se) );
  start_check_test_1 strt_chk ( .clk(clk), .rstn(rstn), .enable(strt_chk_en), 
        .sampled_bit(sampled_bit), .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count({edge_count[5:2], n9, edge_count[0]}), .start_glitch(
        start_glitch), .test_si(stop_error), .test_se(test_se) );
  stop_check_test_1 stp_chk ( .clk(clk), .rstn(rstn), .enable(stp_chk_en), 
        .sampled_bit(sampled_bit), .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count({edge_count[5:2], n9, edge_count[0]}), .bit_count(bit_count), 
        .stop_error(stop_error), .test_si(parity_error), .test_se(test_se) );
  parity_check_test_1 par_chk ( .clk(clk), .rstn(rstn), .enable(parity_chk_en), 
        .parity_type(parity_type), .sampled_bit(sampled_bit), .P_DATA(P_DATA), 
        .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count({
        edge_count[5:2], n9, edge_count[0]}), .bit_count(bit_count), 
        .parity_error(parity_error), .test_se(test_se) );
endmodule


module fsm_uart_tx_test_1 ( clk, rstn, data_valid, par_en, ser_done, ser_en, 
        mux_sel, busy, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input clk, rstn, data_valid, par_en, ser_done, test_si, test_se;
  output ser_en, busy, test_so;
  wire   busy_c, n10, n11, n12, n13, n5, n6, n7, n8, n9;
  wire   [2:0] curent_state;
  wire   [2:0] next_state;
  assign test_so = n8;

  SDFFRQX2M \curent_state_reg[2]  ( .D(next_state[2]), .SI(n9), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(curent_state[2]) );
  SDFFRQX2M busy_reg ( .D(busy_c), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rstn), .Q(busy) );
  SDFFRQX2M \curent_state_reg[1]  ( .D(next_state[1]), .SI(n7), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(curent_state[1]) );
  SDFFRQX2M \curent_state_reg[0]  ( .D(next_state[0]), .SI(busy), .SE(test_se), 
        .CK(clk), .RN(rstn), .Q(curent_state[0]) );
  OAI211X2M U7 ( .A0(ser_done), .A1(n10), .B0(n12), .C0(n13), .Y(next_state[0]) );
  NAND3X2M U8 ( .A(n9), .B(n8), .C(data_valid), .Y(n12) );
  NAND2X2M U9 ( .A(n10), .B(n11), .Y(mux_sel[1]) );
  INVX2M U10 ( .A(n10), .Y(ser_en) );
  OAI31X1M U11 ( .A0(n5), .A1(par_en), .A2(n10), .B0(n11), .Y(next_state[2])
         );
  INVX2M U12 ( .A(ser_done), .Y(n5) );
  OAI211X2M U13 ( .A0(curent_state[0]), .A1(n9), .B0(n13), .C0(n6), .Y(busy_c)
         );
  INVX2M U14 ( .A(mux_sel[1]), .Y(n6) );
  NAND3X2M U15 ( .A(curent_state[0]), .B(n8), .C(curent_state[1]), .Y(n10) );
  INVX2M U16 ( .A(curent_state[2]), .Y(n8) );
  NAND2X2M U17 ( .A(curent_state[0]), .B(n8), .Y(mux_sel[0]) );
  NAND3X2M U18 ( .A(n7), .B(n8), .C(curent_state[1]), .Y(n11) );
  NAND3X2M U19 ( .A(n9), .B(n8), .C(curent_state[0]), .Y(n13) );
  AOI21X2M U20 ( .A0(n7), .A1(n9), .B0(curent_state[2]), .Y(next_state[1]) );
  INVX2M U21 ( .A(curent_state[1]), .Y(n9) );
  INVX2M U22 ( .A(curent_state[0]), .Y(n7) );
endmodule


module tx_mux_test_1 ( clk, rst, mux_sel, start_bit, stop_bit, ser_data, 
        par_bit, TX_OUT, test_si, test_se );
  input [1:0] mux_sel;
  input clk, rst, start_bit, stop_bit, ser_data, par_bit, test_si, test_se;
  output TX_OUT;
  wire   mux_out, n3, n4, n5;

  SDFFRHQX8M TX_OUT_reg ( .D(mux_out), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(TX_OUT) );
  OAI2B2X1M U5 ( .A1N(mux_sel[1]), .A0(n3), .B0(mux_sel[1]), .B1(n4), .Y(
        mux_out) );
  AOI22X1M U6 ( .A0(start_bit), .A1(n5), .B0(stop_bit), .B1(mux_sel[0]), .Y(n4) );
  AOI22X1M U7 ( .A0(ser_data), .A1(n5), .B0(par_bit), .B1(mux_sel[0]), .Y(n3)
         );
  INVX2M U8 ( .A(mux_sel[0]), .Y(n5) );
endmodule


module parity_calc_test_1 ( clk, rst, P_DATA, data_valid, busy, par_en, 
        par_typ, par_bit, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input clk, rst, data_valid, busy, par_en, par_typ, test_si, test_se;
  output par_bit, test_so;
  wire   n1, n2, n3, n4, n5, n6, n8, n10, n12, n14, n16, n18, n20, n22;
  wire   [7:0] saved_data;
  assign test_so = saved_data[7];

  SDFFRQX2M \saved_data_reg[1]  ( .D(n10), .SI(saved_data[0]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(saved_data[1]) );
  SDFFRQX2M \saved_data_reg[0]  ( .D(n8), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(saved_data[0]) );
  SDFFRQX2M \saved_data_reg[2]  ( .D(n12), .SI(saved_data[1]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(saved_data[2]) );
  SDFFRQX2M \saved_data_reg[3]  ( .D(n14), .SI(saved_data[2]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(saved_data[3]) );
  SDFFRQX2M \saved_data_reg[5]  ( .D(n18), .SI(saved_data[4]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(saved_data[5]) );
  SDFFRQX2M \saved_data_reg[4]  ( .D(n16), .SI(saved_data[3]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(saved_data[4]) );
  SDFFRQX2M \saved_data_reg[6]  ( .D(n20), .SI(saved_data[5]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(saved_data[6]) );
  SDFFRQX2M \saved_data_reg[7]  ( .D(n22), .SI(saved_data[6]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(saved_data[7]) );
  NOR2BX2M U2 ( .AN(data_valid), .B(busy), .Y(n6) );
  NOR2BX2M U3 ( .AN(par_en), .B(n1), .Y(par_bit) );
  XOR3XLM U4 ( .A(n2), .B(par_typ), .C(n3), .Y(n1) );
  XOR3XLM U5 ( .A(saved_data[1]), .B(saved_data[0]), .C(n4), .Y(n3) );
  XOR3XLM U6 ( .A(saved_data[5]), .B(saved_data[4]), .C(n5), .Y(n2) );
  AO2B2X2M U7 ( .B0(P_DATA[0]), .B1(n6), .A0(saved_data[0]), .A1N(n6), .Y(n8)
         );
  AO2B2X2M U8 ( .B0(P_DATA[1]), .B1(n6), .A0(saved_data[1]), .A1N(n6), .Y(n10)
         );
  AO2B2X2M U9 ( .B0(P_DATA[2]), .B1(n6), .A0(saved_data[2]), .A1N(n6), .Y(n12)
         );
  AO2B2X2M U10 ( .B0(P_DATA[3]), .B1(n6), .A0(saved_data[3]), .A1N(n6), .Y(n14) );
  AO2B2X2M U11 ( .B0(P_DATA[4]), .B1(n6), .A0(saved_data[4]), .A1N(n6), .Y(n16) );
  AO2B2X2M U12 ( .B0(P_DATA[5]), .B1(n6), .A0(saved_data[5]), .A1N(n6), .Y(n18) );
  AO2B2X2M U13 ( .B0(P_DATA[6]), .B1(n6), .A0(saved_data[6]), .A1N(n6), .Y(n20) );
  AO2B2X2M U14 ( .B0(P_DATA[7]), .B1(n6), .A0(saved_data[7]), .A1N(n6), .Y(n22) );
  CLKXOR2X2M U15 ( .A(saved_data[7]), .B(saved_data[6]), .Y(n5) );
  XNOR2X2M U16 ( .A(saved_data[2]), .B(saved_data[3]), .Y(n4) );
endmodule


module ser_test_1 ( clk, rstn, P_DATA, data_valid, busy, ser_en, ser_done, 
        ser_data, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input clk, rstn, data_valid, busy, ser_en, test_si, test_se;
  output ser_done, ser_data, test_so;
  wire   N2, N3, N4, N11, N12, N13, N15, n1, n4, n5, n13, n15, n17, n19, n21,
         n23, n25, n27, n3, n6, n7, n8, n28, n29, n30;
  wire   [7:0] saved_data;
  assign test_so = saved_data[7];

  SDFFSQX2M \saved_data_reg[5]  ( .D(n23), .SI(saved_data[4]), .SE(test_se), 
        .CK(clk), .SN(rstn), .Q(saved_data[5]) );
  SDFFSQX2M \saved_data_reg[1]  ( .D(n15), .SI(saved_data[0]), .SE(test_se), 
        .CK(clk), .SN(rstn), .Q(saved_data[1]) );
  SDFFSQX2M \saved_data_reg[3]  ( .D(n19), .SI(saved_data[2]), .SE(test_se), 
        .CK(clk), .SN(rstn), .Q(saved_data[3]) );
  SDFFSQX2M \saved_data_reg[6]  ( .D(n25), .SI(saved_data[5]), .SE(test_se), 
        .CK(clk), .SN(rstn), .Q(saved_data[6]) );
  SDFFSQX2M \saved_data_reg[2]  ( .D(n17), .SI(saved_data[1]), .SE(test_se), 
        .CK(clk), .SN(rstn), .Q(saved_data[2]) );
  SDFFSQX2M \saved_data_reg[4]  ( .D(n21), .SI(saved_data[3]), .SE(test_se), 
        .CK(clk), .SN(rstn), .Q(saved_data[4]) );
  SDFFSQX2M \saved_data_reg[0]  ( .D(n13), .SI(n28), .SE(test_se), .CK(clk), 
        .SN(rstn), .Q(saved_data[0]) );
  SDFFRQX2M \cnt_reg[1]  ( .D(N12), .SI(n7), .SE(test_se), .CK(clk), .RN(rstn), 
        .Q(N3) );
  SDFFRQX2M \cnt_reg[2]  ( .D(N13), .SI(n8), .SE(test_se), .CK(clk), .RN(rstn), 
        .Q(N4) );
  SDFFRQX2M \cnt_reg[0]  ( .D(N11), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rstn), .Q(N2) );
  SDFFSQX1M \saved_data_reg[7]  ( .D(n27), .SI(saved_data[6]), .SE(test_se), 
        .CK(clk), .SN(rstn), .Q(saved_data[7]) );
  INVX2M U4 ( .A(n4), .Y(n30) );
  AOI211X2M U5 ( .A0(n7), .A1(n8), .B0(n29), .C0(n1), .Y(N12) );
  NOR2X2M U6 ( .A(n8), .B(n7), .Y(n1) );
  INVX2M U7 ( .A(ser_en), .Y(n29) );
  NOR2BX2M U8 ( .AN(data_valid), .B(busy), .Y(n4) );
  AO22X1M U9 ( .A0(saved_data[0]), .A1(n30), .B0(P_DATA[0]), .B1(n4), .Y(n13)
         );
  AO22X1M U10 ( .A0(saved_data[1]), .A1(n30), .B0(P_DATA[1]), .B1(n4), .Y(n15)
         );
  AO22X1M U11 ( .A0(saved_data[2]), .A1(n30), .B0(P_DATA[2]), .B1(n4), .Y(n17)
         );
  AO22X1M U12 ( .A0(saved_data[3]), .A1(n30), .B0(P_DATA[3]), .B1(n4), .Y(n19)
         );
  AO22X1M U13 ( .A0(saved_data[4]), .A1(n30), .B0(P_DATA[4]), .B1(n4), .Y(n21)
         );
  AO22X1M U14 ( .A0(saved_data[5]), .A1(n30), .B0(P_DATA[5]), .B1(n4), .Y(n23)
         );
  AO22X1M U15 ( .A0(saved_data[6]), .A1(n30), .B0(P_DATA[6]), .B1(n4), .Y(n25)
         );
  AO22X1M U16 ( .A0(saved_data[7]), .A1(n30), .B0(P_DATA[7]), .B1(n4), .Y(n27)
         );
  OAI2BB2X1M U17 ( .B0(n5), .B1(n29), .A0N(N4), .A1N(N11), .Y(N13) );
  AOI22X1M U18 ( .A0(n1), .A1(n28), .B0(N4), .B1(n8), .Y(n5) );
  INVX2M U19 ( .A(N4), .Y(n28) );
  NOR2X2M U20 ( .A(n29), .B(N2), .Y(N11) );
  OR2X2M U21 ( .A(N15), .B(n29), .Y(ser_data) );
  MX2X2M U22 ( .A(n6), .B(n3), .S0(N4), .Y(N15) );
  MX4X1M U23 ( .A(saved_data[0]), .B(saved_data[1]), .C(saved_data[2]), .D(
        saved_data[3]), .S0(N2), .S1(N3), .Y(n6) );
  MX4X1M U35 ( .A(saved_data[4]), .B(saved_data[5]), .C(saved_data[6]), .D(
        saved_data[7]), .S0(N2), .S1(N3), .Y(n3) );
  AND2X2M U36 ( .A(n1), .B(N4), .Y(ser_done) );
  INVX2M U37 ( .A(N2), .Y(n7) );
  INVX2M U38 ( .A(N3), .Y(n8) );
endmodule


module UART_TX_TOP_test_1 ( clk, rstn, P_DATA, data_valid, par_typ, par_en, 
        TX_OUT, busy, test_si2, test_si1, test_so1, test_se );
  input [7:0] P_DATA;
  input clk, rstn, data_valid, par_typ, par_en, test_si2, test_si1, test_se;
  output TX_OUT, busy, test_so1;
  wire   ser_done, ser_en, ser_data, par_bit, n2, n3;
  wire   [1:0] mux_sel;

  fsm_uart_tx_test_1 U0 ( .clk(clk), .rstn(rstn), .data_valid(data_valid), 
        .par_en(par_en), .ser_done(ser_done), .ser_en(ser_en), .mux_sel(
        mux_sel), .busy(busy), .test_si(test_si1), .test_so(n3), .test_se(
        test_se) );
  tx_mux_test_1 U1 ( .clk(clk), .rst(rstn), .mux_sel(mux_sel), .start_bit(1'b0), .stop_bit(1'b1), .ser_data(ser_data), .par_bit(par_bit), .TX_OUT(TX_OUT), 
        .test_si(test_si2), .test_se(test_se) );
  parity_calc_test_1 U2 ( .clk(clk), .rst(rstn), .P_DATA(P_DATA), .data_valid(
        data_valid), .busy(busy), .par_en(par_en), .par_typ(par_typ), 
        .par_bit(par_bit), .test_si(n3), .test_so(n2), .test_se(test_se) );
  ser_test_1 U3 ( .clk(clk), .rstn(rstn), .P_DATA(P_DATA), .data_valid(
        data_valid), .busy(busy), .ser_en(ser_en), .ser_done(ser_done), 
        .ser_data(ser_data), .test_si(n2), .test_so(test_so1), .test_se(
        test_se) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, RX_P_DATA, RX_D_VLD, RdData, RdData_Valid, 
        ALU_OUT, OUT_Valid, ALU_EN, ALU_FUN, CLK_EN, Address, WrEn, RdEn, 
        WrData, TX_P_DATA, TX_D_VLD, clk_div_en, test_si, test_so, test_se );
  input [7:0] RX_P_DATA;
  input [7:0] RdData;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, RX_D_VLD, RdData_Valid, OUT_Valid, test_si, test_se;
  output ALU_EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en, test_so;
  wire   n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n18, n19, n20, n21, n22, n23, n24, n25, n26, n85, n86, n87,
         n88, n89, n90, n91, n92;
  wire   [3:0] curent_state;
  assign test_so = n85;

  SDFFRQX2M \curent_state_reg[3]  ( .D(n83), .SI(n87), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(curent_state[3]) );
  SDFFRQX1M \Address_reg[2]  ( .D(n79), .SI(Address[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(Address[2]) );
  SDFFRQX1M \Address_reg[1]  ( .D(n78), .SI(Address[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(Address[1]) );
  SDFFRQX1M \Address_reg[0]  ( .D(n77), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Address[0]) );
  SDFFRQX1M \Address_reg[3]  ( .D(n80), .SI(Address[2]), .SE(test_se), .CK(CLK), .RN(RST), .Q(Address[3]) );
  SDFFRQX1M \curent_state_reg[1]  ( .D(n81), .SI(n21), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(curent_state[1]) );
  SDFFRQX1M \curent_state_reg[0]  ( .D(n84), .SI(Address[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(curent_state[0]) );
  SDFFRQX1M \curent_state_reg[2]  ( .D(n82), .SI(n86), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(curent_state[2]) );
  NOR2X2M U20 ( .A(n33), .B(n51), .Y(ALU_FUN[2]) );
  NOR2X2M U21 ( .A(n30), .B(n51), .Y(ALU_FUN[0]) );
  INVX2M U22 ( .A(n60), .Y(n24) );
  INVX2M U23 ( .A(n29), .Y(n23) );
  INVX2M U24 ( .A(n47), .Y(n22) );
  OAI2B11X2M U25 ( .A1N(n36), .A0(n62), .B0(n46), .C0(n27), .Y(n60) );
  NOR2X2M U26 ( .A(n88), .B(n24), .Y(WrEn) );
  NAND2X2M U27 ( .A(n63), .B(n26), .Y(n46) );
  NOR2X2M U28 ( .A(n53), .B(n45), .Y(n29) );
  NAND2X2M U29 ( .A(n63), .B(n61), .Y(n51) );
  NOR2X2M U30 ( .A(n24), .B(n30), .Y(WrData[0]) );
  NOR2X2M U31 ( .A(n24), .B(n32), .Y(WrData[1]) );
  NOR2X2M U32 ( .A(n24), .B(n33), .Y(WrData[2]) );
  NOR2X2M U33 ( .A(n24), .B(n34), .Y(WrData[3]) );
  OAI21X2M U34 ( .A0(n57), .A1(n18), .B0(n75), .Y(TX_D_VLD) );
  NOR2X2M U35 ( .A(n18), .B(n74), .Y(n66) );
  OAI22X1M U36 ( .A0(n19), .A1(n86), .B0(n37), .B1(n38), .Y(n81) );
  AOI21X2M U37 ( .A0(n22), .A1(n39), .B0(n23), .Y(n37) );
  OAI31X1M U38 ( .A0(n89), .A1(n92), .A2(n40), .B0(n41), .Y(n39) );
  OAI21X2M U39 ( .A0(n47), .A1(n41), .B0(n27), .Y(n49) );
  NOR2BX2M U40 ( .AN(WrEn), .B(n89), .Y(WrData[4]) );
  INVX2M U41 ( .A(n38), .Y(n19) );
  NAND3X2M U42 ( .A(n86), .B(n87), .C(n61), .Y(n47) );
  OAI211X2M U43 ( .A0(n19), .A1(n87), .B0(n42), .C0(n43), .Y(n82) );
  OAI31X1M U44 ( .A0(n44), .A1(n45), .A2(n25), .B0(n19), .Y(n42) );
  INVX2M U45 ( .A(n46), .Y(n25) );
  OAI21BX1M U46 ( .A0(n47), .A1(n48), .B0N(n49), .Y(n44) );
  NOR2X2M U47 ( .A(n18), .B(n51), .Y(n64) );
  OAI21X2M U48 ( .A0(n19), .A1(n85), .B0(n43), .Y(n83) );
  NAND3X2M U49 ( .A(n92), .B(n89), .C(n56), .Y(n41) );
  INVX2M U50 ( .A(n58), .Y(RdEn) );
  INVX2M U51 ( .A(n62), .Y(n26) );
  AND2X2M U52 ( .A(n36), .B(n61), .Y(n45) );
  AND2X2M U53 ( .A(n51), .B(n74), .Y(n57) );
  INVX2M U54 ( .A(n75), .Y(n20) );
  OAI21X2M U55 ( .A0(n32), .A1(n51), .B0(n74), .Y(ALU_FUN[1]) );
  OAI21X2M U56 ( .A0(n88), .A1(n51), .B0(n74), .Y(ALU_EN) );
  NOR2X2M U57 ( .A(n34), .B(n51), .Y(ALU_FUN[3]) );
  OAI31X1M U58 ( .A0(n48), .A1(n88), .A2(n47), .B0(n57), .Y(CLK_EN) );
  NOR2X2M U59 ( .A(n87), .B(curent_state[1]), .Y(n63) );
  NOR2X2M U60 ( .A(n86), .B(curent_state[2]), .Y(n36) );
  INVX2M U61 ( .A(curent_state[2]), .Y(n87) );
  INVX2M U62 ( .A(curent_state[1]), .Y(n86) );
  OAI221X1M U63 ( .A0(OUT_Valid), .A1(n57), .B0(RdData_Valid), .B1(n58), .C0(
        n59), .Y(n38) );
  OAI31X1M U64 ( .A0(n23), .A1(n22), .A2(n60), .B0(n88), .Y(n59) );
  NOR3X2M U65 ( .A(curent_state[1]), .B(curent_state[2]), .C(n62), .Y(n53) );
  NOR2X2M U66 ( .A(curent_state[3]), .B(curent_state[0]), .Y(n61) );
  NAND4BX1M U67 ( .AN(RX_P_DATA[3]), .B(n90), .C(n92), .D(n50), .Y(n43) );
  NOR3X2M U68 ( .A(n51), .B(n91), .C(n38), .Y(n50) );
  OAI22X1M U69 ( .A0(n19), .A1(n21), .B0(n52), .B1(n38), .Y(n84) );
  NOR3X2M U70 ( .A(n49), .B(n53), .C(n54), .Y(n52) );
  NOR4X1M U71 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n40), .D(n47), .Y(n54)
         );
  NAND4X2M U72 ( .A(RX_P_DATA[5]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n55), 
        .Y(n40) );
  NOR3X2M U73 ( .A(n91), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n55) );
  NAND3X2M U74 ( .A(n63), .B(n21), .C(curent_state[3]), .Y(n74) );
  NAND3X2M U75 ( .A(curent_state[2]), .B(curent_state[1]), .C(n61), .Y(n58) );
  OAI2BB1X2M U76 ( .A0N(ALU_OUT[0]), .A1N(n64), .B0(n73), .Y(TX_P_DATA[0]) );
  AOI22X1M U77 ( .A0(RdData[0]), .A1(n20), .B0(ALU_OUT[8]), .B1(n66), .Y(n73)
         );
  OAI2BB1X2M U78 ( .A0N(ALU_OUT[1]), .A1N(n64), .B0(n72), .Y(TX_P_DATA[1]) );
  AOI22X1M U79 ( .A0(RdData[1]), .A1(n20), .B0(ALU_OUT[9]), .B1(n66), .Y(n72)
         );
  OAI2BB1X2M U80 ( .A0N(ALU_OUT[2]), .A1N(n64), .B0(n71), .Y(TX_P_DATA[2]) );
  AOI22X1M U81 ( .A0(RdData[2]), .A1(n20), .B0(ALU_OUT[10]), .B1(n66), .Y(n71)
         );
  OAI2BB1X2M U82 ( .A0N(ALU_OUT[3]), .A1N(n64), .B0(n70), .Y(TX_P_DATA[3]) );
  AOI22X1M U83 ( .A0(RdData[3]), .A1(n20), .B0(ALU_OUT[11]), .B1(n66), .Y(n70)
         );
  OAI2BB1X2M U84 ( .A0N(ALU_OUT[4]), .A1N(n64), .B0(n69), .Y(TX_P_DATA[4]) );
  AOI22X1M U85 ( .A0(RdData[4]), .A1(n20), .B0(ALU_OUT[12]), .B1(n66), .Y(n69)
         );
  OAI2BB1X2M U86 ( .A0N(ALU_OUT[5]), .A1N(n64), .B0(n68), .Y(TX_P_DATA[5]) );
  AOI22X1M U87 ( .A0(RdData[5]), .A1(n20), .B0(ALU_OUT[13]), .B1(n66), .Y(n68)
         );
  OAI2BB1X2M U88 ( .A0N(ALU_OUT[6]), .A1N(n64), .B0(n67), .Y(TX_P_DATA[6]) );
  AOI22X1M U89 ( .A0(RdData[6]), .A1(n20), .B0(ALU_OUT[14]), .B1(n66), .Y(n67)
         );
  OAI2BB1X2M U90 ( .A0N(ALU_OUT[7]), .A1N(n64), .B0(n65), .Y(TX_P_DATA[7]) );
  AOI22X1M U91 ( .A0(RdData[7]), .A1(n20), .B0(ALU_OUT[15]), .B1(n66), .Y(n65)
         );
  NAND2X2M U92 ( .A(curent_state[0]), .B(n85), .Y(n62) );
  AND4X2M U93 ( .A(RX_P_DATA[7]), .B(RX_P_DATA[3]), .C(RX_P_DATA[6]), .D(n76), 
        .Y(n56) );
  NOR3X2M U94 ( .A(n90), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n76) );
  INVX2M U95 ( .A(RX_D_VLD), .Y(n88) );
  AND2X2M U96 ( .A(RX_P_DATA[5]), .B(WrEn), .Y(WrData[5]) );
  AND2X2M U97 ( .A(RX_P_DATA[6]), .B(WrEn), .Y(WrData[6]) );
  AND2X2M U98 ( .A(RX_P_DATA[7]), .B(WrEn), .Y(WrData[7]) );
  NAND3X2M U99 ( .A(n26), .B(curent_state[1]), .C(curent_state[2]), .Y(n27) );
  INVX2M U100 ( .A(curent_state[0]), .Y(n21) );
  INVX2M U101 ( .A(curent_state[3]), .Y(n85) );
  INVX2M U102 ( .A(RX_P_DATA[1]), .Y(n91) );
  NAND2X2M U103 ( .A(RdData_Valid), .B(RdEn), .Y(n75) );
  OAI221X1M U104 ( .A0(n27), .A1(n28), .B0(n29), .B1(n30), .C0(n31), .Y(n77)
         );
  NAND2X2M U105 ( .A(Address[0]), .B(n28), .Y(n31) );
  NAND2X2M U106 ( .A(RX_P_DATA[3]), .B(RX_D_VLD), .Y(n34) );
  NAND2X2M U107 ( .A(RX_P_DATA[2]), .B(RX_D_VLD), .Y(n33) );
  NAND3X2M U108 ( .A(n35), .B(n85), .C(RX_D_VLD), .Y(n28) );
  OAI22X1M U109 ( .A0(curent_state[2]), .A1(curent_state[0]), .B0(n36), .B1(
        n21), .Y(n35) );
  NAND2X2M U110 ( .A(RX_P_DATA[1]), .B(RX_D_VLD), .Y(n32) );
  NAND2X2M U111 ( .A(RX_P_DATA[0]), .B(RX_D_VLD), .Y(n30) );
  OAI2BB2X1M U112 ( .B0(n29), .B1(n32), .A0N(Address[1]), .A1N(n28), .Y(n78)
         );
  OAI2BB2X1M U113 ( .B0(n29), .B1(n33), .A0N(Address[2]), .A1N(n28), .Y(n79)
         );
  OAI2BB2X1M U114 ( .B0(n29), .B1(n34), .A0N(Address[3]), .A1N(n28), .Y(n80)
         );
  NAND3X2M U115 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n56), .Y(n48) );
  INVX2M U116 ( .A(RX_P_DATA[4]), .Y(n89) );
  INVX2M U117 ( .A(RX_P_DATA[0]), .Y(n92) );
  INVX2M U118 ( .A(RX_P_DATA[2]), .Y(n90) );
  INVX2M U119 ( .A(OUT_Valid), .Y(n18) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
endmodule


module RegFile_WIDTH8_DEPTH16_ADDR4_test_1 ( CLK, RST, WrEn, RdEn, Address, 
        WrData, RdData, RdData_VLD, REG0, REG1, REG2, REG3, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdData_VLD, test_so2, test_so1;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n480, n481, n482, n483, n484, n485, n1;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so1 = \regArr[5][3] ;

  SDFFRQX2M \regArr_reg[7][6]  ( .D(n248), .SI(\regArr[7][5] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][6] ) );
  SDFFRQX2M \regArr_reg[14][4]  ( .D(n302), .SI(\regArr[14][3] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][4] ) );
  SDFFRQX2M \regArr_reg[6][0]  ( .D(n234), .SI(\regArr[5][7] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][0] ) );
  SDFFRQX2M \regArr_reg[4][4]  ( .D(n222), .SI(\regArr[4][3] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[4][4] ) );
  SDFFRQX2M \regArr_reg[0][7]  ( .D(n193), .SI(REG0[6]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(REG0[7]) );
  SDFFSQX2M \regArr_reg[3][5]  ( .D(n215), .SI(REG3[4]), .SE(n483), .CK(CLK), 
        .SN(RST), .Q(REG3[5]) );
  SDFFRQX2M \regArr_reg[3][4]  ( .D(n214), .SI(REG3[3]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG3[4]) );
  SDFFRQX2M \regArr_reg[2][2]  ( .D(n204), .SI(REG2[1]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(REG2[2]) );
  SDFFSQX2M \regArr_reg[2][7]  ( .D(n209), .SI(REG2[6]), .SE(n482), .CK(CLK), 
        .SN(RST), .Q(REG2[7]) );
  SDFFRQX2M \regArr_reg[2][3]  ( .D(n205), .SI(REG2[2]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(REG2[3]) );
  SDFFRQX1M RdData_VLD_reg ( .D(n185), .SI(test_si1), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(RdData_VLD) );
  SDFFRQX1M \RdData_reg[0]  ( .D(n177), .SI(RdData_VLD), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(RdData[0]) );
  SDFFRQX1M \regArr_reg[15][6]  ( .D(n312), .SI(\regArr[15][5] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][6] ) );
  SDFFRQX1M \regArr_reg[15][5]  ( .D(n311), .SI(\regArr[15][4] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][5] ) );
  SDFFRQX1M \regArr_reg[15][4]  ( .D(n310), .SI(\regArr[15][3] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][4] ) );
  SDFFRQX1M \regArr_reg[15][3]  ( .D(n309), .SI(\regArr[15][2] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][3] ) );
  SDFFRQX1M \regArr_reg[15][2]  ( .D(n308), .SI(\regArr[15][1] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][2] ) );
  SDFFRQX1M \regArr_reg[15][1]  ( .D(n307), .SI(\regArr[15][0] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][1] ) );
  SDFFRQX1M \regArr_reg[15][0]  ( .D(n306), .SI(\regArr[14][7] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][0] ) );
  SDFFRQX1M \regArr_reg[13][7]  ( .D(n297), .SI(\regArr[13][6] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][7] ) );
  SDFFRQX1M \regArr_reg[13][6]  ( .D(n296), .SI(\regArr[13][5] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][6] ) );
  SDFFRQX1M \regArr_reg[13][5]  ( .D(n295), .SI(\regArr[13][4] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][5] ) );
  SDFFRQX1M \regArr_reg[13][4]  ( .D(n294), .SI(\regArr[13][3] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][4] ) );
  SDFFRQX1M \regArr_reg[13][3]  ( .D(n293), .SI(\regArr[13][2] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][3] ) );
  SDFFRQX1M \regArr_reg[13][2]  ( .D(n292), .SI(\regArr[13][1] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][2] ) );
  SDFFRQX1M \regArr_reg[13][1]  ( .D(n291), .SI(\regArr[13][0] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][1] ) );
  SDFFRQX1M \regArr_reg[13][0]  ( .D(n290), .SI(\regArr[12][7] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[13][0] ) );
  SDFFRQX1M \regArr_reg[11][7]  ( .D(n281), .SI(\regArr[11][6] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][7] ) );
  SDFFRQX1M \regArr_reg[11][6]  ( .D(n280), .SI(\regArr[11][5] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][6] ) );
  SDFFRQX1M \regArr_reg[11][5]  ( .D(n279), .SI(\regArr[11][4] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][5] ) );
  SDFFRQX1M \regArr_reg[11][4]  ( .D(n278), .SI(\regArr[11][3] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][4] ) );
  SDFFRQX1M \regArr_reg[11][3]  ( .D(n277), .SI(\regArr[11][2] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][3] ) );
  SDFFRQX1M \regArr_reg[11][2]  ( .D(n276), .SI(\regArr[11][1] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][2] ) );
  SDFFRQX1M \regArr_reg[11][1]  ( .D(n275), .SI(\regArr[11][0] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][1] ) );
  SDFFRQX1M \regArr_reg[11][0]  ( .D(n274), .SI(\regArr[10][7] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[11][0] ) );
  SDFFRQX1M \regArr_reg[9][7]  ( .D(n265), .SI(\regArr[9][6] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][7] ) );
  SDFFRQX1M \regArr_reg[9][6]  ( .D(n264), .SI(\regArr[9][5] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][6] ) );
  SDFFRQX1M \regArr_reg[9][5]  ( .D(n263), .SI(\regArr[9][4] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][5] ) );
  SDFFRQX1M \regArr_reg[9][4]  ( .D(n262), .SI(\regArr[9][3] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][4] ) );
  SDFFRQX1M \regArr_reg[9][3]  ( .D(n261), .SI(\regArr[9][2] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][3] ) );
  SDFFRQX1M \regArr_reg[9][2]  ( .D(n260), .SI(\regArr[9][1] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][2] ) );
  SDFFRQX1M \regArr_reg[9][1]  ( .D(n259), .SI(\regArr[9][0] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][1] ) );
  SDFFRQX1M \regArr_reg[9][0]  ( .D(n258), .SI(\regArr[8][7] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[9][0] ) );
  SDFFRQX1M \regArr_reg[14][7]  ( .D(n305), .SI(\regArr[14][6] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][7] ) );
  SDFFRQX1M \regArr_reg[14][6]  ( .D(n304), .SI(\regArr[14][5] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][6] ) );
  SDFFRQX1M \regArr_reg[14][5]  ( .D(n303), .SI(\regArr[14][4] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][5] ) );
  SDFFRQX1M \regArr_reg[14][3]  ( .D(n301), .SI(\regArr[14][2] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][3] ) );
  SDFFRQX1M \regArr_reg[14][2]  ( .D(n300), .SI(\regArr[14][1] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][2] ) );
  SDFFRQX1M \regArr_reg[14][1]  ( .D(n299), .SI(\regArr[14][0] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][1] ) );
  SDFFRQX1M \regArr_reg[14][0]  ( .D(n298), .SI(\regArr[13][7] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[14][0] ) );
  SDFFRQX1M \regArr_reg[12][7]  ( .D(n289), .SI(\regArr[12][6] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][7] ) );
  SDFFRQX1M \regArr_reg[12][6]  ( .D(n288), .SI(\regArr[12][5] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][6] ) );
  SDFFRQX1M \regArr_reg[12][5]  ( .D(n287), .SI(\regArr[12][4] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][5] ) );
  SDFFRQX1M \regArr_reg[12][4]  ( .D(n286), .SI(\regArr[12][3] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][4] ) );
  SDFFRQX1M \regArr_reg[12][2]  ( .D(n284), .SI(\regArr[12][1] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][2] ) );
  SDFFRQX1M \regArr_reg[12][1]  ( .D(n283), .SI(\regArr[12][0] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][1] ) );
  SDFFRQX1M \regArr_reg[12][0]  ( .D(n282), .SI(\regArr[11][7] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][0] ) );
  SDFFRQX1M \regArr_reg[10][6]  ( .D(n272), .SI(\regArr[10][5] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][6] ) );
  SDFFRQX1M \regArr_reg[10][5]  ( .D(n271), .SI(\regArr[10][4] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][5] ) );
  SDFFRQX1M \regArr_reg[10][4]  ( .D(n270), .SI(\regArr[10][3] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][4] ) );
  SDFFRQX1M \regArr_reg[10][3]  ( .D(n269), .SI(\regArr[10][2] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][3] ) );
  SDFFRQX1M \regArr_reg[10][1]  ( .D(n267), .SI(\regArr[10][0] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][1] ) );
  SDFFRQX1M \regArr_reg[10][0]  ( .D(n266), .SI(\regArr[9][7] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][0] ) );
  SDFFRQX1M \regArr_reg[8][7]  ( .D(n257), .SI(\regArr[8][6] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][7] ) );
  SDFFRQX1M \regArr_reg[8][5]  ( .D(n255), .SI(\regArr[8][4] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][5] ) );
  SDFFRQX1M \regArr_reg[8][4]  ( .D(n254), .SI(\regArr[8][3] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][4] ) );
  SDFFRQX1M \regArr_reg[8][3]  ( .D(n253), .SI(\regArr[8][2] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][3] ) );
  SDFFRQX1M \regArr_reg[8][2]  ( .D(n252), .SI(\regArr[8][1] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][2] ) );
  SDFFRQX1M \regArr_reg[8][0]  ( .D(n250), .SI(\regArr[7][7] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][0] ) );
  SDFFRQX1M \regArr_reg[6][7]  ( .D(n241), .SI(\regArr[6][6] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][7] ) );
  SDFFRQX1M \regArr_reg[6][6]  ( .D(n240), .SI(\regArr[6][5] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][6] ) );
  SDFFRQX1M \regArr_reg[6][4]  ( .D(n238), .SI(\regArr[6][3] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][4] ) );
  SDFFRQX1M \regArr_reg[6][3]  ( .D(n237), .SI(\regArr[6][2] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][3] ) );
  SDFFRQX1M \regArr_reg[6][2]  ( .D(n236), .SI(\regArr[6][1] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][2] ) );
  SDFFRQX1M \regArr_reg[6][1]  ( .D(n235), .SI(\regArr[6][0] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][1] ) );
  SDFFRQX1M \regArr_reg[4][7]  ( .D(n225), .SI(\regArr[4][6] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[4][7] ) );
  SDFFRQX1M \regArr_reg[4][6]  ( .D(n224), .SI(\regArr[4][5] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[4][6] ) );
  SDFFRQX1M \regArr_reg[4][5]  ( .D(n223), .SI(\regArr[4][4] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[4][5] ) );
  SDFFRQX1M \regArr_reg[4][3]  ( .D(n221), .SI(\regArr[4][2] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[4][3] ) );
  SDFFRQX1M \regArr_reg[4][2]  ( .D(n220), .SI(\regArr[4][1] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[4][2] ) );
  SDFFRQX1M \regArr_reg[4][1]  ( .D(n219), .SI(\regArr[4][0] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[4][1] ) );
  SDFFRQX1M \regArr_reg[4][0]  ( .D(n218), .SI(REG3[7]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(\regArr[4][0] ) );
  SDFFRQX1M \regArr_reg[2][6]  ( .D(n208), .SI(REG2[5]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(REG2[6]) );
  SDFFRQX1M \regArr_reg[2][5]  ( .D(n207), .SI(REG2[4]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(REG2[5]) );
  SDFFRQX1M \regArr_reg[2][4]  ( .D(n206), .SI(REG2[3]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG2[4]) );
  SDFFRQX1M \regArr_reg[2][1]  ( .D(n203), .SI(REG2[0]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(REG2[1]) );
  SDFFRQX1M \regArr_reg[7][7]  ( .D(n249), .SI(\regArr[7][6] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][7] ) );
  SDFFRQX1M \regArr_reg[7][5]  ( .D(n247), .SI(\regArr[7][4] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][5] ) );
  SDFFRQX1M \regArr_reg[7][4]  ( .D(n246), .SI(\regArr[7][3] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][4] ) );
  SDFFRQX1M \regArr_reg[7][3]  ( .D(n245), .SI(\regArr[7][2] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][3] ) );
  SDFFRQX1M \regArr_reg[7][2]  ( .D(n244), .SI(\regArr[7][1] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][2] ) );
  SDFFRQX1M \regArr_reg[7][0]  ( .D(n242), .SI(\regArr[6][7] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][0] ) );
  SDFFRQX1M \regArr_reg[5][7]  ( .D(n233), .SI(\regArr[5][6] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[5][7] ) );
  SDFFRQX1M \regArr_reg[5][6]  ( .D(n232), .SI(\regArr[5][5] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[5][6] ) );
  SDFFRQX1M \regArr_reg[5][5]  ( .D(n231), .SI(\regArr[5][4] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[5][5] ) );
  SDFFRQX1M \regArr_reg[5][4]  ( .D(n230), .SI(test_si2), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(\regArr[5][4] ) );
  SDFFRQX1M \regArr_reg[5][3]  ( .D(n229), .SI(\regArr[5][2] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[5][3] ) );
  SDFFRQX1M \regArr_reg[5][2]  ( .D(n228), .SI(\regArr[5][1] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[5][2] ) );
  SDFFRQX1M \regArr_reg[5][1]  ( .D(n227), .SI(\regArr[5][0] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[5][1] ) );
  SDFFRQX1M \regArr_reg[5][0]  ( .D(n226), .SI(\regArr[4][7] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[5][0] ) );
  SDFFRQX1M \regArr_reg[3][6]  ( .D(n216), .SI(REG3[5]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG3[6]) );
  SDFFRQX1M \regArr_reg[3][3]  ( .D(n213), .SI(REG3[2]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(REG3[3]) );
  SDFFRQX1M \regArr_reg[3][2]  ( .D(n212), .SI(REG3[1]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(REG3[2]) );
  SDFFRQX1M \regArr_reg[3][1]  ( .D(n211), .SI(REG3[0]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(REG3[1]) );
  SDFFRQX1M \regArr_reg[3][0]  ( .D(n210), .SI(REG2[7]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG3[0]) );
  SDFFRQX1M \regArr_reg[0][6]  ( .D(n192), .SI(REG0[5]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(REG0[6]) );
  SDFFRQX1M \regArr_reg[0][5]  ( .D(n191), .SI(REG0[4]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(REG0[5]) );
  SDFFRQX1M \regArr_reg[0][4]  ( .D(n190), .SI(REG0[3]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(REG0[4]) );
  SDFFRQX1M \regArr_reg[0][3]  ( .D(n189), .SI(REG0[2]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG0[3]) );
  SDFFRQX1M \regArr_reg[0][1]  ( .D(n187), .SI(REG0[0]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(REG0[1]) );
  SDFFRQX1M \regArr_reg[0][0]  ( .D(n186), .SI(RdData[7]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(REG0[0]) );
  SDFFRQX1M \regArr_reg[1][7]  ( .D(n201), .SI(REG1[6]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(REG1[7]) );
  SDFFRQX1M \regArr_reg[1][6]  ( .D(n200), .SI(REG1[5]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG1[6]) );
  SDFFRQX1M \regArr_reg[1][5]  ( .D(n199), .SI(REG1[4]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(REG1[5]) );
  SDFFRQX1M \regArr_reg[1][3]  ( .D(n197), .SI(REG1[2]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(REG1[3]) );
  SDFFRQX1M \regArr_reg[1][2]  ( .D(n196), .SI(REG1[1]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(REG1[2]) );
  SDFFRQX1M \regArr_reg[1][1]  ( .D(n195), .SI(REG1[0]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG1[1]) );
  SDFFRQX1M \regArr_reg[1][0]  ( .D(n194), .SI(REG0[7]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(REG1[0]) );
  SDFFRQX1M \RdData_reg[6]  ( .D(n183), .SI(RdData[5]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(RdData[6]) );
  SDFFRQX1M \RdData_reg[5]  ( .D(n182), .SI(RdData[4]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(RdData[5]) );
  SDFFRQX1M \RdData_reg[1]  ( .D(n178), .SI(RdData[0]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(RdData[1]) );
  SDFFRQX1M \RdData_reg[4]  ( .D(n181), .SI(RdData[3]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(RdData[4]) );
  SDFFRQX1M \RdData_reg[3]  ( .D(n180), .SI(RdData[2]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(RdData[3]) );
  SDFFRQX1M \regArr_reg[12][3]  ( .D(n285), .SI(\regArr[12][2] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[12][3] ) );
  SDFFRQX1M \regArr_reg[10][7]  ( .D(n273), .SI(\regArr[10][6] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][7] ) );
  SDFFRQX1M \regArr_reg[10][2]  ( .D(n268), .SI(\regArr[10][1] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[10][2] ) );
  SDFFRQX1M \regArr_reg[8][6]  ( .D(n256), .SI(\regArr[8][5] ), .SE(n480), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][6] ) );
  SDFFRQX1M \regArr_reg[8][1]  ( .D(n251), .SI(\regArr[8][0] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[8][1] ) );
  SDFFRQX1M \regArr_reg[6][5]  ( .D(n239), .SI(\regArr[6][4] ), .SE(n482), 
        .CK(CLK), .RN(RST), .Q(\regArr[6][5] ) );
  SDFFRQX1M \regArr_reg[7][1]  ( .D(n243), .SI(\regArr[7][0] ), .SE(n481), 
        .CK(CLK), .RN(RST), .Q(\regArr[7][1] ) );
  SDFFRQX1M \regArr_reg[3][7]  ( .D(n217), .SI(REG3[6]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(REG3[7]) );
  SDFFRQX1M \regArr_reg[0][2]  ( .D(n188), .SI(REG0[1]), .SE(n483), .CK(CLK), 
        .RN(RST), .Q(REG0[2]) );
  SDFFRQX1M \regArr_reg[1][4]  ( .D(n198), .SI(REG1[3]), .SE(n482), .CK(CLK), 
        .RN(RST), .Q(REG1[4]) );
  SDFFRQX1M \RdData_reg[7]  ( .D(n184), .SI(RdData[6]), .SE(n481), .CK(CLK), 
        .RN(RST), .Q(RdData[7]) );
  SDFFRQX1M \RdData_reg[2]  ( .D(n179), .SI(RdData[1]), .SE(n480), .CK(CLK), 
        .RN(RST), .Q(RdData[2]) );
  NOR2BX2M U266 ( .AN(N13), .B(N12), .Y(n160) );
  NOR2BX2M U267 ( .AN(N13), .B(n467), .Y(n163) );
  INVX2M U268 ( .A(WrData[5]), .Y(n470) );
  INVX2M U269 ( .A(WrData[6]), .Y(n471) );
  INVX2M U270 ( .A(WrData[7]), .Y(n472) );
  NOR2X2M U271 ( .A(n467), .B(N13), .Y(n157) );
  NOR2X2M U272 ( .A(N12), .B(N13), .Y(n152) );
  INVX2M U273 ( .A(n463), .Y(n464) );
  INVX2M U274 ( .A(n461), .Y(n462) );
  INVX2M U275 ( .A(n463), .Y(n465) );
  BUFX2M U276 ( .A(n466), .Y(n463) );
  INVX2M U277 ( .A(n149), .Y(n468) );
  BUFX2M U278 ( .A(n467), .Y(n461) );
  NOR2BX2M U279 ( .AN(WrEn), .B(RdEn), .Y(n150) );
  NAND2BX2M U280 ( .AN(WrEn), .B(RdEn), .Y(n149) );
  NOR2BX2M U281 ( .AN(n164), .B(N11), .Y(n153) );
  NOR2BX2M U282 ( .AN(n164), .B(n466), .Y(n155) );
  NAND2X2M U283 ( .A(n157), .B(n153), .Y(n156) );
  NAND2X2M U284 ( .A(n157), .B(n155), .Y(n158) );
  NOR2BX2M U285 ( .AN(n175), .B(N11), .Y(n167) );
  NOR2BX2M U286 ( .AN(n175), .B(n466), .Y(n169) );
  NAND2X2M U287 ( .A(n155), .B(n152), .Y(n154) );
  NAND2X2M U288 ( .A(n167), .B(n152), .Y(n166) );
  NAND2X2M U289 ( .A(n169), .B(n152), .Y(n168) );
  NAND2X2M U290 ( .A(n167), .B(n157), .Y(n170) );
  NAND2X2M U291 ( .A(n169), .B(n157), .Y(n171) );
  NAND2X2M U292 ( .A(n160), .B(n153), .Y(n159) );
  NAND2X2M U293 ( .A(n160), .B(n155), .Y(n161) );
  NAND2X2M U294 ( .A(n163), .B(n153), .Y(n162) );
  NAND2X2M U295 ( .A(n163), .B(n155), .Y(n165) );
  NAND2X2M U296 ( .A(n167), .B(n160), .Y(n172) );
  NAND2X2M U297 ( .A(n169), .B(n160), .Y(n173) );
  NAND2X2M U298 ( .A(n167), .B(n163), .Y(n174) );
  NAND2X2M U299 ( .A(n169), .B(n163), .Y(n176) );
  NAND2X2M U300 ( .A(n152), .B(n153), .Y(n151) );
  INVX2M U301 ( .A(WrData[0]), .Y(n476) );
  INVX2M U302 ( .A(WrData[1]), .Y(n475) );
  INVX2M U303 ( .A(WrData[2]), .Y(n474) );
  INVX2M U304 ( .A(WrData[3]), .Y(n473) );
  INVX2M U305 ( .A(WrData[4]), .Y(n469) );
  OAI2BB2X1M U306 ( .B0(n476), .B1(n156), .A0N(REG2[0]), .A1N(n156), .Y(n202)
         );
  OAI2BB2X1M U307 ( .B0(n472), .B1(n156), .A0N(REG2[7]), .A1N(n156), .Y(n209)
         );
  OAI2BB2X1M U308 ( .B0(n470), .B1(n158), .A0N(REG3[5]), .A1N(n158), .Y(n215)
         );
  NOR2BX2M U309 ( .AN(n150), .B(N14), .Y(n164) );
  OAI2BB2X1M U310 ( .B0(n151), .B1(n476), .A0N(REG0[0]), .A1N(n151), .Y(n186)
         );
  OAI2BB2X1M U311 ( .B0(n151), .B1(n475), .A0N(REG0[1]), .A1N(n151), .Y(n187)
         );
  OAI2BB2X1M U312 ( .B0(n151), .B1(n474), .A0N(REG0[2]), .A1N(n151), .Y(n188)
         );
  OAI2BB2X1M U313 ( .B0(n151), .B1(n473), .A0N(REG0[3]), .A1N(n151), .Y(n189)
         );
  OAI2BB2X1M U314 ( .B0(n151), .B1(n469), .A0N(REG0[4]), .A1N(n151), .Y(n190)
         );
  OAI2BB2X1M U315 ( .B0(n151), .B1(n470), .A0N(REG0[5]), .A1N(n151), .Y(n191)
         );
  OAI2BB2X1M U316 ( .B0(n151), .B1(n471), .A0N(REG0[6]), .A1N(n151), .Y(n192)
         );
  OAI2BB2X1M U317 ( .B0(n151), .B1(n472), .A0N(REG0[7]), .A1N(n151), .Y(n193)
         );
  OAI2BB2X1M U318 ( .B0(n476), .B1(n154), .A0N(REG1[0]), .A1N(n154), .Y(n194)
         );
  OAI2BB2X1M U319 ( .B0(n475), .B1(n154), .A0N(REG1[1]), .A1N(n154), .Y(n195)
         );
  OAI2BB2X1M U320 ( .B0(n474), .B1(n154), .A0N(REG1[2]), .A1N(n154), .Y(n196)
         );
  OAI2BB2X1M U321 ( .B0(n473), .B1(n154), .A0N(REG1[3]), .A1N(n154), .Y(n197)
         );
  OAI2BB2X1M U322 ( .B0(n469), .B1(n154), .A0N(REG1[4]), .A1N(n154), .Y(n198)
         );
  OAI2BB2X1M U323 ( .B0(n470), .B1(n154), .A0N(REG1[5]), .A1N(n154), .Y(n199)
         );
  OAI2BB2X1M U324 ( .B0(n471), .B1(n154), .A0N(REG1[6]), .A1N(n154), .Y(n200)
         );
  OAI2BB2X1M U325 ( .B0(n472), .B1(n154), .A0N(REG1[7]), .A1N(n154), .Y(n201)
         );
  OAI2BB2X1M U326 ( .B0(n476), .B1(n159), .A0N(\regArr[4][0] ), .A1N(n159), 
        .Y(n218) );
  OAI2BB2X1M U327 ( .B0(n475), .B1(n159), .A0N(\regArr[4][1] ), .A1N(n159), 
        .Y(n219) );
  OAI2BB2X1M U328 ( .B0(n474), .B1(n159), .A0N(\regArr[4][2] ), .A1N(n159), 
        .Y(n220) );
  OAI2BB2X1M U329 ( .B0(n473), .B1(n159), .A0N(\regArr[4][3] ), .A1N(n159), 
        .Y(n221) );
  OAI2BB2X1M U330 ( .B0(n469), .B1(n159), .A0N(\regArr[4][4] ), .A1N(n159), 
        .Y(n222) );
  OAI2BB2X1M U331 ( .B0(n470), .B1(n159), .A0N(\regArr[4][5] ), .A1N(n159), 
        .Y(n223) );
  OAI2BB2X1M U332 ( .B0(n471), .B1(n159), .A0N(\regArr[4][6] ), .A1N(n159), 
        .Y(n224) );
  OAI2BB2X1M U333 ( .B0(n472), .B1(n159), .A0N(\regArr[4][7] ), .A1N(n159), 
        .Y(n225) );
  OAI2BB2X1M U334 ( .B0(n476), .B1(n161), .A0N(\regArr[5][0] ), .A1N(n161), 
        .Y(n226) );
  OAI2BB2X1M U335 ( .B0(n475), .B1(n161), .A0N(\regArr[5][1] ), .A1N(n161), 
        .Y(n227) );
  OAI2BB2X1M U336 ( .B0(n474), .B1(n161), .A0N(\regArr[5][2] ), .A1N(n161), 
        .Y(n228) );
  OAI2BB2X1M U337 ( .B0(n473), .B1(n161), .A0N(\regArr[5][3] ), .A1N(n161), 
        .Y(n229) );
  OAI2BB2X1M U338 ( .B0(n469), .B1(n161), .A0N(\regArr[5][4] ), .A1N(n161), 
        .Y(n230) );
  OAI2BB2X1M U339 ( .B0(n470), .B1(n161), .A0N(\regArr[5][5] ), .A1N(n161), 
        .Y(n231) );
  OAI2BB2X1M U340 ( .B0(n471), .B1(n161), .A0N(\regArr[5][6] ), .A1N(n161), 
        .Y(n232) );
  OAI2BB2X1M U341 ( .B0(n472), .B1(n161), .A0N(\regArr[5][7] ), .A1N(n161), 
        .Y(n233) );
  OAI2BB2X1M U342 ( .B0(n476), .B1(n162), .A0N(\regArr[6][0] ), .A1N(n162), 
        .Y(n234) );
  OAI2BB2X1M U343 ( .B0(n475), .B1(n162), .A0N(\regArr[6][1] ), .A1N(n162), 
        .Y(n235) );
  OAI2BB2X1M U344 ( .B0(n474), .B1(n162), .A0N(\regArr[6][2] ), .A1N(n162), 
        .Y(n236) );
  OAI2BB2X1M U345 ( .B0(n473), .B1(n162), .A0N(\regArr[6][3] ), .A1N(n162), 
        .Y(n237) );
  OAI2BB2X1M U346 ( .B0(n469), .B1(n162), .A0N(\regArr[6][4] ), .A1N(n162), 
        .Y(n238) );
  OAI2BB2X1M U347 ( .B0(n470), .B1(n162), .A0N(\regArr[6][5] ), .A1N(n162), 
        .Y(n239) );
  OAI2BB2X1M U348 ( .B0(n471), .B1(n162), .A0N(\regArr[6][6] ), .A1N(n162), 
        .Y(n240) );
  OAI2BB2X1M U349 ( .B0(n472), .B1(n162), .A0N(\regArr[6][7] ), .A1N(n162), 
        .Y(n241) );
  OAI2BB2X1M U350 ( .B0(n476), .B1(n165), .A0N(\regArr[7][0] ), .A1N(n165), 
        .Y(n242) );
  OAI2BB2X1M U351 ( .B0(n475), .B1(n165), .A0N(\regArr[7][1] ), .A1N(n165), 
        .Y(n243) );
  OAI2BB2X1M U352 ( .B0(n474), .B1(n165), .A0N(\regArr[7][2] ), .A1N(n165), 
        .Y(n244) );
  OAI2BB2X1M U353 ( .B0(n473), .B1(n165), .A0N(\regArr[7][3] ), .A1N(n165), 
        .Y(n245) );
  OAI2BB2X1M U354 ( .B0(n469), .B1(n165), .A0N(\regArr[7][4] ), .A1N(n165), 
        .Y(n246) );
  OAI2BB2X1M U355 ( .B0(n470), .B1(n165), .A0N(\regArr[7][5] ), .A1N(n165), 
        .Y(n247) );
  OAI2BB2X1M U356 ( .B0(n471), .B1(n165), .A0N(\regArr[7][6] ), .A1N(n165), 
        .Y(n248) );
  OAI2BB2X1M U357 ( .B0(n472), .B1(n165), .A0N(\regArr[7][7] ), .A1N(n165), 
        .Y(n249) );
  OAI2BB2X1M U358 ( .B0(n476), .B1(n166), .A0N(\regArr[8][0] ), .A1N(n166), 
        .Y(n250) );
  OAI2BB2X1M U359 ( .B0(n475), .B1(n166), .A0N(\regArr[8][1] ), .A1N(n166), 
        .Y(n251) );
  OAI2BB2X1M U360 ( .B0(n474), .B1(n166), .A0N(\regArr[8][2] ), .A1N(n166), 
        .Y(n252) );
  OAI2BB2X1M U361 ( .B0(n473), .B1(n166), .A0N(\regArr[8][3] ), .A1N(n166), 
        .Y(n253) );
  OAI2BB2X1M U362 ( .B0(n469), .B1(n166), .A0N(\regArr[8][4] ), .A1N(n166), 
        .Y(n254) );
  OAI2BB2X1M U363 ( .B0(n470), .B1(n166), .A0N(\regArr[8][5] ), .A1N(n166), 
        .Y(n255) );
  OAI2BB2X1M U364 ( .B0(n471), .B1(n166), .A0N(\regArr[8][6] ), .A1N(n166), 
        .Y(n256) );
  OAI2BB2X1M U365 ( .B0(n472), .B1(n166), .A0N(\regArr[8][7] ), .A1N(n166), 
        .Y(n257) );
  OAI2BB2X1M U366 ( .B0(n476), .B1(n168), .A0N(\regArr[9][0] ), .A1N(n168), 
        .Y(n258) );
  OAI2BB2X1M U367 ( .B0(n475), .B1(n168), .A0N(\regArr[9][1] ), .A1N(n168), 
        .Y(n259) );
  OAI2BB2X1M U368 ( .B0(n474), .B1(n168), .A0N(\regArr[9][2] ), .A1N(n168), 
        .Y(n260) );
  OAI2BB2X1M U369 ( .B0(n473), .B1(n168), .A0N(\regArr[9][3] ), .A1N(n168), 
        .Y(n261) );
  OAI2BB2X1M U370 ( .B0(n469), .B1(n168), .A0N(\regArr[9][4] ), .A1N(n168), 
        .Y(n262) );
  OAI2BB2X1M U371 ( .B0(n470), .B1(n168), .A0N(\regArr[9][5] ), .A1N(n168), 
        .Y(n263) );
  OAI2BB2X1M U372 ( .B0(n471), .B1(n168), .A0N(\regArr[9][6] ), .A1N(n168), 
        .Y(n264) );
  OAI2BB2X1M U373 ( .B0(n472), .B1(n168), .A0N(\regArr[9][7] ), .A1N(n168), 
        .Y(n265) );
  OAI2BB2X1M U374 ( .B0(n476), .B1(n170), .A0N(\regArr[10][0] ), .A1N(n170), 
        .Y(n266) );
  OAI2BB2X1M U375 ( .B0(n475), .B1(n170), .A0N(\regArr[10][1] ), .A1N(n170), 
        .Y(n267) );
  OAI2BB2X1M U376 ( .B0(n474), .B1(n170), .A0N(\regArr[10][2] ), .A1N(n170), 
        .Y(n268) );
  OAI2BB2X1M U377 ( .B0(n473), .B1(n170), .A0N(\regArr[10][3] ), .A1N(n170), 
        .Y(n269) );
  OAI2BB2X1M U378 ( .B0(n469), .B1(n170), .A0N(\regArr[10][4] ), .A1N(n170), 
        .Y(n270) );
  OAI2BB2X1M U379 ( .B0(n470), .B1(n170), .A0N(\regArr[10][5] ), .A1N(n170), 
        .Y(n271) );
  OAI2BB2X1M U380 ( .B0(n471), .B1(n170), .A0N(\regArr[10][6] ), .A1N(n170), 
        .Y(n272) );
  OAI2BB2X1M U381 ( .B0(n472), .B1(n170), .A0N(\regArr[10][7] ), .A1N(n170), 
        .Y(n273) );
  OAI2BB2X1M U382 ( .B0(n476), .B1(n171), .A0N(\regArr[11][0] ), .A1N(n171), 
        .Y(n274) );
  OAI2BB2X1M U383 ( .B0(n475), .B1(n171), .A0N(\regArr[11][1] ), .A1N(n171), 
        .Y(n275) );
  OAI2BB2X1M U384 ( .B0(n474), .B1(n171), .A0N(\regArr[11][2] ), .A1N(n171), 
        .Y(n276) );
  OAI2BB2X1M U385 ( .B0(n473), .B1(n171), .A0N(\regArr[11][3] ), .A1N(n171), 
        .Y(n277) );
  OAI2BB2X1M U386 ( .B0(n469), .B1(n171), .A0N(\regArr[11][4] ), .A1N(n171), 
        .Y(n278) );
  OAI2BB2X1M U387 ( .B0(n470), .B1(n171), .A0N(\regArr[11][5] ), .A1N(n171), 
        .Y(n279) );
  OAI2BB2X1M U388 ( .B0(n471), .B1(n171), .A0N(\regArr[11][6] ), .A1N(n171), 
        .Y(n280) );
  OAI2BB2X1M U389 ( .B0(n472), .B1(n171), .A0N(\regArr[11][7] ), .A1N(n171), 
        .Y(n281) );
  OAI2BB2X1M U390 ( .B0(n476), .B1(n172), .A0N(\regArr[12][0] ), .A1N(n172), 
        .Y(n282) );
  OAI2BB2X1M U391 ( .B0(n475), .B1(n172), .A0N(\regArr[12][1] ), .A1N(n172), 
        .Y(n283) );
  OAI2BB2X1M U392 ( .B0(n474), .B1(n172), .A0N(\regArr[12][2] ), .A1N(n172), 
        .Y(n284) );
  OAI2BB2X1M U393 ( .B0(n473), .B1(n172), .A0N(\regArr[12][3] ), .A1N(n172), 
        .Y(n285) );
  OAI2BB2X1M U394 ( .B0(n469), .B1(n172), .A0N(\regArr[12][4] ), .A1N(n172), 
        .Y(n286) );
  OAI2BB2X1M U395 ( .B0(n470), .B1(n172), .A0N(\regArr[12][5] ), .A1N(n172), 
        .Y(n287) );
  OAI2BB2X1M U396 ( .B0(n471), .B1(n172), .A0N(\regArr[12][6] ), .A1N(n172), 
        .Y(n288) );
  OAI2BB2X1M U397 ( .B0(n472), .B1(n172), .A0N(\regArr[12][7] ), .A1N(n172), 
        .Y(n289) );
  OAI2BB2X1M U398 ( .B0(n476), .B1(n173), .A0N(\regArr[13][0] ), .A1N(n173), 
        .Y(n290) );
  OAI2BB2X1M U399 ( .B0(n475), .B1(n173), .A0N(\regArr[13][1] ), .A1N(n173), 
        .Y(n291) );
  OAI2BB2X1M U400 ( .B0(n474), .B1(n173), .A0N(\regArr[13][2] ), .A1N(n173), 
        .Y(n292) );
  OAI2BB2X1M U401 ( .B0(n473), .B1(n173), .A0N(\regArr[13][3] ), .A1N(n173), 
        .Y(n293) );
  OAI2BB2X1M U402 ( .B0(n469), .B1(n173), .A0N(\regArr[13][4] ), .A1N(n173), 
        .Y(n294) );
  OAI2BB2X1M U403 ( .B0(n470), .B1(n173), .A0N(\regArr[13][5] ), .A1N(n173), 
        .Y(n295) );
  OAI2BB2X1M U404 ( .B0(n471), .B1(n173), .A0N(\regArr[13][6] ), .A1N(n173), 
        .Y(n296) );
  OAI2BB2X1M U405 ( .B0(n472), .B1(n173), .A0N(\regArr[13][7] ), .A1N(n173), 
        .Y(n297) );
  OAI2BB2X1M U406 ( .B0(n476), .B1(n174), .A0N(\regArr[14][0] ), .A1N(n174), 
        .Y(n298) );
  OAI2BB2X1M U407 ( .B0(n475), .B1(n174), .A0N(\regArr[14][1] ), .A1N(n174), 
        .Y(n299) );
  OAI2BB2X1M U408 ( .B0(n474), .B1(n174), .A0N(\regArr[14][2] ), .A1N(n174), 
        .Y(n300) );
  OAI2BB2X1M U409 ( .B0(n473), .B1(n174), .A0N(\regArr[14][3] ), .A1N(n174), 
        .Y(n301) );
  OAI2BB2X1M U410 ( .B0(n469), .B1(n174), .A0N(\regArr[14][4] ), .A1N(n174), 
        .Y(n302) );
  OAI2BB2X1M U411 ( .B0(n470), .B1(n174), .A0N(\regArr[14][5] ), .A1N(n174), 
        .Y(n303) );
  OAI2BB2X1M U412 ( .B0(n471), .B1(n174), .A0N(\regArr[14][6] ), .A1N(n174), 
        .Y(n304) );
  OAI2BB2X1M U413 ( .B0(n472), .B1(n174), .A0N(\regArr[14][7] ), .A1N(n174), 
        .Y(n305) );
  OAI2BB2X1M U414 ( .B0(n476), .B1(n176), .A0N(\regArr[15][0] ), .A1N(n176), 
        .Y(n306) );
  OAI2BB2X1M U415 ( .B0(n475), .B1(n176), .A0N(\regArr[15][1] ), .A1N(n176), 
        .Y(n307) );
  OAI2BB2X1M U416 ( .B0(n474), .B1(n176), .A0N(\regArr[15][2] ), .A1N(n176), 
        .Y(n308) );
  OAI2BB2X1M U417 ( .B0(n473), .B1(n176), .A0N(\regArr[15][3] ), .A1N(n176), 
        .Y(n309) );
  OAI2BB2X1M U418 ( .B0(n469), .B1(n176), .A0N(\regArr[15][4] ), .A1N(n176), 
        .Y(n310) );
  OAI2BB2X1M U419 ( .B0(n470), .B1(n176), .A0N(\regArr[15][5] ), .A1N(n176), 
        .Y(n311) );
  OAI2BB2X1M U420 ( .B0(n471), .B1(n176), .A0N(\regArr[15][6] ), .A1N(n176), 
        .Y(n312) );
  OAI2BB2X1M U421 ( .B0(n472), .B1(n176), .A0N(n485), .A1N(n176), .Y(n313) );
  OAI2BB2X1M U422 ( .B0(n475), .B1(n156), .A0N(REG2[1]), .A1N(n156), .Y(n203)
         );
  OAI2BB2X1M U423 ( .B0(n474), .B1(n156), .A0N(REG2[2]), .A1N(n156), .Y(n204)
         );
  OAI2BB2X1M U424 ( .B0(n473), .B1(n156), .A0N(REG2[3]), .A1N(n156), .Y(n205)
         );
  OAI2BB2X1M U425 ( .B0(n469), .B1(n156), .A0N(REG2[4]), .A1N(n156), .Y(n206)
         );
  OAI2BB2X1M U426 ( .B0(n470), .B1(n156), .A0N(REG2[5]), .A1N(n156), .Y(n207)
         );
  OAI2BB2X1M U427 ( .B0(n471), .B1(n156), .A0N(REG2[6]), .A1N(n156), .Y(n208)
         );
  OAI2BB2X1M U428 ( .B0(n476), .B1(n158), .A0N(REG3[0]), .A1N(n158), .Y(n210)
         );
  OAI2BB2X1M U429 ( .B0(n475), .B1(n158), .A0N(REG3[1]), .A1N(n158), .Y(n211)
         );
  OAI2BB2X1M U430 ( .B0(n474), .B1(n158), .A0N(REG3[2]), .A1N(n158), .Y(n212)
         );
  OAI2BB2X1M U431 ( .B0(n473), .B1(n158), .A0N(REG3[3]), .A1N(n158), .Y(n213)
         );
  OAI2BB2X1M U432 ( .B0(n469), .B1(n158), .A0N(REG3[4]), .A1N(n158), .Y(n214)
         );
  OAI2BB2X1M U433 ( .B0(n471), .B1(n158), .A0N(REG3[6]), .A1N(n158), .Y(n216)
         );
  OAI2BB2X1M U434 ( .B0(n472), .B1(n158), .A0N(REG3[7]), .A1N(n158), .Y(n217)
         );
  MX4X1M U435 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n464), 
        .S1(N12), .Y(n436) );
  MX4X1M U436 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(N12), .Y(n431) );
  MX4X1M U437 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n464), .S1(N12), .Y(n435) );
  MX4X1M U438 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n464), .S1(n462), .Y(n439) );
  MX4X1M U439 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n464), .S1(n462), .Y(n443) );
  MX4X1M U440 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n464), .S1(n462), .Y(n447) );
  MX4X1M U441 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n465), .S1(N12), .Y(n451) );
  MX4X1M U442 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n465), .S1(N12), .Y(n455) );
  MX4X1M U443 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n465), .S1(N12), .Y(n459) );
  MX4X1M U444 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n465), .S1(n462), .Y(n429) );
  MX4X1M U445 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n464), .S1(n462), .Y(n437) );
  MX4X1M U446 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n464), .S1(n462), .Y(n441) );
  MX4X1M U447 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n464), .S1(n462), .Y(n445) );
  MX4X1M U448 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n465), .S1(N12), .Y(n449) );
  MX4X1M U449 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n465), .S1(N12), .Y(n453) );
  MX4X1M U450 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(n485), .S0(n465), .S1(N12), .Y(n457) );
  OAI2BB1X2M U451 ( .A0N(RdData_VLD), .A1N(n150), .B0(n149), .Y(n185) );
  AND2X2M U452 ( .A(N14), .B(n150), .Y(n175) );
  AO22X1M U453 ( .A0(N43), .A1(n468), .B0(RdData[0]), .B1(n149), .Y(n177) );
  MX4X1M U454 ( .A(n432), .B(n430), .C(n431), .D(n429), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U455 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n432) );
  MX4X1M U456 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(N12), .Y(n430) );
  AO22X1M U457 ( .A0(N42), .A1(n468), .B0(RdData[1]), .B1(n149), .Y(n178) );
  MX4X1M U458 ( .A(n436), .B(n434), .C(n435), .D(n433), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U459 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(N12), .Y(n434) );
  MX4X1M U460 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n464), .S1(n462), .Y(n433) );
  AO22X1M U461 ( .A0(N41), .A1(n468), .B0(RdData[2]), .B1(n149), .Y(n179) );
  MX4X1M U462 ( .A(n440), .B(n438), .C(n439), .D(n437), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U463 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n464), 
        .S1(n462), .Y(n440) );
  MX4X1M U464 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n464), .S1(n462), .Y(n438) );
  AO22X1M U465 ( .A0(N40), .A1(n468), .B0(RdData[3]), .B1(n149), .Y(n180) );
  MX4X1M U466 ( .A(n444), .B(n442), .C(n443), .D(n441), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U467 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n464), 
        .S1(n462), .Y(n444) );
  MX4X1M U468 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n464), .S1(n462), .Y(n442) );
  AO22X1M U469 ( .A0(N39), .A1(n468), .B0(RdData[4]), .B1(n149), .Y(n181) );
  MX4X1M U470 ( .A(n448), .B(n446), .C(n447), .D(n445), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U471 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n465), 
        .S1(n462), .Y(n448) );
  MX4X1M U472 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n464), .S1(n462), .Y(n446) );
  AO22X1M U473 ( .A0(N38), .A1(n468), .B0(RdData[5]), .B1(n149), .Y(n182) );
  MX4X1M U474 ( .A(n452), .B(n450), .C(n451), .D(n449), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U475 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n465), 
        .S1(N12), .Y(n452) );
  MX4X1M U476 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n465), .S1(N12), .Y(n450) );
  AO22X1M U477 ( .A0(N37), .A1(n468), .B0(RdData[6]), .B1(n149), .Y(n183) );
  MX4X1M U478 ( .A(n456), .B(n454), .C(n455), .D(n453), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U479 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n465), 
        .S1(N12), .Y(n456) );
  MX4X1M U480 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n465), .S1(N12), .Y(n454) );
  AO22X1M U481 ( .A0(N36), .A1(n468), .B0(RdData[7]), .B1(n149), .Y(n184) );
  MX4X1M U482 ( .A(n460), .B(n458), .C(n459), .D(n457), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U483 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n465), 
        .S1(N12), .Y(n460) );
  MX4X1M U484 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n465), .S1(N12), .Y(n458) );
  INVX2M U485 ( .A(N11), .Y(n466) );
  INVX2M U486 ( .A(N12), .Y(n467) );
  DLY1X1M U487 ( .A(test_se), .Y(n480) );
  DLY1X1M U488 ( .A(test_se), .Y(n481) );
  DLY1X1M U489 ( .A(test_se), .Y(n482) );
  DLY1X1M U490 ( .A(test_se), .Y(n483) );
  INVXLM U491 ( .A(test_so2), .Y(n484) );
  INVXLM U492 ( .A(n484), .Y(n485) );
  SDFFSQX1M \regArr_reg[2][0]  ( .D(n202), .SI(REG1[7]), .SE(test_se), .CK(CLK), .SN(RST), .Q(REG2[0]) );
  SDFFRHQX1M \regArr_reg[15][7]  ( .D(n313), .SI(\regArr[15][6] ), .SE(n483), 
        .CK(CLK), .RN(RST), .Q(\regArr[15][7] ) );
  INVXLM U3 ( .A(\regArr[15][7] ), .Y(n1) );
  INVX8M U4 ( .A(n1), .Y(test_so2) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U9 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  NAND2X2M U10 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n3) );
  INVX2M U12 ( .A(n18), .Y(n2) );
  NAND2X2M U13 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n5) );
  INVX2M U15 ( .A(n18), .Y(n4) );
  NAND2X2M U16 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n7) );
  INVX2M U18 ( .A(n18), .Y(n6) );
  NAND2X2M U19 ( .A(n2), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n6), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n4), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U24 ( .A(a[0]), .Y(n10) );
  NAND2X2M U25 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  NAND2X2M U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U5 ( .A(B[7]), .Y(n8) );
  XNOR2X2M U6 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U18 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U19 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U20 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  XNOR2X2M U23 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U24 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U25 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U26 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U29 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U30 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U31 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U36 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U37 ( .A(A[7]), .Y(n32) );
  INVX2M U38 ( .A(A[6]), .Y(n33) );
  INVX2M U39 ( .A(A[1]), .Y(n38) );
  INVX2M U40 ( .A(A[0]), .Y(n39) );
  INVX2M U41 ( .A(A[3]), .Y(n36) );
  INVX2M U42 ( .A(A[2]), .Y(n37) );
  INVX2M U43 ( .A(A[5]), .Y(n34) );
  INVX2M U44 ( .A(A[4]), .Y(n35) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[0]), .Y(n31) );
  INVX2M U47 ( .A(B[2]), .Y(n29) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[7]), .Y(n24) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[5]), .Y(n26) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, 
        n11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 ( A, B, EN, ALU_FUN, CLK, RST, 
        ALU_OUT, OUT_VALID, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si, test_se;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n3, n4, n5, n6,
         n7, n8, n9, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157;
  wire   [15:0] ALU_OUT_Comb;

  SDFFRHQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  BUFX2M U7 ( .A(A[6]), .Y(n28) );
  OAI2BB1X2M U23 ( .A0N(n155), .A1N(n122), .B0(n118), .Y(n64) );
  OAI2BB1X2M U24 ( .A0N(n117), .A1N(n116), .B0(n118), .Y(n65) );
  NOR2BX2M U25 ( .AN(n123), .B(n157), .Y(n54) );
  AND2X2M U26 ( .A(n116), .B(n122), .Y(n59) );
  NOR2BX2M U27 ( .AN(n52), .B(n152), .Y(n48) );
  AND2X2M U28 ( .A(n123), .B(n122), .Y(n67) );
  BUFX2M U29 ( .A(n58), .Y(n30) );
  NOR2X2M U30 ( .A(n124), .B(n157), .Y(n58) );
  INVX2M U31 ( .A(n117), .Y(n157) );
  OAI2BB1X2M U32 ( .A0N(N118), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U33 ( .A0N(N119), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U34 ( .A0N(N120), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U35 ( .A0N(N121), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U36 ( .A0N(N122), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U37 ( .A0N(N123), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U38 ( .A0N(N124), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[15]) );
  INVX2M U39 ( .A(n108), .Y(n153) );
  INVX2M U40 ( .A(n124), .Y(n155) );
  NOR3BX2M U41 ( .AN(n122), .B(n154), .C(ALU_FUN[2]), .Y(n66) );
  NOR3X2M U42 ( .A(n157), .B(ALU_FUN[2]), .C(n154), .Y(n52) );
  NOR2X2M U43 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n123) );
  AND3X2M U44 ( .A(n123), .B(n156), .C(n3), .Y(n63) );
  NAND3X2M U45 ( .A(n155), .B(n156), .C(n3), .Y(n53) );
  NAND2X2M U46 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n124) );
  INVX2M U47 ( .A(ALU_FUN[1]), .Y(n154) );
  INVX2M U48 ( .A(ALU_FUN[0]), .Y(n156) );
  NAND2X2M U49 ( .A(EN), .B(n140), .Y(n49) );
  NOR2X2M U50 ( .A(n156), .B(n3), .Y(n122) );
  NOR2X2M U51 ( .A(n3), .B(ALU_FUN[0]), .Y(n117) );
  NAND3X2M U52 ( .A(n3), .B(ALU_FUN[0]), .C(n116), .Y(n108) );
  INVX2M U53 ( .A(EN), .Y(n152) );
  NAND3X2M U54 ( .A(n123), .B(ALU_FUN[0]), .C(n3), .Y(n118) );
  AND2X2M U55 ( .A(ALU_FUN[2]), .B(n154), .Y(n116) );
  AND4X2M U56 ( .A(N159), .B(n116), .C(n3), .D(n156), .Y(n107) );
  INVX2M U57 ( .A(n4), .Y(n139) );
  OAI222X1M U58 ( .A0(n72), .A1(n139), .B0(n4), .B1(n73), .C0(n53), .C1(n146), 
        .Y(n71) );
  AOI221XLM U59 ( .A0(n28), .A1(n63), .B0(n64), .B1(n145), .C0(n30), .Y(n73)
         );
  AOI221XLM U60 ( .A0(n63), .A1(n145), .B0(n28), .B1(n65), .C0(n59), .Y(n72)
         );
  AOI31X2M U61 ( .A0(n92), .A1(n93), .A2(n94), .B0(n152), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U62 ( .A0(N102), .A1(n67), .B0(N93), .B1(n54), .Y(n92) );
  AOI221XLM U63 ( .A0(n8), .A1(n153), .B0(n30), .B1(n149), .C0(n95), .Y(n94)
         );
  AOI222X1M U64 ( .A0(N111), .A1(n52), .B0(n7), .B1(n59), .C0(N127), .C1(n66), 
        .Y(n93) );
  AOI31X2M U65 ( .A0(n86), .A1(n87), .A2(n88), .B0(n152), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U66 ( .A0(N103), .A1(n67), .B0(N94), .B1(n54), .Y(n86) );
  AOI221XLM U67 ( .A0(n9), .A1(n153), .B0(n30), .B1(n148), .C0(n89), .Y(n88)
         );
  AOI222X1M U68 ( .A0(N112), .A1(n52), .B0(n8), .B1(n59), .C0(N128), .C1(n66), 
        .Y(n87) );
  AOI31X2M U69 ( .A0(n80), .A1(n81), .A2(n82), .B0(n152), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U70 ( .A0(N104), .A1(n67), .B0(N95), .B1(n54), .Y(n80) );
  AOI221XLM U71 ( .A0(n153), .A1(n27), .B0(n30), .B1(n147), .C0(n83), .Y(n82)
         );
  AOI222X1M U72 ( .A0(N113), .A1(n52), .B0(n9), .B1(n59), .C0(N129), .C1(n66), 
        .Y(n81) );
  AOI31X2M U73 ( .A0(n74), .A1(n75), .A2(n76), .B0(n152), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U74 ( .A0(N105), .A1(n67), .B0(N96), .B1(n54), .Y(n74) );
  AOI221XLM U75 ( .A0(n153), .A1(n28), .B0(n30), .B1(n146), .C0(n77), .Y(n76)
         );
  AOI222X1M U76 ( .A0(N114), .A1(n52), .B0(n27), .B1(n59), .C0(N130), .C1(n66), 
        .Y(n75) );
  AOI31X2M U77 ( .A0(n68), .A1(n69), .A2(n70), .B0(n152), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U78 ( .A0(N106), .A1(n67), .B0(N97), .B1(n54), .Y(n68) );
  AOI221XLM U79 ( .A0(n153), .A1(n29), .B0(n30), .B1(n145), .C0(n71), .Y(n70)
         );
  AOI222X1M U80 ( .A0(N115), .A1(n52), .B0(n59), .B1(n28), .C0(N131), .C1(n66), 
        .Y(n69) );
  AOI31X2M U81 ( .A0(n55), .A1(n56), .A2(n57), .B0(n152), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U82 ( .A0(N132), .A1(n66), .B0(N116), .B1(n52), .Y(n56) );
  AOI22X1M U83 ( .A0(N107), .A1(n67), .B0(N98), .B1(n54), .Y(n55) );
  AOI221XLM U84 ( .A0(n30), .A1(n144), .B0(n59), .B1(n29), .C0(n60), .Y(n57)
         );
  AOI31X2M U85 ( .A0(n110), .A1(n111), .A2(n112), .B0(n152), .Y(
        ALU_OUT_Comb[0]) );
  AOI22X1M U86 ( .A0(N100), .A1(n67), .B0(N91), .B1(n54), .Y(n110) );
  AOI211X2M U87 ( .A0(n30), .A1(n151), .B0(n113), .C0(n114), .Y(n112) );
  AOI222X1M U88 ( .A0(N109), .A1(n52), .B0(n5), .B1(n59), .C0(N125), .C1(n66), 
        .Y(n111) );
  AOI31X2M U89 ( .A0(n98), .A1(n99), .A2(n100), .B0(n152), .Y(ALU_OUT_Comb[1])
         );
  AOI211X2M U90 ( .A0(n7), .A1(n153), .B0(n101), .C0(n102), .Y(n100) );
  AOI222X1M U91 ( .A0(N126), .A1(n66), .B0(n30), .B1(n150), .C0(n6), .C1(n59), 
        .Y(n99) );
  AOI222X1M U92 ( .A0(N92), .A1(n54), .B0(N110), .B1(n52), .C0(N101), .C1(n67), 
        .Y(n98) );
  INVX2M U93 ( .A(n109), .Y(n140) );
  AOI211X2M U94 ( .A0(N108), .A1(n67), .B0(n30), .C0(n64), .Y(n109) );
  AOI21X2M U95 ( .A0(n50), .A1(n51), .B0(n152), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U96 ( .A0(N99), .A1(n54), .B0(n140), .Y(n50) );
  AOI2BB2XLM U97 ( .B0(N117), .B1(n52), .A0N(n144), .A1N(n53), .Y(n51) );
  BUFX2M U98 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U99 ( .A(n6), .Y(n150) );
  INVX2M U100 ( .A(n5), .Y(n151) );
  INVX2M U101 ( .A(n28), .Y(n145) );
  INVX2M U102 ( .A(n29), .Y(n144) );
  INVX2M U103 ( .A(n8), .Y(n148) );
  INVX2M U104 ( .A(n7), .Y(n149) );
  INVX2M U105 ( .A(n27), .Y(n146) );
  INVX2M U106 ( .A(n9), .Y(n147) );
  OAI222X1M U107 ( .A0(n96), .A1(n136), .B0(B[2]), .B1(n97), .C0(n53), .C1(
        n150), .Y(n95) );
  AOI221XLM U108 ( .A0(n7), .A1(n63), .B0(n64), .B1(n149), .C0(n30), .Y(n97)
         );
  AOI221XLM U109 ( .A0(n63), .A1(n149), .B0(n7), .B1(n65), .C0(n59), .Y(n96)
         );
  OAI222X1M U110 ( .A0(n90), .A1(n138), .B0(B[3]), .B1(n91), .C0(n53), .C1(
        n149), .Y(n89) );
  AOI221XLM U111 ( .A0(n8), .A1(n63), .B0(n64), .B1(n148), .C0(n30), .Y(n91)
         );
  AOI221XLM U112 ( .A0(n63), .A1(n148), .B0(n8), .B1(n65), .C0(n59), .Y(n90)
         );
  OAI222X1M U113 ( .A0(n84), .A1(n143), .B0(B[4]), .B1(n85), .C0(n53), .C1(
        n148), .Y(n83) );
  INVX2M U114 ( .A(B[4]), .Y(n143) );
  AOI221XLM U115 ( .A0(n9), .A1(n63), .B0(n64), .B1(n147), .C0(n30), .Y(n85)
         );
  AOI221XLM U116 ( .A0(n63), .A1(n147), .B0(n9), .B1(n65), .C0(n59), .Y(n84)
         );
  OAI222X1M U117 ( .A0(n78), .A1(n142), .B0(B[5]), .B1(n79), .C0(n53), .C1(
        n147), .Y(n77) );
  INVX2M U118 ( .A(B[5]), .Y(n142) );
  AOI221XLM U119 ( .A0(n27), .A1(n63), .B0(n64), .B1(n146), .C0(n30), .Y(n79)
         );
  AOI221XLM U120 ( .A0(n63), .A1(n146), .B0(n27), .B1(n65), .C0(n59), .Y(n78)
         );
  OAI222X1M U121 ( .A0(n61), .A1(n141), .B0(B[7]), .B1(n62), .C0(n53), .C1(
        n145), .Y(n60) );
  INVX2M U122 ( .A(B[7]), .Y(n141) );
  AOI221XLM U123 ( .A0(n63), .A1(n29), .B0(n64), .B1(n144), .C0(n30), .Y(n62)
         );
  AOI221XLM U124 ( .A0(n63), .A1(n144), .B0(n29), .B1(n65), .C0(n59), .Y(n61)
         );
  INVX2M U125 ( .A(n31), .Y(n135) );
  OAI2B2X1M U126 ( .A1N(B[0]), .A0(n115), .B0(n108), .B1(n150), .Y(n114) );
  AOI221XLM U127 ( .A0(n63), .A1(n151), .B0(n5), .B1(n65), .C0(n59), .Y(n115)
         );
  OAI2B2X1M U128 ( .A1N(B[1]), .A0(n103), .B0(n53), .B1(n151), .Y(n102) );
  AOI221XLM U129 ( .A0(n63), .A1(n150), .B0(n6), .B1(n65), .C0(n59), .Y(n103)
         );
  INVX2M U130 ( .A(n42), .Y(n137) );
  OAI21X2M U131 ( .A0(B[0]), .A1(n119), .B0(n120), .Y(n113) );
  AOI31X2M U132 ( .A0(N157), .A1(n3), .A2(n121), .B0(n107), .Y(n120) );
  AOI221XLM U133 ( .A0(n5), .A1(n63), .B0(n64), .B1(n151), .C0(n30), .Y(n119)
         );
  NOR3X2M U134 ( .A(n154), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n121) );
  OAI21X2M U135 ( .A0(B[1]), .A1(n104), .B0(n105), .Y(n101) );
  AOI31X2M U136 ( .A0(N158), .A1(n3), .A2(n106), .B0(n107), .Y(n105) );
  AOI221XLM U137 ( .A0(n6), .A1(n63), .B0(n64), .B1(n150), .C0(n30), .Y(n104)
         );
  NOR3X2M U138 ( .A(n156), .B(ALU_FUN[2]), .C(n154), .Y(n106) );
  BUFX2M U139 ( .A(A[7]), .Y(n29) );
  BUFX2M U140 ( .A(A[1]), .Y(n6) );
  BUFX2M U141 ( .A(A[0]), .Y(n5) );
  BUFX2M U142 ( .A(A[3]), .Y(n8) );
  BUFX2M U143 ( .A(A[2]), .Y(n7) );
  BUFX2M U144 ( .A(A[5]), .Y(n27) );
  BUFX2M U145 ( .A(A[4]), .Y(n9) );
  BUFX2M U146 ( .A(B[6]), .Y(n4) );
  INVX2M U147 ( .A(B[0]), .Y(n134) );
  INVX2M U148 ( .A(B[2]), .Y(n136) );
  INVX2M U149 ( .A(B[3]), .Y(n138) );
  NOR2X1M U150 ( .A(n144), .B(B[7]), .Y(n130) );
  NAND2BX1M U151 ( .AN(B[4]), .B(n9), .Y(n46) );
  NAND2BX1M U152 ( .AN(n9), .B(B[4]), .Y(n35) );
  CLKNAND2X2M U153 ( .A(n46), .B(n35), .Y(n125) );
  NOR2X1M U154 ( .A(n138), .B(n8), .Y(n43) );
  NOR2X1M U155 ( .A(n136), .B(n7), .Y(n34) );
  NOR2X1M U156 ( .A(n134), .B(n5), .Y(n31) );
  CLKNAND2X2M U157 ( .A(n7), .B(n136), .Y(n45) );
  NAND2BX1M U158 ( .AN(n34), .B(n45), .Y(n40) );
  AOI21X1M U159 ( .A0(n31), .A1(n150), .B0(B[1]), .Y(n32) );
  AOI211X1M U160 ( .A0(n6), .A1(n135), .B0(n40), .C0(n32), .Y(n33) );
  CLKNAND2X2M U161 ( .A(n8), .B(n138), .Y(n44) );
  OAI31X1M U162 ( .A0(n43), .A1(n34), .A2(n33), .B0(n44), .Y(n36) );
  NAND2BX1M U163 ( .AN(n27), .B(B[5]), .Y(n128) );
  OAI211X1M U164 ( .A0(n125), .A1(n36), .B0(n35), .C0(n128), .Y(n37) );
  NAND2BX1M U165 ( .AN(B[5]), .B(n27), .Y(n47) );
  XNOR2X1M U166 ( .A(n28), .B(n4), .Y(n127) );
  AOI32X1M U167 ( .A0(n37), .A1(n47), .A2(n127), .B0(n4), .B1(n145), .Y(n38)
         );
  CLKNAND2X2M U168 ( .A(B[7]), .B(n144), .Y(n131) );
  OAI21X1M U169 ( .A0(n130), .A1(n38), .B0(n131), .Y(N159) );
  CLKNAND2X2M U170 ( .A(n5), .B(n134), .Y(n41) );
  OA21X1M U171 ( .A0(n41), .A1(n150), .B0(B[1]), .Y(n39) );
  AOI211X1M U172 ( .A0(n41), .A1(n150), .B0(n40), .C0(n39), .Y(n42) );
  AOI31X1M U173 ( .A0(n137), .A1(n45), .A2(n44), .B0(n43), .Y(n126) );
  OAI2B11X1M U174 ( .A1N(n126), .A0(n125), .B0(n47), .C0(n46), .Y(n129) );
  AOI32X1M U175 ( .A0(n129), .A1(n128), .A2(n127), .B0(n28), .B1(n139), .Y(
        n132) );
  AOI2B1X1M U176 ( .A1N(n132), .A0(n131), .B0(n130), .Y(n133) );
  CLKINVX1M U177 ( .A(n133), .Y(N158) );
  NOR2X1M U178 ( .A(N159), .B(N158), .Y(N157) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({n29, n28, n27, n9, n8, 
        n7, n6, n5}), .b({B[7], n4, B[5:0]}), .quotient({N132, N131, N130, 
        N129, N128, N127, N126, N125}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, n29, n28, n27, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, 
        N107, N106, N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, n29, n28, n27, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, 
        N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({n29, n28, n27, n9, n8, 
        n7, n6, n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110, N109}) );
  SDFFRQX1M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX1M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX1M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX1M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX1M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX1M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX1M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX1M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  SDFFRQX1M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX1M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX1M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX1M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX1M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX1M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX1M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error, SI, SE, scan_clk, scan_rst, test_mode, SO );
  input [3:0] SI;
  output [3:0] SO;
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN, SE, scan_clk, scan_rst,
         test_mode;
  output UART_TX_O, parity_error, framing_error;
  wire   REF_CLK_scan, UART_CLK_scan, UART_RX_CLK, muxed_UART_RX_CLK,
         UART_TX_CLK, muxed_UART_TX_CLK, rst_scan, RST_N_REF, ref_rst_scan,
         RST_N_UART, uart_rst_scan, data_valid, data_valid_sync, wr_inc,
         busy_pulse, FIFO_empty, busy_lvl, rd_data_valid, ALU_OUT_VALID,
         ALU_EN, CLK_EN, wr_en, rd_en, ALU_CLK, _1_net_, n1, n2, n3, n4, n5,
         n6, n10, n11, n12, n15, n16, n17, n18, n19, n20, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [7:0] UART_P_DATA;
  wire   [7:0] UART_P_DATA_sync;
  wire   [7:0] ASYNC_FIFO_wr_Data;
  wire   [7:0] ASYNC_FIFO_RD_Data;
  wire   [7:0] REG3;
  wire   [7:0] REG2;
  wire   [7:0] i_divide_ratio_RX;
  wire   [7:0] rd_data;
  wire   [15:0] ALU_OUT;
  wire   [3:0] ALU_FUN;
  wire   [3:0] addr;
  wire   [7:0] wr_data;
  wire   [7:0] REG0;
  wire   [7:0] REG1;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX2M U3 ( .A(FIFO_empty), .Y(n1) );
  OR2X2M U4 ( .A(CLK_EN), .B(n2), .Y(_1_net_) );
  INVX2M U5 ( .A(n6), .Y(n5) );
  INVX2M U6 ( .A(REG2[4]), .Y(n6) );
  BUFX2M U7 ( .A(addr[0]), .Y(n3) );
  BUFX2M U8 ( .A(addr[1]), .Y(n4) );
  BUFX2M U9 ( .A(test_mode), .Y(n2) );
  CLKBUFX40M U15 ( .A(SO[1]), .Y(UART_TX_O) );
  INVXLM U16 ( .A(n31), .Y(n25) );
  DLY1X1M U17 ( .A(n27), .Y(n26) );
  INVXLM U18 ( .A(n36), .Y(n27) );
  INVXLM U19 ( .A(n36), .Y(n28) );
  DLY1X1M U20 ( .A(n25), .Y(n29) );
  DLY1X1M U21 ( .A(n32), .Y(n30) );
  INVXLM U22 ( .A(n27), .Y(n31) );
  INVXLM U23 ( .A(n31), .Y(n32) );
  INVXLM U24 ( .A(n31), .Y(n33) );
  INVXLM U25 ( .A(n38), .Y(n34) );
  INVXLM U26 ( .A(n34), .Y(n35) );
  INVXLM U27 ( .A(SE), .Y(n36) );
  INVXLM U28 ( .A(n36), .Y(n37) );
  INVXLM U29 ( .A(n36), .Y(n38) );
  mux2X1_1 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        REF_CLK_scan) );
  mux2X1_5 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        UART_CLK_scan) );
  mux2X1_4 U2_mux2X1 ( .IN_0(UART_RX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        muxed_UART_RX_CLK) );
  mux2X1_3 U3_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        muxed_UART_TX_CLK) );
  mux2X1_2 U4_mux2X1 ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(n2), .OUT(rst_scan)
         );
  mux2X1_0 U5_mux2X1 ( .IN_0(RST_N_REF), .IN_1(scan_rst), .SEL(n2), .OUT(
        ref_rst_scan) );
  mux2X1_6 U6_mux2X1 ( .IN_0(RST_N_UART), .IN_1(scan_rst), .SEL(n2), .OUT(
        uart_rst_scan) );
  RST_SYNC_test_1 UART_CLK_domain_RST_SYNC ( .clk(UART_CLK_scan), .rst(
        rst_scan), .sync_rst(RST_N_UART), .test_si(n15), .test_se(n35) );
  RST_SYNC_test_0 REF_CLK_domain_RST_SYNC ( .clk(REF_CLK_scan), .rst(rst_scan), 
        .sync_rst(RST_N_REF), .test_si(n16), .test_se(n33) );
  DATA_SYNCH_bus_width8_test_1 DATA_SYNCH ( .unsync_bus(UART_P_DATA), 
        .bus_enable(data_valid), .clk(REF_CLK_scan), .rst(ref_rst_scan), 
        .sync_bus(UART_P_DATA_sync), .enable_pulse(data_valid_sync), .test_si(
        n18), .test_so(n17), .test_se(n33) );
  FIFO_TOP_data_width8_address_width3_test_1 ASYNC_FIFO ( .w_clk(REF_CLK_scan), 
        .wrst_n(ref_rst_scan), .w_inc(wr_inc), .w_data(ASYNC_FIFO_wr_Data), 
        .r_clk(muxed_UART_TX_CLK), .rrst_n(uart_rst_scan), .r_inc(busy_pulse), 
        .rempty(FIFO_empty), .r_data(ASYNC_FIFO_RD_Data), .test_si2(SI[2]), 
        .test_si1(ALU_OUT_VALID), .test_so2(n20), .test_so1(SO[3]), .test_se(
        SE) );
  PULSE_GEN_test_1 PULSE_GEN ( .clk(muxed_UART_TX_CLK), .rst(uart_rst_scan), 
        .lvl_sig(busy_lvl), .pulse_sig(busy_pulse), .test_si(n17), .test_so(
        n16), .test_se(n27) );
  CLK_DIV_test_1 CLK_DIV_UART_TX ( .i_ref_clk(UART_CLK_scan), .i_rstn(
        uart_rst_scan), .i_clk_en(1'b1), .i_divide_ratio(REG3), .gen_clk(
        UART_TX_CLK), .test_si(n19), .test_so(n18), .test_se(n35) );
  CLKDIV_MUX_WIDTH8 CLKDIV_MUX ( .IN({REG2[7:5], n5, REG2[3:2]}), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        i_divide_ratio_RX[3:0]}) );
  CLK_DIV_test_0 CLK_DIV_UART_RX ( .i_ref_clk(UART_CLK_scan), .i_rstn(
        uart_rst_scan), .i_clk_en(1'b1), .i_divide_ratio({1'b0, 1'b0, 1'b0, 
        1'b0, i_divide_ratio_RX[3:0]}), .gen_clk(UART_RX_CLK), .test_si(n20), 
        .test_so(n19), .test_se(n37) );
  UART_RX_TOP_test_1 UART_RX ( .clk(muxed_UART_RX_CLK), .rstn(uart_rst_scan), 
        .RX_IN(UART_RX_IN), .prescale({REG2[7:5], n5, REG2[3:2]}), 
        .parity_enable(REG2[0]), .parity_type(REG2[1]), .P_DATA(UART_P_DATA), 
        .parity_error(parity_error), .stop_error(framing_error), .data_valid(
        data_valid), .test_si2(SI[1]), .test_si1(RST_N_UART), .test_so2(n12), 
        .test_so1(SO[2]), .test_se(n26) );
  UART_TX_TOP_test_1 UART_TX ( .clk(muxed_UART_TX_CLK), .rstn(uart_rst_scan), 
        .P_DATA(ASYNC_FIFO_RD_Data), .data_valid(n1), .par_typ(REG2[1]), 
        .par_en(REG2[0]), .TX_OUT(SO[1]), .busy(busy_lvl), .test_si2(n10), 
        .test_si1(n12), .test_so1(n11), .test_se(n29) );
  SYS_CTRL_test_1 SYS_CTRL ( .CLK(REF_CLK_scan), .RST(ref_rst_scan), 
        .RX_P_DATA(UART_P_DATA_sync), .RX_D_VLD(data_valid_sync), .RdData(
        rd_data), .RdData_Valid(rd_data_valid), .ALU_OUT(ALU_OUT), .OUT_Valid(
        ALU_OUT_VALID), .ALU_EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLK_EN(CLK_EN), 
        .Address(addr), .WrEn(wr_en), .RdEn(rd_en), .WrData(wr_data), 
        .TX_P_DATA(ASYNC_FIFO_wr_Data), .TX_D_VLD(wr_inc), .test_si(RST_N_REF), 
        .test_so(n15), .test_se(n28) );
  RegFile_WIDTH8_DEPTH16_ADDR4_test_1 reg_file ( .CLK(REF_CLK_scan), .RST(
        ref_rst_scan), .WrEn(wr_en), .RdEn(rd_en), .Address({addr[3:2], n4, n3}), .WrData(wr_data), .RdData(rd_data), .RdData_VLD(rd_data_valid), .REG0(REG0), 
        .REG1(REG1), .REG2(REG2), .REG3(REG3), .test_si2(SI[0]), .test_si1(n11), .test_so2(SO[0]), .test_so1(n10), .test_se(SE) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 ALU ( .A(REG0), .B(REG1), .EN(ALU_EN), 
        .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(ref_rst_scan), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VALID), .test_si(SI[3]), .test_se(n30) );
  CLK_GATE CLK_GATE ( .CLK_EN(_1_net_), .CLK(REF_CLK_scan), .GATED_CLK(ALU_CLK) );
endmodule

