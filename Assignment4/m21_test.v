`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 5
// problem number = 2 (Testbench) 
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module test;
reg in1, in2, select;
wire out;

// design under test 
m21 uut(.in1(in1), .in2(in2), 
            .select(select), .out(out));

// list the input to the design
initial begin in1=1'b0;in2=1'b0;select=1'b0; 
        #2    in1=1'b1;
        #2    select=1'b1;
        #2    in2=1'b1;
        #2    $stop();
        end

// monitor the output whenever any of the input changes
initial begin $monitor("time=%0d, input1=%b, input2=%b, 
                       select line=%b, output=%b", $time, 
                        in1, in2, select, out);
        end
endmodule :test