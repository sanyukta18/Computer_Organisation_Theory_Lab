`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:36 11/05/2018 
// Design Name: 
// Module Name:    ControlUnit 
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
module Controller(input [5:0]instruction, input [5:0] fn, 
	                output reg ret,
						 output reg call,
						 output reg [1:0]regdst,
						 output reg [1:0] flag,
						 output reg branch,
						 output reg brnoeq,
						 output reg gotoreg,
						 output reg onlygoto,
						 output reg memtoreg,
						 output reg memread,
						 output reg memwrite,
						 output reg [1:0]alusrc,
						 output reg [2:0]aluctr,
						 output reg regwrite);

	always@(*)
	begin
		if(instruction == 6'b000000)
		begin
			if(fn == 6'b000001)
			begin
				regdst = 2'b00;  		//add
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		
				aluctr = 3'b001;
				regwrite = 1;
				call = 0;
				ret = 0;
			end
			
			else if(fn == 6'b000010)
			begin 							//comp
				regdst = 2'b00;
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		
				aluctr = 3'b010;
				regwrite = 1;
				call = 0;
				ret = 0;
			end
			
			else if(fn == 6'b000011) 
			begin   					//and
				regdst = 2'b00;
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		
				aluctr = 3'b011;
				regwrite = 1;
				call = 0;
				ret = 0;
			end
			
			else if(fn == 6'b000100)
			begin                        //xor
				regdst = 2'b00;
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		
				aluctr = 3'b100;
				regwrite = 1;
				call = 0;
				ret = 0;
			end
			
			else if(fn == 6'b000101)
			begin                         //shllv
				regdst = 2'b00;
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		
				aluctr = 3'b101;
				regwrite = 1;
				call = 0;
				ret = 0;
			end
			
			else if(fn == 6'b000110)
			begin						//shrlv
				regdst = 2'b00;
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		
				aluctr = 3'b110;
				regwrite = 1;
				call = 0;
				ret = 0;
			end
			
			else if(fn == 6'b000111)
			begin                        //shrav
				regdst = 2'b00;
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		
				aluctr = 3'b111;
				regwrite = 1;
				call = 0;
				ret = 0;
			end
		end
		
		else if(instruction == 6'b000001)		//Load
		begin
				regdst = 2'b01;
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 1;		
				memread  = 1;	
				memwrite = 0;		
				alusrc = 2'b01;		
				aluctr = 3'b001;
				regwrite = 1;
				call = 0;
				ret = 0;
		end
		
		else if(instruction == 6'b000010)		//Store
		begin
				regdst = 2'b00;			//xx
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;		//x	
				memread  = 0;	
				memwrite = 1;		
				alusrc = 2'b01;		
				aluctr = 3'b001;
				regwrite = 0;
				call = 0;
				ret = 0;
		end
		
		else if(instruction == 6'b100001)		//Addi
		begin
				regdst = 2'b00;			
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;	
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b10;		
				aluctr = 3'b001;
				regwrite = 1;
				call = 0;
				ret = 0;
		end
		
		else if(instruction == 6'b100010)		//Compi
		begin
				regdst = 2'b00;			
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;	
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b10;		
				aluctr = 3'b000;
				regwrite = 1;
				call = 0;
				ret = 0;
		end
		
		else if(instruction == 6'b100011)		//shll
		begin
				regdst = 2'b00;	
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;	
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b10;		
				aluctr = 3'b101;
				regwrite = 1;
				call = 0;
				ret = 0;
		end
		
		else if(instruction == 6'b100100)		//shrl
		begin
				regdst = 2'b00;			
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;	
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b10;		
				aluctr = 3'b110;
				regwrite = 1;
				call = 0;
				ret = 0;
		end
		
		else if(instruction == 6'b100101)		//shra
		begin
				regdst = 2'b00;			
				flag = 2'b00;			//xx
				branch = 0;
				brnoeq = 0;				//x
				gotoreg = 0;		//x
				onlygoto = 0;		//x
				memtoreg = 0;	
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b10;		
				aluctr = 3'b111;
				regwrite = 1;
				call = 0;
				ret = 0;
				
				//r type, immediate done
		end
		
		else if(instruction == 6'b110001)		//bz
		begin
				regdst = 2'b00;				//xx	
				flag = 2'b00;			
				branch = 1;
				brnoeq = 1;				
				gotoreg = 0;		
				onlygoto = 0;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 0;
				call = 0;			//x
				ret = 0;			
		end
		
		else if(instruction == 6'b110010)		//bnz
		begin
				regdst = 2'b00;			//xx	
				flag = 2'b00;			
				branch = 1;
				brnoeq = 0;				
				gotoreg = 0;		
				onlygoto = 0;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 0;
				call = 0;			//x
				ret = 0;			
		end
		
		else if(instruction == 6'b110011)		//bcy
		begin
				regdst = 2'b00;				//xx	
				flag = 2'b01;			
				branch = 1;
				brnoeq = 1;				
				gotoreg = 0;		
				onlygoto = 0;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 0;
				call = 0;			//x
				ret = 0;			
		end
		
		else if(instruction == 6'b110100)		//bncy
		begin
				regdst = 2'b00;				//xx	
				flag = 2'b01;			
				branch = 1;
				brnoeq = 0;				
				gotoreg = 0;		
				onlygoto = 0;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 0;
				call = 0;			//x
				ret = 0;			
		end
		
		else if(instruction == 6'b110101)		//bs
		begin
				regdst = 2'b00;				//xx	
				flag = 2'b11;			
				branch = 1;
				brnoeq = 1;				
				gotoreg = 0;		
				onlygoto = 0;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 0;
				call = 0;			//x
				ret = 0;			
		end
		
		//else if(instruction == 6'b110110)		//bns --- convert this to bl branch link
		//begin
		//		regdst = 2'b00;				//xx	
		//		flag = 2'b11;			
		//		branch = 1;
		//		brnoeq = 0;				
		//		gotoreg = 0;		
		//		onlygoto = 0;		
		//		memtoreg = 0;		//x
		//		memread  = 0;		//x
		//		memwrite = 0;		
		//		alusrc = 2'b00;		//xx		
		//		aluctr = 3'b000;		//xxx
		//		regwrite = 0;
		//		call = 0;			//x
		//		ret = 0;			
		//end
		

		
		else if(instruction == 6'b111001)		//b
		begin
				regdst = 2'b00;				//xx	
				flag = 2'b00;			//xx	
				branch = 1;
				brnoeq = 0;				//x	
				gotoreg = 0;		
				onlygoto = 1;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 0;
				call = 0;			//x
				ret = 0;			
		end
		
		else if(instruction == 6'b111010)		//br
		begin
				regdst = 2'b00;				//xx	
				flag = 2'b00;			//xx	
				branch = 1;
				brnoeq = 0;				//x	
				gotoreg = 1;		
				onlygoto = 1;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 0;
				call = 0;			//x
				ret = 0;			
		end
	end

	else if(instruction == 6'b111101)		//Call
		begin
				regdst = 2'b10;				
				flag = 2'b00;			//xx	
				branch = 1;
				brnoeq = 0;				//x	
				gotoreg = 0;		
				onlygoto = 1;		
				memtoreg = 0;		//x
				memread  = 0;		//x
				memwrite = 0;		
				alusrc = 2'b00;		//xx		
				aluctr = 3'b000;		//xxx
				regwrite = 1;
				call = 1;			
				ret = 0;			
		end

endmodule