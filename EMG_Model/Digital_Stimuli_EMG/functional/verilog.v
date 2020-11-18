//Verilog HDL for "EMG_Model", "Digital_Stimuli_EMG" "functional"


module Digital_Stimuli_EMG (input CLK, input Reset, output reg[3:0] CH_Sel, output reg start );


reg[3:0] cnt;

initial begin
	CH_Sel <= 4'b0000;
	start <= 1'b0;
	cnt <= 4'b0000;
end


always@(posedge CLK or posedge Reset) begin

	if (Reset == 1'b1) begin
		CH_Sel <= 0;
		cnt <= 0;
    end else begin
  		cnt <= cnt + 1; 	
		
		if(cnt == 4'b1101) begin
			cnt <= 0;
			start <= ~start;
		
			if (CH_Sel == 4'b1111)
       			CH_Sel <= 4'b0000;
      		else
       			CH_Sel <= CH_Sel + 1;
		end

    end
end
endmodule