`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////////////////////
// assignment number = 6
// problem number = 1 (Bidirectional Barrel Shifter)
// semester = 5
// group number = 56   
// Name: Sanyukta Deogade (19CS30016)
// Name: Akanksha Singh (19CS10007)
//////////////////////////////////////////////////////////////////////////////////////////////////

module bidirec_barrel_shifter(
		input [7:0] in, 
		input [2:0] shamt, 
		input dir, 
		output [7:0]out
    );
	wire [7:0]w, w2;
	
	m21  mul23 (.in0(in[7]),.in1(1'b0),.select(shamt[2]),.out(w[7]), .shift_dir(dir), .in2(in[3]));
	m21  mul22 (.in0(in[6]),.in1(1'b0),.select(shamt[2]),.out(w[6]),.shift_dir(dir), .in2(in[2]));
	m21  mul21 (.in0(in[5]),.in1(1'b0),.select(shamt[2]),.out(w[5]),.shift_dir(dir), .in2(in[1]));
	m21  mul20 (.in0(in[4]),.in1(1'b0),.select(shamt[2]),.out(w[4]),.shift_dir(dir), .in2(in[0]));
	m21  mul19 (.in0(in[3]),.in1(in[7]),.select(shamt[2]),.out(w[3]),.shift_dir(dir), .in2(1'b0));
	m21  mul18 (.in0(in[2]),.in1(in[6]),.select(shamt[2]),.out(w[2]),.shift_dir(dir), .in2(1'b0));
	m21  mul17 (.in0(in[1]),.in1(in[5]),.select(shamt[2]),.out(w[1]),.shift_dir(dir), .in2(1'b0));
	m21  mul16 (.in0(in[0]),.in1(in[4]),.select(shamt[2]),.out(w[0]),.shift_dir(dir), .in2(1'b0));
	 
	//2 bit shift right
	 
	m21  mul15 (.in0(w[7]),.in1(1'b0),.select(shamt[1]),.out(w2[7]),.shift_dir(dir), .in2(w[5]));
	m21  mul14 (.in0(w[6]),.in1(1'b0),.select(shamt[1]),.out(w2[6]),.shift_dir(dir), .in2(w[4]));
	m21  mul13 (.in0(w[5]),.in1(w[7]),.select(shamt[1]),.out(w2[5]),.shift_dir(dir), .in2(w[3]));
	m21  mul12 (.in0(w[4]),.in1(w[6]),.select(shamt[1]),.out(w2[4]),.shift_dir(dir), .in2(w[2]));
	m21  mul11 (.in0(w[3]),.in1(w[5]),.select(shamt[1]),.out(w2[3]),.shift_dir(dir), .in2(w[1]));
	m21  mul10 (.in0(w[2]),.in1(w[4]),.select(shamt[1]),.out(w2[2]),.shift_dir(dir), .in2(w[0]));
	m21  mul09 (.in0(w[1]),.in1(w[3]),.select(shamt[1]),.out(w2[1]),.shift_dir(dir), .in2(1'b0));
	m21  mul08 (.in0(w[0]),.in1(w[2]),.select(shamt[1]),.out(w2[0]),.shift_dir(dir), .in2(1'b0));
	 
	//1 bit shift right
	m21  mul07 (.in0(w2[7]),.in1(1'b0),.select(shamt[0]),.out(out[7]),.shift_dir(dir), .in2(w2[6]));
	m21  mul06 (.in0(w2[6]),.in1(w2[7]),.select(shamt[0]),.out(out[6]),.shift_dir(dir), .in2(w2[5]));
	m21  mul05 (.in0(w2[5]),.in1(w2[6]),.select(shamt[0]),.out(out[5]),.shift_dir(dir), .in2(w2[4]));
	m21  mul04 (.in0(w2[4]),.in1(w2[5]),.select(shamt[0]),.out(out[4]),.shift_dir(dir), .in2(w2[3]));
	m21  mul03 (.in0(w2[3]),.in1(w2[4]),.select(shamt[0]),.out(out[3]),.shift_dir(dir), .in2(w2[2]));
	m21  mul02 (.in0(w2[2]),.in1(w2[3]),.select(shamt[0]),.out(out[2]),.shift_dir(dir), .in2(w2[1]));
	m21  mul01 (.in0(w2[1]),.in1(w2[2]),.select(shamt[0]),.out(out[1]),.shift_dir(dir), .in2(w2[0]));
	m21  mul00 (.in0(w2[0]),.in1(w2[1]),.select(shamt[0]),.out(out[0]),.shift_dir(dir), .in2(1'b0));

endmodule
