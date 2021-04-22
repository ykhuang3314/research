// Created by ihdl
`timescale 1ns/10ps

`celldefine

module IN_3VX2 (A, Q);
//*****************************************************************
//   technology       : 180 nm bulk CMOS
//   module name      : IN_3VX2
//   version          : 2.1.0, Mon Mar  5 07:15:19 2018
//   cell_description : Inverter
//   last modified by : XLICDD generated
//****************************************************************************

   input     A;
   output    Q;

// Function Q: !(A)
   not       i0  (Q, A);

// timing section:
   specify

      (A -=> Q) = (0.02, 0.02);

   endspecify
endmodule

`endcelldefine
