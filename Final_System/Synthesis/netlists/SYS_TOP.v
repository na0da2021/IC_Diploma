/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Oct 28 22:36:01 2024
/////////////////////////////////////////////////////////////


module RST_SYNC_0 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   meta_flop;

  DFFRQX2M sync_rst_reg ( .D(meta_flop), .CK(clk), .RN(rst), .Q(sync_rst) );
  DFFRQX2M meta_flop_reg ( .D(1'b1), .CK(clk), .RN(rst), .Q(meta_flop) );
endmodule


module RST_SYNC_1 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   meta_flop;

  DFFRQX2M sync_rst_reg ( .D(meta_flop), .CK(clk), .RN(rst), .Q(sync_rst) );
  DFFRQX2M meta_flop_reg ( .D(1'b1), .CK(clk), .RN(rst), .Q(meta_flop) );
endmodule


module DATA_SYNCH_bus_width8 ( unsync_bus, bus_enable, clk, rst, sync_bus, 
        enable_pulse );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, clk, rst;
  output enable_pulse;
  wire   sync_flop, meta_flop, enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10;

  DFFRQX2M enable_flop_reg ( .D(sync_flop), .CK(clk), .RN(rst), .Q(enable_flop) );
  DFFRQX2M sync_flop_reg ( .D(meta_flop), .CK(clk), .RN(rst), .Q(sync_flop) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(clk), .RN(rst), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(clk), .RN(rst), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(clk), .RN(rst), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(clk), .RN(rst), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(clk), .RN(rst), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(clk), .RN(rst), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(clk), .RN(rst), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(clk), .RN(rst), .Q(sync_bus[0]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(clk), .RN(rst), .Q(enable_pulse) );
  DFFRQX2M meta_flop_reg ( .D(bus_enable), .CK(clk), .RN(rst), .Q(meta_flop)
         );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(sync_flop), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module FIFO_WR_address_width3 ( w_inc, w_clk, wrst_n, wq2_rptr, wptr, waddr, 
        wfull );
  input [3:0] wq2_rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input w_inc, w_clk, wrst_n;
  output wfull;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  DFFRQX2M \waddr_intermid_reg[3]  ( .D(n11), .CK(w_clk), .RN(wrst_n), .Q(
        wptr[3]) );
  DFFRQX2M \waddr_intermid_reg[2]  ( .D(n12), .CK(w_clk), .RN(wrst_n), .Q(
        waddr[2]) );
  DFFRX1M \waddr_intermid_reg[0]  ( .D(n14), .CK(w_clk), .RN(wrst_n), .Q(
        waddr[0]), .QN(n1) );
  DFFRQX2M \waddr_intermid_reg[1]  ( .D(n13), .CK(w_clk), .RN(wrst_n), .Q(
        waddr[1]) );
  INVX2M U3 ( .A(n2), .Y(wfull) );
  NAND2X2M U4 ( .A(w_inc), .B(n2), .Y(n6) );
  XNOR2X2M U5 ( .A(wptr[1]), .B(wq2_rptr[1]), .Y(n7) );
  XNOR2X2M U6 ( .A(n1), .B(waddr[1]), .Y(wptr[0]) );
  NOR2X2M U7 ( .A(n6), .B(n1), .Y(n5) );
  XNOR2X2M U8 ( .A(waddr[2]), .B(n4), .Y(n12) );
  XNOR2X2M U9 ( .A(wptr[3]), .B(n3), .Y(n11) );
  NAND2BX2M U10 ( .AN(n4), .B(waddr[2]), .Y(n3) );
  NAND4X2M U11 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n2) );
  CLKXOR2X2M U12 ( .A(wq2_rptr[3]), .B(wptr[3]), .Y(n9) );
  XNOR2X2M U13 ( .A(wptr[0]), .B(wq2_rptr[0]), .Y(n8) );
  CLKXOR2X2M U14 ( .A(wq2_rptr[2]), .B(wptr[2]), .Y(n10) );
  NAND2X2M U15 ( .A(n5), .B(waddr[1]), .Y(n4) );
  CLKXOR2X2M U16 ( .A(wptr[3]), .B(waddr[2]), .Y(wptr[2]) );
  CLKXOR2X2M U17 ( .A(waddr[1]), .B(waddr[2]), .Y(wptr[1]) );
  CLKXOR2X2M U18 ( .A(waddr[1]), .B(n5), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n6), .Y(n14) );
endmodule


module FIFO_RD_address_width3 ( r_inc, r_clk, rrst_n, rq2_wptr, rptr, raddr, 
        rempty );
  input [3:0] rq2_wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input r_inc, r_clk, rrst_n;
  output rempty;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  DFFRQX2M \raddr_intermid_reg[3]  ( .D(n11), .CK(r_clk), .RN(rrst_n), .Q(
        rptr[3]) );
  DFFRX1M \raddr_intermid_reg[0]  ( .D(n14), .CK(r_clk), .RN(rrst_n), .Q(
        raddr[0]), .QN(n1) );
  DFFRQX2M \raddr_intermid_reg[2]  ( .D(n12), .CK(r_clk), .RN(rrst_n), .Q(
        raddr[2]) );
  DFFRQX2M \raddr_intermid_reg[1]  ( .D(n13), .CK(r_clk), .RN(rrst_n), .Q(
        raddr[1]) );
  INVX2M U3 ( .A(n2), .Y(rempty) );
  XNOR2X2M U4 ( .A(rptr[1]), .B(rq2_wptr[1]), .Y(n7) );
  XNOR2X2M U5 ( .A(n1), .B(raddr[1]), .Y(rptr[0]) );
  NOR2X2M U6 ( .A(n6), .B(n1), .Y(n5) );
  XNOR2X2M U7 ( .A(raddr[2]), .B(n4), .Y(n12) );
  NAND4X2M U8 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n2) );
  XNOR2X2M U9 ( .A(rptr[3]), .B(rq2_wptr[3]), .Y(n9) );
  XNOR2X2M U10 ( .A(rptr[2]), .B(rq2_wptr[2]), .Y(n10) );
  XNOR2X2M U11 ( .A(rptr[0]), .B(rq2_wptr[0]), .Y(n8) );
  NAND2X2M U12 ( .A(n5), .B(raddr[1]), .Y(n4) );
  NAND2X2M U13 ( .A(r_inc), .B(n2), .Y(n6) );
  XNOR2X2M U14 ( .A(rptr[3]), .B(n3), .Y(n11) );
  NAND2BX2M U15 ( .AN(n4), .B(raddr[2]), .Y(n3) );
  CLKXOR2X2M U16 ( .A(raddr[1]), .B(raddr[2]), .Y(rptr[1]) );
  CLKXOR2X2M U17 ( .A(rptr[3]), .B(raddr[2]), .Y(rptr[2]) );
  CLKXOR2X2M U18 ( .A(raddr[1]), .B(n5), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n6), .Y(n14) );
endmodule


module DF_SYNC_addr_width3_0 ( clk, rst, ptr, synch_ptr );
  input [3:0] ptr;
  output [3:0] synch_ptr;
  input clk, rst;

  wire   [3:0] meta_flop;

  DFFRQX2M \synch_ptr_reg[3]  ( .D(meta_flop[3]), .CK(clk), .RN(rst), .Q(
        synch_ptr[3]) );
  DFFRQX2M \synch_ptr_reg[2]  ( .D(meta_flop[2]), .CK(clk), .RN(rst), .Q(
        synch_ptr[2]) );
  DFFRQX2M \synch_ptr_reg[1]  ( .D(meta_flop[1]), .CK(clk), .RN(rst), .Q(
        synch_ptr[1]) );
  DFFRQX2M \synch_ptr_reg[0]  ( .D(meta_flop[0]), .CK(clk), .RN(rst), .Q(
        synch_ptr[0]) );
  DFFRQX2M \meta_flop_reg[3]  ( .D(ptr[3]), .CK(clk), .RN(rst), .Q(
        meta_flop[3]) );
  DFFRQX2M \meta_flop_reg[2]  ( .D(ptr[2]), .CK(clk), .RN(rst), .Q(
        meta_flop[2]) );
  DFFRQX2M \meta_flop_reg[1]  ( .D(ptr[1]), .CK(clk), .RN(rst), .Q(
        meta_flop[1]) );
  DFFRQX2M \meta_flop_reg[0]  ( .D(ptr[0]), .CK(clk), .RN(rst), .Q(
        meta_flop[0]) );
endmodule


module DF_SYNC_addr_width3_1 ( clk, rst, ptr, synch_ptr );
  input [3:0] ptr;
  output [3:0] synch_ptr;
  input clk, rst;

  wire   [3:0] meta_flop;

  DFFRQX2M \synch_ptr_reg[1]  ( .D(meta_flop[1]), .CK(clk), .RN(rst), .Q(
        synch_ptr[1]) );
  DFFRQX2M \synch_ptr_reg[0]  ( .D(meta_flop[0]), .CK(clk), .RN(rst), .Q(
        synch_ptr[0]) );
  DFFRQX2M \synch_ptr_reg[3]  ( .D(meta_flop[3]), .CK(clk), .RN(rst), .Q(
        synch_ptr[3]) );
  DFFRQX2M \synch_ptr_reg[2]  ( .D(meta_flop[2]), .CK(clk), .RN(rst), .Q(
        synch_ptr[2]) );
  DFFRQX2M \meta_flop_reg[3]  ( .D(ptr[3]), .CK(clk), .RN(rst), .Q(
        meta_flop[3]) );
  DFFRQX2M \meta_flop_reg[2]  ( .D(ptr[2]), .CK(clk), .RN(rst), .Q(
        meta_flop[2]) );
  DFFRQX2M \meta_flop_reg[1]  ( .D(ptr[1]), .CK(clk), .RN(rst), .Q(
        meta_flop[1]) );
  DFFRQX2M \meta_flop_reg[0]  ( .D(ptr[0]), .CK(clk), .RN(rst), .Q(
        meta_flop[0]) );
endmodule


