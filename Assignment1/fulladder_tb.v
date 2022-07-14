//test bench for full adder

module main;
reg a,b,c0;
wire s,c;
fulladder add(a,b,c0,s,c);
always @(s or c)
begin 
    $display("time= %d: Input %b %b %b Sum = %b, carry = %b\n",$time,a,b,c0,s,c);
end
initial 
begin
    a = 0; b = 0; c0 = 0;
    #5
     a = 0; b = 0; c0 = 1;
    #5
     a = 0; b = 1; c0 = 0;
    #5
     a = 0; b = 1; c0 = 1;
    #5
     a = 1; b = 0; c0 = 0;
    #5
     a = 1; b = 0; c0 = 1;
    #5
     a = 1; b = 1; c0 = 0;
    #5
     a = 1; b = 1; c0 = 1;
end
endmodule