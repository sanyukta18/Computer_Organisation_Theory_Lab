`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:54 11/05/2018 
// Design Name: 
// Module Name:    ADD4 
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
module ADD4(input [31:0] in, output reg [31:0] out );
	
	always@(*)
	begin
	out = in + 32'b00000000000000000000000000000100; 	//Add 4
	end

endmodule