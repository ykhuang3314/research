//Verilog HDL for "EMG_Model", "Digital_Stimulus_all" "functional"


module Digital_Stimulus_all (
	input ENABLE,
	input RESET,
	input CH_SWEEP_ST,
	input RAMP_ST,
	output wire ADC_CLK_EMG,
	output wire MUX_CLK_EMG,
	output wire EN_ADC_EMG,
	output wire START_EMG,
	output wire[3:0] CH_SEL_EMG,
	output wire EN_ST,
	output wire ANO_ST,
	output wire CAT_ST,
	output wire DIS_ST,
	output wire[1:0] CH_SEL_ST,
	output wire[4:0] MAG_ST,
	output wire[3:0] Fsel_BioZ,
	output wire StepNum_BioZ,
	output wire CountEnable_Bioz,
	output wire Restn_BioZ,
	output wire Clk_En_BioZ,
	output wire ADC_En_BioZ,
	output wire ADC_Start_BioZ,
	output wire Gain_TCA_SigGen_BioZ,
	output wire G_CTRL_TCA_AFE_BioZ,
	output wire G_CTRL_TIA_AFE_BioZ
);

// ST parameters 
parameter period = 500; // in us
parameter CAT_phase = 150; // in us
parameter ANO_phase = 150; // in us
parameter DIS_phase = 10; // in us
parameter InterPulseDelay = 10; // in us
parameter MAG = 10; // in mA
parameter Channel = 1; 
parameter duration_ch = 5; //in stimulus period
parameter num_of_ch_ST = 4;

// EMG parameters
parameter num_of_ch_EMG = 16; 
parameter sampling_rate = 2; // in kHz/channel
parameter ADC_clk_cycle = 15; // ADC takes 15 clock cycles to convert

// BioZ parameters
parameter cycle_BioZ = 4500000; // 4.5 ms
parameter [3:0] freq_selection_BioZ = 4'b0000;

// instantiate modules

Digital_Stimuli_EMG_V2 #(
	.num_of_channel(num_of_ch_EMG),
	.sampling_rate(sampling_rate),
	.ADC_clk_cycle(ADC_clk_cycle)
	) digital_EMG 
	(
	.Enable(ENABLE),
	.RESET(RESET),
	.CLK_EMG(ADC_CLK_EMG),
	.EN_ADC_EMG(EN_ADC_EMG),
	.CH_SEL_EMG(CH_SEL_EMG[3:0]),
	.START_EMG(START_EMG),
	.MUX_CLK_EMG(MUX_CLK_EMG)
	);

Digital_Stimulus_ST_V2 #(
	.period(period),
	.CAT_phase(CAT_phase),
	.ANO_phase(ANO_phase),
	.DIS_phase(DIS_phase),
	.InterPulseDelay(InterPulseDelay),
	.MAG(MAG),
	.Channel(Channel),
	.duration_ch(duration_ch),
	.num_of_ch(num_of_ch_ST)
	) digital_ST
	(
	.enable(ENABLE),
	.ramping(RAMP_ST),
	.ch_sweeping(CH_SWEEP_ST),
	.EN_ST(EN_ST),
	.ANO_ST(ANO_ST),
	.CAT_ST(CAT_ST),
	.DIS_ST(DIS_ST),
	.CH_SEL_ST(CH_SEL_ST[1:0]),
	.MAG_ST(MAG_ST[4:0])
	);

BioZ_Digital_stim #(
	.cycle(cycle_BioZ),
	.freq_selection(freq_selection_BioZ)
	) digital_BioZ
	(
	.Fsel(Fsel_BioZ[3:0]),
	.StepNum(StepNum_BioZ),
	.Gain_TCA_SigGen(Gain_TCA_SigGen_BioZ),
	.CountEnable(CountEnable_BioZ),
	.Resetn(Resetn_BioZ),
	.Clk_En(Clk_En_BioZ),
	.G_CTRL_TCA_AFE(G_CTRL_TCA_AFE_BioZ),
	.G_CTRL_TIA_AFE(G_CTRL_TIA_AFE_BioZ),
	.ADC_En(ADC_En_BioZ),
	.ADC_Start(ADC_Start_BioZ)
	);

endmodule
