`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 6
// problem number 3 (Booth's Multiplier testbench) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////


module booth_multiplier_test;

	// Inputs
	reg [7:0] X;
	reg [7:0] Y;
	reg clk;
	reg load;

	// Outputs
	wire [15:0] Z;

	// Instantiate the Unit Under Test (UUT)
	booth_multiplier uut (
		.X(X), 
		.Y(Y), 
		.clk(clk), 
		.load(load), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		X = 6;
		Y = 4;
		clk = 0;
		load = 0;

		// Wait 100 ns for global reset to finish
		#50;
		$monitor("X = %d Y = %d --- OUT = %d",
			X,
			Y,
			Z
		);

      load = 1;
		#50;
		// Add stimulus here

	end
      
	always begin
		#20 clk = !clk;
	end
endmodule

