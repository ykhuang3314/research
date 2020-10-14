//Verilog HDL for "EMG_202009", "Digital_Stimuli_Mux4" "functional"

`timescale 1ms/10ps

module Digital_Stimuli_Mux4 (Sel_Mux4);

output Sel_Mux4;

reg[1:0] Sel_Mux4;

initial begin

	Sel_Mux4 = 2'b00;
	#25 Sel_Mux4 = 2'b01;
	#25 Sel_Mux4 = 2'b10;
	#25 Sel_Mux4 = 2'b11;

end
endmodule
