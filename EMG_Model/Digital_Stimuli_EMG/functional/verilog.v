
	//Verilog HDL for "EMG_Model", "Digital_Stimuli_EMG" "functional"


module Digital_Stimuli_EMG (input CLK, input Reset, output reg[3:0] CH_Sel, output reg start );


integer count, end_count;

initial begin
	CH_Sel <= 4'b0000;
	start <= 1'b0;
	count = 0;
	end_count = 13;
end


always@(posedge CLK or posedge Reset) begin

	if (Reset == 1'b1) begin
		CH_Sel <= 0;
 		count = 0;   
	end else begin
  		if(count == 0) begin
			start <= 1'b1;
		end else begin
			start <= 1'b0;
		end		
		
		count = count + 1; 	
		
		if(count == end_count) begin
			count = 0;
			if (CH_Sel == 4'b1111) begin
       			CH_Sel <= 4'b0000;
      		end else begin
       			CH_Sel <= CH_Sel + 1;
			end
		end
    end
end
endmodule
