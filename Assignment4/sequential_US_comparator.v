`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 4 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module sequential_US_comparator( 
		input  a,
		input  b,
		input clk,
		input start,
		output reg i,
		//output reg currstate,
		output reg [2:0] out
		);
		
  //reg state;
 parameter E = 0; parameter L = 1; parameter G = 2; 
 
	

 always@(posedge clk)
 begin 
  	
	  if(start == 1)begin
	 
	  if(a==b)begin
	  out = 3'b010;
	  i = 0;
	  end
	  
	  if(a<b)begin
	  out = 3'b100;
	  i = 1;
	  end
	  if(a>b)begin
	   out = 3'b001;
	   i = 1; 
	  end
	  end
		
	if(start == 0)begin   //reset
	i = 0;
	out = 3'b000;
	end
end

endmodule
