//Verilog HDL for "BioZ_EMG_Model", "BioZ_PLL_FD" "functional"
//Frequency Divider

module BioZ_PLL_FD (Fin,  //Input frequency from the VCO
Fsel, // 16-1 Mux selector (4 bits)
Resetn, 
Fout,  //Mux output
F_PFD
);

//inputs
input Fin; // This is the VCO output clock. Fin = 32 MHz when the PLL is locked
input [3:0] Fsel;
input Resetn;

//outputs
output reg Fout;
output F_PFD; // This is a divider output clock which goes to the Phase & Freq. Detector. When locked, this freq = 500 kHz 

//div by 2 register of size 15 (input frequency Fin will be appended so that there are 16 frecs!)
reg [14:0] divider;

wire F_PFD; // Reference for the PFD Div-by-32

// F_PFD is the clock signal that is compared with the reference frequency at the Phase-Freq detector
// The reference clock is 500 kHz. 
assign F_PFD = divider[5]; 

always @(posedge Fin, negedge Resetn)
begin
    if (Resetn == 0) begin
        divider <= 0;
    end else begin
        divider <= divider + 1;
    end
end

// MUX 16:1
always @(Fsel,divider,Fin)
begin
    case (Fsel)
        4'b0000: Fout = Fin;        //  32 MHz
        4'b0001: Fout = divider[0]; //  16 MHz
        4'b0010: Fout = divider[1]; //  8 MHz
        4'b0011: Fout = divider[2]; //  4 MHz
        4'b0100: Fout = divider[3]; //  2 MHz
        4'b0101: Fout = divider[4]; //  1 MHz
        4'b0110: Fout = divider[5]; //  500 kHz (REFERENCE FOR THE PLL)
        4'b0111: Fout = divider[6]; //  250 kHz
        4'b1000: Fout = divider[7]; //  125 kHz
        4'b1001: Fout = divider[8]; //  62500 Hz
        4'b1010: Fout = divider[9]; //  31250 Hz
        4'b1011: Fout = divider[10]; // 15625 Hz
        4'b1100: Fout = divider[11]; //  7812.5 Hz 
        4'b1101: Fout = divider[12]; //  3906.25 Hz
        4'b1110: Fout = divider[13]; //  1952.125 Hz
        4'b1111: Fout = divider[14]; //   976.5625 Hz
        default: Fout = Fin;
    endcase
end
    

endmodule