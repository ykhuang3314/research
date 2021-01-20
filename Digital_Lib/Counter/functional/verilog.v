//Verilog HDL for "Digital_Lib", "Counter" "functional"


module Counter #( 
	// block parameters
	parameter WIDTH = 5, // number of bits in the counter
	parameter START = 0, // counting from the START value to the END value
	parameter END = 31,
	parameter STEP = 1 // counting step
	)(
	//output port
	output reg [WIDTH-1:0] out,
	input CLK,
	input RESET,
	input EN
	);

initial begin
	out <= START;
end

always@(posedge CLK) begin
	if(RESET == 1) begin
		out <= START;
	end else begin
		if(EN ==1) begin
			if(out == 31)
				out <= START;
			else
				out <= out + STEP;
		end
	end		
end

endmodule
