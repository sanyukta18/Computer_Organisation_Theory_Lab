`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 4 (Testbench) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////
module SeqUScomp_test;

	// Inputs
	reg a;
	reg b;
	reg clk;
	
	reg start;

	// Outputs
	wire [2:0] out;
  wire i ;
	//wire currstate;
	// Instantiate the Unit Under Test (UUT)
	sequential_US_comparator uut (
		.a(a), 
		.b(b), 
		.clk(clk), 
		.i(i),
		.start(start), 
		//.currstate(currstate),
		.out(out)
	);
	integer j; reg [31:0]A; reg [31:0]B;
	initial begin
		// Initialize Inputs
		
		//change values of A and B to see diffrent results
		//Here A>B so will see out = 001
		A = 32'b01000100000000000000000000001010;
       B =32'b00000000000000000000000000001010;
		
			
		while(A!=0 & B != 0)begin
			  a = A[31];
		    b = B[31];
			 clk = 1'b1;
			 start = 1;	
			 if(a!=b)begin
		    #10;
			 
			 if(i==1)begin
				$display("out = %b",out);
		      $finish; 
			 end
			end
			 A = A << 1;
			 B = B << 1;
			// $display("i = %b",i);
		end
		
			a = A[31];
		    b = B[31];
			 clk = 1'b1;
			 start = 1;			 
		    #10;
		 if(i == 0)begin
			$display("out = %b",out);
			$finish; 
		 end
		// Add stimulus here
		
	end
	
      
endmodule

