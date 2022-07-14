`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:45 11/05/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(input [31:0] in, input clock, input reset, output reg [31:0] out);
	
	
	always@(posedge clock)
	begin
		if(reset)
		begin
			out <= 32'b000000000000000000000000000000000; 	//inital PC
		end
		else
		begin
			out <= in; 	//new PC value
		end
		
	end

endmodule