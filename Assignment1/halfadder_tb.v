//half adder test bench 

module halfadder_tb;
reg a,b;
wire sum,carry;

halfadder add1(a,b,s,c);

initial 
begin 
    $monitor("time=%d:%b %b Sum = %b, carry = %b\n",$time,a,b,s,c);
    a = 0; b = 0;
    #1 
    b = 1;
    #1
    a = 1;
    #1
    b = 0;
end
endmodule
