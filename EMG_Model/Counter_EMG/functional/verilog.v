//Verilog HDL for "EMG_Model", "Counter_EMG" "functional"


module Counter_EMG
	# (parameter Max_Count = 16, 
       parameter Bits = 4)
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