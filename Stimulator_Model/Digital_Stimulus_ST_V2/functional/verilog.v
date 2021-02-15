//Verilog HDL for "Stimulator_Model", "Digital_Stimulus_ST_V2" "functional"


module Digital_Stimulus_ST_V2 (
		input  enable,
		input  ramping,
		input  ch_sweeping,
		output reg EN_ST,
		output reg ANO_ST,
		output reg CAT_ST,
		output reg DIS_ST,
		output reg[1:0] CH_SEL_ST,
		output reg[4:0] MAG_ST
);

real period_ns;
real CAT_phase_ns;
real ANO_phase_ns;
real DIS_phase_ns;
real IPD_ns;
real Rest_ns; 

integer i, cnt_period, cnt_ch, num_of_period;

// parameters 
parameter period = 500; // in us
parameter CAT_phase = 150; // in us
parameter ANO_phase = 150; // in us
parameter DIS_phase = 10; // in us
parameter InterPulseDelay = 10; // in us
parameter MAG = 10; // in mA
parameter Channel = 1; 
parameter duration_ch = 5; //in stimulus period
parameter num_of_ch = 4;

initial begin
	// conver to ns
	period_ns = period * 1e3;
	CAT_phase_ns = CAT_phase * 1e3;
	ANO_phase_ns = ANO_phase * 1e3;
	DIS_phase_ns = DIS_phase * 1e3;
	IPD_ns = InterPulseDelay * 1e3;
	Rest_ns = period_ns - CAT_phase_ns - ANO_phase_ns - DIS_phase_ns - IPD_ns;
	

	EN_ST <= 1'b1;
	ANO_ST <= 1'b0;
	CAT_ST <= 1'b0;
	DIS_ST <= 1'b0;
	MAG_ST <= 5'b00000;
	CH_SEL_ST <= 2'b00;
end

always@(posedge enable) begin

	if(ch_sweeping == 1'b1) begin
		CH_SEL_ST <= 2'b00;
	end else begin
		case (Channel)
			1: CH_SEL_ST <= 2'b00;
			2: CH_SEL_ST <= 2'b01;
			3: CH_SEL_ST <= 2'b10;
			4: CH_SEL_ST <= 2'b11;
		endcase
	end
	
	if(ramping == 1'b1) begin
		MAG_ST <= 5'b00000;
		if(duration_ch < MAG*2+1) begin
			num_of_period = MAG*2+1;
		end
	end else begin		
		case (MAG)
			1: MAG_ST <= 5'b00000;
			2: MAG_ST <= 5'b00001;
			3: MAG_ST <= 5'b00010;
			4: MAG_ST <= 5'b00011;
			5: MAG_ST <= 5'b00100;
			6: MAG_ST <= 5'b00101;
			7: MAG_ST <= 5'b00110;
			8: MAG_ST <= 5'b00111;
			9: MAG_ST <= 5'b01000;
			10: MAG_ST <= 5'b01001;
			11: MAG_ST <= 5'b01010;
			12: MAG_ST <= 5'b01011;
			13: MAG_ST <= 5'b01100;
			14: MAG_ST <= 5'b01101;
			15: MAG_ST <= 5'b01110;
			16: MAG_ST <= 5'b01111;
			17: MAG_ST <= 5'b10000;
			18: MAG_ST <= 5'b10001;
			19: MAG_ST <= 5'b10010;
			20: MAG_ST <= 5'b10011;
			21: MAG_ST <= 5'b10100;
			22: MAG_ST <= 5'b10101;
			23: MAG_ST <= 5'b10110;
			24: MAG_ST <= 5'b10111;
			25: MAG_ST <= 5'b11000;
			26: MAG_ST <= 5'b11001;
			27: MAG_ST <= 5'b11010;
			28: MAG_ST <= 5'b11011;
			29: MAG_ST <= 5'b11100;
			30: MAG_ST <= 5'b11101;
			31: MAG_ST <= 5'b11110;
			32: MAG_ST <= 5'b11111;
		endcase
		num_of_period = duration_ch;
	end
	
	forever begin
	//	if (enable == 1'b1) begin
			if (ch_sweeping == 1'b1) begin
				CH_SEL_ST <= 2'b00;
				for(cnt_ch=0; cnt_ch<num_of_ch; cnt_ch=cnt_ch+1) begin 
					for(cnt_period=0; cnt_period<num_of_period; cnt_period=cnt_period+1) begin
						#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0;
						#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	
						#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
						#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1;
						#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
					end
					CH_SEL_ST <= CH_SEL_ST + 1;
				end
			end else begin
				if (ramping == 1'b0) begin
					#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0;
					#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	
					#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
					#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1;
					#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
				end else begin
					MAG_ST <= 5'b00000;
					for(i=0; i<=MAG; i=i+1) begin
						#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0;
						#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	
						#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
						#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1;
						#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
						MAG_ST <= MAG_ST + 1;
					end
					for(i=0; i<MAG; i=i+1) begin
						MAG_ST <= MAG_ST - 1;
						#(Rest_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b1; DIS_ST <= 1'b0;
						#(CAT_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;	
						#(IPD_ns) ANO_ST <= 1'b1; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
						#(ANO_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b1;
						#(DIS_phase_ns) ANO_ST <= 1'b0; CAT_ST <= 1'b0; DIS_ST <= 1'b0;
					end
				end	
			end 
		//end
	end
end
endmodule