`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 1 (Testbench) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////


module LFSRtest;

	// Inputs
	reg [3:0] seed;
	reg clk;
	reg reset;
	reg sel;

	// Outputs
	wire [3:0] w;

	// Instantiate the Unit Under Test (UUT)
	LFSR uut (
		.seed(seed), 
		.clk(clk), 
		.reset(reset), 
		.sel(sel), 
		.w(w)
	);
		
		// Initialize Inputs
		
		
		initial begin
		
		 seed = 4'b1111; clk = 1'b1; reset = 0; sel = 0; #10;
		 $display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; #10;
		 $display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; #10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; #10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; #10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
			$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;

		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		
		 seed = 4'b1111;  clk = 1'b1; reset = 0; sel = 1; 	#10;
		 	$display("w = %b, Time = %d",w, $time);
		clk = 1'b0; #10;
		$finish;
		// Add stimulus here

end
	
endmodule
