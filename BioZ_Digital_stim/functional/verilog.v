//Verilog HDL for "BioZ_EMG_Model", "BioZ_Digital_stim" "functional"


module BioZ_Digital_stim (Fsel,StepNum,Gain_TCA_SigGen,CountEnable,Resetn,Clk_En,G_CTRL_TCA_AFE,G_CTRL_TIA_AFE,ADC_En,ADC_Start,Dir,Row,Col,clk_ADC);

input clk_ADC;
output [3:0] Fsel;
output [1:0] Row, Col, Gain_TCA_SigGen;
output StepNum,CountEnable,Resetn,Clk_En,G_CTRL_TCA_AFE,G_CTRL_TIA_AFE,ADC_En,ADC_Start,Dir;

//parameter cycle = 1428; // 700 kHz
parameter cycle = 4500000; // 4.5 ms

parameter [3:0] freq_selection = 4'b1010;
parameter ADC_clk_cycle = 14; // ADC takes 15 clock cycles to convert

reg StepNum,CountEnable,Resetn,Clk_En,G_CTRL_TCA_AFE,G_CTRL_TIA_AFE,ADC_En,ADC_Start,Dir;
reg [3:0] Fsel;
reg [1:0] Row, Col, Gain_TCA_SigGen;

integer cnt_conv;

initial begin
	StepNum = 0;
	Gain_TCA_SigGen = 2'b10;
	CountEnable = 1;
	Fsel = freq_selection;
	Resetn = 1;
	Clk_En = 1;

	G_CTRL_TCA_AFE = 1;
	G_CTRL_TIA_AFE = 1;
	ADC_En = 0;
	ADC_Start = 0;
	cnt_conv = 0;

	Dir = 1;
	Row = 2'b00;
	Col = 2'b00;

	#200 Resetn = 0; Clk_En = 0; ADC_En = 0;
	#400 Resetn = 1; Clk_En = 1; ADC_En = 1;
end 

always begin
	#(cycle) Fsel = Fsel - 1;
//	case (Fsel)
		//4'b1010: #(1e6/0.9765625) Fsel = Fsel - 1;
		//4'b1001: #(1e6/1.95215) Fsel = Fsel - 1;
		//4'b1000: #(1e6/3.90625) Fsel = Fsel - 1;
		//4'b0111: #(1e6/7.8125) Fsel = Fsel - 1;
		//4'b0110: #(1e6/15.625) Fsel = Fsel - 1;
		//4'b0101: #(1e6/31.25) Fsel = Fsel - 1;
		//4'b0100: #(1e6/62.5) Fsel = Fsel - 1;
		//4'b0011: #(1e6/125) Fsel = Fsel - 1;
		//4'b0010: #(1e6/250) Fsel = Fsel - 1;
		//4'b0001: #(1e6/500) Fsel = Fsel - 1;
		//4'b0000: #(1e6/1e3) Fsel = Fsel - 1;
//	endcase
end

always@(posedge clk_ADC) begin
	
	if(cnt_conv < ADC_clk_cycle) begin
		cnt_conv = cnt_conv +1;
	end else begin
		cnt_conv = 0;
	end
	
	if(cnt_conv == 1) begin
		ADC_Start <= 1'b1;
	end else if(cnt_conv == 2) begin
		ADC_Start <= 1'b0;
	end
end

endmodule
