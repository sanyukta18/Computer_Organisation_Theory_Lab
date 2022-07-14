`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:23 11/05/2018 
// Design Name: 
// Module Name:    MUX21_32 
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
module MUX21_32(input [31:0] a, input [31:0] b, input select, output reg [31:0] c);

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