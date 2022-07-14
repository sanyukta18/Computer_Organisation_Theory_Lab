`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:44 11/05/2018 
// Design Name: 
// Module Name:    MUX21_5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX21_5(input [4:0] a, input [4:0] b, input select, output reg [4:0] c);

	always@(*)
	begin
	if(!select)
	begin
	c = a;
	end
	else 
	begin
	c =b;
	end
	end

endmodule