//Verilog HDL for "Stimulator_Model", "Digital_Stimulus_ST_V2" "functional"


module Digital_Stimulus_ST_V2 (
		input  enable,
		input  ramping,
		input  ch_sweeping,
		output reg EN_ST,
		output reg ANO_ST,
		output reg CAT_ST,
		output reg DIS_ST,
		output reg[1:0] CH_SEL_U_ST,
		output reg[1:0] CH_SEL_D_ST,	
		output reg[4:0] MAG_ST
);

real period_ns;
real CAT_phase_ns;
real ANO_phase_ns;
real DIS_phase_ns;
real IPD_ns;
real Rest_ns;
real en_extension_ns;
real delay_dis_ns;

integer i, cnt_period, cnt_ch, num_of_period;

// parameters 
parameter period = 500; // in us
parameter CAT_phase = 150; // in us
parameter ANO_phase = 150; // in us
parameter DIS_phase = 5; // in us
parameter InterPulseDelay = 10; // in us
parameter MAG = 5'b01001; // in mA
parameter Channel_UP = 2'b00;
parameter Channel_DOWN = 2'b01; 
parameter duration_ch = 3; //in stimulus period
parameter num_of_ch = 4;
parameter delay_discharge = 1; // in us

initial begin
	// conver to ns
	period_ns = period * 1e3;
	CAT_phase_ns = CAT_phase * 1e3;
	ANO_phase_ns = ANO_phase * 1e3;
	DIS_phase_ns = DIS_phase * 1e3;
	delay_dis_ns = delay_discharge * 1e3;
	IPD_ns = InterPulseDelay * 1e3;
	en_extension_ns = 10*1e3;
	Rest_ns = period_ns - CAT_phase_ns - ANO_phase_ns - DIS_phase_ns - IPD_ns - en_extension_ns - delay_dis_ns;

	EN_ST <= 1'b0;
	ANO_ST <= 1'b0;
	CAT_ST <= 1'b0;
	DIS_ST <= 1'b0;
	MAG_ST <= MAG;
	CH_SEL_U_ST <= 2'b00;
	CH_SEL_D_ST <= 2'b00;
end

always@(posedge enable) begin

	if(ch_sweeping == 1'b1) begin
		CH_SEL_U_ST <= Channel_UP;
		CH_SEL_D_ST <= 2'b00;

	end else begin
		CH_SEL_U_ST <= Channel_UP;
		CH_SEL_D_ST <= Channel_DOWN;
	end
	
	if(ramping == 1'b1) begin
		MAG_ST <= 5'b00000;
		if(duration_ch < MAG*2+1) begin
			num_of_period = MAG*2+1;
		end
	end else begin		
		MAG_ST <= MAG;		
		num_of_period = duration_ch;
	end
	
	forever begin
			if (ch_sweeping == 1'b1) begin
				CH_SEL_D_ST <= 2'b00;
				for(cnt_ch=0; cnt_ch<num_of_ch; cnt_ch=cnt_ch+1) begin 
					for(cnt_period=0; cnt_period<num_of_period; cnt_period=cnt_period+1) begin
						#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	EN_ST <= 1'b1;
						#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(delay_dis_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1; EN_ST <= 1'b1;
						#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b0;
					end
					CH_SEL_D_ST <= CH_SEL_D_ST + 1;
				end
			end else begin
				if (ramping == 1'b0) begin
					#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
					#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0; EN_ST <= 1'b1;
					#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	EN_ST <= 1'b1;
					#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
					#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
					#(delay_dis_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1; EN_ST <= 1'b1;
					#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
					#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b0;

				end else begin
					MAG_ST <= 5'b00000;
					for(i=0; i<=MAG; i=i+1) begin
						#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	EN_ST <= 1'b1;
						#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(delay_dis_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1; EN_ST <= 1'b1;
						#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b0;
						MAG_ST <= MAG_ST + 1;
					end
					for(i=0; i<MAG; i=i+1) begin
						MAG_ST <= MAG_ST - 1;
						#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	EN_ST <= 1'b1;
						#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(delay_dis_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1; EN_ST <= 1'b1;
						#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b1;
						#(en_extension_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0; EN_ST <= 1'b0;
					end
				end	
			end 
	end
end
endmodule