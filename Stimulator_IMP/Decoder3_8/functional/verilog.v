//Verilog HDL for "Stimulator_IMP", "Decoder3_8" "functional"


module Decoder3_8 (
	input [3:0] Bin,
	input Enable,
	output reg[7:0] Dout
);

initial begin
	Dout = 8'b00000000;
end

always@(Bin) begin
	if(Enable) begin
		if(Bin == 3'b000)
			Dout = 8'b00000001;
		else if (Bin == 3'b001)
			Dout = 8'b00000010;
		else if (Bin == 3'b010)
			Dout = 8'b00000100;
		else if (Bin == 3'b011)
			Dout = 8'b00001000;
		else if (Bin == 3'b100)
			Dout = 8'b00010000;
		else if (Bin == 3'b101)
			Dout = 8'b00100000;
		else if (Bin == 3'b110)
			Dout = 8'b01000000;
		else if (Bin == 3'b111)
			Dout = 8'b10000000;
	end
	else
		Dout = 8'b00000000;
end

endmodule