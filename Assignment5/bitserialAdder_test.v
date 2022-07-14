`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 6
// problem number = 2 (bit serial adder testbench)
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module bitserialAdder_test;

	// Inputs
	reg [7:0] a1;
	reg [7:0] a2;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] sum;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Bit_Serial_Adder uut (
		.a1(a1), 
		.a2(a2), 
		.clk(clk), 
		.reset(reset), 
		.sum(sum), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a1 = 0;
		a2 = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#5;clk =1; a1 =15;a2 =20; 
		#5;clk =0;
		#5;clk =1;
		#5;clk=0;
		#5;clk =1;
		#5;clk=0;
		#5;clk =1;
		#5;clk=0;
		#5;clk =1;
		#5;clk=0;
		#5;clk =1;
		#5;clk=0;
		#5;clk =1;
		#5;clk=0;
		#5;clk =1;
		#5;clk=0;
		#5;clk =1;
		#5;clk=0;
		$monitor("rst = %b a1 = %d a2 = %d SUM = %d",
			reset,
			a1,
			a2,
			sum
		);
	end
      
endmodule