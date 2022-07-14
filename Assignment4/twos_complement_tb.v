`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 2 (Testbench) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////


module twos_complement_tb;

	// Inputs
	reg in;
	reg clk;
	reg reset;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	twos_complement uut (
		.in(in), 
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);
	
	reg [15:0]sequence;
	reg [15:0]output_seq;
	integer i;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		in = 0;
		assign sequence =  16'b1101010101110101;
		i=0;
		
		#5;
		reset =0;
		for( i = 0; i <= 15; i = i + 1)
		begin
			in = sequence[i];
			clk = 1;
			#2;
			clk = 0;
			#2;
			output_seq[i] = out;
			$display("in = %b, out = %b",in, out);
		end

	end
      
endmodule

