// Created by ihdl
`timescale 1ns/10ps

`celldefine

module AND2HDLLX0 (A, B, Q);
//*****************************************************************
//   technology       : 180 nm bulk CMOS
//   module name      : AND2HDLLX0
//   version          : 2.1.0, Wed Jan 24 08:49:57 2018
//   cell_description : 2-Input AND
//   last modified by : XLICDD generated
//****************************************************************************

   input     A, B;
   output    Q;

// Function Q: (A*B)
   and       i0  (Q, A, B);

// timing section:
   specify

      (A +=> Q) = (0.02, 0.02);
      (B +=> Q) = (0.02, 0.02);

   endspecify
endmodule

`endcelldefine
