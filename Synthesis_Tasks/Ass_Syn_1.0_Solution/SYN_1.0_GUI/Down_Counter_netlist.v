/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Tue Sep  3 04:03:00 2024
/////////////////////////////////////////////////////////////


module Down_Counter ( clock, in, latch, dec, zero );
  input [3:0] in;
  input clock, latch, dec;
  output zero;
  wire   N9, N10, N11, N12, N13, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42;
  wire   [3:0] counter;

  EDFFHQX2M \counter_reg[3]  ( .D(N13), .E(N9), .CK(clock), .Q(counter[3]) );
  EDFFHQX2M \counter_reg[2]  ( .D(N12), .E(N9), .CK(clock), .Q(counter[2]) );
  EDFFHQX2M \counter_reg[1]  ( .D(N11), .E(N9), .CK(clock), .Q(counter[1]) );
  EDFFHQX2M \counter_reg[0]  ( .D(N10), .E(N9), .CK(clock), .Q(counter[0]) );
  CLKINVX1M U35 ( .A(n33), .Y(zero) );
  CLKNAND2X2M U36 ( .A(n34), .B(n35), .Y(N9) );
  OAI31X1M U37 ( .A0(n36), .A1(n37), .A2(n35), .B0(n38), .Y(N13) );
  CLKNAND2X2M U38 ( .A(latch), .B(in[3]), .Y(n38) );
  OAI2BB2X1M U39 ( .B0(n39), .B1(n35), .A0N(in[2]), .A1N(latch), .Y(N12) );
  AOI21X1M U40 ( .A0(counter[2]), .A1(n40), .B0(n37), .Y(n39) );
  OAI2BB2X1M U41 ( .B0(n41), .B1(n35), .A0N(in[1]), .A1N(latch), .Y(N11) );
  AOI21X1M U42 ( .A0(counter[1]), .A1(counter[0]), .B0(n42), .Y(n41) );
  OAI2BB2X1M U43 ( .B0(counter[0]), .B1(n35), .A0N(in[0]), .A1N(latch), .Y(N10) );
  NAND3X1M U44 ( .A(n33), .B(n34), .C(dec), .Y(n35) );
  CLKINVX1M U45 ( .A(latch), .Y(n34) );
  CLKNAND2X2M U46 ( .A(n37), .B(n36), .Y(n33) );
  CLKINVX1M U47 ( .A(counter[3]), .Y(n36) );
  NOR2X1M U48 ( .A(n40), .B(counter[2]), .Y(n37) );
  CLKINVX1M U49 ( .A(n42), .Y(n40) );
  NOR2X1M U50 ( .A(counter[1]), .B(counter[0]), .Y(n42) );
endmodule

