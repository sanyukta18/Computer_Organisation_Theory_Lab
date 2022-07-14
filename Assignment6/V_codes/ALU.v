`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:28 11/05/2018 
// Design Name: 
// Module Name:    ALU 
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

module ALU(input [31:0] in1, 
        input [31:0] in2, 
        input [2:0] ALUctr,
        input branch,
        output reg [31:0] out, 
        output reg [3:0] flag );
    reg cout;
    always@(*)
    begin
    if(branch ==0)
    begin
      if(ALUctr== 3'b001)     //ADD
      begin
        {cout,out} = in1 + in2; 
        if(cout==1)
        begin
          flag[1] = 1;
        end
        else
        begin
          flag[1] =0;
        end
        
        flag[2] = cout^in1[31]^in2[31]^out[31]; // Cn XOR Cn-1
      end
      
      else if(ALUctr== 3'b010 ) //2's Complement
      begin
        out = in1;
      end
      else if(ALUctr== 3'b000 ) //2's Complement for in2
      begin
        out = in2;
      end

      else if(ALUctr== 3'b011  )    //AND
      begin
        out = in1&in2;
      end
      
      else if(ALUctr== 3'b100  )    //XOR
      begin
        out = in1^in2;
      end
      
      else if(ALUctr== 3'b101  )    //Left Shift
      begin
        out = in1<<in2;
      end
      
      else if(ALUctr== 3'b110  )    //Right Shift
      begin
        out = in1>>in2;
      end
      
      else if (ALUctr== 3'b111  )   //Right Shift arithematic
      begin
        if(in1[31] == 1)
        begin
          out = !in1 + 32'b000000000000000000000000000000001;
          out = out>>in2;
          out = out + 32'b000000000000000000000000000000001;
        end
        else
        begin
          out = in1>>in2;
        end
      end
      
      else
      begin
      
      end

      //handling different kinds of flag
      if(out ==32'b000000000000000000000000000000000) //Zero Flag
      begin
        flag[0] = 1;
      end
      
      else
      begin
        flag[0] = 0;
      end
      
      if(out[31] == 1)
      begin
        flag[3]  =1;
      end
      else
      begin
        flag[3] =0;
      end
    end
  end

  if(in1)
endmodule