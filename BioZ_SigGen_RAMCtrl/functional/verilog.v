//Verilog HDL for "BioZ_EMG_Model", "BioZ_SigGen_RAMCtrl" "functional"


module BioZ_SigGen_RAMCtrl (
clk         , // Clock Input
address     , // Address Output
data        , // Data uni-directional
cs          , // Chip Select
we          , // Write Enable/Read Enable
oe            // Output Enable
);

parameter DATA_WIDTH = 8 ;
parameter ADDR_WIDTH = 8 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input                   clk         ;

//--------------Inout Ports----------------------- 
output [ADDR_WIDTH-1:0] address     ;
output                  cs          ;
output                  we          ;
output                  oe          ; 
output [DATA_WIDTH-1:0] data        ;

//--------------Internal variables---------------- 
reg write_finished;
reg [DATA_WIDTH-1:0] LUT [0:RAM_DEPTH-1];

always@ (posedge clk)
begin: MEM_WRITE
	if ( !write_finished ) begin
		cs = 1;
		we = 1;
		oe = 0;
		data = LUT[address];
		address = address + 1;
	end
end

always@ (posedge clk)
begin: MEM_READ
end

endmodule