module FIFO_mem_data_width8_address_width3 ( w_data, w_clk, w_clk_en, w_addr, 
        r_addr, r_data );
  input [7:0] w_data;
  input [2:0] w_addr;
  input [2:0] r_addr;
  output [7:0] r_data;
  input w_clk, w_clk_en;
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
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107;
  assign N10 = r_addr[0];
  assign N11 = r_addr[1];
  assign N12 = r_addr[2];

  DFFQX2M \mem_reg[5][7]  ( .D(n68), .CK(w_clk), .Q(\mem[5][7] ) );
  DFFQX2M \mem_reg[5][6]  ( .D(n67), .CK(w_clk), .Q(\mem[5][6] ) );
  DFFQX2M \mem_reg[5][5]  ( .D(n66), .CK(w_clk), .Q(\mem[5][5] ) );
  DFFQX2M \mem_reg[5][4]  ( .D(n65), .CK(w_clk), .Q(\mem[5][4] ) );
  DFFQX2M \mem_reg[5][3]  ( .D(n64), .CK(w_clk), .Q(\mem[5][3] ) );
  DFFQX2M \mem_reg[5][2]  ( .D(n63), .CK(w_clk), .Q(\mem[5][2] ) );
  DFFQX2M \mem_reg[5][1]  ( .D(n62), .CK(w_clk), .Q(\mem[5][1] ) );
  DFFQX2M \mem_reg[5][0]  ( .D(n61), .CK(w_clk), .Q(\mem[5][0] ) );
  DFFQX2M \mem_reg[1][7]  ( .D(n36), .CK(w_clk), .Q(\mem[1][7] ) );
  DFFQX2M \mem_reg[1][6]  ( .D(n35), .CK(w_clk), .Q(\mem[1][6] ) );
  DFFQX2M \mem_reg[1][5]  ( .D(n34), .CK(w_clk), .Q(\mem[1][5] ) );
  DFFQX2M \mem_reg[1][4]  ( .D(n33), .CK(w_clk), .Q(\mem[1][4] ) );
  DFFQX2M \mem_reg[1][3]  ( .D(n32), .CK(w_clk), .Q(\mem[1][3] ) );
  DFFQX2M \mem_reg[1][2]  ( .D(n31), .CK(w_clk), .Q(\mem[1][2] ) );
  DFFQX2M \mem_reg[1][1]  ( .D(n30), .CK(w_clk), .Q(\mem[1][1] ) );
  DFFQX2M \mem_reg[1][0]  ( .D(n29), .CK(w_clk), .Q(\mem[1][0] ) );
  DFFQX2M \mem_reg[7][7]  ( .D(n84), .CK(w_clk), .Q(\mem[7][7] ) );
  DFFQX2M \mem_reg[7][6]  ( .D(n83), .CK(w_clk), .Q(\mem[7][6] ) );
  DFFQX2M \mem_reg[7][5]  ( .D(n82), .CK(w_clk), .Q(\mem[7][5] ) );
  DFFQX2M \mem_reg[7][4]  ( .D(n81), .CK(w_clk), .Q(\mem[7][4] ) );
  DFFQX2M \mem_reg[7][3]  ( .D(n80), .CK(w_clk), .Q(\mem[7][3] ) );
  DFFQX2M \mem_reg[7][2]  ( .D(n79), .CK(w_clk), .Q(\mem[7][2] ) );
  DFFQX2M \mem_reg[7][1]  ( .D(n78), .CK(w_clk), .Q(\mem[7][1] ) );
  DFFQX2M \mem_reg[7][0]  ( .D(n77), .CK(w_clk), .Q(\mem[7][0] ) );
  DFFQX2M \mem_reg[3][7]  ( .D(n52), .CK(w_clk), .Q(\mem[3][7] ) );
  DFFQX2M \mem_reg[3][6]  ( .D(n51), .CK(w_clk), .Q(\mem[3][6] ) );
  DFFQX2M \mem_reg[3][5]  ( .D(n50), .CK(w_clk), .Q(\mem[3][5] ) );
  DFFQX2M \mem_reg[3][4]  ( .D(n49), .CK(w_clk), .Q(\mem[3][4] ) );
  DFFQX2M \mem_reg[3][3]  ( .D(n48), .CK(w_clk), .Q(\mem[3][3] ) );
  DFFQX2M \mem_reg[3][2]  ( .D(n47), .CK(w_clk), .Q(\mem[3][2] ) );
  DFFQX2M \mem_reg[3][1]  ( .D(n46), .CK(w_clk), .Q(\mem[3][1] ) );
  DFFQX2M \mem_reg[3][0]  ( .D(n45), .CK(w_clk), .Q(\mem[3][0] ) );
  DFFQX2M \mem_reg[6][7]  ( .D(n76), .CK(w_clk), .Q(\mem[6][7] ) );
  DFFQX2M \mem_reg[6][6]  ( .D(n75), .CK(w_clk), .Q(\mem[6][6] ) );
  DFFQX2M \mem_reg[6][5]  ( .D(n74), .CK(w_clk), .Q(\mem[6][5] ) );
  DFFQX2M \mem_reg[6][4]  ( .D(n73), .CK(w_clk), .Q(\mem[6][4] ) );
  DFFQX2M \mem_reg[6][3]  ( .D(n72), .CK(w_clk), .Q(\mem[6][3] ) );
  DFFQX2M \mem_reg[6][2]  ( .D(n71), .CK(w_clk), .Q(\mem[6][2] ) );
  DFFQX2M \mem_reg[6][1]  ( .D(n70), .CK(w_clk), .Q(\mem[6][1] ) );
  DFFQX2M \mem_reg[6][0]  ( .D(n69), .CK(w_clk), .Q(\mem[6][0] ) );
  DFFQX2M \mem_reg[2][7]  ( .D(n44), .CK(w_clk), .Q(\mem[2][7] ) );
  DFFQX2M \mem_reg[2][6]  ( .D(n43), .CK(w_clk), .Q(\mem[2][6] ) );
  DFFQX2M \mem_reg[2][5]  ( .D(n42), .CK(w_clk), .Q(\mem[2][5] ) );
  DFFQX2M \mem_reg[2][4]  ( .D(n41), .CK(w_clk), .Q(\mem[2][4] ) );
  DFFQX2M \mem_reg[2][3]  ( .D(n40), .CK(w_clk), .Q(\mem[2][3] ) );
  DFFQX2M \mem_reg[2][2]  ( .D(n39), .CK(w_clk), .Q(\mem[2][2] ) );
  DFFQX2M \mem_reg[2][1]  ( .D(n38), .CK(w_clk), .Q(\mem[2][1] ) );
  DFFQX2M \mem_reg[2][0]  ( .D(n37), .CK(w_clk), .Q(\mem[2][0] ) );
  DFFQX2M \mem_reg[4][7]  ( .D(n60), .CK(w_clk), .Q(\mem[4][7] ) );
  DFFQX2M \mem_reg[4][6]  ( .D(n59), .CK(w_clk), .Q(\mem[4][6] ) );
  DFFQX2M \mem_reg[4][5]  ( .D(n58), .CK(w_clk), .Q(\mem[4][5] ) );
  DFFQX2M \mem_reg[4][4]  ( .D(n57), .CK(w_clk), .Q(\mem[4][4] ) );
  DFFQX2M \mem_reg[4][3]  ( .D(n56), .CK(w_clk), .Q(\mem[4][3] ) );
  DFFQX2M \mem_reg[4][2]  ( .D(n55), .CK(w_clk), .Q(\mem[4][2] ) );
  DFFQX2M \mem_reg[4][1]  ( .D(n54), .CK(w_clk), .Q(\mem[4][1] ) );
  DFFQX2M \mem_reg[4][0]  ( .D(n53), .CK(w_clk), .Q(\mem[4][0] ) );
  DFFQX2M \mem_reg[0][7]  ( .D(n28), .CK(w_clk), .Q(\mem[0][7] ) );
  DFFQX2M \mem_reg[0][6]  ( .D(n27), .CK(w_clk), .Q(\mem[0][6] ) );
  DFFQX2M \mem_reg[0][5]  ( .D(n26), .CK(w_clk), .Q(\mem[0][5] ) );
  DFFQX2M \mem_reg[0][4]  ( .D(n25), .CK(w_clk), .Q(\mem[0][4] ) );
  DFFQX2M \mem_reg[0][3]  ( .D(n24), .CK(w_clk), .Q(\mem[0][3] ) );
  DFFQX2M \mem_reg[0][2]  ( .D(n23), .CK(w_clk), .Q(\mem[0][2] ) );
  DFFQX2M \mem_reg[0][1]  ( .D(n22), .CK(w_clk), .Q(\mem[0][1] ) );
  DFFQX2M \mem_reg[0][0]  ( .D(n21), .CK(w_clk), .Q(\mem[0][0] ) );
  BUFX2M U2 ( .A(n19), .Y(n93) );
  BUFX2M U3 ( .A(n20), .Y(n92) );
  BUFX2M U4 ( .A(n13), .Y(n97) );
  BUFX2M U5 ( .A(n14), .Y(n96) );
  NAND3X2M U6 ( .A(n98), .B(n99), .C(n17), .Y(n16) );
  NAND3X2M U7 ( .A(n98), .B(n99), .C(n12), .Y(n11) );
  NOR2BX2M U8 ( .AN(w_clk_en), .B(w_addr[2]), .Y(n12) );
  OAI2BB2X1M U9 ( .B0(n11), .B1(n107), .A0N(\mem[0][0] ), .A1N(n11), .Y(n21)
         );
  OAI2BB2X1M U10 ( .B0(n11), .B1(n106), .A0N(\mem[0][1] ), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U11 ( .B0(n11), .B1(n105), .A0N(\mem[0][2] ), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U12 ( .B0(n11), .B1(n104), .A0N(\mem[0][3] ), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U13 ( .B0(n11), .B1(n103), .A0N(\mem[0][4] ), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U14 ( .B0(n11), .B1(n102), .A0N(\mem[0][5] ), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U15 ( .B0(n11), .B1(n101), .A0N(\mem[0][6] ), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U16 ( .B0(n11), .B1(n100), .A0N(\mem[0][7] ), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U17 ( .B0(n107), .B1(n16), .A0N(\mem[4][0] ), .A1N(n16), .Y(n53)
         );
  OAI2BB2X1M U18 ( .B0(n106), .B1(n16), .A0N(\mem[4][1] ), .A1N(n16), .Y(n54)
         );
  OAI2BB2X1M U19 ( .B0(n105), .B1(n16), .A0N(\mem[4][2] ), .A1N(n16), .Y(n55)
         );
  OAI2BB2X1M U20 ( .B0(n104), .B1(n16), .A0N(\mem[4][3] ), .A1N(n16), .Y(n56)
         );
  OAI2BB2X1M U21 ( .B0(n103), .B1(n16), .A0N(\mem[4][4] ), .A1N(n16), .Y(n57)
         );
  OAI2BB2X1M U22 ( .B0(n102), .B1(n16), .A0N(\mem[4][5] ), .A1N(n16), .Y(n58)
         );
  OAI2BB2X1M U23 ( .B0(n101), .B1(n16), .A0N(\mem[4][6] ), .A1N(n16), .Y(n59)
         );
  OAI2BB2X1M U24 ( .B0(n100), .B1(n16), .A0N(\mem[4][7] ), .A1N(n16), .Y(n60)
         );
  INVX2M U25 ( .A(w_data[0]), .Y(n107) );
  INVX2M U26 ( .A(w_data[1]), .Y(n106) );
  INVX2M U27 ( .A(w_data[2]), .Y(n105) );
  INVX2M U28 ( .A(w_data[3]), .Y(n104) );
  INVX2M U29 ( .A(w_data[4]), .Y(n103) );
  INVX2M U30 ( .A(w_data[5]), .Y(n102) );
  INVX2M U31 ( .A(w_data[6]), .Y(n101) );
  INVX2M U32 ( .A(w_data[7]), .Y(n100) );
  BUFX2M U33 ( .A(n15), .Y(n95) );
  NAND3X2M U34 ( .A(w_addr[0]), .B(n12), .C(w_addr[1]), .Y(n15) );
  BUFX2M U35 ( .A(n18), .Y(n94) );
  NAND3X2M U36 ( .A(w_addr[0]), .B(n99), .C(n17), .Y(n18) );
  OAI2BB2X1M U37 ( .B0(n107), .B1(n97), .A0N(\mem[1][0] ), .A1N(n97), .Y(n29)
         );
  OAI2BB2X1M U38 ( .B0(n106), .B1(n97), .A0N(\mem[1][1] ), .A1N(n97), .Y(n30)
         );
  OAI2BB2X1M U39 ( .B0(n105), .B1(n97), .A0N(\mem[1][2] ), .A1N(n97), .Y(n31)
         );
  OAI2BB2X1M U40 ( .B0(n104), .B1(n97), .A0N(\mem[1][3] ), .A1N(n97), .Y(n32)
         );
  OAI2BB2X1M U41 ( .B0(n103), .B1(n97), .A0N(\mem[1][4] ), .A1N(n97), .Y(n33)
         );
  OAI2BB2X1M U42 ( .B0(n102), .B1(n97), .A0N(\mem[1][5] ), .A1N(n97), .Y(n34)
         );
  OAI2BB2X1M U43 ( .B0(n101), .B1(n97), .A0N(\mem[1][6] ), .A1N(n97), .Y(n35)
         );
  OAI2BB2X1M U44 ( .B0(n100), .B1(n97), .A0N(\mem[1][7] ), .A1N(n97), .Y(n36)
         );
  OAI2BB2X1M U45 ( .B0(n107), .B1(n96), .A0N(\mem[2][0] ), .A1N(n96), .Y(n37)
         );
  OAI2BB2X1M U46 ( .B0(n106), .B1(n96), .A0N(\mem[2][1] ), .A1N(n96), .Y(n38)
         );
  OAI2BB2X1M U47 ( .B0(n105), .B1(n96), .A0N(\mem[2][2] ), .A1N(n96), .Y(n39)
         );
  OAI2BB2X1M U48 ( .B0(n104), .B1(n96), .A0N(\mem[2][3] ), .A1N(n96), .Y(n40)
         );
  OAI2BB2X1M U49 ( .B0(n103), .B1(n96), .A0N(\mem[2][4] ), .A1N(n96), .Y(n41)
         );
  OAI2BB2X1M U50 ( .B0(n102), .B1(n96), .A0N(\mem[2][5] ), .A1N(n96), .Y(n42)
         );
  OAI2BB2X1M U51 ( .B0(n101), .B1(n96), .A0N(\mem[2][6] ), .A1N(n96), .Y(n43)
         );
  OAI2BB2X1M U52 ( .B0(n100), .B1(n96), .A0N(\mem[2][7] ), .A1N(n96), .Y(n44)
         );
  OAI2BB2X1M U53 ( .B0(n107), .B1(n95), .A0N(\mem[3][0] ), .A1N(n95), .Y(n45)
         );
  OAI2BB2X1M U54 ( .B0(n106), .B1(n95), .A0N(\mem[3][1] ), .A1N(n95), .Y(n46)
         );
  OAI2BB2X1M U55 ( .B0(n105), .B1(n95), .A0N(\mem[3][2] ), .A1N(n95), .Y(n47)
         );
  OAI2BB2X1M U56 ( .B0(n104), .B1(n95), .A0N(\mem[3][3] ), .A1N(n95), .Y(n48)
         );
  OAI2BB2X1M U57 ( .B0(n103), .B1(n95), .A0N(\mem[3][4] ), .A1N(n95), .Y(n49)
         );
  OAI2BB2X1M U58 ( .B0(n102), .B1(n95), .A0N(\mem[3][5] ), .A1N(n95), .Y(n50)
         );
  OAI2BB2X1M U59 ( .B0(n101), .B1(n95), .A0N(\mem[3][6] ), .A1N(n95), .Y(n51)
         );
  OAI2BB2X1M U60 ( .B0(n100), .B1(n95), .A0N(\mem[3][7] ), .A1N(n95), .Y(n52)
         );
  OAI2BB2X1M U61 ( .B0(n107), .B1(n94), .A0N(\mem[5][0] ), .A1N(n94), .Y(n61)
         );
  OAI2BB2X1M U62 ( .B0(n106), .B1(n94), .A0N(\mem[5][1] ), .A1N(n94), .Y(n62)
         );
  OAI2BB2X1M U63 ( .B0(n105), .B1(n94), .A0N(\mem[5][2] ), .A1N(n94), .Y(n63)
         );
  OAI2BB2X1M U64 ( .B0(n104), .B1(n94), .A0N(\mem[5][3] ), .A1N(n94), .Y(n64)
         );
  OAI2BB2X1M U65 ( .B0(n103), .B1(n94), .A0N(\mem[5][4] ), .A1N(n94), .Y(n65)
         );
  OAI2BB2X1M U66 ( .B0(n102), .B1(n94), .A0N(\mem[5][5] ), .A1N(n94), .Y(n66)
         );
  OAI2BB2X1M U67 ( .B0(n101), .B1(n94), .A0N(\mem[5][6] ), .A1N(n94), .Y(n67)
         );
  OAI2BB2X1M U68 ( .B0(n100), .B1(n94), .A0N(\mem[5][7] ), .A1N(n94), .Y(n68)
         );
  OAI2BB2X1M U69 ( .B0(n107), .B1(n93), .A0N(\mem[6][0] ), .A1N(n93), .Y(n69)
         );
  OAI2BB2X1M U70 ( .B0(n106), .B1(n93), .A0N(\mem[6][1] ), .A1N(n93), .Y(n70)
         );
  OAI2BB2X1M U71 ( .B0(n105), .B1(n93), .A0N(\mem[6][2] ), .A1N(n93), .Y(n71)
         );
  OAI2BB2X1M U72 ( .B0(n104), .B1(n93), .A0N(\mem[6][3] ), .A1N(n93), .Y(n72)
         );
  OAI2BB2X1M U73 ( .B0(n103), .B1(n93), .A0N(\mem[6][4] ), .A1N(n93), .Y(n73)
         );
  OAI2BB2X1M U74 ( .B0(n102), .B1(n93), .A0N(\mem[6][5] ), .A1N(n93), .Y(n74)
         );
  OAI2BB2X1M U75 ( .B0(n101), .B1(n93), .A0N(\mem[6][6] ), .A1N(n93), .Y(n75)
         );
  OAI2BB2X1M U76 ( .B0(n100), .B1(n93), .A0N(\mem[6][7] ), .A1N(n93), .Y(n76)
         );
  OAI2BB2X1M U77 ( .B0(n107), .B1(n92), .A0N(\mem[7][0] ), .A1N(n92), .Y(n77)
         );
  OAI2BB2X1M U78 ( .B0(n106), .B1(n92), .A0N(\mem[7][1] ), .A1N(n92), .Y(n78)
         );
  OAI2BB2X1M U79 ( .B0(n105), .B1(n92), .A0N(\mem[7][2] ), .A1N(n92), .Y(n79)
         );
  OAI2BB2X1M U80 ( .B0(n104), .B1(n92), .A0N(\mem[7][3] ), .A1N(n92), .Y(n80)
         );
  OAI2BB2X1M U81 ( .B0(n103), .B1(n92), .A0N(\mem[7][4] ), .A1N(n92), .Y(n81)
         );
  OAI2BB2X1M U82 ( .B0(n102), .B1(n92), .A0N(\mem[7][5] ), .A1N(n92), .Y(n82)
         );
  OAI2BB2X1M U83 ( .B0(n101), .B1(n92), .A0N(\mem[7][6] ), .A1N(n92), .Y(n83)
         );
  OAI2BB2X1M U84 ( .B0(n100), .B1(n92), .A0N(\mem[7][7] ), .A1N(n92), .Y(n84)
         );
  AND2X2M U85 ( .A(w_addr[2]), .B(w_clk_en), .Y(n17) );
  NAND3X2M U86 ( .A(n12), .B(n99), .C(w_addr[0]), .Y(n13) );
  NAND3X2M U87 ( .A(n12), .B(n98), .C(w_addr[1]), .Y(n14) );
  NAND3X2M U88 ( .A(w_addr[1]), .B(w_addr[0]), .C(n17), .Y(n20) );
  NAND3X2M U89 ( .A(w_addr[1]), .B(n98), .C(n17), .Y(n19) );
  INVX2M U90 ( .A(w_addr[0]), .Y(n98) );
  INVX2M U91 ( .A(w_addr[1]), .Y(n99) );
  BUFX4M U92 ( .A(N10), .Y(n91) );
  MX2X2M U93 ( .A(n2), .B(n1), .S0(N12), .Y(r_data[0]) );
  MX4X1M U94 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n91), .S1(N11), .Y(n1) );
  MX4X1M U95 ( .A(\mem[0][0] ), .B(\mem[1][0] ), .C(\mem[2][0] ), .D(
        \mem[3][0] ), .S0(n91), .S1(N11), .Y(n2) );
  MX2X2M U96 ( .A(n4), .B(n3), .S0(N12), .Y(r_data[1]) );
  MX4X1M U97 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n91), .S1(N11), .Y(n3) );
  MX4X1M U98 ( .A(\mem[0][1] ), .B(\mem[1][1] ), .C(\mem[2][1] ), .D(
        \mem[3][1] ), .S0(n91), .S1(N11), .Y(n4) );
  MX2X2M U99 ( .A(n6), .B(n5), .S0(N12), .Y(r_data[2]) );
  MX4X1M U100 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n91), .S1(N11), .Y(n5) );
  MX4X1M U101 ( .A(\mem[0][2] ), .B(\mem[1][2] ), .C(\mem[2][2] ), .D(
        \mem[3][2] ), .S0(n91), .S1(N11), .Y(n6) );
  MX2X2M U102 ( .A(n8), .B(n7), .S0(N12), .Y(r_data[3]) );
  MX4X1M U103 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n91), .S1(N11), .Y(n7) );
  MX4X1M U104 ( .A(\mem[0][3] ), .B(\mem[1][3] ), .C(\mem[2][3] ), .D(
        \mem[3][3] ), .S0(n91), .S1(N11), .Y(n8) );
  MX2X2M U105 ( .A(n10), .B(n9), .S0(N12), .Y(r_data[4]) );
  MX4X1M U106 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n91), .S1(N11), .Y(n9) );
  MX4X1M U107 ( .A(\mem[0][4] ), .B(\mem[1][4] ), .C(\mem[2][4] ), .D(
        \mem[3][4] ), .S0(n91), .S1(N11), .Y(n10) );
  MX2X2M U108 ( .A(n86), .B(n85), .S0(N12), .Y(r_data[5]) );
  MX4X1M U109 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n91), .S1(N11), .Y(n85) );
  MX4X1M U110 ( .A(\mem[0][5] ), .B(\mem[1][5] ), .C(\mem[2][5] ), .D(
        \mem[3][5] ), .S0(n91), .S1(N11), .Y(n86) );
  MX2X2M U111 ( .A(n88), .B(n87), .S0(N12), .Y(r_data[6]) );
  MX4X1M U112 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n91), .S1(N11), .Y(n87) );
  MX4X1M U113 ( .A(\mem[0][6] ), .B(\mem[1][6] ), .C(\mem[2][6] ), .D(
        \mem[3][6] ), .S0(n91), .S1(N11), .Y(n88) );
  MX2X2M U114 ( .A(n90), .B(n89), .S0(N12), .Y(r_data[7]) );
  MX4X1M U115 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n91), .S1(N11), .Y(n89) );
  MX4X1M U116 ( .A(\mem[0][7] ), .B(\mem[1][7] ), .C(\mem[2][7] ), .D(
        \mem[3][7] ), .S0(n91), .S1(N11), .Y(n90) );
endmodule


module FIFO_TOP_data_width8_address_width3 ( w_clk, wrst_n, w_inc, w_data, 
        r_clk, rrst_n, r_inc, wfull, rempty, r_data );
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, wrst_n, w_inc, r_clk, rrst_n, r_inc;
  output wfull, rempty;
  wire   _0_net_;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [2:0] w_addr;
  wire   [3:0] rq2_wptr;
  wire   [3:0] rptr;
  wire   [2:0] r_addr;

  FIFO_WR_address_width3 FIFO_WR ( .w_inc(w_inc), .w_clk(w_clk), .wrst_n(
        wrst_n), .wq2_rptr(wq2_rptr), .wptr(wptr), .waddr(w_addr), .wfull(
        wfull) );
  FIFO_RD_address_width3 FIFO_RD ( .r_inc(r_inc), .r_clk(r_clk), .rrst_n(
        rrst_n), .rq2_wptr(rq2_wptr), .rptr(rptr), .raddr(r_addr), .rempty(
        rempty) );
  DF_SYNC_addr_width3_0 W2R ( .clk(r_clk), .rst(rrst_n), .ptr(wptr), 
        .synch_ptr(rq2_wptr) );
  DF_SYNC_addr_width3_1 R2W ( .clk(w_clk), .rst(wrst_n), .ptr(rptr), 
        .synch_ptr(wq2_rptr) );
  FIFO_mem_data_width8_address_width3 FIFO_mem ( .w_data(w_data), .w_clk(w_clk), .w_clk_en(_0_net_), .w_addr(w_addr), .r_addr(r_addr), .r_data(r_data) );
  NOR2BX2M U1 ( .AN(w_inc), .B(wfull), .Y(_0_net_) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
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


module CLK_DIV_0 ( i_ref_clk, i_rstn, i_clk_en, i_divide_ratio, gen_clk );
  input [7:0] i_divide_ratio;
  input i_ref_clk, i_rstn, i_clk_en;
  output gen_clk;
  wire   N1, divided_clk, N6, N7, N8, N9, N10, N11, N12, N15, N16, N18, N19,
         N20, N21, N22, N23, N24, N25, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n1, n2, n3, n4, n5, n6, n7, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53;
  wire   [7:0] cnt;

  CLK_DIV_0_DW01_inc_0 add_31 ( .A(cnt), .SUM({N25, N24, N23, N22, N21, N20, 
        N19, N18}) );
  DFFRQX2M divided_clk_reg ( .D(n12), .CK(i_ref_clk), .RN(i_rstn), .Q(
        divided_clk) );
  DFFRQX2M \cnt_reg[7]  ( .D(n13), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[7]) );
  DFFRQX2M \cnt_reg[6]  ( .D(n14), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[6]) );
  DFFRQX2M \cnt_reg[4]  ( .D(n16), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[4]) );
  DFFRQX2M \cnt_reg[5]  ( .D(n15), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[5]) );
  DFFRQX2M \cnt_reg[0]  ( .D(n20), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[0]) );
  DFFRQX2M \cnt_reg[1]  ( .D(n19), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[1]) );
  DFFRQX2M \cnt_reg[2]  ( .D(n18), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[2]) );
  DFFRQX2M \cnt_reg[3]  ( .D(n17), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[3]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(divided_clk), .S0(N1), .Y(gen_clk) );
  INVX2M U4 ( .A(n3), .Y(N1) );
  AO22X1M U5 ( .A0(N6), .A1(N1), .B0(divided_clk), .B1(n3), .Y(n12) );
  INVX2M U6 ( .A(N12), .Y(n52) );
  INVX2M U7 ( .A(N10), .Y(n50) );
  INVX2M U8 ( .A(N11), .Y(n51) );
  INVX2M U9 ( .A(cnt[4]), .Y(n32) );
  INVX2M U10 ( .A(N9), .Y(n49) );
  INVX2M U11 ( .A(cnt[3]), .Y(n31) );
  AND2X2M U12 ( .A(N16), .B(N1), .Y(n9) );
  INVX2M U13 ( .A(N15), .Y(n53) );
  AO22X1M U14 ( .A0(cnt[1]), .A1(n3), .B0(N19), .B1(n9), .Y(n19) );
  AO22X1M U15 ( .A0(cnt[2]), .A1(n3), .B0(N20), .B1(n9), .Y(n18) );
  AO22X1M U16 ( .A0(cnt[3]), .A1(n3), .B0(N21), .B1(n9), .Y(n17) );
  AO22X1M U17 ( .A0(cnt[4]), .A1(n3), .B0(N22), .B1(n9), .Y(n16) );
  AO22X1M U18 ( .A0(cnt[5]), .A1(n3), .B0(N23), .B1(n9), .Y(n15) );
  AO22X1M U19 ( .A0(cnt[6]), .A1(n3), .B0(N24), .B1(n9), .Y(n14) );
  AO22X1M U20 ( .A0(cnt[7]), .A1(n3), .B0(N25), .B1(n9), .Y(n13) );
  AO22X1M U21 ( .A0(cnt[0]), .A1(n3), .B0(N18), .B1(n9), .Y(n20) );
  INVX2M U22 ( .A(cnt[2]), .Y(n47) );
  INVX2M U23 ( .A(cnt[5]), .Y(n48) );
  OR2X2M U24 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[0]), .Y(n4) );
  AOI21X2M U25 ( .A0(n22), .A1(i_divide_ratio[7]), .B0(N15), .Y(n1) );
  BUFX2M U26 ( .A(n8), .Y(n3) );
  OAI2BB1X2M U27 ( .A0N(n10), .A1N(n11), .B0(i_clk_en), .Y(n8) );
  NOR3X2M U28 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[3]), .C(
        i_divide_ratio[2]), .Y(n10) );
  NOR4X1M U29 ( .A(i_divide_ratio[7]), .B(i_divide_ratio[6]), .C(
        i_divide_ratio[5]), .D(i_divide_ratio[4]), .Y(n11) );
  AOI21BX2M U30 ( .A0(n21), .A1(i_divide_ratio[6]), .B0N(n22), .Y(n2) );
  INVX2M U31 ( .A(i_divide_ratio[4]), .Y(n34) );
  INVX2M U32 ( .A(i_divide_ratio[7]), .Y(n37) );
  INVX2M U33 ( .A(i_divide_ratio[6]), .Y(n36) );
  INVX2M U34 ( .A(i_divide_ratio[5]), .Y(n35) );
  INVX2M U35 ( .A(i_divide_ratio[3]), .Y(n33) );
  CLKINVX1M U36 ( .A(i_divide_ratio[0]), .Y(N7) );
  OAI2BB1X1M U37 ( .A0N(i_divide_ratio[0]), .A1N(i_divide_ratio[1]), .B0(n4), 
        .Y(N8) );
  OR2X1M U38 ( .A(n4), .B(i_divide_ratio[2]), .Y(n5) );
  OAI2BB1X1M U39 ( .A0N(n4), .A1N(i_divide_ratio[2]), .B0(n5), .Y(N9) );
  OR2X1M U40 ( .A(n5), .B(i_divide_ratio[3]), .Y(n6) );
  OAI2BB1X1M U41 ( .A0N(n5), .A1N(i_divide_ratio[3]), .B0(n6), .Y(N10) );
  OR2X1M U42 ( .A(n6), .B(i_divide_ratio[4]), .Y(n7) );
  OAI2BB1X1M U43 ( .A0N(n6), .A1N(i_divide_ratio[4]), .B0(n7), .Y(N11) );
  OR2X1M U44 ( .A(n7), .B(i_divide_ratio[5]), .Y(n21) );
  OAI2BB1X1M U45 ( .A0N(n7), .A1N(i_divide_ratio[5]), .B0(n21), .Y(N12) );
  OR2X1M U46 ( .A(n21), .B(i_divide_ratio[6]), .Y(n22) );
  NOR2X1M U47 ( .A(n22), .B(i_divide_ratio[7]), .Y(N15) );
  NAND2BX1M U48 ( .AN(cnt[0]), .B(i_divide_ratio[1]), .Y(n24) );
  AOI2BB1X1M U49 ( .A0N(n24), .A1N(cnt[1]), .B0(i_divide_ratio[2]), .Y(n23) );
  AOI221XLM U50 ( .A0(cnt[2]), .A1(n33), .B0(cnt[1]), .B1(n24), .C0(n23), .Y(
        n25) );
  AOI221XLM U51 ( .A0(i_divide_ratio[4]), .A1(n31), .B0(i_divide_ratio[3]), 
        .B1(n47), .C0(n25), .Y(n26) );
  AOI221XLM U52 ( .A0(cnt[4]), .A1(n35), .B0(cnt[3]), .B1(n34), .C0(n26), .Y(
        n27) );
  AOI221XLM U53 ( .A0(i_divide_ratio[6]), .A1(n48), .B0(i_divide_ratio[5]), 
        .B1(n32), .C0(n27), .Y(n28) );
  AOI221XLM U54 ( .A0(cnt[6]), .A1(n37), .B0(cnt[5]), .B1(n36), .C0(n28), .Y(
        n29) );
  AOI2B1X1M U55 ( .A1N(cnt[6]), .A0(i_divide_ratio[7]), .B0(n29), .Y(n30) );
  NOR2X1M U56 ( .A(cnt[7]), .B(n30), .Y(N6) );
  NOR2X1M U57 ( .A(cnt[6]), .B(n2), .Y(n45) );
  NAND2BX1M U58 ( .AN(cnt[0]), .B(N7), .Y(n39) );
  AOI2BB1X1M U59 ( .A0N(n39), .A1N(cnt[1]), .B0(N8), .Y(n38) );
  AOI221XLM U60 ( .A0(cnt[2]), .A1(n49), .B0(cnt[1]), .B1(n39), .C0(n38), .Y(
        n40) );
  AOI221XLM U61 ( .A0(N10), .A1(n31), .B0(N9), .B1(n47), .C0(n40), .Y(n41) );
  AOI221XLM U62 ( .A0(cnt[4]), .A1(n51), .B0(cnt[3]), .B1(n50), .C0(n41), .Y(
        n42) );
  AOI221XLM U63 ( .A0(N12), .A1(n48), .B0(N11), .B1(n32), .C0(n42), .Y(n43) );
  AOI221XLM U64 ( .A0(cnt[6]), .A1(n2), .B0(cnt[5]), .B1(n52), .C0(n43), .Y(
        n44) );
  OAI2BB2X1M U65 ( .B0(n45), .B1(n44), .A0N(n1), .A1N(cnt[7]), .Y(n46) );
  OAI211X1M U66 ( .A0(cnt[7]), .A1(n1), .B0(n46), .C0(n53), .Y(N16) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  INVX2M U11 ( .A(IN[2]), .Y(n14) );
  NAND4BX1M U12 ( .AN(IN[4]), .B(IN[3]), .C(n14), .D(n15), .Y(n6) );
  NAND4BX1M U13 ( .AN(IN[3]), .B(IN[4]), .C(n14), .D(n15), .Y(n7) );
  NOR4X1M U14 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U15 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  NOR3X2M U16 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR3X2M U17 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  OAI211X2M U18 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U19 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U20 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n14), .Y(n8) );
  INVX2M U21 ( .A(IN[1]), .Y(n16) );
  INVX2M U22 ( .A(IN[0]), .Y(n17) );
  INVX2M U23 ( .A(IN[5]), .Y(n15) );
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


