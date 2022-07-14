`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 6
// problem number 3 (Booth's Multiplier) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module booth_multiplier(
    input signed[7:0] X,
    input signed[7:0] Y,
	 input clk,
	 input load,
    output reg signed[15:0] Z
    );
	reg [1:0] temp;
	integer i;
	reg E1;
	reg [15:0] Y1;
	always @ (posedge clk) begin
		if(load==0)
				begin
				Z = 16'd0;
				E1 = 1'd0;
				Y1 = - Y;
				Z[15:0]=X;
				i <= 0;
				end
		else
			begin
				if(i<8)
				begin
					temp = {X[i], E1};
					case (temp)
						2'd2 : Z [14 : 0] = {Z [15 : 8] + Y1,Z[7:1]};
						2'd1 : Z [14 : 0] = {Z [15 : 8] + Y,Z[7:1]};
						2'd0 : Z [14 : 0] = {Z[15:1]};
						2'd3 : Z [14 : 0] = {Z[15:1]};
						default : begin end
					endcase
					Z[15] = Z[14];
					E1 = X[i];
					i <= i+1;
				end
			end

	end

endmodule