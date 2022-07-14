`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 6
// problem number = 1 (2:1 Multiplexer used) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

// define a module for the design
module m21(in0,in1, in2, select,shift_dir,out);

// define input  port
input in0,in1, in2, select,shift_dir;

// define the output port
output out;

// assign one of the inputs to the output based upon select line input
reg i;
	
	always @( * )
	begin
		if ( shift_dir == 0)
			 i=(select)?in1:in0;
		else
			 i=(select)?in2:in0;
	end
	assign out = i;
endmodule 