module CLK_DIV_1 ( i_ref_clk, i_rstn, i_clk_en, i_divide_ratio, gen_clk );
  input [7:0] i_divide_ratio;
  input i_ref_clk, i_rstn, i_clk_en;
  output gen_clk;
  wire   N1, divided_clk, N6, N7, N8, N9, N10, N11, N12, N15, N16, N18, N19,
         N20, N21, N22, N23, N24, N25, n1, n2, n3, n4, n5, n6, n7, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66;
  wire   [7:0] cnt;

  CLK_DIV_1_DW01_inc_0 add_31 ( .A(cnt), .SUM({N25, N24, N23, N22, N21, N20, 
        N19, N18}) );
  DFFRQX2M divided_clk_reg ( .D(n62), .CK(i_ref_clk), .RN(i_rstn), .Q(
        divided_clk) );
  DFFRQX2M \cnt_reg[7]  ( .D(n61), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[7]) );
  DFFRQX2M \cnt_reg[6]  ( .D(n60), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[6]) );
  DFFRQX2M \cnt_reg[4]  ( .D(n58), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[4]) );
  DFFRQX2M \cnt_reg[5]  ( .D(n59), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[5]) );
  DFFRQX2M \cnt_reg[0]  ( .D(n54), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[0]) );
  DFFRQX2M \cnt_reg[1]  ( .D(n55), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[1]) );
  DFFRQX2M \cnt_reg[2]  ( .D(n56), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[2]) );
  DFFRQX2M \cnt_reg[3]  ( .D(n57), .CK(i_ref_clk), .RN(i_rstn), .Q(cnt[3]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(divided_clk), .S0(N1), .Y(gen_clk) );
  OR2X2M U4 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[0]), .Y(n4) );
  INVX2M U5 ( .A(i_divide_ratio[3]), .Y(n35) );
  INVX2M U6 ( .A(n3), .Y(N1) );
  INVX2M U7 ( .A(N12), .Y(n48) );
  INVX2M U8 ( .A(N11), .Y(n49) );
  INVX2M U9 ( .A(N10), .Y(n50) );
  INVX2M U10 ( .A(N9), .Y(n51) );
  INVX2M U11 ( .A(cnt[2]), .Y(n36) );
  INVX2M U12 ( .A(cnt[5]), .Y(n37) );
  AND2X2M U13 ( .A(N16), .B(N1), .Y(n65) );
  INVX2M U14 ( .A(N15), .Y(n47) );
  AO22X1M U15 ( .A0(N6), .A1(N1), .B0(divided_clk), .B1(n3), .Y(n62) );
  AO22X1M U16 ( .A0(cnt[1]), .A1(n3), .B0(N19), .B1(n65), .Y(n55) );
  AO22X1M U17 ( .A0(cnt[2]), .A1(n3), .B0(N20), .B1(n65), .Y(n56) );
  AO22X1M U18 ( .A0(cnt[3]), .A1(n3), .B0(N21), .B1(n65), .Y(n57) );
  AO22X1M U19 ( .A0(cnt[4]), .A1(n3), .B0(N22), .B1(n65), .Y(n58) );
  AO22X1M U20 ( .A0(cnt[5]), .A1(n3), .B0(N23), .B1(n65), .Y(n59) );
  AO22X1M U21 ( .A0(cnt[6]), .A1(n3), .B0(N24), .B1(n65), .Y(n60) );
  AO22X1M U22 ( .A0(cnt[7]), .A1(n3), .B0(N25), .B1(n65), .Y(n61) );
  AO22X1M U23 ( .A0(cnt[0]), .A1(n3), .B0(N18), .B1(n65), .Y(n54) );
  INVX2M U24 ( .A(cnt[3]), .Y(n52) );
  INVX2M U25 ( .A(cnt[4]), .Y(n53) );
  BUFX2M U26 ( .A(n66), .Y(n3) );
  OAI2BB1X2M U27 ( .A0N(n64), .A1N(n63), .B0(i_clk_en), .Y(n66) );
  NOR4X1M U28 ( .A(i_divide_ratio[7]), .B(i_divide_ratio[6]), .C(
        i_divide_ratio[5]), .D(i_divide_ratio[4]), .Y(n63) );
  NOR3X2M U29 ( .A(i_divide_ratio[1]), .B(i_divide_ratio[3]), .C(
        i_divide_ratio[2]), .Y(n64) );
  AOI21X2M U30 ( .A0(n22), .A1(i_divide_ratio[7]), .B0(N15), .Y(n1) );
  AOI21BX2M U31 ( .A0(n21), .A1(i_divide_ratio[6]), .B0N(n22), .Y(n2) );
  INVX2M U32 ( .A(i_divide_ratio[5]), .Y(n33) );
  INVX2M U33 ( .A(i_divide_ratio[7]), .Y(n31) );
  INVX2M U34 ( .A(i_divide_ratio[4]), .Y(n34) );
  INVX2M U35 ( .A(i_divide_ratio[6]), .Y(n32) );
  CLKINVX1M U36 ( .A(i_divide_ratio[0]), .Y(N7) );
  OAI2BB1X1M U37 ( .A0N(i_divide_ratio[0]), .A1N(i_divide_ratio[1]), .B0(n4), 
        .Y(N8) );
  OR2X1M U38 ( .A(n4), .B(i_divide_ratio[2]), .Y(n5) );
  OAI2BB1X1M U39 ( .A0N(n4), .A1N(i_divide_ratio[2]), .B0(n5), .Y(N9) );
  OR2X1M U40 ( .A(n5), .B(i_divide_ratio[3]), .Y(n6) );
  OAI2BB1X1M U41 ( .A0N(n5), .A1N(i_divide_ratio[3]), .B0(n6), .Y(N10) );
  OR2X1M U42 ( .A(n6), .B(i_divide_ratio[4]), .Y(n7) );
  OAI2BB1X1M U43 ( .A0N(n6), .A1N(i_divide_ratio[4]), .B0(n7), .Y(N11) );
  OR2X1M U44 ( .A(n7), .B(i_divide_ratio[5]), .Y(n21) );
  OAI2BB1X1M U45 ( .A0N(n7), .A1N(i_divide_ratio[5]), .B0(n21), .Y(N12) );
  OR2X1M U46 ( .A(n21), .B(i_divide_ratio[6]), .Y(n22) );
  NOR2X1M U47 ( .A(n22), .B(i_divide_ratio[7]), .Y(N15) );
  NAND2BX1M U48 ( .AN(cnt[0]), .B(i_divide_ratio[1]), .Y(n24) );
  AOI2BB1X1M U49 ( .A0N(n24), .A1N(cnt[1]), .B0(i_divide_ratio[2]), .Y(n23) );
  AOI221XLM U50 ( .A0(cnt[2]), .A1(n35), .B0(cnt[1]), .B1(n24), .C0(n23), .Y(
        n25) );
  AOI221XLM U51 ( .A0(i_divide_ratio[4]), .A1(n52), .B0(i_divide_ratio[3]), 
        .B1(n36), .C0(n25), .Y(n26) );
  AOI221XLM U52 ( .A0(cnt[4]), .A1(n33), .B0(cnt[3]), .B1(n34), .C0(n26), .Y(
        n27) );
  AOI221XLM U53 ( .A0(i_divide_ratio[6]), .A1(n37), .B0(i_divide_ratio[5]), 
        .B1(n53), .C0(n27), .Y(n28) );
  AOI221XLM U54 ( .A0(cnt[6]), .A1(n31), .B0(cnt[5]), .B1(n32), .C0(n28), .Y(
        n29) );
  AOI2B1X1M U55 ( .A1N(cnt[6]), .A0(i_divide_ratio[7]), .B0(n29), .Y(n30) );
  NOR2X1M U56 ( .A(cnt[7]), .B(n30), .Y(N6) );
  NOR2X1M U57 ( .A(cnt[6]), .B(n2), .Y(n45) );
  NAND2BX1M U58 ( .AN(cnt[0]), .B(N7), .Y(n39) );
  AOI2BB1X1M U59 ( .A0N(n39), .A1N(cnt[1]), .B0(N8), .Y(n38) );
  AOI221XLM U60 ( .A0(cnt[2]), .A1(n51), .B0(cnt[1]), .B1(n39), .C0(n38), .Y(
        n40) );
  AOI221XLM U61 ( .A0(N10), .A1(n52), .B0(N9), .B1(n36), .C0(n40), .Y(n41) );
  AOI221XLM U62 ( .A0(cnt[4]), .A1(n49), .B0(cnt[3]), .B1(n50), .C0(n41), .Y(
        n42) );
  AOI221XLM U63 ( .A0(N12), .A1(n37), .B0(N11), .B1(n53), .C0(n42), .Y(n43) );
  AOI221XLM U64 ( .A0(cnt[6]), .A1(n2), .B0(cnt[5]), .B1(n48), .C0(n43), .Y(
        n44) );
  OAI2BB2X1M U65 ( .B0(n45), .B1(n44), .A0N(n1), .A1N(cnt[7]), .Y(n46) );
  OAI211X1M U66 ( .A0(cnt[7]), .A1(n1), .B0(n46), .C0(n47), .Y(N16) );
endmodule


