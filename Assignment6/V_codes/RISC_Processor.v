`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:59 11/05/2018 
// Design Name: 
// Module Name:    RISC_Processor 
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
module RISC_Processor(input clock,input im_clock,input reset, output [31:0]Result, output [31:0]read_addr, output [31:0]instr);
	//wire [31:0] instr;
	//wire [31:0] read_addr;
	wire [31:0] in;
	wire [31:0] pc_plus_4;
	wire [31:0] SignExtOut16;
	wire [31:0] SignExtOut21;
	wire [31:0] SignExtOut26;
	
   wire [31:0]outtemp1;
	wire [31:0]outtemp2;
	wire [31:0]outtemp3;
	wire [31:0]out_write;
	wire Return;
	wire Call;
	wire [1:0] RegDst;
	wire [1:0] Flag;
	wire Branch;
	wire BrNoEq;
	wire GotoReg;
	wire OnlyGoto;
	wire MemtoReg;
	wire MemRead;
	wire MemWrite;
	wire [1:0] ALUSrc;
	wire [2:0] ALUctr;
	wire RegWrite;
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;
	wire [4:0] ReadAddr1;
	wire [4:0] WriteAddr;
	wire [31:0] WriteData;		
	wire [31:0] ALU_out;
	wire outb1;
	wire outb2;
	wire outb3;
	wire [31:0]outb4;
	wire [31:0]outb5;
	wire [31:0]newPC;
	wire [31:0] ALU_in2;
	wire [31:0] DataMemory_out;
	wire [3:0] flag;

	//Program Counter
	PC pc(newPC, clock, reset, read_addr);
	
	//Instruction Memory
	InstructionMemory im(im_clock,4'b0000,read_addr,32'b00000000000000000000000000000000,instr);
	//ADD4 for next instruction
	ADD4 add(read_addr, pc_plus_4);
	
	SignExtend26_32 SE26 (instr[25:0], SignExtOut26);
	//Control Unit for setting various controls signals
	ControlUnit cu(instr[31:26], instr [5:0], Return , Call, RegDst, Flag, Branch,BrNoEq, GotoReg, OnlyGoto, MemtoReg, MemRead, MemWrite, ALUSrc, ALUctr, RegWrite);

	MUX21_5 M1(instr[25:21], 5'b11111, Return, ReadAddr1); 			//Return Select Line MUX
	MUX41_5 M2(instr[25:21], instr[20:16], 5'b11111, 5'b11111,RegDst, WriteAddr); // RegDst Select Line MUX
	//Register File containing 32- 32 bits registers
	RegisterFile rf (ReadAddr1,instr[20:16], WriteAddr, WriteData, RegWrite, ReadData1, ReadData2, clock, Result);
	 
	SignExtend16_32 SE16 (instr[15:0], SignExtOut16); // Sign Extend 16 bits to 32 bits
	SignExtend21_32 SE21 (instr[20:0], SignExtOut21); // Sign Extend 21 bits to 32 bits
	MUX21_32 M3( outtemp1,pc_plus_4 , Call, WriteData);   			// call Select Line MUX
	
	MUX41_32 M4(ReadData2, SignExtOut16, SignExtOut21, 32'b00000000000000000000000000000000,ALUSrc,ALU_in2); //ALUSrc
	ALU alu (ReadData1, ALU_in2, ALUctr, Branch, ALU_out, flag); 	// ALU_out Select Line MUX
	MUX41_1 M5 (flag[0], flag[1], flag[2], flag[3], Flag, outb1); 	// flag Select Line MUX
	xnor x1(outb2,BrNoEq,outb1);
	or o1(outb3,OnlyGoto,outb2);

	
	MUX21_32 M6(SignExtOut26, ReadData1, GotoReg, outb4); 			// GotoReg Select Line MUX
	MUX21_32 M7(pc_plus_4,outb4,outb3,outb5); 		 					// outb3 Select Line MUX
	MUX21_32 M8(pc_plus_4,outb5,Branch,newPC);			 				// Branch Select Line MUX
	//Data Memory for Storing Array
	DataMemory DM1(im_clock, {3'b000,MemWrite}, ALU_out, ReadData2, DataMemory_out);
	
	MUX21_32 M9(ALU_out,DataMemory_out,MemtoReg,outtemp1);  			//MemtoReg Select Line MUX
	
endmodule