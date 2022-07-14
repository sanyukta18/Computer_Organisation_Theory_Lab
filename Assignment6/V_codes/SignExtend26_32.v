`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:18 11/05/2018 
// Design Name: 
// Module Name:    SignExtend26_32 
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
module SignExtend26_32(input wire [25:0] in, output reg [31:0] out);

	always @(*)
	begin
		if(in[25] == 1)
		begin
			out = {6'b111111 , in}; 
		end
		else
		begin
			out = {6'b000000, in};
		end
	end

endmodule