// verilog code for full adder

module fulladder(a,b,c0,s,c);
input a,b,c0;
output s,c;
wire s,c;
assign s = a^b^(c0);  //sum
assign c = ((a&b)|(b&c0)|(a&c0)); //carry
endmodule
