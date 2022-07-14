`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:50 11/05/2018 
// Design Name: 
// Module Name:    SignExtend16_32 
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
module SignExtend16_32(input wire [15:0] in, output reg [31:0] out);

	always @(*)
	begin
		if(in[15] == 1)
		begin
			out = {16'b1111111111111111 , in}; 
		end
		else
		begin
			out = {16'b0000000000000000 ,in};
		end
	end
endmodule