module FSM_UART_RX ( clk, rstn, parity_enable, RX_IN, prescale, edge_count, 
        bit_count, stop_error, parity_error, start_glitch, data_sample_en, 
        edge_bit_count_en, des_en, stp_chk_en, strt_chk_en, parity_chk_en, 
        data_valid );
  input [5:0] prescale;
  input [5:0] edge_count;
  input [3:0] bit_count;
  input clk, rstn, parity_enable, RX_IN, stop_error, parity_error,
         start_glitch;
  output data_sample_en, edge_bit_count_en, des_en, stp_chk_en, strt_chk_en,
         parity_chk_en, data_valid;
  wire   N35, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n31, n32, n33, n34, n36, n37, n38, n39;
  wire   [5:0] check_edge;
  wire   [2:0] curent_state;
  wire   [2:0] next_state;

  DFFRQX2M \curent_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rstn), .Q(
        curent_state[0]) );
  DFFRQX2M \curent_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rstn), .Q(
        curent_state[1]) );
  DFFRQX2M \curent_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rstn), .Q(
        curent_state[2]) );
  NOR4XLM U3 ( .A(n30), .B(curent_state[1]), .C(stop_error), .D(parity_error), 
        .Y(data_valid) );
  OAI2B1X2M U4 ( .A1N(parity_chk_en), .A0(n15), .B0(n16), .Y(next_state[2]) );
  AOI31X2M U5 ( .A0(des_en), .A1(n39), .A2(n17), .B0(stp_chk_en), .Y(n16) );
  INVX2M U6 ( .A(n18), .Y(stp_chk_en) );
  OAI21X2M U7 ( .A0(n19), .A1(n38), .B0(n20), .Y(next_state[1]) );
  NOR2BX2M U8 ( .AN(n21), .B(n22), .Y(n19) );
  NOR2X2M U9 ( .A(parity_chk_en), .B(des_en), .Y(n21) );
  INVX2M U10 ( .A(n28), .Y(n32) );
  INVX2M U11 ( .A(strt_chk_en), .Y(n36) );
  OAI21BX1M U12 ( .A0(n23), .A1(n37), .B0N(n24), .Y(next_state[0]) );
  AOI2B1X1M U13 ( .A1N(n17), .A0(des_en), .B0(n22), .Y(n23) );
  OAI31X1M U14 ( .A0(RX_IN), .A1(curent_state[1]), .A2(curent_state[0]), .B0(
        n20), .Y(n24) );
  NOR3X2M U15 ( .A(n37), .B(curent_state[2]), .C(n38), .Y(des_en) );
  NOR3X2M U16 ( .A(curent_state[0]), .B(curent_state[2]), .C(n38), .Y(
        parity_chk_en) );
  OAI22X1M U17 ( .A0(n25), .A1(n36), .B0(n26), .B1(n18), .Y(n22) );
  AOI21X2M U18 ( .A0(n15), .A1(n39), .B0(n27), .Y(n26) );
  AOI31X2M U19 ( .A0(n32), .A1(n33), .A2(bit_count[1]), .B0(n39), .Y(n27) );
  NOR3X2M U20 ( .A(curent_state[1]), .B(curent_state[2]), .C(n37), .Y(
        strt_chk_en) );
  NAND3BX2M U21 ( .AN(bit_count[2]), .B(N35), .C(bit_count[3]), .Y(n28) );
  NOR3X2M U22 ( .A(bit_count[0]), .B(bit_count[1]), .C(n28), .Y(n17) );
  NAND3BX2M U23 ( .AN(start_glitch), .B(strt_chk_en), .C(n25), .Y(n20) );
  NAND3X2M U24 ( .A(curent_state[1]), .B(n37), .C(curent_state[2]), .Y(n18) );
  INVX2M U25 ( .A(curent_state[0]), .Y(n37) );
  INVX2M U26 ( .A(curent_state[1]), .Y(n38) );
  NAND3X2M U27 ( .A(n32), .B(n34), .C(bit_count[0]), .Y(n15) );
  AND4X2M U28 ( .A(N35), .B(n33), .C(n29), .D(n34), .Y(n25) );
  NOR2X2M U29 ( .A(bit_count[3]), .B(bit_count[2]), .Y(n29) );
  INVX2M U30 ( .A(bit_count[1]), .Y(n34) );
  INVX2M U31 ( .A(bit_count[0]), .Y(n33) );
  NAND2X2M U32 ( .A(curent_state[2]), .B(n37), .Y(n30) );
  OR2X2M U33 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  INVX2M U34 ( .A(prescale[3]), .Y(n6) );
  INVX2M U35 ( .A(parity_enable), .Y(n39) );
  BUFX2M U36 ( .A(edge_bit_count_en), .Y(data_sample_en) );
  NAND3X2M U37 ( .A(n36), .B(n18), .C(n21), .Y(edge_bit_count_en) );
  CLKINVX1M U38 ( .A(prescale[0]), .Y(check_edge[0]) );
  OAI2BB1X1M U39 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(
        check_edge[1]) );
  NOR2X1M U40 ( .A(n2), .B(prescale[2]), .Y(n3) );
  AO21XLM U41 ( .A0(n2), .A1(prescale[2]), .B0(n3), .Y(check_edge[2]) );
  CLKNAND2X2M U42 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U43 ( .A0(n3), .A1(n6), .B0(n4), .Y(check_edge[3]) );
  XNOR2X1M U44 ( .A(prescale[4]), .B(n4), .Y(check_edge[4]) );
  NOR2X1M U45 ( .A(prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U46 ( .A(prescale[5]), .B(n5), .Y(check_edge[5]) );
  NOR2BX1M U47 ( .AN(edge_count[0]), .B(check_edge[0]), .Y(n7) );
  OAI2B2X1M U48 ( .A1N(check_edge[1]), .A0(n7), .B0(edge_count[1]), .B1(n7), 
        .Y(n11) );
  NOR2BX1M U49 ( .AN(check_edge[0]), .B(edge_count[0]), .Y(n8) );
  OAI2B2X1M U50 ( .A1N(edge_count[1]), .A0(n8), .B0(check_edge[1]), .B1(n8), 
        .Y(n10) );
  XNOR2X1M U51 ( .A(check_edge[5]), .B(edge_count[5]), .Y(n9) );
  NAND3X1M U52 ( .A(n11), .B(n10), .C(n9), .Y(n31) );
  CLKXOR2X2M U53 ( .A(check_edge[4]), .B(edge_count[4]), .Y(n14) );
  CLKXOR2X2M U54 ( .A(check_edge[2]), .B(edge_count[2]), .Y(n13) );
  CLKXOR2X2M U55 ( .A(check_edge[3]), .B(edge_count[3]), .Y(n12) );
  NOR4X1M U56 ( .A(n31), .B(n14), .C(n13), .D(n12), .Y(N35) );
endmodule


module edge_bit_counter ( clk, rstn, prescale, enable, edge_count, bit_count
 );
  input [5:0] prescale;
  output [5:0] edge_count;
  output [3:0] bit_count;
  input clk, rstn, enable;
  wire   N3, N4, N5, N6, N8, N9, complete_bit, N22, N23, N24, N25, N27, N28,
         N29, N30, N31, N32, n9, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, \add_20/carry[5] , \add_20/carry[4] , \add_20/carry[3] ,
         \add_20/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n12, n13,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43;

  DFFRQX2M \bit_count_reg[0]  ( .D(n24), .CK(clk), .RN(rstn), .Q(bit_count[0])
         );
  DFFRQX2M \bit_count_reg[2]  ( .D(n39), .CK(clk), .RN(rstn), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n23), .CK(clk), .RN(rstn), .Q(bit_count[1])
         );
  DFFRX1M \bit_count_reg[3]  ( .D(n22), .CK(clk), .RN(rstn), .Q(bit_count[3]), 
        .QN(n9) );
  DFFRQX2M \edge_count_reg[5]  ( .D(N32), .CK(clk), .RN(rstn), .Q(
        edge_count[5]) );
  DFFRQX2M \edge_count_reg[0]  ( .D(N27), .CK(clk), .RN(rstn), .Q(
        edge_count[0]) );
  DFFRQX2M \edge_count_reg[4]  ( .D(N31), .CK(clk), .RN(rstn), .Q(
        edge_count[4]) );
  DFFRQX2M \edge_count_reg[1]  ( .D(N28), .CK(clk), .RN(rstn), .Q(
        edge_count[1]) );
  DFFRQX2M \edge_count_reg[3]  ( .D(N30), .CK(clk), .RN(rstn), .Q(
        edge_count[3]) );
  DFFRQX2M \edge_count_reg[2]  ( .D(N29), .CK(clk), .RN(rstn), .Q(
        edge_count[2]) );
  INVX2M U3 ( .A(enable), .Y(n43) );
  NOR2X2M U4 ( .A(complete_bit), .B(n43), .Y(n20) );
  INVX2M U5 ( .A(n28), .Y(n37) );
  NOR3X2M U6 ( .A(n43), .B(n20), .C(n40), .Y(n16) );
  NAND2X2M U7 ( .A(n37), .B(enable), .Y(n21) );
  AOI21X2M U8 ( .A0(n40), .A1(enable), .B0(n20), .Y(n19) );
  NOR2BX2M U9 ( .AN(N22), .B(n21), .Y(N28) );
  NOR2BX2M U10 ( .AN(N23), .B(n21), .Y(N29) );
  NOR2BX2M U11 ( .AN(N24), .B(n21), .Y(N30) );
  NOR2BX2M U12 ( .AN(N25), .B(n21), .Y(N31) );
  INVX2M U13 ( .A(n18), .Y(n39) );
  AOI32X1M U14 ( .A0(bit_count[1]), .A1(n42), .A2(n16), .B0(n17), .B1(
        bit_count[2]), .Y(n18) );
  INVX2M U15 ( .A(n29), .Y(n36) );
  INVX2M U16 ( .A(n13), .Y(n34) );
  OAI32X1M U17 ( .A0(n43), .A1(bit_count[0]), .A2(n20), .B0(n40), .B1(n38), 
        .Y(n24) );
  INVX2M U18 ( .A(n20), .Y(n38) );
  OAI21X2M U19 ( .A0(bit_count[1]), .A1(n43), .B0(n19), .Y(n17) );
  OAI2BB2X1M U20 ( .B0(n19), .B1(n41), .A0N(n41), .A1N(n16), .Y(n23) );
  INVX2M U21 ( .A(bit_count[1]), .Y(n41) );
  OAI21X2M U22 ( .A0(n14), .A1(n9), .B0(n15), .Y(n22) );
  AOI21X2M U23 ( .A0(enable), .A1(n42), .B0(n17), .Y(n14) );
  NAND4X2M U24 ( .A(bit_count[2]), .B(bit_count[1]), .C(n16), .D(n9), .Y(n15)
         );
  NOR2X2M U25 ( .A(n1), .B(n21), .Y(N32) );
  XNOR2X2M U26 ( .A(\add_20/carry[5] ), .B(edge_count[5]), .Y(n1) );
  NOR2X2M U27 ( .A(edge_count[0]), .B(n21), .Y(N27) );
  INVX2M U28 ( .A(edge_count[3]), .Y(n33) );
  INVX2M U29 ( .A(edge_count[2]), .Y(n32) );
  INVX2M U30 ( .A(edge_count[5]), .Y(n35) );
  INVX2M U31 ( .A(bit_count[0]), .Y(n40) );
  INVX2M U32 ( .A(bit_count[2]), .Y(n42) );
  ADDHX1M U33 ( .A(edge_count[2]), .B(\add_20/carry[2] ), .CO(
        \add_20/carry[3] ), .S(N23) );
  ADDHX1M U34 ( .A(edge_count[3]), .B(\add_20/carry[3] ), .CO(
        \add_20/carry[4] ), .S(N24) );
  ADDHX1M U35 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_20/carry[2] ), 
        .S(N22) );
  ADDHX1M U36 ( .A(edge_count[4]), .B(\add_20/carry[4] ), .CO(
        \add_20/carry[5] ), .S(N25) );
  OR2X2M U37 ( .A(prescale[1]), .B(prescale[0]), .Y(n3) );
  AOI21BX2M U38 ( .A0(n5), .A1(prescale[4]), .B0N(n6), .Y(n2) );
  CLKINVX1M U39 ( .A(prescale[0]), .Y(N3) );
  OAI2BB1X1M U40 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n3), .Y(N4) );
  OR2X1M U41 ( .A(n3), .B(prescale[2]), .Y(n4) );
  OAI2BB1X1M U42 ( .A0N(n3), .A1N(prescale[2]), .B0(n4), .Y(N5) );
  OR2X1M U43 ( .A(n4), .B(prescale[3]), .Y(n5) );
  OAI2BB1X1M U44 ( .A0N(n4), .A1N(prescale[3]), .B0(n5), .Y(N6) );
  OR2X1M U45 ( .A(n5), .B(prescale[4]), .Y(n6) );
  NOR2X1M U46 ( .A(n6), .B(prescale[5]), .Y(N9) );
  AO21XLM U47 ( .A0(n6), .A1(prescale[5]), .B0(N9), .Y(N8) );
  NOR2X1M U48 ( .A(n33), .B(N6), .Y(n25) );
  CLKNAND2X2M U49 ( .A(edge_count[4]), .B(n2), .Y(n13) );
  NOR2BX1M U50 ( .AN(edge_count[0]), .B(N3), .Y(n7) );
  OAI2B2X1M U51 ( .A1N(N4), .A0(n7), .B0(edge_count[1]), .B1(n7), .Y(n8) );
  NAND3BX1M U52 ( .AN(n25), .B(n13), .C(n8), .Y(n31) );
  NOR2X1M U53 ( .A(n32), .B(N5), .Y(n30) );
  NAND2BX1M U54 ( .AN(edge_count[0]), .B(N3), .Y(n11) );
  AOI2BB1X1M U55 ( .A0N(n11), .A1N(edge_count[1]), .B0(N4), .Y(n10) );
  AOI211X1M U56 ( .A0(edge_count[1]), .A1(n11), .B0(n30), .C0(n10), .Y(n12) );
  AOI221XLM U57 ( .A0(N6), .A1(n33), .B0(N5), .B1(n32), .C0(n12), .Y(n26) );
  OAI32X1M U58 ( .A0(n26), .A1(n25), .A2(n34), .B0(edge_count[4]), .B1(n2), 
        .Y(n27) );
  NOR2X1M U59 ( .A(n35), .B(N8), .Y(n29) );
  AOI221XLM U60 ( .A0(n27), .A1(n36), .B0(N8), .B1(n35), .C0(N9), .Y(n28) );
  NOR4X1M U61 ( .A(n31), .B(n30), .C(n37), .D(n29), .Y(complete_bit) );
endmodule


module data_sampling ( clk, rstn, prescale, RX_IN, enable, edge_count, 
        sampled_bit );
  input [5:0] prescale;
  input [5:0] edge_count;
  input clk, rstn, RX_IN, enable;
  output sampled_bit;
  wire   n21, n22, n23, n24, \add_19/carry[4] , \add_19/carry[3] ,
         \add_19/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51;
  wire   [5:0] centre_plus_one;
  wire   [5:0] centre_minus_one;
  wire   [2:0] oversamples;

  DFFSQX2M \oversamples_reg[1]  ( .D(n23), .CK(clk), .SN(rstn), .Q(
        oversamples[1]) );
  DFFSQX2M \oversamples_reg[0]  ( .D(n22), .CK(clk), .SN(rstn), .Q(
        oversamples[0]) );
  DFFSQX2M \oversamples_reg[2]  ( .D(n24), .CK(clk), .SN(rstn), .Q(
        oversamples[2]) );
  DFFSQX2M sampled_bit_reg ( .D(n21), .CK(clk), .SN(rstn), .Q(sampled_bit) );
  OR2X2M U3 ( .A(prescale[2]), .B(prescale[1]), .Y(n1) );
  ADDHX1M U4 ( .A(prescale[3]), .B(\add_19/carry[2] ), .CO(\add_19/carry[3] ), 
        .S(centre_plus_one[2]) );
  ADDHX1M U5 ( .A(prescale[4]), .B(\add_19/carry[3] ), .CO(\add_19/carry[4] ), 
        .S(centre_plus_one[3]) );
  ADDHX1M U6 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_19/carry[2] ), .S(
        centre_plus_one[1]) );
  ADDHX1M U7 ( .A(prescale[5]), .B(\add_19/carry[4] ), .CO(centre_plus_one[5]), 
        .S(centre_plus_one[4]) );
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
  CLKMX2X2M U16 ( .A(oversamples[2]), .B(RX_IN), .S0(n4), .Y(n24) );
  NOR4X1M U17 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(n4) );
  OAI22X1M U18 ( .A0(centre_plus_one[5]), .A1(n9), .B0(centre_plus_one[4]), 
        .B1(n10), .Y(n6) );
  NAND4X1M U19 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n5) );
  AOI2BB2XLM U20 ( .B0(edge_count[0]), .B1(prescale[1]), .A0N(n15), .A1N(
        centre_plus_one[3]), .Y(n14) );
  NAND4BX1M U21 ( .AN(n16), .B(n17), .C(n18), .D(n19), .Y(n13) );
  MXI2X1M U22 ( .A(n20), .B(n25), .S0(n26), .Y(n23) );
  NOR4BX1M U23 ( .AN(n12), .B(n27), .C(n16), .D(n28), .Y(n26) );
  XNOR2X1M U24 ( .A(n10), .B(prescale[5]), .Y(n16) );
  NAND3X1M U25 ( .A(n17), .B(n19), .C(n18), .Y(n27) );
  AND3X1M U26 ( .A(n29), .B(n9), .C(n30), .Y(n18) );
  XNOR2X1M U27 ( .A(edge_count[0]), .B(prescale[1]), .Y(n30) );
  CLKXOR2X2M U28 ( .A(n31), .B(prescale[2]), .Y(n29) );
  CLKXOR2X2M U29 ( .A(n15), .B(prescale[4]), .Y(n19) );
  CLKXOR2X2M U30 ( .A(n32), .B(prescale[3]), .Y(n17) );
  MXI2X1M U31 ( .A(n33), .B(n25), .S0(n34), .Y(n22) );
  NOR2X1M U32 ( .A(n28), .B(n12), .Y(n34) );
  NAND4X1M U33 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n12) );
  NOR3X1M U34 ( .A(n39), .B(n40), .C(n41), .Y(n38) );
  CLKXOR2X2M U35 ( .A(edge_count[4]), .B(centre_minus_one[4]), .Y(n41) );
  CLKXOR2X2M U36 ( .A(edge_count[1]), .B(centre_minus_one[1]), .Y(n40) );
  CLKXOR2X2M U37 ( .A(edge_count[0]), .B(centre_minus_one[0]), .Y(n39) );
  CLKXOR2X2M U38 ( .A(n32), .B(centre_minus_one[2]), .Y(n37) );
  CLKXOR2X2M U39 ( .A(n15), .B(centre_minus_one[3]), .Y(n36) );
  CLKXOR2X2M U40 ( .A(n9), .B(centre_minus_one[5]), .Y(n35) );
  CLKINVX1M U41 ( .A(edge_count[5]), .Y(n9) );
  CLKINVX1M U42 ( .A(enable), .Y(n28) );
  CLKINVX1M U43 ( .A(RX_IN), .Y(n25) );
  CLKMX2X2M U44 ( .A(sampled_bit), .B(n42), .S0(n43), .Y(n21) );
  AOI2B1X1M U45 ( .A1N(n11), .A0(n44), .B0(n8), .Y(n43) );
  OAI21X1M U46 ( .A0(edge_count[5]), .A1(n45), .B0(enable), .Y(n8) );
  CLKNAND2X2M U47 ( .A(edge_count[5]), .B(n45), .Y(n44) );
  CLKINVX1M U48 ( .A(centre_plus_one[5]), .Y(n45) );
  OAI21X1M U49 ( .A0(centre_plus_one[4]), .A1(n10), .B0(n46), .Y(n11) );
  OAI2BB2X1M U50 ( .B0(n47), .B1(n48), .A0N(n10), .A1N(centre_plus_one[4]), 
        .Y(n46) );
  AOI222X1M U51 ( .A0(centre_plus_one[3]), .A1(n15), .B0(n49), .B1(n50), .C0(
        centre_plus_one[2]), .C1(n32), .Y(n48) );
  OAI2BB2X1M U52 ( .B0(edge_count[0]), .B1(prescale[1]), .A0N(n31), .A1N(
        centre_plus_one[1]), .Y(n50) );
  CLKINVX1M U53 ( .A(n7), .Y(n49) );
  OAI22X1M U54 ( .A0(centre_plus_one[2]), .A1(n32), .B0(centre_plus_one[1]), 
        .B1(n31), .Y(n7) );
  CLKINVX1M U55 ( .A(edge_count[1]), .Y(n31) );
  CLKINVX1M U56 ( .A(edge_count[2]), .Y(n32) );
  NOR2X1M U57 ( .A(centre_plus_one[3]), .B(n15), .Y(n47) );
  CLKINVX1M U58 ( .A(edge_count[3]), .Y(n15) );
  CLKINVX1M U59 ( .A(edge_count[4]), .Y(n10) );
  OAI21X1M U60 ( .A0(n20), .A1(n33), .B0(n51), .Y(n42) );
  OAI21X1M U61 ( .A0(oversamples[0]), .A1(oversamples[1]), .B0(oversamples[2]), 
        .Y(n51) );
  CLKINVX1M U62 ( .A(oversamples[0]), .Y(n33) );
  CLKINVX1M U63 ( .A(oversamples[1]), .Y(n20) );
endmodule


