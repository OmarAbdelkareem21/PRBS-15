module Wrapper #(parameter Type = 15 , parameter BusWidth = 8 , parameter NumWidth = 4 , parameter InPatternDetector = 32'haabbccdd , parameter nPatternDetector = 4'd4)  (

	input wire [BusWidth -1 : 0] InData,
	input wire [NumWidth -1 : 0] n,
	input wire CLK, 
	input wire RST,

	output wire Flag,

	output wire [BusWidth -1 : 0] OutData,
	output wire PRBSEq


);

wire [BusWidth -1 : 0] InDetector ;

PRBS PrbsMod (

	.InData(InData),
	.n(n),
	.CLK(CLK),
	.RST(RST),
	
	.OutData(InDetector),
	.PRBSEq(PRBSEq)
);

assign OutData = InDetector ;

PatternDetector PDetectMod (

	.InData(InDetector),
	.CLK(CLK),
	.RST(RST),
	
	.Flag(Flag)

);

endmodule 