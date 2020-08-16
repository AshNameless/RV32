/************************************************* 
 
Copyright:Call_Me_ZK

File name:ALUctl.v

Author:ZK
 
Date:2020-08-8
 
Description:

对32位指令进行解码，输出ALUop控制ALU进行运算。各指令所对应ALU操作如下:

--add--
ADD ADDI JALR LW LB LUI SB SW
--sub--
SUB
--and--
AND ADDI
--OR--
OR ORI
--XOR--
XOR XORI
-sra--
SRA SRAI
--srl--
SRL SRLI
--sll--
SLL SLLI
--eq--
BEQ
--ne--
BNE

**************************************************/

`include "paras.v"

module ALUctl

	#(parameter inst_width = 32, ALUop_width=4, inst_op_width=17)

(inst_in, ALUop_out);
	
	//输入指令，输出ALU操作码
	input [inst_width-1:0] inst_in;
	output reg[ALUop_width-1:0] ALUop_out;
	
	//将指令的操作码部分提取出来
	wire[inst_op_width-1:0] operation;
	assign operation = {inst_in[6:0], inst_in[14:12], inst_in[31:25]};
	
	always@(operation) begin
		casex(operation)
			`ADD, `ADDI, `JALR, `LW, `LB, `LUI, `SW, `SB: ALUop_out <= `ALU_add;
			`SUB: ALUop_out <= `ALU_sub;
			`AND, `ANDI: ALUop_out <= `ALU_and;
			`OR, `ORI: ALUop_out <= `ALU_or;
			`XOR, `XORI: ALUop_out <= `ALU_xor;
			`SRA, `SRAI: ALUop_out <= `ALU_sra;
			`SRL, `SRLI: ALUop_out <= `ALU_srl;
			`SLL, `SLLI: ALUop_out <= `ALU_sll;
			`BEQ: ALUop_out <= `ALU_eq;
			`BNE: ALUop_out <= `ALU_ne;
			default: ALUop_out <= 0;
		endcase
	end

endmodule







