`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:53 11/05/2018 
// Design Name: 
// Module Name:    MUX41_32 
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
module MUX41_32(input [31:0] a, input [31:0] b,input [31:0] c, input [31:0] d, input [1:0] select, output reg [31:0] out);

	always@(*)
		begin
			if(select==2'b00)
			begin
				out = a;
			end
			else if(select==2'b01)
			begin
				out = b;
			end
			else if(select==2'b10)
			begin
				out = c;
			end
			else if(select==2'b11)
			begin
				out = d;
			end
		end

endmodule