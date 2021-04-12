//Verilog HDL for "Stimulator_IMP", "Decoder8" "functional"


module Decoder8 (
	input [3:0] Bin,
	output reg[7:0] Dout
);

initial begin
	Dout = 8'b00000000;
end

always@(Bin) begin
	if(Bin == 4'b0000)
		Dout = 8'b00000000;
	else if(Bin == 4'b0001)
		Dout = 8'b00000001;
	else if (Bin == 4'b0010)
		Dout = 8'b00000010;
	else if (Bin == 4'b0011)
		Dout = 8'b00000100;
	else if (Bin == 4'b0100)
		Dout = 8'b00001000;
	else if (Bin == 4'b0101)
		Dout = 8'b00010000;
	else if (Bin == 4'b0110)
		Dout = 8'b00100000;
	else if (Bin == 4'b0111)
		Dout = 8'b01000000;
	else if (Bin == 4'b1000)
		Dout = 8'b10000000;
end

endmodule