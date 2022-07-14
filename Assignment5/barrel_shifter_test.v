`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 6
// problem number = 1 (Bidirectional Barrel Shifter testbench)
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////


module bidirec_barrel_shifter_test;

	// Inputs
	reg [7:0] in;
	reg [2:0] shamt;
	reg dir;

	wire [7:0] out;
	// Instantiate the Unit Under Test (UUT)
	bidirec_barrel_shifter uut (
		.in(in), 
		.shamt(shamt),
		.dir(dir), 
		.out(out)
	);

	initial begin

	 $display($time, " << Starting the Simulation >>");
		 in= 8'd5;  shamt=3'd4;dir = 0; //no shift
		 #10 in=8'd30; shamt= 3'd3; dir = 1; //shift 4 bit
		 #10 in=8'd128; shamt= 3'd2; dir = 0;//shift 2 bit
		 #10 in=8'd63; shamt= 3'd5; dir = 1;//shift by 1 bit
		 #10 in=8'd25; shamt= 3'd3; dir = 0;//shift by 7bit
		 #10 in=8'd52; shamt= 3'd1; dir = 1;//shift by 7bit
	  end
    initial begin
      $monitor("Input=%b, shift=%d,direc=%d, Output=%b",in,shamt,dir,out);
    end	
      
endmodule