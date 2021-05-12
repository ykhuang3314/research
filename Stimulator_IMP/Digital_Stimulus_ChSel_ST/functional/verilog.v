//Verilog HDL for "Stimulator_IMP", "Digital_Stimulus_ChSel_ST" "functional"


module Digital_Stimulus_ChSel_ST ( 		
		output reg EN_ST,
		output reg[4:0] MAG_ST,
		output reg[2:0] ChSel_HS,
		output reg[2:0] ChSel_LS
);


// parameters 
parameter ST_period = 500; // in us
parameter CAT_phase = 150; // in us
parameter ANO_phase = 150; // in us
parameter InterPulseDelay = 10; // in us
parameter MAG = 5'b11111; // in mA
parameter Ramping = 1'b0;
parameter Ch_Sweeping = 1'b0; 
parameter Ch_ANO = 3'b001;
parameter Ch_CAT = 3'b010;


real period_ns;
real CAT_phase_ns;
real ANO_phase_ns;
real IPD_ns;
real Rest_ns;
reg [2:0] ChSel_ANO, ChSel_CAT;

initial begin
	// convert to ns
	period_ns = ST_period * 1e3;
	CAT_phase_ns = CAT_phase * 1e3;
	ANO_phase_ns = ANO_phase * 1e3;
	IPD_ns = InterPulseDelay * 1e3;
	Rest_ns = period_ns - CAT_phase_ns - ANO_phase_ns - IPD_ns;
	
	//initialize
	EN_ST <= 1'b0;
	ChSel_ANO <= Ch_ANO;
	ChSel_CAT <= Ch_CAT;
	ChSel_HS <= 3'b000;
	ChSel_LS <= 3'b000;
	if(Ramping == 1'b0)
		MAG_ST <= MAG;
	else
		MAG_ST <= 5'b00000;
end

always begin
	if(Ch_Sweeping == 1'b1) begin
		ChSel_ANO <= 3'b000; ChSel_CAT <= 3'b001;
		#(Rest_ns) 			ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b1;
		#(ANO_phase_ns) 		ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b0;
		#(IPD_ns) 			ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b1;
		#(CAT_phase_ns) 		ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b0;
		
		ChSel_ANO <= 3'b010; ChSel_CAT <= 3'b011;
		#(Rest_ns) 			ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b1;
		#(ANO_phase_ns) 		ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b0;
		#(IPD_ns) 			ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b1;
		#(CAT_phase_ns) 		ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b0;

		ChSel_ANO <= 3'b100; ChSel_CAT <= 3'b101;
		#(Rest_ns) 			ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b1;
		#(ANO_phase_ns) 		ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b0;
		#(IPD_ns) 			ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b1;
		#(CAT_phase_ns) 		ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b0;

		ChSel_ANO <= 3'b110; ChSel_CAT <= 3'b111;
		#(Rest_ns) 			ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b1;
		#(ANO_phase_ns) 		ChSel_HS <= ChSel_ANO; ChSel_LS <= ChSel_CAT; EN_ST <= 1'b0;
		#(IPD_ns) 			ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b1;
		#(CAT_phase_ns) 		ChSel_HS <= ChSel_CAT; ChSel_LS <= ChSel_ANO; EN_ST <= 1'b0;	
		
		if(Ramping == 1'b1)
			MAG_ST <= MAG_ST + 1;
	end

end

endmodule
