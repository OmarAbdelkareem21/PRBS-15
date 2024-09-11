`timescale 1ns/100ps
module PatternDetector_tb #(parameter Type = 15 , parameter BusWidth = 8 , parameter NumWidth = 4 , parameter InPatternDetector = 32'haabbccdd , parameter nPatternDetector = 4'd4) (); 

	 reg [BusWidth - 1 : 0] InData;
	 reg CLK;
	 reg RST;

	
	 wire Flag;
	 
	 
	 PatternDetector PDetectMod (
	 
	 .InData(InData),
	 .CLK(CLK),
	 .RST(RST),
	 .Flag(Flag)
	 
	 );
	 
	 
	integer clock = 5;
	integer i = 0;
	
	always #(clock) CLK = !CLK ;
	
	task initialize ;
	begin
		InData = 'd0;
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
		InData = 'hDD ;
		#(10);
		InData = 'hCC ;
		#(10);
		InData = 'hBB ;
		#(10);
		InData = 'hAA ;
		#(10);
	end
	endtask
	
	task DoWByte ;
	begin
		InData = 'hDD ;
		#(10);
		InData = 'hCC ;
		#(10);
		InData = 'h44 ;
		#(10);
		InData = 'hAA ;
		#(10);
	end
	endtask
	
	task DoWBIT ;
	begin
		InData = 'hDD ;
		#(10);
		InData = 'hCD ;
		#(10);
		InData = 'hBB ;
		#(10);
		InData = 'hAA ;
		#(10);
	end
	endtask
		
	initial 
	begin
	
	
	initialize ();
	reset ();
	
	// Correct Sequence
	for (i = 0 ; i < 10 ; i = i +1)
		begin
			Do ();
		end
	
	if (Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");

	// Wait
    for (i = 0 ; i < 10 ; i = i +1)
		begin
			#10;
		end
		
	
	
	reset ();
	
	// Byte Error Detection
	for (i = 0 ; i < 10 ; i = i +1)
		begin
			DoWByte ();
		end
	if (!Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");
	// Wait
	for (i = 0 ; i < 10 ; i = i +1)
	begin
		#10;
	end
		
	
	
	reset ();
	
	// Bit Error Detection
	for (i = 0 ; i < 10 ; i = i +1)
		begin
			DoWBIT (); 
		end
	if (!Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");
	// Wait	
	for (i = 0 ; i < 10 ; i = i +1)
		begin
				#10;
		end
	
	reset ();
	
	// Error in Byte while sequence
	Do();
	DoWBIT();
	Do();
	Do();
	Do();
	if (!Flag)
		$display ("Correct Detection");
	else
		$display ("False Detection");
	// Wait
	for (i = 0 ; i < 10 ; i = i +1)
	begin
		#10;
	end
	
	
	
	$stop;
	
	end
	
	
	
	endmodule 

