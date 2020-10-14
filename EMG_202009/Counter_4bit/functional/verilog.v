//Verilog HDL for "EMG_202009", "Counter_4bit" "functional"


module Counter_4bit (Q, Clk, Reset );

output[3:0] Q;
input Clk, Reset;

reg[3:0] tmp;

initial tmp = 4'b0000;

always@(posedge Clk or posedge Reset) begin
	
	if(Reset)
		tmp = 4'b0000;
	else
		tmp = tmp + 1'b1;
end
	
assign Q = tmp;

endmodule
