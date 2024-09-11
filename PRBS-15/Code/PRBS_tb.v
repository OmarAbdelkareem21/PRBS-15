`timescale 1ns/100ps

module PRBS_tb #(parameter Type = 15 , parameter BusWidth = 8 , parameter NumWidth = 4 ) ();

	 reg [BusWidth -1 : 0] InData;
	 reg [NumWidth -1 : 0] n;
	 reg CLK;
	 reg RST;

	wire [BusWidth -1 : 0] OutData;
	wire PRBSEq ;
	
	PRBS PrbsMod (
	.InData(InData),
	.n(n),
	.CLK(CLK),
	.RST(RST),
	
	.OutData(OutData),
	.PRBSEq(PRBSEq)
	
	);

	
	integer clock = 5;
	integer i = 0;
	integer inc = 0;
	
	always #(clock) CLK = !CLK ;
	
	task initialize ;
	begin
		InData = 'h0;
		n = 'd4 ;
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
	

	
	
	task IndataTask;
	begin
			InData = 'hAA;
			#10;
			InData = 'hBB;
			#10;
			InData = 'hCC;
			#10;
			InData = 'hDD;
			#10;	
	end
	endtask
	
	initial 
	begin
	
	
	initialize ();
	reset ();
	IndataTask ();
	
	// Function Output 
	#5
	
	for (i = 0 ; i < 4 ; i = i +1 )
		begin
			if (OutData == 'hDD)
				inc = inc + 1;
			#10;
			
			if (OutData == 'hCC)
				inc = inc + 1;
			#10;
			
			if (OutData == 'hBB)
				inc = inc + 1;
			#10;
			
			if (OutData == 'hAA)
				inc = inc + 1;
			#10;
		end
	if (inc == 4*4)
		$display ("Correct Output Data");
	else
		$display ("Incorrect Output Data");
		
	// PRBS Output View
	for (i = 0 ; i < 10 ; i = i+1)
		begin
			#10;
		end
		
	
	
	
	$stop;
	end

	
	
endmodule 