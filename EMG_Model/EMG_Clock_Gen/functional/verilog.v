//Verilog HDL for "EMG_Model", "EMG_Clock_Gen" "functional"


module EMG_Clock_Gen ( 
	output reg CLK);

	real FREQ = 50; // in kHz
	parameter PHASE = 0; // in degrees
	parameter DUTY = 50; // in percentage

	real clk_pd; // convert to ns
	real clk_on;
	real clk_off;
	real quarter;
	real start_dly;


	initial begin
		clk_pd = 1.0/(FREQ * 1e3) * 1e9; // convert to ns
		clk_on =  DUTY/100.0 * clk_pd;
		clk_off = (100.0 - DUTY)/100.0 * clk_pd;

		CLK <= 0;

	end	

	always begin

		forever begin
			#(clk_off)  CLK <= ~CLK;
			#(clk_on) CLK <= ~CLK;
		end
	end

endmodule



