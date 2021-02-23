//Verilog HDL for "BioZ_EMG_Model", "BioZ_SigGen_ClkGen_stim" "functional"


module BioZ_SigGen_ClkGen_stim (Fsel,enable);

output [3:0] Fsel;
output enable;

//parameter cycle = 1428; // 700 kHz
parameter cycle = 4500000; // 4.5 ms

parameter [3:0] freq_selection = 4'b0000;

reg enable;
reg [3:0] Fsel;
reg clk;


initial begin
	enable = 1;
	Fsel = freq_selection;
	clk <= 0;

	#200 enable = 0;
	#400 enable = 1;
end 

always begin
	#(cycle) Fsel = Fsel - 1;
//	#(1e6/1e3) clk <= ~clk;
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

endmodule
