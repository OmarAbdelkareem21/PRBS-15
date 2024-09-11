`timescale 1ns/100ps
module Wrapper_tb #(parameter Type = 15 , parameter BusWidth = 8 , parameter NumWidth = 4 , parameter InPatternDetector = 32'haabbccdd , parameter nPatternDetector = 4'd4)  ();

	reg [BusWidth -1 : 0] InData;
	reg [NumWidth -1 : 0] n;
	reg CLK; 
	reg RST;
	

	wire Flag;

    wire [BusWidth -1 : 0] OutData;
	wire PRBSEq;
	 
	Wrapper WrapperMod (
	
	.InData(InData),
	.n(n),
	.CLK(CLK),
	.RST(RST),
	
	.Flag(Flag),
	
	.OutData(OutData),
	.PRBSEq(PRBSEq)
	
	);
	
	integer clock = 5;
	integer i = 0;
	
	always #(clock) CLK = !CLK ;
	
	task initialize ;
	begin
		InData = 'h0;
		n = 'd4;
		CLK = 'd0;
	
	end
	endtask 
	
	task reset ;
	begin
		RST = 'd1 ;
		#1
		RST = 'd0 ;
		#1
		RST = 'd1 ;
	end
	endtask
	
	task Do ;
	begin
		InData = 'hAA ;
		#(10);
		InData = 'hBB ;
		#(10);
		InData = 'hCC ;
		#(10);
		InData = 'hDD ;
		#(10);
	end
	endtask
	
	task DoWByte ;
	begin
		InData = 'hAA ;
		#(10);
		InData = 'hBB ;
		#(10);
		InData = 'h44 ;
		#(10);
		InData = 'hDD ;
		#(10);
	end
	endtask
	
	task DoWBIT ;
	begin
		InData = 'hAA ;
		#(10);
		InData = 'hBC ;
		#(10);
		InData = 'hCC ;
		#(10);
		InData = 'hDD ;
		#(10);
	end
	endtask
		
	initial 
	begin
	
	
	initialize ();
	reset ();
	
	
	// Correct Sequence
	Do ();
    for (i = 0 ; i < 16 ; i = i +1)
		begin
			#10;
		end
		#5;
	if (Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");
		
	//Wait
	for (i = 0 ; i < 10 ; i = i +1)
	begin
		#10;
	end
	
	reset ();
	
	// Bit Error Detection
	DoWBIT ();
    for (i = 0 ; i < 16 ; i = i +1)
		begin
			#10;
		end
		#5;
	if (!Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");
		
	//Wait
	for (i = 0 ; i < 10 ; i = i +1)
	begin
		#10;
	end
	
	reset ();
	
	// Byte Error Detection
	DoWByte ();
    for (i = 0 ; i < 16 ; i = i +1)
		begin
			#10;
		end
		#5;
	if (!Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");
		
	//Wait
	for (i = 0 ; i < 10 ; i = i +1)
	begin
		#10;
	end
	
	reset ();
	
	// Correct Sequence
	Do ();
    for (i = 0 ; i < 16 ; i = i +1)
		begin
			#10;
		end
		#5;
	if (Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");
		
	//Wait
	for (i = 0 ; i < 10 ; i = i +1)
	begin
		#10;
	end
	
	
	
	
	
	$stop;
	
	end
	 
endmodule 

