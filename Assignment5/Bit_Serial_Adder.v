`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 6
// problem number = 2 (bit serial adder.v)
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module Bit_Serial_Adder(input [7:0]a1, input [7:0] a2, input clk, input reset, output [7:0] sum, output out);
     wire in;
     assign in =0;
    wire a1_bit;                        
    wire a2_bit;                        //store current bit of a under consideration in each clock
    wire sum_bit;                       
    wire out_bit;                   
    wire in_bit;                        
    assign out = out_bit;                      //linking output to current output bit

    reg [3:0] state;                    //register will go from state 0 to state 7 creating 8 bit counter
    wire[3:0] count=state;          //link count to state

    initial                             //state initialisation
        begin
            state <= 0;
        end

     always @(posedge clk)          //cycle to change state at every clock
    begin
          if(reset == 1)                //reset to go to start state i.e. state 0
                state = 0;
        else if(state <= 8) 
            state = state + 1; 
    end
    
    Parallel_in_Serial_out inputa1(a1, clk, count, a1_bit);     //function to move a1_bit to next bit of a in every cycle
    Parallel_in_Serial_out inputb1(a2, clk, count, a2_bit);     //function to move a2_bit to next bit of b in every cycle

     assign {out_bit, sum_bit} = a1_bit + a2_bit + in_bit;  //evaluate current output bit and sum bit 

    D_Flip_Flop D(clk, reset, out_bit, count, in, in_bit);          
    Serial_in_Parallel_out sum_sipo(clk, reset, sum_bit, count, sum);   

endmodule 

module Serial_in_Parallel_out(input clk, input reset, input a1, input [3:0] count, output [7:0] result);
    reg [7:0] ans;              // store final answer
    assign result = ans;
    initial                         
            begin 
            ans <= 8'b00000000;
            end
    always @(posedge clk)
        begin
                if(reset == 1)          
                    ans = 8'b00000000;
            else if (count <= 8 && count >= 1)
                ans = {a1, ans[7:1]};
        end
endmodule


module D_Flip_Flop(input clk, input reset, input out, input [3:0] count, input in, output ans1);
    reg x;
    assign ans1 = x;
    initial         
        begin
            x = 0;
        end
    always @(posedge clk)
    begin
          if(reset == 1)        // reset condition 
                x <= 0;
        else if(count == 0) 
            x <= in;
        else if(count <= 8)
            x <= out;
    end
endmodule 


module Parallel_in_Serial_out(input [7:0] a1, input clk, input [3:0] count, output current);
    reg [7:0] new_a;            // store bits of a1 and a2
    assign current = new_a[0];  
    always @(posedge clk)
        begin
                if(count == 0)    
               new_a <= a1;
            else if (count <= 8)
                new_a <= {new_a[0], new_a[7:1]}; 
                else
                     new_a[0] <= a1[7];
        end
endmodule 