module des ( clk, rstn, enable, prescale, edge_count, sampled_bit, P_DATA );
  input [5:0] prescale;
  input [5:0] edge_count;
  output [7:0] P_DATA;
  input clk, rstn, enable, sampled_bit;
  wire   N1, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16, n17,
         \add_16/carry[4] , \add_16/carry[3] , n2, n3, n4, n5, n6, n7, n8, n9,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  assign N1 = prescale[1];

  DFFSQX2M \P_DATA_reg[0]  ( .D(n10), .CK(clk), .SN(rstn), .Q(P_DATA[0]) );
  DFFSQX2M \P_DATA_reg[5]  ( .D(n15), .CK(clk), .SN(rstn), .Q(P_DATA[5]) );
  DFFSQX2M \P_DATA_reg[1]  ( .D(n11), .CK(clk), .SN(rstn), .Q(P_DATA[1]) );
  DFFSQX2M \P_DATA_reg[4]  ( .D(n14), .CK(clk), .SN(rstn), .Q(P_DATA[4]) );
  DFFSQX2M \P_DATA_reg[7]  ( .D(n17), .CK(clk), .SN(rstn), .Q(P_DATA[7]) );
  DFFSQX2M \P_DATA_reg[3]  ( .D(n13), .CK(clk), .SN(rstn), .Q(P_DATA[3]) );
  DFFSQX2M \P_DATA_reg[6]  ( .D(n16), .CK(clk), .SN(rstn), .Q(P_DATA[6]) );
  DFFSQX2M \P_DATA_reg[2]  ( .D(n12), .CK(clk), .SN(rstn), .Q(P_DATA[2]) );
  INVX2M U3 ( .A(prescale[2]), .Y(n2) );
  OAI22X1M U4 ( .A0(n20), .A1(n27), .B0(n1), .B1(n26), .Y(n11) );
  OAI22X1M U5 ( .A0(n20), .A1(n26), .B0(n1), .B1(n25), .Y(n12) );
  OAI22X1M U6 ( .A0(n20), .A1(n25), .B0(n1), .B1(n24), .Y(n13) );
  OAI22X1M U7 ( .A0(n20), .A1(n24), .B0(n1), .B1(n23), .Y(n14) );
  OAI22X1M U8 ( .A0(n20), .A1(n23), .B0(n1), .B1(n22), .Y(n15) );
  OAI22X1M U9 ( .A0(n20), .A1(n22), .B0(n1), .B1(n21), .Y(n16) );
  INVX2M U10 ( .A(n1), .Y(n20) );
  NAND2X2M U11 ( .A(enable), .B(N7), .Y(n1) );
  OAI2BB2X1M U12 ( .B0(n1), .B1(n27), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U13 ( .B0(n20), .B1(n21), .A0N(sampled_bit), .A1N(n20), .Y(n17)
         );
  INVX2M U14 ( .A(P_DATA[2]), .Y(n26) );
  INVX2M U15 ( .A(P_DATA[6]), .Y(n22) );
  INVX2M U16 ( .A(P_DATA[7]), .Y(n21) );
  INVX2M U17 ( .A(P_DATA[3]), .Y(n25) );
  INVX2M U18 ( .A(P_DATA[1]), .Y(n27) );
  INVX2M U19 ( .A(P_DATA[4]), .Y(n24) );
  INVX2M U20 ( .A(P_DATA[5]), .Y(n23) );
  AND2X1M U21 ( .A(\add_16/carry[4] ), .B(prescale[5]), .Y(N6) );
  CLKXOR2X2M U22 ( .A(prescale[5]), .B(\add_16/carry[4] ), .Y(N5) );
  AND2X1M U23 ( .A(\add_16/carry[3] ), .B(prescale[4]), .Y(\add_16/carry[4] )
         );
  CLKXOR2X2M U24 ( .A(prescale[4]), .B(\add_16/carry[3] ), .Y(N4) );
  AND2X1M U25 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U26 ( .A(prescale[3]), .B(prescale[2]), .Y(N3) );
  NOR2BX1M U27 ( .AN(edge_count[0]), .B(N1), .Y(n3) );
  OAI2B2X1M U28 ( .A1N(n2), .A0(n3), .B0(edge_count[1]), .B1(n3), .Y(n7) );
  NOR2BX1M U29 ( .AN(N1), .B(edge_count[0]), .Y(n4) );
  OAI2B2X1M U30 ( .A1N(edge_count[1]), .A0(n4), .B0(n2), .B1(n4), .Y(n6) );
  XNOR2X1M U31 ( .A(N6), .B(edge_count[5]), .Y(n5) );
  NAND3X1M U32 ( .A(n7), .B(n6), .C(n5), .Y(n19) );
  CLKXOR2X2M U33 ( .A(N5), .B(edge_count[4]), .Y(n18) );
  CLKXOR2X2M U34 ( .A(N3), .B(edge_count[2]), .Y(n9) );
  CLKXOR2X2M U35 ( .A(N4), .B(edge_count[3]), .Y(n8) );
  NOR4X1M U36 ( .A(n19), .B(n18), .C(n9), .D(n8), .Y(N7) );
endmodule


module start_check ( clk, rstn, enable, sampled_bit, prescale, edge_count, 
        start_glitch );
  input [5:0] prescale;
  input [5:0] edge_count;
  input clk, rstn, enable, sampled_bit;
  output start_glitch;
  wire   N2, N4, N5, N6, N7, N8, N11, \add_16/carry[4] , \add_16/carry[3] , n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10;
  assign N2 = prescale[1];

  DFFRQX2M start_glitch_reg ( .D(N11), .CK(clk), .RN(rstn), .Q(start_glitch)
         );
  INVX2M U3 ( .A(prescale[2]), .Y(n1) );
  AND3X2M U4 ( .A(enable), .B(N8), .C(sampled_bit), .Y(N11) );
  AND2X1M U5 ( .A(\add_16/carry[4] ), .B(prescale[5]), .Y(N7) );
  CLKXOR2X2M U6 ( .A(prescale[5]), .B(\add_16/carry[4] ), .Y(N6) );
  AND2X1M U7 ( .A(\add_16/carry[3] ), .B(prescale[4]), .Y(\add_16/carry[4] )
         );
  CLKXOR2X2M U8 ( .A(prescale[4]), .B(\add_16/carry[3] ), .Y(N5) );
  AND2X1M U9 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U10 ( .A(prescale[3]), .B(prescale[2]), .Y(N4) );
  NOR2BX1M U11 ( .AN(edge_count[0]), .B(N2), .Y(n2) );
  OAI2B2X1M U12 ( .A1N(n1), .A0(n2), .B0(edge_count[1]), .B1(n2), .Y(n6) );
  NOR2BX1M U13 ( .AN(N2), .B(edge_count[0]), .Y(n3) );
  OAI2B2X1M U14 ( .A1N(edge_count[1]), .A0(n3), .B0(n1), .B1(n3), .Y(n5) );
  XNOR2X1M U15 ( .A(N7), .B(edge_count[5]), .Y(n4) );
  NAND3X1M U16 ( .A(n6), .B(n5), .C(n4), .Y(n10) );
  CLKXOR2X2M U17 ( .A(N6), .B(edge_count[4]), .Y(n9) );
  CLKXOR2X2M U18 ( .A(N4), .B(edge_count[2]), .Y(n8) );
  CLKXOR2X2M U19 ( .A(N5), .B(edge_count[3]), .Y(n7) );
  NOR4X1M U20 ( .A(n10), .B(n9), .C(n8), .D(n7), .Y(N8) );
endmodule


module stop_check ( clk, rstn, enable, sampled_bit, prescale, edge_count, 
        bit_count, stop_error );
  input [5:0] prescale;
  input [5:0] edge_count;
  input [3:0] bit_count;
  input clk, rstn, enable, sampled_bit;
  output stop_error;
  wire   N2, N4, N5, N6, N7, n7, n8, n9, n10, \add_17/carry[4] ,
         \add_17/carry[3] , n1, n2, n3, n4, n5, n6, n11, n12, n13, n14, n15,
         n16;
  assign N2 = prescale[1];

  DFFRHQX8M stop_error_reg ( .D(n10), .CK(clk), .RN(rstn), .Q(stop_error) );
  OR4X1M U3 ( .A(n15), .B(n14), .C(n13), .D(n12), .Y(n1) );
  INVX2M U4 ( .A(prescale[2]), .Y(n2) );
  OAI31X1M U5 ( .A0(n16), .A1(sampled_bit), .A2(n1), .B0(n7), .Y(n10) );
  OAI211X2M U6 ( .A0(n1), .A1(n16), .B0(n8), .C0(stop_error), .Y(n7) );
  INVX2M U7 ( .A(enable), .Y(n16) );
  NAND3BX2M U8 ( .AN(bit_count[1]), .B(bit_count[0]), .C(n9), .Y(n8) );
  NOR2X2M U9 ( .A(bit_count[3]), .B(bit_count[2]), .Y(n9) );
  AND2X1M U10 ( .A(\add_17/carry[4] ), .B(prescale[5]), .Y(N7) );
  CLKXOR2X2M U11 ( .A(prescale[5]), .B(\add_17/carry[4] ), .Y(N6) );
  AND2X1M U12 ( .A(\add_17/carry[3] ), .B(prescale[4]), .Y(\add_17/carry[4] )
         );
  CLKXOR2X2M U13 ( .A(prescale[4]), .B(\add_17/carry[3] ), .Y(N5) );
  AND2X1M U14 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_17/carry[3] ) );
  CLKXOR2X2M U15 ( .A(prescale[3]), .B(prescale[2]), .Y(N4) );
  NOR2BX1M U16 ( .AN(edge_count[0]), .B(N2), .Y(n3) );
  OAI2B2X1M U17 ( .A1N(n2), .A0(n3), .B0(edge_count[1]), .B1(n3), .Y(n11) );
  NOR2BX1M U18 ( .AN(N2), .B(edge_count[0]), .Y(n4) );
  OAI2B2X1M U19 ( .A1N(edge_count[1]), .A0(n4), .B0(n2), .B1(n4), .Y(n6) );
  XNOR2X1M U20 ( .A(N7), .B(edge_count[5]), .Y(n5) );
  NAND3X1M U21 ( .A(n11), .B(n6), .C(n5), .Y(n15) );
  CLKXOR2X2M U22 ( .A(N6), .B(edge_count[4]), .Y(n14) );
  CLKXOR2X2M U23 ( .A(N4), .B(edge_count[2]), .Y(n13) );
  CLKXOR2X2M U24 ( .A(N5), .B(edge_count[3]), .Y(n12) );
endmodule


module parity_check ( clk, rstn, enable, parity_type, sampled_bit, P_DATA, 
        prescale, edge_count, bit_count, parity_error );
  input [7:0] P_DATA;
  input [5:0] prescale;
  input [5:0] edge_count;
  input [3:0] bit_count;
  input clk, rstn, enable, parity_type, sampled_bit;
  output parity_error;
  wire   N15, N17, N18, N19, N20, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, \add_29/carry[4] , \add_29/carry[3] , n1, n2, n3, n4, n5, n6,
         n17, n18, n19, n20, n21, n22;
  assign N15 = prescale[1];

  DFFRHQX8M parity_error_reg ( .D(n16), .CK(clk), .RN(rstn), .Q(parity_error)
         );
  OR4X1M U3 ( .A(n21), .B(n20), .C(n19), .D(n18), .Y(n1) );
  INVX2M U4 ( .A(prescale[2]), .Y(n2) );
  INVX2M U5 ( .A(enable), .Y(n22) );
  OAI31X1M U6 ( .A0(n22), .A1(n7), .A2(n1), .B0(n8), .Y(n16) );
  XOR3XLM U7 ( .A(n11), .B(n12), .C(n13), .Y(n7) );
  OAI211X2M U8 ( .A0(n1), .A1(n22), .B0(n9), .C0(parity_error), .Y(n8) );
  XOR3XLM U9 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n14), .Y(n12) );
  XNOR2X2M U10 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n14) );
  XOR3XLM U11 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n15), .Y(n11) );
  XNOR2X2M U12 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n15) );
  NAND3BX2M U13 ( .AN(bit_count[1]), .B(bit_count[0]), .C(n10), .Y(n9) );
  NOR2X2M U14 ( .A(bit_count[3]), .B(bit_count[2]), .Y(n10) );
  XNOR2X2M U15 ( .A(sampled_bit), .B(parity_type), .Y(n13) );
  AND2X1M U16 ( .A(\add_29/carry[4] ), .B(prescale[5]), .Y(N20) );
  CLKXOR2X2M U17 ( .A(prescale[5]), .B(\add_29/carry[4] ), .Y(N19) );
  AND2X1M U18 ( .A(\add_29/carry[3] ), .B(prescale[4]), .Y(\add_29/carry[4] )
         );
  CLKXOR2X2M U19 ( .A(prescale[4]), .B(\add_29/carry[3] ), .Y(N18) );
  AND2X1M U20 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_29/carry[3] ) );
  CLKXOR2X2M U21 ( .A(prescale[3]), .B(prescale[2]), .Y(N17) );
  NOR2BX1M U22 ( .AN(edge_count[0]), .B(N15), .Y(n3) );
  OAI2B2X1M U23 ( .A1N(n2), .A0(n3), .B0(edge_count[1]), .B1(n3), .Y(n17) );
  NOR2BX1M U24 ( .AN(N15), .B(edge_count[0]), .Y(n4) );
  OAI2B2X1M U25 ( .A1N(edge_count[1]), .A0(n4), .B0(n2), .B1(n4), .Y(n6) );
  XNOR2X1M U26 ( .A(N20), .B(edge_count[5]), .Y(n5) );
  NAND3X1M U27 ( .A(n17), .B(n6), .C(n5), .Y(n21) );
  CLKXOR2X2M U28 ( .A(N19), .B(edge_count[4]), .Y(n20) );
  CLKXOR2X2M U29 ( .A(N17), .B(edge_count[2]), .Y(n19) );
  CLKXOR2X2M U30 ( .A(N18), .B(edge_count[3]), .Y(n18) );
endmodule


module UART_RX_TOP ( clk, rstn, RX_IN, prescale, parity_enable, parity_type, 
        P_DATA, parity_error, stop_error, data_valid );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input clk, rstn, RX_IN, parity_enable, parity_type;
  output parity_error, stop_error, data_valid;
  wire   start_glitch, data_sample_en, edge_bit_count_en, des_en, stp_chk_en,
         strt_chk_en, parity_chk_en, sampled_bit, n1, n2, n3, n4;
  wire   [5:0] edge_count;
  wire   [3:0] bit_count;

  FSM_UART_RX FSM ( .clk(clk), .rstn(n3), .parity_enable(parity_enable), 
        .RX_IN(RX_IN), .prescale({prescale[5:3], n1, prescale[1:0]}), 
        .edge_count(edge_count), .bit_count(bit_count), .stop_error(stop_error), .parity_error(parity_error), .start_glitch(start_glitch), .data_sample_en(
        data_sample_en), .edge_bit_count_en(edge_bit_count_en), .des_en(des_en), .stp_chk_en(stp_chk_en), .strt_chk_en(strt_chk_en), .parity_chk_en(
        parity_chk_en), .data_valid(data_valid) );
  edge_bit_counter edge_bit_counter ( .clk(clk), .rstn(n3), .prescale({
        prescale[5:3], n1, prescale[1:0]}), .enable(edge_bit_count_en), 
        .edge_count(edge_count), .bit_count(bit_count) );
  data_sampling data_sampling ( .clk(clk), .rstn(n3), .prescale({prescale[5:3], 
        n1, prescale[1:0]}), .RX_IN(RX_IN), .enable(data_sample_en), 
        .edge_count(edge_count), .sampled_bit(sampled_bit) );
  des des ( .clk(clk), .rstn(n3), .enable(des_en), .prescale({prescale[5:3], 
        n1, prescale[1:0]}), .edge_count(edge_count), .sampled_bit(sampled_bit), .P_DATA(P_DATA) );
  start_check strt_chk ( .clk(clk), .rstn(n3), .enable(strt_chk_en), 
        .sampled_bit(sampled_bit), .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count(edge_count), .start_glitch(start_glitch) );
  stop_check stp_chk ( .clk(clk), .rstn(n3), .enable(stp_chk_en), 
        .sampled_bit(sampled_bit), .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count(edge_count), .bit_count(bit_count), .stop_error(stop_error) );
  parity_check par_chk ( .clk(clk), .rstn(n3), .enable(parity_chk_en), 
        .parity_type(parity_type), .sampled_bit(sampled_bit), .P_DATA(P_DATA), 
        .prescale({prescale[5:3], n1, prescale[1:0]}), .edge_count(edge_count), 
        .bit_count(bit_count), .parity_error(parity_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(prescale[2]), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(rstn), .Y(n4) );
endmodule


module fsm_uart_tx ( clk, rstn, data_valid, par_en, ser_done, ser_en, mux_sel, 
        busy );
  output [1:0] mux_sel;
  input clk, rstn, data_valid, par_en, ser_done;
  output ser_en, busy;
  wire   busy_c, n6, n7, n8, n9, n1, n2, n3, n4, n5;
  wire   [2:0] curent_state;
  wire   [2:0] next_state;

  DFFRQX2M busy_reg ( .D(busy_c), .CK(clk), .RN(rstn), .Q(busy) );
  DFFRQX2M \curent_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rstn), .Q(
        curent_state[2]) );
  DFFRQX2M \curent_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rstn), .Q(
        curent_state[1]) );
  DFFRQX2M \curent_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rstn), .Q(
        curent_state[0]) );
  OAI211X2M U3 ( .A0(ser_done), .A1(n6), .B0(n8), .C0(n9), .Y(next_state[0])
         );
  NAND3X2M U4 ( .A(n5), .B(n4), .C(data_valid), .Y(n8) );
  INVX2M U5 ( .A(n6), .Y(ser_en) );
  NAND2X2M U6 ( .A(n6), .B(n7), .Y(mux_sel[1]) );
  NAND3X2M U7 ( .A(curent_state[0]), .B(n4), .C(curent_state[1]), .Y(n6) );
  INVX2M U8 ( .A(curent_state[2]), .Y(n4) );
  OAI31X1M U9 ( .A0(n1), .A1(par_en), .A2(n6), .B0(n7), .Y(next_state[2]) );
  INVX2M U10 ( .A(ser_done), .Y(n1) );
  OAI211X2M U11 ( .A0(curent_state[0]), .A1(n5), .B0(n9), .C0(n2), .Y(busy_c)
         );
  INVX2M U12 ( .A(mux_sel[1]), .Y(n2) );
  NAND2X2M U13 ( .A(curent_state[0]), .B(n4), .Y(mux_sel[0]) );
  NAND3X2M U14 ( .A(n3), .B(n4), .C(curent_state[1]), .Y(n7) );
  NAND3X2M U15 ( .A(n5), .B(n4), .C(curent_state[0]), .Y(n9) );
  AOI21X2M U16 ( .A0(n3), .A1(n5), .B0(curent_state[2]), .Y(next_state[1]) );
  INVX2M U17 ( .A(curent_state[1]), .Y(n5) );
  INVX2M U18 ( .A(curent_state[0]), .Y(n3) );
endmodule


module tx_mux ( clk, rst, mux_sel, start_bit, stop_bit, ser_data, par_bit, 
        TX_OUT );
  input [1:0] mux_sel;
  input clk, rst, start_bit, stop_bit, ser_data, par_bit;
  output TX_OUT;
  wire   mux_out, n2, n3, n1;

  DFFRHQX8M TX_OUT_reg ( .D(mux_out), .CK(clk), .RN(rst), .Q(TX_OUT) );
  OAI2B2X1M U3 ( .A1N(mux_sel[1]), .A0(n2), .B0(mux_sel[1]), .B1(n3), .Y(
        mux_out) );
  AOI22X1M U4 ( .A0(start_bit), .A1(n1), .B0(stop_bit), .B1(mux_sel[0]), .Y(n3) );
  AOI22X1M U5 ( .A0(ser_data), .A1(n1), .B0(par_bit), .B1(mux_sel[0]), .Y(n2)
         );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module parity_calc ( clk, rst, P_DATA, data_valid, busy, par_en, par_typ, 
        par_bit );
  input [7:0] P_DATA;
  input clk, rst, data_valid, busy, par_en, par_typ;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [7:0] saved_data;

  DFFRQX2M \saved_data_reg[5]  ( .D(n12), .CK(clk), .RN(rst), .Q(saved_data[5]) );
  DFFRQX2M \saved_data_reg[1]  ( .D(n8), .CK(clk), .RN(rst), .Q(saved_data[1])
         );
  DFFRQX2M \saved_data_reg[4]  ( .D(n11), .CK(clk), .RN(rst), .Q(saved_data[4]) );
  DFFRQX2M \saved_data_reg[0]  ( .D(n7), .CK(clk), .RN(rst), .Q(saved_data[0])
         );
  DFFRQX2M \saved_data_reg[2]  ( .D(n9), .CK(clk), .RN(rst), .Q(saved_data[2])
         );
  DFFRQX2M \saved_data_reg[3]  ( .D(n10), .CK(clk), .RN(rst), .Q(saved_data[3]) );
  DFFRQX2M \saved_data_reg[6]  ( .D(n13), .CK(clk), .RN(rst), .Q(saved_data[6]) );
  DFFRQX2M \saved_data_reg[7]  ( .D(n14), .CK(clk), .RN(rst), .Q(saved_data[7]) );
  NOR2BX2M U2 ( .AN(data_valid), .B(busy), .Y(n6) );
  XNOR2X2M U3 ( .A(saved_data[2]), .B(saved_data[3]), .Y(n4) );
  NOR2BX2M U4 ( .AN(par_en), .B(n1), .Y(par_bit) );
  XOR3XLM U5 ( .A(n2), .B(par_typ), .C(n3), .Y(n1) );
  XOR3XLM U6 ( .A(saved_data[1]), .B(saved_data[0]), .C(n4), .Y(n3) );
  XOR3XLM U7 ( .A(saved_data[5]), .B(saved_data[4]), .C(n5), .Y(n2) );
  AO2B2X2M U8 ( .B0(P_DATA[0]), .B1(n6), .A0(saved_data[0]), .A1N(n6), .Y(n7)
         );
  AO2B2X2M U9 ( .B0(P_DATA[1]), .B1(n6), .A0(saved_data[1]), .A1N(n6), .Y(n8)
         );
  AO2B2X2M U10 ( .B0(P_DATA[2]), .B1(n6), .A0(saved_data[2]), .A1N(n6), .Y(n9)
         );
  AO2B2X2M U11 ( .B0(P_DATA[3]), .B1(n6), .A0(saved_data[3]), .A1N(n6), .Y(n10) );
  AO2B2X2M U12 ( .B0(P_DATA[4]), .B1(n6), .A0(saved_data[4]), .A1N(n6), .Y(n11) );
  AO2B2X2M U13 ( .B0(P_DATA[5]), .B1(n6), .A0(saved_data[5]), .A1N(n6), .Y(n12) );
  AO2B2X2M U14 ( .B0(P_DATA[6]), .B1(n6), .A0(saved_data[6]), .A1N(n6), .Y(n13) );
  AO2B2X2M U15 ( .B0(P_DATA[7]), .B1(n6), .A0(saved_data[7]), .A1N(n6), .Y(n14) );
  CLKXOR2X2M U16 ( .A(saved_data[7]), .B(saved_data[6]), .Y(n5) );
endmodule


