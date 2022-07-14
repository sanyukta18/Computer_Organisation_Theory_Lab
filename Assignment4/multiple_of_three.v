`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 3 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module multiple_of_three(
	input clk,
        input reset,
        input in,
	output reg out,
	output reg[1:0] curstate
    );
parameter S0 = 2'b0, S1=2'b1, S2=2'b10;

always@(posedge clk)
begin
	if(reset)
	begin
		curstate = 0;
		out = 0;
	end
	else
	begin
		case(curstate)
		S0:
		begin
			if(in)
				begin
				  curstate = S1;
				  out = 0;
				end
			else
                                begin
				 out = 1;
                                 curstate = S0;
                                end
		end

		S1:
		begin
			if(in)
				begin
				 curstate = S0;
				 out = 1;
				end
			else
				begin
				 curstate = S2;
				 out = 0;
				end
		end

		
		S2:
		begin
			if(in)
				begin
				  curstate = S2;
				  out = 0;
				end
			else
				begin
				  curstate = S1;
				  out = 0;
				end
		end	
		endcase
	end
end
endmodule
