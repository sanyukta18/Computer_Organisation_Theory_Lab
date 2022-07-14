`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////

//Name: Sanyukta Deogade
//roll number:19CS30016 

////////////////////////////////////////////////////////////////////////////////



module bin_frac_seq_mult(input  clk,
	input start,
	input [5:0] a,
	input [5:0] b,
	output reg done,
	output reg [11:0] product
	);
	
	reg [5:0] x, y;
	reg [2:0] cnt;					
	reg [11:0] temp;					
	reg total;										
	
	always @ (posedge clk) begin 
		
		 if(start) begin	
		    cnt = 0;
		    total = 0;
			product <= 0;		
			x <= a;
			y <= b;
		end
			
		else if(cnt < 6) begin		
			if(x[cnt]==1 or y[cnt]==1)
				total = total+cnt+1; 
			if( x[0])begin			
				temp = y << 6;
				end
			else
				temp = 0;	
			x <= x >> 1;				
			cnt = cnt + 1;						
			product <= (product + temp) >> 1;  
									
		end
		if(cnt==6)
			done = 1;
	end


endmodule