module ser ( clk, rstn, P_DATA, data_valid, busy, ser_en, ser_done, ser_data
 );
  input [7:0] P_DATA;
  input clk, rstn, data_valid, busy, ser_en;
  output ser_done, ser_data;
  wire   N2, N3, N4, N11, N12, N13, N15, n1, n4, n5, n9, n10, n11, n12, n13,
         n14, n15, n16, n2, n3, n6, n7, n8, n17, n18;
  wire   [7:0] saved_data;

  DFFRQX2M \cnt_reg[2]  ( .D(N13), .CK(clk), .RN(rstn), .Q(N4) );
  DFFSQX2M \saved_data_reg[5]  ( .D(n14), .CK(clk), .SN(rstn), .Q(
        saved_data[5]) );
  DFFSQX2M \saved_data_reg[1]  ( .D(n10), .CK(clk), .SN(rstn), .Q(
        saved_data[1]) );
  DFFSQX2M \saved_data_reg[7]  ( .D(n16), .CK(clk), .SN(rstn), .Q(
        saved_data[7]) );
  DFFSQX2M \saved_data_reg[3]  ( .D(n12), .CK(clk), .SN(rstn), .Q(
        saved_data[3]) );
  DFFSQX2M \saved_data_reg[6]  ( .D(n15), .CK(clk), .SN(rstn), .Q(
        saved_data[6]) );
  DFFSQX2M \saved_data_reg[2]  ( .D(n11), .CK(clk), .SN(rstn), .Q(
        saved_data[2]) );
  DFFSQX2M \saved_data_reg[4]  ( .D(n13), .CK(clk), .SN(rstn), .Q(
        saved_data[4]) );
  DFFSQX2M \saved_data_reg[0]  ( .D(n9), .CK(clk), .SN(rstn), .Q(saved_data[0]) );
  DFFRQX2M \cnt_reg[1]  ( .D(N12), .CK(clk), .RN(rstn), .Q(N3) );
  DFFRQX2M \cnt_reg[0]  ( .D(N11), .CK(clk), .RN(rstn), .Q(N2) );
  INVX2M U3 ( .A(n4), .Y(n18) );
  INVX2M U4 ( .A(ser_en), .Y(n17) );
  AOI211X2M U5 ( .A0(n6), .A1(n7), .B0(n17), .C0(n1), .Y(N12) );
  NOR2X2M U6 ( .A(n7), .B(n6), .Y(n1) );
  NOR2BX2M U7 ( .AN(data_valid), .B(busy), .Y(n4) );
  AO22X1M U8 ( .A0(saved_data[0]), .A1(n18), .B0(P_DATA[0]), .B1(n4), .Y(n9)
         );
  AO22X1M U9 ( .A0(saved_data[1]), .A1(n18), .B0(P_DATA[1]), .B1(n4), .Y(n10)
         );
  AO22X1M U10 ( .A0(saved_data[2]), .A1(n18), .B0(P_DATA[2]), .B1(n4), .Y(n11)
         );
  AO22X1M U11 ( .A0(saved_data[3]), .A1(n18), .B0(P_DATA[3]), .B1(n4), .Y(n12)
         );
  AO22X1M U12 ( .A0(saved_data[4]), .A1(n18), .B0(P_DATA[4]), .B1(n4), .Y(n13)
         );
  AO22X1M U13 ( .A0(saved_data[5]), .A1(n18), .B0(P_DATA[5]), .B1(n4), .Y(n14)
         );
  AO22X1M U14 ( .A0(saved_data[6]), .A1(n18), .B0(P_DATA[6]), .B1(n4), .Y(n15)
         );
  AO22X1M U15 ( .A0(saved_data[7]), .A1(n18), .B0(P_DATA[7]), .B1(n4), .Y(n16)
         );
  OR2X2M U16 ( .A(N15), .B(n17), .Y(ser_data) );
  MX2X2M U17 ( .A(n3), .B(n2), .S0(N4), .Y(N15) );
  MX4X1M U18 ( .A(saved_data[4]), .B(saved_data[5]), .C(saved_data[6]), .D(
        saved_data[7]), .S0(N2), .S1(N3), .Y(n2) );
  MX4X1M U19 ( .A(saved_data[0]), .B(saved_data[1]), .C(saved_data[2]), .D(
        saved_data[3]), .S0(N2), .S1(N3), .Y(n3) );
  OAI2BB2X1M U20 ( .B0(n5), .B1(n17), .A0N(N4), .A1N(N11), .Y(N13) );
  AOI22X1M U21 ( .A0(n1), .A1(n8), .B0(N4), .B1(n7), .Y(n5) );
  INVX2M U22 ( .A(N4), .Y(n8) );
  NOR2X2M U23 ( .A(n17), .B(N2), .Y(N11) );
  AND2X2M U24 ( .A(n1), .B(N4), .Y(ser_done) );
  INVX2M U25 ( .A(N2), .Y(n6) );
  INVX2M U26 ( .A(N3), .Y(n7) );
endmodule


module UART_TX_TOP ( clk, rstn, P_DATA, data_valid, par_typ, par_en, TX_OUT, 
        busy );
  input [7:0] P_DATA;
  input clk, rstn, data_valid, par_typ, par_en;
  output TX_OUT, busy;
  wire   ser_done, ser_en, ser_data, par_bit, n1, n2;
  wire   [1:0] mux_sel;

  fsm_uart_tx U0 ( .clk(clk), .rstn(n1), .data_valid(data_valid), .par_en(
        par_en), .ser_done(ser_done), .ser_en(ser_en), .mux_sel(mux_sel), 
        .busy(busy) );
  tx_mux U1 ( .clk(clk), .rst(n1), .mux_sel(mux_sel), .start_bit(1'b0), 
        .stop_bit(1'b1), .ser_data(ser_data), .par_bit(par_bit), .TX_OUT(
        TX_OUT) );
  parity_calc U2 ( .clk(clk), .rst(n1), .P_DATA(P_DATA), .data_valid(
        data_valid), .busy(busy), .par_en(par_en), .par_typ(par_typ), 
        .par_bit(par_bit) );
  ser U3 ( .clk(clk), .rstn(n1), .P_DATA(P_DATA), .data_valid(data_valid), 
        .busy(busy), .ser_en(ser_en), .ser_done(ser_done), .ser_data(ser_data)
         );
  INVX2M U6 ( .A(n2), .Y(n1) );
  INVX2M U7 ( .A(rstn), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, RX_P_DATA, RX_D_VLD, RdData, RdData_Valid, ALU_OUT, 
        OUT_Valid, ALU_EN, ALU_FUN, CLK_EN, Address, WrEn, RdEn, WrData, 
        TX_P_DATA, TX_D_VLD, clk_div_en );
  input [7:0] RX_P_DATA;
  input [7:0] RdData;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, RX_D_VLD, RdData_Valid, OUT_Valid;
  output ALU_EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n77;
  wire   [3:0] curent_state;

  DFFRQX2M \Address_reg[1]  ( .D(n70), .CK(CLK), .RN(RST), .Q(Address[1]) );
  DFFRQX2M \Address_reg[2]  ( .D(n71), .CK(CLK), .RN(RST), .Q(Address[2]) );
  DFFRQX2M \Address_reg[3]  ( .D(n72), .CK(CLK), .RN(RST), .Q(Address[3]) );
  DFFRQX2M \Address_reg[0]  ( .D(n69), .CK(CLK), .RN(RST), .Q(Address[0]) );
  DFFRQX2M \curent_state_reg[3]  ( .D(n75), .CK(CLK), .RN(RST), .Q(
        curent_state[3]) );
  DFFRQX2M \curent_state_reg[0]  ( .D(n76), .CK(CLK), .RN(RST), .Q(
        curent_state[0]) );
  DFFRQX2M \curent_state_reg[1]  ( .D(n73), .CK(CLK), .RN(RST), .Q(
        curent_state[1]) );
  DFFRQX2M \curent_state_reg[2]  ( .D(n74), .CK(CLK), .RN(RST), .Q(
        curent_state[2]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  NOR2X2M U5 ( .A(n25), .B(n43), .Y(ALU_FUN[2]) );
  NOR2X2M U6 ( .A(n22), .B(n43), .Y(ALU_FUN[0]) );
  INVX2M U7 ( .A(n52), .Y(n9) );
  INVX2M U8 ( .A(n21), .Y(n8) );
  INVX2M U9 ( .A(n39), .Y(n7) );
  OAI21X2M U10 ( .A0(n24), .A1(n43), .B0(n66), .Y(ALU_FUN[1]) );
  NAND2X2M U11 ( .A(n55), .B(n53), .Y(n43) );
  NOR2X2M U12 ( .A(n26), .B(n43), .Y(ALU_FUN[3]) );
  OAI2B11X2M U13 ( .A1N(n28), .A0(n54), .B0(n38), .C0(n19), .Y(n52) );
  OAI21X2M U14 ( .A0(n15), .A1(n43), .B0(n66), .Y(ALU_EN) );
  NOR2X2M U15 ( .A(n45), .B(n37), .Y(n21) );
  NOR2X2M U16 ( .A(n9), .B(n22), .Y(WrData[0]) );
  NOR2X2M U17 ( .A(n9), .B(n24), .Y(WrData[1]) );
  NOR2X2M U18 ( .A(n9), .B(n25), .Y(WrData[2]) );
  NOR2X2M U19 ( .A(n9), .B(n26), .Y(WrData[3]) );
  OAI21X2M U20 ( .A0(n49), .A1(n3), .B0(n67), .Y(TX_D_VLD) );
  NOR2X2M U21 ( .A(n15), .B(n9), .Y(WrEn) );
  NOR2X2M U22 ( .A(n3), .B(n66), .Y(n58) );
  OAI22X1M U23 ( .A0(n4), .A1(n13), .B0(n29), .B1(n30), .Y(n73) );
  AOI21X2M U24 ( .A0(n7), .A1(n31), .B0(n8), .Y(n29) );
  OAI31X1M U25 ( .A0(n16), .A1(n77), .A2(n32), .B0(n33), .Y(n31) );
  NOR2BX2M U26 ( .AN(WrEn), .B(n16), .Y(WrData[4]) );
  INVX2M U27 ( .A(n30), .Y(n4) );
  NAND3X2M U28 ( .A(n13), .B(n14), .C(n53), .Y(n39) );
  OAI211X2M U29 ( .A0(n4), .A1(n14), .B0(n34), .C0(n35), .Y(n74) );
  OAI31X1M U30 ( .A0(n36), .A1(n37), .A2(n10), .B0(n4), .Y(n34) );
  INVX2M U31 ( .A(n38), .Y(n10) );
  OAI21BX1M U32 ( .A0(n39), .A1(n40), .B0N(n41), .Y(n36) );
  NOR2X2M U33 ( .A(n3), .B(n43), .Y(n56) );
  OAI21X2M U34 ( .A0(n4), .A1(n12), .B0(n35), .Y(n75) );
  NAND2X2M U35 ( .A(n55), .B(n11), .Y(n38) );
  INVX2M U36 ( .A(n50), .Y(RdEn) );
  INVX2M U37 ( .A(n54), .Y(n11) );
  AND2X2M U38 ( .A(n28), .B(n53), .Y(n37) );
  AND2X2M U39 ( .A(n43), .B(n66), .Y(n49) );
  OAI31X1M U40 ( .A0(n40), .A1(n15), .A2(n39), .B0(n49), .Y(CLK_EN) );
  OAI21X2M U41 ( .A0(n39), .A1(n33), .B0(n19), .Y(n41) );
  NAND3X2M U42 ( .A(n77), .B(n16), .C(n48), .Y(n33) );
  INVX2M U43 ( .A(n67), .Y(n5) );
  NOR2X2M U44 ( .A(curent_state[3]), .B(curent_state[0]), .Y(n53) );
  NOR2X2M U45 ( .A(n14), .B(curent_state[1]), .Y(n55) );
  NAND3X2M U46 ( .A(n55), .B(n6), .C(curent_state[3]), .Y(n66) );
  INVX2M U47 ( .A(curent_state[2]), .Y(n14) );
  OAI221X1M U48 ( .A0(OUT_Valid), .A1(n49), .B0(RdData_Valid), .B1(n50), .C0(
        n51), .Y(n30) );
  OAI31X1M U49 ( .A0(n8), .A1(n7), .A2(n52), .B0(n15), .Y(n51) );
  NOR3X2M U50 ( .A(curent_state[1]), .B(curent_state[2]), .C(n54), .Y(n45) );
  OAI22X1M U51 ( .A0(n4), .A1(n6), .B0(n44), .B1(n30), .Y(n76) );
  NOR3X2M U52 ( .A(n41), .B(n45), .C(n46), .Y(n44) );
  NOR4X1M U53 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n32), .D(n39), .Y(n46)
         );
  NAND4BX1M U54 ( .AN(RX_P_DATA[3]), .B(n17), .C(n77), .D(n42), .Y(n35) );
  NOR3X2M U55 ( .A(n43), .B(n18), .C(n30), .Y(n42) );
  NAND2X2M U56 ( .A(RX_P_DATA[3]), .B(RX_D_VLD), .Y(n26) );
  NAND2X2M U57 ( .A(RX_P_DATA[2]), .B(RX_D_VLD), .Y(n25) );
  NAND3X2M U58 ( .A(curent_state[2]), .B(curent_state[1]), .C(n53), .Y(n50) );
  NOR2X2M U59 ( .A(n13), .B(curent_state[2]), .Y(n28) );
  NAND2X2M U60 ( .A(RX_P_DATA[1]), .B(RX_D_VLD), .Y(n24) );
  NAND2X2M U61 ( .A(RX_P_DATA[0]), .B(RX_D_VLD), .Y(n22) );
  OAI2BB1X2M U62 ( .A0N(ALU_OUT[0]), .A1N(n56), .B0(n65), .Y(TX_P_DATA[0]) );
  AOI22X1M U63 ( .A0(RdData[0]), .A1(n5), .B0(ALU_OUT[8]), .B1(n58), .Y(n65)
         );
  OAI2BB1X2M U64 ( .A0N(ALU_OUT[1]), .A1N(n56), .B0(n64), .Y(TX_P_DATA[1]) );
  AOI22X1M U65 ( .A0(RdData[1]), .A1(n5), .B0(ALU_OUT[9]), .B1(n58), .Y(n64)
         );
  OAI2BB1X2M U66 ( .A0N(ALU_OUT[2]), .A1N(n56), .B0(n63), .Y(TX_P_DATA[2]) );
  AOI22X1M U67 ( .A0(RdData[2]), .A1(n5), .B0(ALU_OUT[10]), .B1(n58), .Y(n63)
         );
  OAI2BB1X2M U68 ( .A0N(ALU_OUT[3]), .A1N(n56), .B0(n62), .Y(TX_P_DATA[3]) );
  AOI22X1M U69 ( .A0(RdData[3]), .A1(n5), .B0(ALU_OUT[11]), .B1(n58), .Y(n62)
         );
  OAI2BB1X2M U70 ( .A0N(ALU_OUT[4]), .A1N(n56), .B0(n61), .Y(TX_P_DATA[4]) );
  AOI22X1M U71 ( .A0(RdData[4]), .A1(n5), .B0(ALU_OUT[12]), .B1(n58), .Y(n61)
         );
  OAI2BB1X2M U72 ( .A0N(ALU_OUT[5]), .A1N(n56), .B0(n60), .Y(TX_P_DATA[5]) );
  AOI22X1M U73 ( .A0(RdData[5]), .A1(n5), .B0(ALU_OUT[13]), .B1(n58), .Y(n60)
         );
  OAI2BB1X2M U74 ( .A0N(ALU_OUT[6]), .A1N(n56), .B0(n59), .Y(TX_P_DATA[6]) );
  AOI22X1M U75 ( .A0(RdData[6]), .A1(n5), .B0(ALU_OUT[14]), .B1(n58), .Y(n59)
         );
  OAI2BB1X2M U76 ( .A0N(ALU_OUT[7]), .A1N(n56), .B0(n57), .Y(TX_P_DATA[7]) );
  AOI22X1M U77 ( .A0(RdData[7]), .A1(n5), .B0(ALU_OUT[15]), .B1(n58), .Y(n57)
         );
  NAND2X2M U78 ( .A(curent_state[0]), .B(n12), .Y(n54) );
  INVX2M U79 ( .A(RX_D_VLD), .Y(n15) );
  AND2X2M U80 ( .A(RX_P_DATA[5]), .B(WrEn), .Y(WrData[5]) );
  AND2X2M U81 ( .A(RX_P_DATA[6]), .B(WrEn), .Y(WrData[6]) );
  AND2X2M U82 ( .A(RX_P_DATA[7]), .B(WrEn), .Y(WrData[7]) );
  NAND3X2M U83 ( .A(n11), .B(curent_state[1]), .C(curent_state[2]), .Y(n19) );
  INVX2M U84 ( .A(curent_state[1]), .Y(n13) );
  NAND2X2M U85 ( .A(RdData_Valid), .B(RdEn), .Y(n67) );
  INVX2M U86 ( .A(curent_state[0]), .Y(n6) );
  INVX2M U87 ( .A(curent_state[3]), .Y(n12) );
  OAI221X1M U88 ( .A0(n19), .A1(n20), .B0(n21), .B1(n22), .C0(n23), .Y(n69) );
  NAND2X2M U89 ( .A(Address[0]), .B(n20), .Y(n23) );
  NAND4X2M U90 ( .A(RX_P_DATA[5]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n47), 
        .Y(n32) );
  NOR3X2M U91 ( .A(n18), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n47) );
  NAND3X2M U92 ( .A(n27), .B(n12), .C(RX_D_VLD), .Y(n20) );
  OAI22X1M U93 ( .A0(curent_state[2]), .A1(curent_state[0]), .B0(n28), .B1(n6), 
        .Y(n27) );
  AND4X2M U94 ( .A(RX_P_DATA[7]), .B(RX_P_DATA[3]), .C(RX_P_DATA[6]), .D(n68), 
        .Y(n48) );
  NOR3X2M U95 ( .A(n17), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n68) );
  OAI2BB2X1M U96 ( .B0(n21), .B1(n24), .A0N(Address[1]), .A1N(n20), .Y(n70) );
  OAI2BB2X1M U97 ( .B0(n21), .B1(n25), .A0N(Address[2]), .A1N(n20), .Y(n71) );
  OAI2BB2X1M U98 ( .B0(n21), .B1(n26), .A0N(Address[3]), .A1N(n20), .Y(n72) );
  NAND3X2M U99 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n48), .Y(n40) );
  INVX2M U100 ( .A(RX_P_DATA[4]), .Y(n16) );
  INVX2M U101 ( .A(RX_P_DATA[0]), .Y(n77) );
  INVX2M U102 ( .A(RX_P_DATA[1]), .Y(n18) );
  INVX2M U103 ( .A(OUT_Valid), .Y(n3) );
  INVX2M U104 ( .A(RX_P_DATA[2]), .Y(n17) );
endmodule


