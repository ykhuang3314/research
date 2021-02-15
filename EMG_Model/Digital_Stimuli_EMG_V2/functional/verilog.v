//Verilog HDL for "EMG_Model", "Digital_Stimuli_EMG_V2" "functional"


module Digital_Stimuli_EMG_V2 (
		input Enable, 
		input RESET,
		output reg CLK_EMG,
		output reg EN_ADC_EMG, 
		output reg[3:0] CH_SEL_EMG, 
		output reg START_EMG, 
		output reg MUX_CLK_EMG );

integer cnt_conv, cnt_ch;

real clk_rate, clk_period, mux_clk_rate, mux_clk_period;

parameter num_of_channel = 16; 
parameter sampling_rate = 2; // in kHz/channel
parameter ADC_clk_cycle = 15; // ADC takes 15 clock cycles to convert

initial begin

	//derive clock frequecny 
	clk_rate = sampling_rate	* num_of_channel * ADC_clk_cycle; // in kHz
	clk_period = 1/clk_rate * 1e6; // in ns
	mux_clk_rate = sampling_rate	* ADC_clk_cycle; // in kHz
	mux_clk_period = 1/mux_clk_rate * 1e6; // in ns
	
	cnt_conv = 0;
	cnt_ch = 1;

	// initial value for all REG
	EN_ADC_EMG <= 1'b0;
	CH_SEL_EMG <= 4'b0000;
	START_EMG <= 1'b0;
	CLK_EMG <= 1'b0;
	MUX_CLK_EMG <= 1'b0;
	
end

always begin
	// generate clock for ADC
	#(clk_period/2) CLK_EMG = ~CLK_EMG;
end

always begin
	// generate clock for analog mux
	#(mux_clk_period/2) MUX_CLK_EMG = ~MUX_CLK_EMG;
end

always@(posedge CLK_EMG or posedge RESET ) begin
	if(RESET == 1'b1) begin
		EN_ADC_EMG <= 1'b0;
		CH_SEL_EMG <= 4'b0000;
		START_EMG <= 1'b0;
		CLK_EMG <= 1'b0;
		MUX_CLK_EMG <= 1'b0;
	end
	
	if(cnt_conv < ADC_clk_cycle) begin
		cnt_conv = cnt_conv +1;
	end else begin
		cnt_conv = 0;
	end
	
	if(cnt_conv == 0) begin
		EN_ADC_EMG <= 1'b1;
	end else if(cnt_conv == 1) begin
		START_EMG <= 1'b1;
	end else if(cnt_conv == 2) begin
		START_EMG <= 1'b0;
	end else if(cnt_conv == ADC_clk_cycle) begin
		EN_ADC_EMG <= 1'b0;
		if(cnt_ch < num_of_channel) begin
			cnt_ch = cnt_ch + 1;
			CH_SEL_EMG <= CH_SEL_EMG + 1;
		end else begin
			cnt_ch = 1;
			CH_SEL_EMG <= 4'b0000;
		end 
			
	end

end
		
endmodule
