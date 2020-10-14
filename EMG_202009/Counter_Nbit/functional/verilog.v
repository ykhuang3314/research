//Verilog HDL for "EMG_202009", "Counter_Nbit" "functional"


module Counter_Nbit
	# (parameter Max_Count = 7, 
       parameter Bits = 3)
	(input Clk,   
	 input Reset,
   	 output reg[Bits-1:0] out);

initial begin
	out <= 0;
end

always @ (posedge Clk) begin
	if (Reset) begin
		out <= 0;
    end else begin
      	if (out == Max_Count)
       		 out <= 0;
      	else
       		 out <= out + 1;
    end
end

endmodule
