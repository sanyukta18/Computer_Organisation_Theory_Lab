`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 2
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module twos_complement(
	    input in, 
		 input clk, 
		 input reset, 
		 output reg out
    );
  reg state;
    parameter S0=0, S1=1;
    always@(posedge clk, posedge reset)
    begin
        if(reset)
            state = S0;
        else
			begin
				case(state)
					S0:
						begin
							if(!in)
								begin
							        state = S0;
							        out = 0;
								end
							else 
							        begin
								state = S1;
								out = 1;
							end
						end
					S1:
						begin
							if(!in)
								begin
							        state = S1;
								out = 1;
								end
							else 
							        begin
								state = S1;
								out = 0;
							        end
						end
			endcase
	   end
	 end
	 
endmodule
