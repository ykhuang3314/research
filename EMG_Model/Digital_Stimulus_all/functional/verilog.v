//Verilog HDL for "EMG_Model", "Digital_Stimulus_all" "functional"


module Digital_Stimulus_all (
	input ENABLE,
	input RESET,
	input CH_SWEEP_ST,
	input RAMP_ST,
	input clk_ADC_BioZ,
	output wire ADC_CLK_EMG,
	output wire MUX_CLK_EMG,
	output wire EN_ADC_EMG,
	output wire START_EMG,
	output wire[3:0] CH_SEL_EMG,
	output wire[2:0] GAIN_EMG,
	output wire EN_ST,
	output wire ANO_ST,
	output wire CAT_ST,
	output wire DIS_ST,
	output wire[1:0] CH_SEL_U_ST,
	output wire[1:0] CH_SEL_D_ST,
	output wire[4:0] MAG_ST,
	output wire[3:0] Fsel_BioZ,
	output wire Dir_Bioz,
	output wire[1:0] Row_BioZ,
	output wire[1:0] Col_BioZ,
	output wire[1:0] Gain_TCA_SigGen_BioZ,
	output wire[2:0] SenseMode_BioZ,
	output wire StepNum_BioZ,
	output wire CountEnable_Bioz,
	output wire Restn_BioZ,
	output wire Clk_En_BioZ,
	output wire ADC_En_BioZ,
	output wire ADC_Start_BioZ,
	output wire G_CTRL_TCA_AFE_BioZ,
	output wire G_CTRL_TIA_AFE_BioZ
);

// ST parameters 
parameter period_ST = 500; // in us
parameter CAT_phase_ST = 150; // in us
parameter ANO_phase_ST = 150; // in us
parameter DIS_phase_ST = 5; // in us
parameter InterPulseDelay_ST = 10; // in us
parameter Imag_ST = 5'b01001; // in mA
parameter Channel_UP_ST = 2'b00;
parameter Channel_DOWN_ST = 2'b01;
parameter duration_ch_ST = 5; //in stimulus period
parameter num_of_ch_ST = 4;
parameter delay_discharge_ST = 1; // in us

// EMG parameters
parameter num_of_ch_EMG = 16; 
parameter sampling_rate_EMG = 2; // in kHz/channel
parameter ADC_clk_cycle_EMG = 13; // ADC takes 13 clock cycles to convert
parameter VGA_Gain_EMG = 3'b111;

// BioZ parameters
parameter cycle_BioZ = 4500000; // 4.5 ms
parameter [3:0] freq_selection_BioZ = 4'b1010;
parameter ADC_clk_cycle_BioZ = 13;

// instantiate modules

Digital_Stimuli_EMG_V2 #(
	.num_of_channel(num_of_ch_EMG),
	.sampling_rate(sampling_rate_EMG),
	.ADC_clk_cycle(ADC_clk_cycle_EMG),
	.VGA_Gain(VGA_Gain_EMG)
	) digital_EMG 
	(
	.Enable(ENABLE),
	.RESET(RESET),
	.CLK_EMG(ADC_CLK_EMG),
	.EN_ADC_EMG(EN_ADC_EMG),
	.CH_SEL_EMG(CH_SEL_EMG[3:0]),
	.START_EMG(START_EMG),
	.MUX_CLK_EMG(MUX_CLK_EMG),
	.GAIN_EMG(GAIN_EMG)
	);

Digital_Stimulus_ST_V2 #(
	.period(period_ST),
	.CAT_phase(CAT_phase_ST),
	.ANO_phase(ANO_phase_ST),
	.DIS_phase(DIS_phase_ST),
	.InterPulseDelay(InterPulseDelay_ST),
	.MAG(Imag_ST),
	.Channel_UP(Channel_UP_ST),
	.Channel_DOWN(Channel_DOWN_ST),
	.duration_ch(duration_ch_ST),
	.num_of_ch(num_of_ch_ST),
	.delay_discharge(delay_discharge_ST)
	) digital_ST
	(
	.enable(ENABLE),
	.ramping(RAMP_ST),
	.ch_sweeping(CH_SWEEP_ST),
	.EN_ST(EN_ST),
	.ANO_ST(ANO_ST),
	.CAT_ST(CAT_ST),
	.DIS_ST(DIS_ST),
	.CH_SEL_U_ST(CH_SEL_U_ST[1:0]),
	.CH_SEL_D_ST(CH_SEL_D_ST[1:0]),	
	.MAG_ST(MAG_ST[4:0])
	);

BioZ_Digital_stim #(
	.cycle(cycle_BioZ),
	.freq_selection(freq_selection_BioZ),
	.ADC_clk_cycle(ADC_clk_cycle_BioZ)
	) digital_BioZ
	(
	.Fsel(Fsel_BioZ[3:0]),
	.StepNum(StepNum_BioZ),
	.CountEnable(CountEnable_BioZ),
	.Resetn(Resetn_BioZ),
	.Clk_En(Clk_En_BioZ),
	.G_CTRL_TCA_AFE(G_CTRL_TCA_AFE_BioZ),
	.G_CTRL_TIA_AFE(G_CTRL_TIA_AFE_BioZ),
	.ADC_En(ADC_En_BioZ),
	.ADC_Start(ADC_Start_BioZ),
	.Row(Row_BioZ[1:0]),
	.Col(Col_BioZ[1:0]),
	.Dir(Dir_BioZ),
	.Gain_TCA_SigGen(Gain_TCA_SigGen_BioZ[1:0]),
	.SenseMode(SenseMode_BioZ[2:0])
	);

endmodule
