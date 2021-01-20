//Verilog HDL for "Digital_Lib", "Inverter" "functional"


module Inverter (in, out);

input in;
output out;

assign out = ~in;

endmodule
