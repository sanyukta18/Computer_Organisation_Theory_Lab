// half adder code in verilog

module halfadder(a,b,s,c);
input a,b;
output s,c;

assign s = a ^ b; //sum bit
assign c = a & b; //carry bit

endmodule