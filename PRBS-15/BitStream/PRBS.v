//Pseudo-Random Binary Sequence of length 15

module PRBS #(parameter Type = 15 , parameter BusWidth = 8 , parameter NumWidth = 4 ) (

	input wire [BusWidth -1 : 0] InData,
	input wire [NumWidth -1 : 0] n,
	input wire CLK, 
	input wire RST,

	output reg [BusWidth -1 : 0] OutData,
	output wire PRBSEq
);

reg [NumWidth -1 : 0] Counter ;
reg [5 : 0] Offset ;
reg EquationFlag ;
reg [Type - 1 : 0] LFSRFF ;
reg [31 : 0] mem ; 
reg start ;
reg [NumWidth -1 : 0] CountIn;

reg StartFlag;



// assign start = CountIn != 'd4 ? 'd0 : 'd1;

always @(posedge CLK  or negedge RST)
begin
	if (!RST)
		begin
			mem <= 'd0;
			start <= 'd0;
			CountIn <= 'd0;
			StartFlag <= 1'd0;
		end
	else
		begin
			if (CountIn != 'd4)
				begin
					mem [31 : 8] <= mem [23 : 0];
					mem [7 : 0]<= InData ;
					CountIn <= CountIn + 'd1 ;
				end
			else
				begin
					StartFlag <= 1'd1;
				end
		end
end


always @(posedge CLK  or negedge RST)
begin
	if (!RST)
		begin
			OutData <= 'd0;
			Counter <= 'd0;
			Offset  <= 'd0;
			EquationFlag <= 'd0;
			
		end	
	else if (StartFlag)
		begin
			if (Counter != n )
				begin
					OutData <= mem [7 : 0];
					mem   <= {mem [7 : 0] , mem [31 : 8]};
					Offset  <= Offset + 'd1;
					
					if (Offset == 'd3)
						begin
							Offset <=  'd0;
							Counter <= Counter + 'd1;
						end
						
					if ((Counter == n -1) & (Offset == 'd3)) 
						begin
							EquationFlag <= 'd1;
						end
				end
		end

end

always @(posedge CLK or negedge RST)
begin
	if (!RST)
		begin
			LFSRFF <= 'h2ABC;

		end
	else if (EquationFlag)
		begin
			LFSRFF <= {LFSRFF [Type - 2 :0], LFSRFF[13]^LFSRFF[14]};				
				
		end
end

assign PRBSEq = LFSRFF [Type - 1] ;




endmodule 