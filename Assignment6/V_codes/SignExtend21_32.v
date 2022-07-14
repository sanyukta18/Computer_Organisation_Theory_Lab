`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:28 11/05/2018 
// Design Name: 
// Module Name:    SignExtend21_32 
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
module SignExtend21_32(input wire [20:0] in, output reg [31:0] out);

	always @(*)
	begin
		if(in[20] == 1)
		begin
			out = {11'b11111111111 , in}; 
		end
		else
		begin
			out = {11'b00000000000 ,in};
		end
	end


endmodule