module PatternDetector#(parameter Type = 15 , parameter BusWidth = 8 , parameter NumWidth = 4 , parameter InPatternDetector = 32'haabbccdd , parameter nPatternDetector = 4'd4) (

	input wire [BusWidth - 1 : 0] InData,
	input wire CLK,
	input wire RST,

	output reg Flag

);

localparam [2 : 0]  ByteOne = 'd0,
					ByteTwo = 'd1,
					ByteThree = 'd2,
					ByteFour = 'd3,
					Detected = 'd4;
					
reg [2 : 0] CurrentState , NextState ;

reg Count ;
reg Error;

reg [NumWidth -1 : 0] Counter ;

always @(posedge CLK or negedge RST)
begin
	if (!RST)
		begin
			CurrentState <= 'd0;
			Counter      <= 'd0;
		end
	else
		begin
			CurrentState <= NextState ;
			// Detect n Times
			if (Error)
				begin
					Counter <= 'd0;
				end
			else
				begin
					Counter <= Count ? Counter + 'd1 : Counter ; 
				end
		end
end

always @(*)
begin
Flag = 1'd0 ;
Count = 1'd0;
Error = 1'd0;
NextState = CurrentState ;

case (CurrentState)

ByteOne : 
	begin
		Flag = 1'd0 ;
		Count = 1'd0;

		// First Byte Detector
		if (InData == InPatternDetector [7 : 0])
			begin
				NextState = ByteTwo ;
				Error = 1'd0;
			end
		else
			begin
				NextState = ByteOne ;
				Error = 1'd1;
			end
	end
	
ByteTwo :
	begin
		Flag = 1'd0 ;
		Count = 1'd0;

		// Second Byte Detector
		if (InData == InPatternDetector [15 : 8])
			begin
				NextState = ByteThree ;
				Error = 1'd0;
			end
		else
			begin
				NextState = ByteOne ;
				Error = 1'd1;
			end
	
	end
	
ByteThree :
	begin
		Flag = 1'd0 ;
		Count = 1'd0;

		// Third Byte Detector
		if (InData == InPatternDetector [23 : 16])
			begin
				NextState = ByteFour ;
				Error = 1'd0;
			end
		else
			begin
				NextState = ByteOne ;
				Error = 1'd1;
			end
	
	end
	
ByteFour :
	begin
		Flag = 1'd0 ;

		// Forth Byte Detector
		if (InData == InPatternDetector [31 : 24])
			begin
				NextState = Counter == nPatternDetector - 1 ? Detected : ByteOne ;
				Count = 1'd1;
				Error = 1'd0;
			end
		else
			begin
				NextState = ByteOne ;
				Count = 1'd0;
				Error = 1'd1;

			end
	
	end
	
Detected : 
	begin
	
		Flag = 1'd1 ;
		Count = 1'd0;
		NextState = Detected;
		Error = 1'd0;

	
	end
	
default :
	begin
		Flag = 1'd0 ;
		Count = 1'd0;
		NextState = ByteOne;
		Error = 1'd0;

	end


endcase 



end





endmodule 