module RegFile_WIDTH8_DEPTH16_ADDR4 ( CLK, RST, WrEn, RdEn, Address, WrData, 
        RdData, RdData_VLD, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
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
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n213), .Q(
        \regArr[13][7] ) );
  DFFRQX2M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n213), .Q(
        \regArr[13][6] ) );
  DFFRQX2M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n212), .Q(
        \regArr[13][5] ) );
  DFFRQX2M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n212), .Q(
        \regArr[13][4] ) );
  DFFRQX2M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n212), .Q(
        \regArr[13][3] ) );
  DFFRQX2M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n212), .Q(
        \regArr[13][2] ) );
  DFFRQX2M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n212), .Q(
        \regArr[13][1] ) );
  DFFRQX2M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n212), .Q(
        \regArr[13][0] ) );
  DFFRQX2M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n210), .Q(
        \regArr[9][7] ) );
  DFFRQX2M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n210), .Q(
        \regArr[9][6] ) );
  DFFRQX2M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n210), .Q(
        \regArr[9][5] ) );
  DFFRQX2M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n210), .Q(
        \regArr[9][4] ) );
  DFFRQX2M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n210), .Q(
        \regArr[9][3] ) );
  DFFRQX2M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n210), .Q(
        \regArr[9][2] ) );
  DFFRQX2M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n210), .Q(
        \regArr[9][1] ) );
  DFFRQX2M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n210), .Q(
        \regArr[9][0] ) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n208), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n208), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n208), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n208), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n208), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n208), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n208), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n208), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n205), .Q(
        \regArr[15][7] ) );
  DFFRQX2M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n214), .Q(
        \regArr[15][6] ) );
  DFFRQX2M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n214), .Q(
        \regArr[15][5] ) );
  DFFRQX2M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n213), .Q(
        \regArr[15][4] ) );
  DFFRQX2M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n213), .Q(
        \regArr[15][3] ) );
  DFFRQX2M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n213), .Q(
        \regArr[15][2] ) );
  DFFRQX2M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n213), .Q(
        \regArr[15][1] ) );
  DFFRQX2M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n213), .Q(
        \regArr[15][0] ) );
  DFFRQX2M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n212), .Q(
        \regArr[11][7] ) );
  DFFRQX2M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n211), .Q(
        \regArr[11][6] ) );
  DFFRQX2M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n211), .Q(
        \regArr[11][5] ) );
  DFFRQX2M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n211), .Q(
        \regArr[11][4] ) );
  DFFRQX2M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n211), .Q(
        \regArr[11][3] ) );
  DFFRQX2M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n211), .Q(
        \regArr[11][2] ) );
  DFFRQX2M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n211), .Q(
        \regArr[11][1] ) );
  DFFRQX2M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n211), .Q(
        \regArr[11][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n209), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n209), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n209), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n209), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n209), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n209), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n209), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n209), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n213), .Q(
        \regArr[14][7] ) );
  DFFRQX2M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n213), .Q(
        \regArr[14][6] ) );
  DFFRQX2M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n213), .Q(
        \regArr[14][5] ) );
  DFFRQX2M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n213), .Q(
        \regArr[14][4] ) );
  DFFRQX2M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n213), .Q(
        \regArr[14][3] ) );
  DFFRQX2M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n213), .Q(
        \regArr[14][2] ) );
  DFFRQX2M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n213), .Q(
        \regArr[14][1] ) );
  DFFRQX2M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n213), .Q(
        \regArr[14][0] ) );
  DFFRQX2M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n211), .Q(
        \regArr[10][7] ) );
  DFFRQX2M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n211), .Q(
        \regArr[10][6] ) );
  DFFRQX2M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n211), .Q(
        \regArr[10][5] ) );
  DFFRQX2M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n211), .Q(
        \regArr[10][4] ) );
  DFFRQX2M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n211), .Q(
        \regArr[10][3] ) );
  DFFRQX2M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n211), .Q(
        \regArr[10][2] ) );
  DFFRQX2M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n211), .Q(
        \regArr[10][1] ) );
  DFFRQX2M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n211), .Q(
        \regArr[10][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n209), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n209), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n209), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n209), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n209), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n208), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n208), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n208), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n212), .Q(
        \regArr[12][7] ) );
  DFFRQX2M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n212), .Q(
        \regArr[12][6] ) );
  DFFRQX2M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n212), .Q(
        \regArr[12][5] ) );
  DFFRQX2M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n212), .Q(
        \regArr[12][4] ) );
  DFFRQX2M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n212), .Q(
        \regArr[12][3] ) );
  DFFRQX2M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n212), .Q(
        \regArr[12][2] ) );
  DFFRQX2M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n212), .Q(
        \regArr[12][1] ) );
  DFFRQX2M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n212), .Q(
        \regArr[12][0] ) );
  DFFRQX2M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n210), .Q(
        \regArr[8][7] ) );
  DFFRQX2M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n210), .Q(
        \regArr[8][6] ) );
  DFFRQX2M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n210), .Q(
        \regArr[8][5] ) );
  DFFRQX2M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n210), .Q(
        \regArr[8][4] ) );
  DFFRQX2M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n210), .Q(
        \regArr[8][3] ) );
  DFFRQX2M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n210), .Q(
        \regArr[8][2] ) );
  DFFRQX2M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n210), .Q(
        \regArr[8][1] ) );
  DFFRQX2M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n209), .Q(
        \regArr[8][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n208), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n208), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n208), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n208), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n207), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n207), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n207), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n207), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n205), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n205), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n205), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n205), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n205), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n205), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n205), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n209), .Q(RdData[0]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n206), .Q(REG2[1]) );
  DFFSQX2M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n205), .Q(REG2[0]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n205), .Q(RdData_VLD) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n207), .Q(REG3[0]) );
  DFFRQX2M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n207), .Q(REG3[1]) );
  DFFRQX2M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n207), .Q(REG3[2]) );
  DFFRQX2M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n207), .Q(REG3[3]) );
  DFFSQX2M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n205), .Q(REG3[5]) );
  DFFRQX2M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n207), .Q(REG2[4]) );
  DFFRQX2M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n207), .Q(REG3[6]) );
  DFFRQX2M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n207), .Q(REG3[7]) );
  DFFRQX2M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n207), .Q(REG3[4]) );
  DFFRQX2M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n207), .Q(REG2[2]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n206), .Q(REG2[3]) );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n205), .Q(REG0[0]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n206), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n206), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n206), .Q(REG0[5]) );
  DFFRQX2M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n206), .Q(REG0[7]) );
  DFFRQX2M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n206), .Q(REG0[6]) );
  DFFRQX2M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n206), .Q(REG1[6]) );
  DFFRQX2M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n206), .Q(REG1[1]) );
  DFFRQX2M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n206), .Q(REG1[5]) );
  DFFRQX2M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n206), .Q(REG1[4]) );
  DFFRQX2M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n206), .Q(REG1[7]) );
  DFFRQX2M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n206), .Q(REG1[3]) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n206), .Q(REG1[2]) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n206), .Q(REG1[0]) );
  DFFSQX2M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n205), .Q(REG2[7]) );
  DFFRQX2M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n207), .Q(REG2[6]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n207), .Q(REG2[5]) );
  INVX2M U3 ( .A(WrData[5]), .Y(n222) );
  INVX2M U4 ( .A(WrData[6]), .Y(n223) );
  INVX2M U5 ( .A(WrData[7]), .Y(n224) );
  NOR2X2M U6 ( .A(n204), .B(N13), .Y(n20) );
  NOR2X2M U7 ( .A(n199), .B(N13), .Y(n15) );
  NOR2BX2M U8 ( .AN(N13), .B(n199), .Y(n23) );
  NOR2BX2M U9 ( .AN(N13), .B(n204), .Y(n26) );
  INVX2M U10 ( .A(n200), .Y(n201) );
  INVX2M U11 ( .A(n198), .Y(n199) );
  INVX2M U12 ( .A(n200), .Y(n202) );
  BUFX2M U13 ( .A(n203), .Y(n200) );
  INVX2M U14 ( .A(n12), .Y(n220) );
  BUFX2M U15 ( .A(n204), .Y(n198) );
  NAND2BX2M U16 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U17 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  BUFX2M U18 ( .A(n219), .Y(n205) );
  BUFX2M U19 ( .A(n219), .Y(n206) );
  BUFX2M U20 ( .A(n218), .Y(n207) );
  BUFX2M U21 ( .A(n218), .Y(n208) );
  BUFX2M U22 ( .A(n217), .Y(n209) );
  BUFX2M U23 ( .A(n217), .Y(n210) );
  BUFX2M U24 ( .A(n216), .Y(n211) );
  BUFX2M U25 ( .A(n216), .Y(n212) );
  BUFX2M U26 ( .A(n215), .Y(n213) );
  BUFX2M U27 ( .A(n215), .Y(n214) );
  NOR2BX2M U28 ( .AN(n27), .B(N11), .Y(n16) );
  NOR2BX2M U29 ( .AN(n27), .B(n203), .Y(n18) );
  NOR2BX2M U30 ( .AN(n38), .B(N11), .Y(n30) );
  NOR2BX2M U31 ( .AN(n38), .B(n203), .Y(n32) );
  NAND2X2M U32 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U33 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U34 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U35 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U36 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U37 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U38 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U39 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U40 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U41 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U42 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U43 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U44 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U45 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U46 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U47 ( .A(n15), .B(n16), .Y(n14) );
  INVX2M U48 ( .A(WrData[0]), .Y(n228) );
  INVX2M U49 ( .A(WrData[1]), .Y(n227) );
  INVX2M U50 ( .A(WrData[2]), .Y(n226) );
  INVX2M U51 ( .A(WrData[3]), .Y(n225) );
  INVX2M U52 ( .A(WrData[4]), .Y(n221) );
  BUFX2M U53 ( .A(RST), .Y(n218) );
  BUFX2M U54 ( .A(RST), .Y(n217) );
  BUFX2M U55 ( .A(RST), .Y(n216) );
  BUFX2M U56 ( .A(RST), .Y(n215) );
  BUFX2M U57 ( .A(RST), .Y(n219) );
  OAI2BB2X1M U58 ( .B0(n14), .B1(n228), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U59 ( .B0(n14), .B1(n227), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U60 ( .B0(n14), .B1(n226), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U61 ( .B0(n14), .B1(n225), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U62 ( .B0(n14), .B1(n221), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  OAI2BB2X1M U63 ( .B0(n14), .B1(n222), .A0N(REG0[5]), .A1N(n14), .Y(n54) );
  OAI2BB2X1M U64 ( .B0(n14), .B1(n223), .A0N(REG0[6]), .A1N(n14), .Y(n55) );
  OAI2BB2X1M U65 ( .B0(n14), .B1(n224), .A0N(REG0[7]), .A1N(n14), .Y(n56) );
  OAI2BB2X1M U66 ( .B0(n228), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U67 ( .B0(n227), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n58) );
  OAI2BB2X1M U68 ( .B0(n226), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n59) );
  OAI2BB2X1M U69 ( .B0(n225), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n60) );
  OAI2BB2X1M U70 ( .B0(n221), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n61) );
  OAI2BB2X1M U71 ( .B0(n222), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U72 ( .B0(n223), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U73 ( .B0(n224), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U74 ( .B0(n228), .B1(n22), .A0N(\regArr[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U75 ( .B0(n227), .B1(n22), .A0N(\regArr[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U76 ( .B0(n226), .B1(n22), .A0N(\regArr[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U77 ( .B0(n225), .B1(n22), .A0N(\regArr[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U78 ( .B0(n221), .B1(n22), .A0N(\regArr[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U79 ( .B0(n222), .B1(n22), .A0N(\regArr[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U80 ( .B0(n223), .B1(n22), .A0N(\regArr[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U81 ( .B0(n224), .B1(n22), .A0N(\regArr[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U82 ( .B0(n228), .B1(n24), .A0N(\regArr[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U83 ( .B0(n227), .B1(n24), .A0N(\regArr[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U84 ( .B0(n226), .B1(n24), .A0N(\regArr[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U85 ( .B0(n225), .B1(n24), .A0N(\regArr[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U86 ( .B0(n221), .B1(n24), .A0N(\regArr[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U87 ( .B0(n222), .B1(n24), .A0N(\regArr[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U88 ( .B0(n223), .B1(n24), .A0N(\regArr[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U89 ( .B0(n224), .B1(n24), .A0N(\regArr[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U90 ( .B0(n228), .B1(n25), .A0N(\regArr[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U91 ( .B0(n227), .B1(n25), .A0N(\regArr[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U92 ( .B0(n226), .B1(n25), .A0N(\regArr[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U93 ( .B0(n225), .B1(n25), .A0N(\regArr[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U94 ( .B0(n221), .B1(n25), .A0N(\regArr[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U95 ( .B0(n222), .B1(n25), .A0N(\regArr[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U96 ( .B0(n223), .B1(n25), .A0N(\regArr[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U97 ( .B0(n224), .B1(n25), .A0N(\regArr[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U98 ( .B0(n228), .B1(n28), .A0N(\regArr[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U99 ( .B0(n227), .B1(n28), .A0N(\regArr[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U100 ( .B0(n226), .B1(n28), .A0N(\regArr[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U101 ( .B0(n225), .B1(n28), .A0N(\regArr[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U102 ( .B0(n221), .B1(n28), .A0N(\regArr[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U103 ( .B0(n222), .B1(n28), .A0N(\regArr[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U104 ( .B0(n223), .B1(n28), .A0N(\regArr[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U105 ( .B0(n224), .B1(n28), .A0N(\regArr[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U106 ( .B0(n228), .B1(n29), .A0N(\regArr[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U107 ( .B0(n227), .B1(n29), .A0N(\regArr[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U108 ( .B0(n226), .B1(n29), .A0N(\regArr[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U109 ( .B0(n225), .B1(n29), .A0N(\regArr[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U110 ( .B0(n221), .B1(n29), .A0N(\regArr[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U111 ( .B0(n222), .B1(n29), .A0N(\regArr[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U112 ( .B0(n223), .B1(n29), .A0N(\regArr[8][6] ), .A1N(n29), .Y(
        n119) );
  OAI2BB2X1M U113 ( .B0(n224), .B1(n29), .A0N(\regArr[8][7] ), .A1N(n29), .Y(
        n120) );
  OAI2BB2X1M U114 ( .B0(n228), .B1(n31), .A0N(\regArr[9][0] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U115 ( .B0(n227), .B1(n31), .A0N(\regArr[9][1] ), .A1N(n31), .Y(
        n122) );
  OAI2BB2X1M U116 ( .B0(n226), .B1(n31), .A0N(\regArr[9][2] ), .A1N(n31), .Y(
        n123) );
  OAI2BB2X1M U117 ( .B0(n225), .B1(n31), .A0N(\regArr[9][3] ), .A1N(n31), .Y(
        n124) );
  OAI2BB2X1M U118 ( .B0(n221), .B1(n31), .A0N(\regArr[9][4] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U119 ( .B0(n222), .B1(n31), .A0N(\regArr[9][5] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U120 ( .B0(n223), .B1(n31), .A0N(\regArr[9][6] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U121 ( .B0(n224), .B1(n31), .A0N(\regArr[9][7] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U122 ( .B0(n228), .B1(n33), .A0N(\regArr[10][0] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U123 ( .B0(n227), .B1(n33), .A0N(\regArr[10][1] ), .A1N(n33), .Y(
        n130) );
  OAI2BB2X1M U124 ( .B0(n226), .B1(n33), .A0N(\regArr[10][2] ), .A1N(n33), .Y(
        n131) );
  OAI2BB2X1M U125 ( .B0(n225), .B1(n33), .A0N(\regArr[10][3] ), .A1N(n33), .Y(
        n132) );
  OAI2BB2X1M U126 ( .B0(n221), .B1(n33), .A0N(\regArr[10][4] ), .A1N(n33), .Y(
        n133) );
  OAI2BB2X1M U127 ( .B0(n222), .B1(n33), .A0N(\regArr[10][5] ), .A1N(n33), .Y(
        n134) );
  OAI2BB2X1M U128 ( .B0(n223), .B1(n33), .A0N(\regArr[10][6] ), .A1N(n33), .Y(
        n135) );
  OAI2BB2X1M U129 ( .B0(n224), .B1(n33), .A0N(\regArr[10][7] ), .A1N(n33), .Y(
        n136) );
  OAI2BB2X1M U130 ( .B0(n228), .B1(n34), .A0N(\regArr[11][0] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U131 ( .B0(n227), .B1(n34), .A0N(\regArr[11][1] ), .A1N(n34), .Y(
        n138) );
  OAI2BB2X1M U132 ( .B0(n226), .B1(n34), .A0N(\regArr[11][2] ), .A1N(n34), .Y(
        n139) );
  OAI2BB2X1M U133 ( .B0(n225), .B1(n34), .A0N(\regArr[11][3] ), .A1N(n34), .Y(
        n140) );
  OAI2BB2X1M U134 ( .B0(n221), .B1(n34), .A0N(\regArr[11][4] ), .A1N(n34), .Y(
        n141) );
  OAI2BB2X1M U135 ( .B0(n222), .B1(n34), .A0N(\regArr[11][5] ), .A1N(n34), .Y(
        n142) );
  OAI2BB2X1M U136 ( .B0(n223), .B1(n34), .A0N(\regArr[11][6] ), .A1N(n34), .Y(
        n143) );
  OAI2BB2X1M U137 ( .B0(n224), .B1(n34), .A0N(\regArr[11][7] ), .A1N(n34), .Y(
        n144) );
  OAI2BB2X1M U138 ( .B0(n228), .B1(n35), .A0N(\regArr[12][0] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U139 ( .B0(n227), .B1(n35), .A0N(\regArr[12][1] ), .A1N(n35), .Y(
        n146) );
  OAI2BB2X1M U140 ( .B0(n226), .B1(n35), .A0N(\regArr[12][2] ), .A1N(n35), .Y(
        n147) );
  OAI2BB2X1M U141 ( .B0(n225), .B1(n35), .A0N(\regArr[12][3] ), .A1N(n35), .Y(
        n148) );
  OAI2BB2X1M U142 ( .B0(n221), .B1(n35), .A0N(\regArr[12][4] ), .A1N(n35), .Y(
        n149) );
  OAI2BB2X1M U143 ( .B0(n222), .B1(n35), .A0N(\regArr[12][5] ), .A1N(n35), .Y(
        n150) );
  OAI2BB2X1M U144 ( .B0(n223), .B1(n35), .A0N(\regArr[12][6] ), .A1N(n35), .Y(
        n151) );
  OAI2BB2X1M U145 ( .B0(n224), .B1(n35), .A0N(\regArr[12][7] ), .A1N(n35), .Y(
        n152) );
  OAI2BB2X1M U146 ( .B0(n228), .B1(n36), .A0N(\regArr[13][0] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U147 ( .B0(n227), .B1(n36), .A0N(\regArr[13][1] ), .A1N(n36), .Y(
        n154) );
  OAI2BB2X1M U148 ( .B0(n226), .B1(n36), .A0N(\regArr[13][2] ), .A1N(n36), .Y(
        n155) );
  OAI2BB2X1M U149 ( .B0(n225), .B1(n36), .A0N(\regArr[13][3] ), .A1N(n36), .Y(
        n156) );
  OAI2BB2X1M U150 ( .B0(n221), .B1(n36), .A0N(\regArr[13][4] ), .A1N(n36), .Y(
        n157) );
  OAI2BB2X1M U151 ( .B0(n222), .B1(n36), .A0N(\regArr[13][5] ), .A1N(n36), .Y(
        n158) );
  OAI2BB2X1M U152 ( .B0(n223), .B1(n36), .A0N(\regArr[13][6] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U153 ( .B0(n224), .B1(n36), .A0N(\regArr[13][7] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U154 ( .B0(n228), .B1(n37), .A0N(\regArr[14][0] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U155 ( .B0(n227), .B1(n37), .A0N(\regArr[14][1] ), .A1N(n37), .Y(
        n162) );
  OAI2BB2X1M U156 ( .B0(n226), .B1(n37), .A0N(\regArr[14][2] ), .A1N(n37), .Y(
        n163) );
  OAI2BB2X1M U157 ( .B0(n225), .B1(n37), .A0N(\regArr[14][3] ), .A1N(n37), .Y(
        n164) );
  OAI2BB2X1M U158 ( .B0(n221), .B1(n37), .A0N(\regArr[14][4] ), .A1N(n37), .Y(
        n165) );
  OAI2BB2X1M U159 ( .B0(n222), .B1(n37), .A0N(\regArr[14][5] ), .A1N(n37), .Y(
        n166) );
  OAI2BB2X1M U160 ( .B0(n223), .B1(n37), .A0N(\regArr[14][6] ), .A1N(n37), .Y(
        n167) );
  OAI2BB2X1M U161 ( .B0(n224), .B1(n37), .A0N(\regArr[14][7] ), .A1N(n37), .Y(
        n168) );
  OAI2BB2X1M U162 ( .B0(n228), .B1(n39), .A0N(\regArr[15][0] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U163 ( .B0(n227), .B1(n39), .A0N(\regArr[15][1] ), .A1N(n39), .Y(
        n170) );
  OAI2BB2X1M U164 ( .B0(n226), .B1(n39), .A0N(\regArr[15][2] ), .A1N(n39), .Y(
        n171) );
  OAI2BB2X1M U165 ( .B0(n225), .B1(n39), .A0N(\regArr[15][3] ), .A1N(n39), .Y(
        n172) );
  OAI2BB2X1M U166 ( .B0(n221), .B1(n39), .A0N(\regArr[15][4] ), .A1N(n39), .Y(
        n173) );
  OAI2BB2X1M U167 ( .B0(n222), .B1(n39), .A0N(\regArr[15][5] ), .A1N(n39), .Y(
        n174) );
  OAI2BB2X1M U168 ( .B0(n223), .B1(n39), .A0N(\regArr[15][6] ), .A1N(n39), .Y(
        n175) );
  OAI2BB2X1M U169 ( .B0(n224), .B1(n39), .A0N(\regArr[15][7] ), .A1N(n39), .Y(
        n176) );
  OAI2BB2X1M U170 ( .B0(n227), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U171 ( .B0(n226), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U172 ( .B0(n225), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U173 ( .B0(n221), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U174 ( .B0(n222), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U175 ( .B0(n223), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U176 ( .B0(n228), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U177 ( .B0(n227), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U178 ( .B0(n226), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U179 ( .B0(n225), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U180 ( .B0(n221), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U181 ( .B0(n223), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U182 ( .B0(n224), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  NOR2BX2M U183 ( .AN(n13), .B(N14), .Y(n27) );
  OAI2BB2X1M U184 ( .B0(n228), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U185 ( .B0(n224), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U186 ( .B0(n222), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  MX4X1M U187 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(n199), .Y(n8) );
  MX4X1M U188 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(n199), .Y(n3) );
  MX4X1M U189 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n201), .S1(n199), .Y(n7) );
  MX4X1M U190 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n201), .S1(N12), .Y(n11) );
  MX4X1M U191 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n201), .S1(N12), .Y(n180) );
  MX4X1M U192 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n201), .S1(N12), .Y(n184) );
  MX4X1M U193 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n202), .S1(N12), .Y(n188) );
  MX4X1M U194 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n202), .S1(N12), .Y(n192) );
  MX4X1M U195 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n202), .S1(N12), .Y(n196) );
  MX4X1M U196 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n202), .S1(n199), .Y(n1) );
  MX4X1M U197 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n201), .S1(n199), .Y(n9) );
  MX4X1M U198 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n201), .S1(n199), .Y(n178) );
  MX4X1M U199 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n201), .S1(N12), .Y(n182) );
  MX4X1M U200 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n202), .S1(n199), .Y(n186) );
  MX4X1M U201 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n202), .S1(n199), .Y(n190) );
  MX4X1M U202 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n202), .S1(n199), .Y(n194) );
  OAI2BB1X2M U203 ( .A0N(RdData_VLD), .A1N(n13), .B0(n12), .Y(n48) );
  AND2X2M U204 ( .A(N14), .B(n13), .Y(n38) );
  AO22X1M U205 ( .A0(N43), .A1(n220), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U206 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U207 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n199), .Y(n4) );
  MX4X1M U208 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(n199), .Y(n2) );
  AO22X1M U209 ( .A0(N42), .A1(n220), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U210 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U211 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(n199), .Y(n6) );
  MX4X1M U212 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n201), .S1(n199), .Y(n5) );
  AO22X1M U213 ( .A0(N41), .A1(n220), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U214 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41) );
  MX4X1M U215 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(N12), .Y(n177) );
  MX4X1M U216 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n201), .S1(N12), .Y(n10) );
  AO22X1M U217 ( .A0(N40), .A1(n220), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U218 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U219 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(N12), .Y(n181) );
  MX4X1M U220 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n201), .S1(N12), .Y(n179) );
  AO22X1M U221 ( .A0(N39), .A1(n220), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U222 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U223 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n202), 
        .S1(N12), .Y(n185) );
  MX4X1M U224 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n201), .S1(N12), .Y(n183) );
  AO22X1M U225 ( .A0(N38), .A1(n220), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U226 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U227 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n202), 
        .S1(N12), .Y(n189) );
  MX4X1M U228 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n202), .S1(N12), .Y(n187) );
  AO22X1M U229 ( .A0(N37), .A1(n220), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U230 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U231 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n202), 
        .S1(N12), .Y(n193) );
  MX4X1M U232 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n202), .S1(N12), .Y(n191) );
  AO22X1M U233 ( .A0(N36), .A1(n220), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U234 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U235 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n202), 
        .S1(N12), .Y(n197) );
  MX4X1M U236 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n202), .S1(N12), .Y(n195) );
  INVX2M U237 ( .A(N11), .Y(n203) );
  INVX2M U238 ( .A(N12), .Y(n204) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
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
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
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
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
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
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
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

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n14, n13, n15, n11, 
        n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n6), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U33 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U34 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U35 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U39 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[4]), .Y(n35) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
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
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_Comb;

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({n12, n11, n10, n9, n8, 
        n7, n6, n5}), .b({B[7], n4, B[5:0]}), .quotient({N132, N131, N130, 
        N129, N128, N127, N126, N125}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, n12, n11, n10, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, 
        N107, N106, N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, n12, n11, n10, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, 
        N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({n12, n11, n10, n9, n8, 
        n7, n6, n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110, N109}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  OAI2BB1X2M U4 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U7 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U8 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U9 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U10 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U11 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U12 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U13 ( .A0N(n138), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U14 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  AND2X2M U15 ( .A(n99), .B(n105), .Y(n42) );
  INVX2M U16 ( .A(n107), .Y(n138) );
  NOR2BX2M U17 ( .AN(n106), .B(n140), .Y(n37) );
  NOR2BX2M U18 ( .AN(n35), .B(n135), .Y(n31) );
  BUFX2M U19 ( .A(n41), .Y(n13) );
  NOR2X2M U20 ( .A(n107), .B(n140), .Y(n41) );
  AND2X2M U21 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U22 ( .A(n100), .Y(n140) );
  INVX2M U23 ( .A(n91), .Y(n136) );
  NOR3BX2M U24 ( .AN(n105), .B(n137), .C(ALU_FUN[2]), .Y(n49) );
  NOR2X2M U25 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U26 ( .A(n106), .B(n139), .C(n3), .Y(n46) );
  NAND2X2M U27 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U28 ( .A(ALU_FUN[1]), .Y(n137) );
  INVX2M U29 ( .A(ALU_FUN[0]), .Y(n139) );
  NAND2X2M U30 ( .A(EN), .B(n123), .Y(n32) );
  NOR2X2M U31 ( .A(n139), .B(n3), .Y(n105) );
  NOR2X2M U32 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  NAND3X2M U33 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  AND2X2M U34 ( .A(ALU_FUN[2]), .B(n137), .Y(n99) );
  AND4X2M U35 ( .A(N159), .B(n99), .C(n3), .D(n139), .Y(n90) );
  NOR3X2M U36 ( .A(n140), .B(ALU_FUN[2]), .C(n137), .Y(n35) );
  NAND3X2M U37 ( .A(n138), .B(n139), .C(n3), .Y(n36) );
  NAND3X2M U38 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  INVX2M U39 ( .A(EN), .Y(n135) );
  AOI31X2M U40 ( .A0(n93), .A1(n94), .A2(n95), .B0(n135), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U41 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U42 ( .A0(n13), .A1(n134), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U43 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U44 ( .A0(n81), .A1(n82), .A2(n83), .B0(n135), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U45 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U46 ( .A0(n7), .A1(n136), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U47 ( .A0(N126), .A1(n49), .B0(n13), .B1(n133), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U48 ( .A0(n75), .A1(n76), .A2(n77), .B0(n135), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U49 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U50 ( .A0(n8), .A1(n136), .B0(n13), .B1(n132), .C0(n78), .Y(n77)
         );
  AOI222X1M U51 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U52 ( .A0(n69), .A1(n70), .A2(n71), .B0(n135), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U53 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U54 ( .A0(n9), .A1(n136), .B0(n13), .B1(n131), .C0(n72), .Y(n71)
         );
  AOI222X1M U55 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U56 ( .A0(n63), .A1(n64), .A2(n65), .B0(n135), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U57 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U58 ( .A0(n136), .A1(n10), .B0(n13), .B1(n130), .C0(n66), .Y(n65)
         );
  AOI222X1M U59 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U60 ( .A0(n51), .A1(n52), .A2(n53), .B0(n135), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U61 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U62 ( .A0(n136), .A1(n12), .B0(n13), .B1(n128), .C0(n54), .Y(n53)
         );
  AOI222X1M U63 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  AOI31X2M U64 ( .A0(n57), .A1(n58), .A2(n59), .B0(n135), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U65 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U66 ( .A0(n136), .A1(n11), .B0(n13), .B1(n129), .C0(n60), .Y(n59)
         );
  AOI222X1M U67 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U68 ( .A0(n38), .A1(n39), .A2(n40), .B0(n135), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U69 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U70 ( .A0(n13), .A1(n127), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U71 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U72 ( .A0(n33), .A1(n34), .B0(n135), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U73 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U74 ( .B0(N117), .B1(n35), .A0N(n127), .A1N(n36), .Y(n34) );
  OAI222X1M U75 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n129), 
        .Y(n54) );
  AOI221XLM U76 ( .A0(n11), .A1(n46), .B0(n47), .B1(n128), .C0(n13), .Y(n56)
         );
  AOI221XLM U77 ( .A0(n46), .A1(n128), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U78 ( .A(n4), .Y(n122) );
  INVX2M U79 ( .A(n92), .Y(n123) );
  AOI211X2M U80 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  BUFX2M U81 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U82 ( .A(n6), .Y(n133) );
  INVX2M U83 ( .A(n5), .Y(n134) );
  INVX2M U84 ( .A(n11), .Y(n128) );
  INVX2M U85 ( .A(n12), .Y(n127) );
  INVX2M U86 ( .A(n8), .Y(n131) );
  INVX2M U87 ( .A(n7), .Y(n132) );
  INVX2M U88 ( .A(n10), .Y(n129) );
  INVX2M U89 ( .A(n9), .Y(n130) );
  BUFX2M U90 ( .A(B[6]), .Y(n4) );
  BUFX2M U91 ( .A(A[7]), .Y(n12) );
  BUFX2M U92 ( .A(A[5]), .Y(n10) );
  BUFX2M U93 ( .A(A[4]), .Y(n9) );
  BUFX2M U94 ( .A(A[3]), .Y(n8) );
  BUFX2M U95 ( .A(A[2]), .Y(n7) );
  BUFX2M U96 ( .A(A[1]), .Y(n6) );
  BUFX2M U97 ( .A(A[0]), .Y(n5) );
  INVX2M U98 ( .A(n25), .Y(n120) );
  OAI2B2X1M U99 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n133), .Y(n97) );
  AOI221XLM U100 ( .A0(n46), .A1(n134), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U101 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n134), .Y(n85) );
  AOI221XLM U102 ( .A0(n46), .A1(n133), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  OAI222X1M U103 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n133), .Y(n78) );
  AOI221XLM U104 ( .A0(n7), .A1(n46), .B0(n47), .B1(n132), .C0(n13), .Y(n80)
         );
  AOI221XLM U105 ( .A0(n46), .A1(n132), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U106 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n132), .Y(n72) );
  AOI221XLM U107 ( .A0(n8), .A1(n46), .B0(n47), .B1(n131), .C0(n13), .Y(n74)
         );
  AOI221XLM U108 ( .A0(n46), .A1(n131), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U109 ( .A0(n67), .A1(n126), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n131), .Y(n66) );
  INVX2M U110 ( .A(B[4]), .Y(n126) );
  AOI221XLM U111 ( .A0(n9), .A1(n46), .B0(n47), .B1(n130), .C0(n13), .Y(n68)
         );
  AOI221XLM U112 ( .A0(n46), .A1(n130), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U113 ( .A0(n61), .A1(n125), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n130), .Y(n60) );
  INVX2M U114 ( .A(B[5]), .Y(n125) );
  AOI221XLM U115 ( .A0(n10), .A1(n46), .B0(n47), .B1(n129), .C0(n13), .Y(n62)
         );
  AOI221XLM U116 ( .A0(n46), .A1(n129), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U117 ( .A0(n44), .A1(n124), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n128), .Y(n43) );
  INVX2M U118 ( .A(B[7]), .Y(n124) );
  AOI221XLM U119 ( .A0(n46), .A1(n12), .B0(n47), .B1(n127), .C0(n13), .Y(n45)
         );
  AOI221XLM U120 ( .A0(n46), .A1(n127), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U121 ( .A(n14), .Y(n118) );
  OAI21X2M U122 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U123 ( .A0(n5), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n102)
         );
  AOI31X2M U124 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U125 ( .A(n137), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U126 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U127 ( .A0(n6), .A1(n46), .B0(n47), .B1(n133), .C0(n13), .Y(n87)
         );
  AOI31X2M U128 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U129 ( .A(n139), .B(ALU_FUN[2]), .C(n137), .Y(n89) );
  INVX2M U130 ( .A(B[0]), .Y(n117) );
  INVX2M U131 ( .A(B[2]), .Y(n119) );
  INVX2M U132 ( .A(B[3]), .Y(n121) );
  NOR2X1M U133 ( .A(n127), .B(B[7]), .Y(n113) );
  NAND2BX1M U134 ( .AN(B[4]), .B(n9), .Y(n29) );
  NAND2BX1M U135 ( .AN(n9), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U136 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U137 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U138 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U139 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U140 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U141 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U142 ( .A0(n14), .A1(n133), .B0(B[1]), .Y(n15) );
  AOI211X1M U143 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U144 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U145 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U146 ( .AN(n10), .B(B[5]), .Y(n111) );
  OAI211X1M U147 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U148 ( .AN(B[5]), .B(n10), .Y(n30) );
  XNOR2X1M U149 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U150 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n128), .Y(n21)
         );
  CLKNAND2X2M U151 ( .A(B[7]), .B(n127), .Y(n114) );
  OAI21X1M U152 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U153 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U154 ( .A0(n24), .A1(n133), .B0(B[1]), .Y(n22) );
  AOI211X1M U155 ( .A0(n24), .A1(n133), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U156 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U157 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U158 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U159 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  CLKINVX1M U160 ( .A(n116), .Y(N158) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   RST_N_REF, RST_N_UART, data_valid, data_valid_sync, wr_inc,
         UART_TX_CLK, busy_pulse, FIFO_empty, busy_lvl, UART_RX_CLK,
         rd_data_valid, ALU_OUT_VALID, ALU_EN, CLK_EN, wr_en, rd_en, ALU_CLK,
         n1, n2, n3, n4, n5, n6, n7, n8, n9;
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

  RST_SYNC_0 REF_CLK_domain_RST_SYNC ( .clk(REF_CLK), .rst(RST_N), .sync_rst(
        RST_N_REF) );
  RST_SYNC_1 UART_CLK_domain_RST_SYNC ( .clk(UART_CLK), .rst(RST_N), 
        .sync_rst(RST_N_UART) );
  DATA_SYNCH_bus_width8 DATA_SYNCH ( .unsync_bus(UART_P_DATA), .bus_enable(
        data_valid), .clk(REF_CLK), .rst(n8), .sync_bus(UART_P_DATA_sync), 
        .enable_pulse(data_valid_sync) );
  FIFO_TOP_data_width8_address_width3 ASYNC_FIFO ( .w_clk(REF_CLK), .wrst_n(n8), .w_inc(wr_inc), .w_data(ASYNC_FIFO_wr_Data), .r_clk(UART_TX_CLK), .rrst_n(n6), .r_inc(busy_pulse), .rempty(FIFO_empty), .r_data(ASYNC_FIFO_RD_Data) );
  PULSE_GEN PULSE_GEN ( .clk(UART_TX_CLK), .rst(n6), .lvl_sig(busy_lvl), 
        .pulse_sig(busy_pulse) );
  CLK_DIV_0 CLK_DIV_UART_TX ( .i_ref_clk(UART_CLK), .i_rstn(n6), .i_clk_en(
        1'b1), .i_divide_ratio(REG3), .gen_clk(UART_TX_CLK) );
  CLKDIV_MUX_WIDTH8 CLKDIV_MUX ( .IN({REG2[7:5], n4, REG2[3:2]}), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        i_divide_ratio_RX[3:0]}) );
  CLK_DIV_1 CLK_DIV_UART_RX ( .i_ref_clk(UART_CLK), .i_rstn(n6), .i_clk_en(
        1'b1), .i_divide_ratio({1'b0, 1'b0, 1'b0, 1'b0, i_divide_ratio_RX[3:0]}), .gen_clk(UART_RX_CLK) );
  UART_RX_TOP UART_RX ( .clk(UART_RX_CLK), .rstn(n6), .RX_IN(UART_RX_IN), 
        .prescale({REG2[7:5], n4, REG2[3:2]}), .parity_enable(REG2[0]), 
        .parity_type(REG2[1]), .P_DATA(UART_P_DATA), .parity_error(
        parity_error), .stop_error(framing_error), .data_valid(data_valid) );
  UART_TX_TOP UART_TX ( .clk(UART_TX_CLK), .rstn(n6), .P_DATA(
        ASYNC_FIFO_RD_Data), .data_valid(n1), .par_typ(REG2[1]), .par_en(
        REG2[0]), .TX_OUT(UART_TX_O), .busy(busy_lvl) );
  SYS_CTRL SYS_CTRL ( .CLK(REF_CLK), .RST(n8), .RX_P_DATA(UART_P_DATA_sync), 
        .RX_D_VLD(data_valid_sync), .RdData(rd_data), .RdData_Valid(
        rd_data_valid), .ALU_OUT(ALU_OUT), .OUT_Valid(ALU_OUT_VALID), .ALU_EN(
        ALU_EN), .ALU_FUN(ALU_FUN), .CLK_EN(CLK_EN), .Address(addr), .WrEn(
        wr_en), .RdEn(rd_en), .WrData(wr_data), .TX_P_DATA(ASYNC_FIFO_wr_Data), 
        .TX_D_VLD(wr_inc) );
  RegFile_WIDTH8_DEPTH16_ADDR4 reg_file ( .CLK(REF_CLK), .RST(n8), .WrEn(wr_en), .RdEn(rd_en), .Address({addr[3:2], n3, n2}), .WrData(wr_data), .RdData(
        rd_data), .RdData_VLD(rd_data_valid), .REG0(REG0), .REG1(REG1), .REG2(
        REG2), .REG3(REG3) );
  ALU_OPER_WIDTH8_OUT_WIDTH16 ALU ( .A(REG0), .B(REG1), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK(ALU_CLK), .RST(n8), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VALID) );
  CLK_GATE CLK_GATE ( .CLK_EN(CLK_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK) );
  INVX2M U2 ( .A(FIFO_empty), .Y(n1) );
  BUFX2M U3 ( .A(addr[0]), .Y(n2) );
  BUFX2M U4 ( .A(addr[1]), .Y(n3) );
  INVX4M U5 ( .A(n9), .Y(n8) );
  INVX2M U6 ( .A(RST_N_REF), .Y(n9) );
  INVX4M U7 ( .A(n7), .Y(n6) );
  INVX2M U8 ( .A(RST_N_UART), .Y(n7) );
  INVX2M U9 ( .A(n5), .Y(n4) );
  INVX2M U10 ( .A(REG2[4]), .Y(n5) );
endmodule

