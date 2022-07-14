`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 3 (Testbench) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////


module test_3;

  // Inputs
  reg clk;
  reg reset;
  reg in;

  // Outputs
  wire out;
  wire [1:0] curstate;

  // Instantiate the Unit Under Test (UUT)
  multiple_of_three uut (
    .clk(clk), 
    .reset(reset), 
    .in(in), 
    .out(out), 
    .curstate(curstate)
  );

    
  always
  #10 clk = ~clk;
  initial begin
	 clk = 1;
    reset = 0; in = 1;  #20;
	 
	 reset = 1;         
    #20;
	   
    reset = 0;
    in = 1;
    #20;
    $display("in = %b,out = %b",in,out);
    in =1;
    #20;
    $display("in = %b,out = %b",in,out);
    in = 0;
    #20;
    $display("in = %b,out = %b",in,out);
    if(out == 1)begin
    $display("Number is divisible");
    end
    else begin 
    $display("Number is not divisible");
    end
    reset=1;
    
    #20;
    reset =0;
    in = 1;
    #20;
      $display("in = %b,out = %b",in,out);
    in =1;
    #20;
    $display("in = %b,out = %b",in,out);
    in = 1;
    #20;
    $display("in = %b,out = %b",in,out);
    in = 0;
    #20;
    $display("in = %b,out = %b",in,out);
   
    if(out == 1)begin
    $display("Number is divisible");
    end
    else begin 
    $display("Number is not divisible");
    end
	 
	 reset=1;
    
    #20;
    reset =0;
    in = 1;
    #20;
      $display("in = %b,out = %b",in,out);
    in =1;
    #20;
    $display("in = %b,out = %b",in,out);
    in = 1;
    #20;
    $display("in = %b,out = %b",in,out);
    in = 0;
    #20;
    $display("in = %b,out = %b",in,out);
	  in = 1;
    #20;
    $display("in = %b,out = %b",in,out);
   
    if(out == 1)begin
    $display("Number is divisible");
    end
    else begin 
    $display("Number is not divisible");
    end
	 
	  
	 reset=1;
    
    #20;
    reset =0;
    in = 1;
    #20;
      $display("in = %b,out = %b",in,out);
    in = 0;
    #20;
    $display("in = %b,out = %b",in,out);
    in = 0;
    #20;
    $display("in = %b,out = %b",in,out);
	  in = 1;
	  #20;
     $display("in = %b,out = %b",in,out);
    if(out == 1)begin
    $display("Number is divisible");
    end
    else begin 
    $display("Number is not divisible");
    end
    $finish;

  end
      
endmodule

        
    // Add stimulus here

  

