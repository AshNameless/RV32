/************************************************* 
 
Copyright:Call_Me_ZK

File name:ALU.v

Author:ZK
 
Date:2020-08-5
 
Description:

32位ALU，能够实现13种不同的运算，如下表所示:

Op		name							C													V
0001	or								C = A | B										V = 0
0101	nor							C = ~(A | B)									V = 0
0011	and							C = A & B										V = 0
0111	xor							C = A ^ B										V = 0
0010	eq								C = (A == B) ? 000...0001 : 000...0000	V = 0
0000	ne								C = (A != B) ? 000...0001 : 000...0000	V = 0
0100	le								C = (A ≤ 0) ? 000...0001 : 000...0000	V = 0
0110	gt								C = (A > 0) ? 000...0001 : 000...0000	V = 0
100x	add							C = A + B										V = overflow
110x	subtract						C = A - B										V = overflow
101x	shift left logical		C = A << Sa										V = 0
1110	shift right logical		C = A >>> Sa									V = 0
1111	shift right arithmetic	C = A >> Sa										V = 0

其中Op为输入到ALU的操作编码，A、B是两个操作数，C是结果，V在进行add、sub时表示溢出

**************************************************/

`include "paras.v"

module ALU

	#(parameter opcode_width = 4, Sa_width = 5, operand_width = 32)

(ALUop, Sa, A, B, C, V);

	//输入输出口定义
	input [opcode_width-1:0] ALUop;
	input [Sa_width-1:0] Sa;
	input signed [operand_width-1:0] A, B;
	output V;
	output reg signed [operand_width-1:0] C;

	//当A，B符号位相同且C与其符号不同时溢出
	assign V = ((ALUop[opcode_width-1:opcode_width-3] == 3'b100 || ALUop[opcode_width-1:opcode_width-3] == 3'b110) && 
	(A[operand_width-1] == B[operand_width-1]) && (A[operand_width-1] != C[operand_width-1]))?1'b1:1'b0;
	
	//ALU操作
	always@(ALUop, A, B, Sa) begin
		casex(ALUop)
			`ALU_or: C <= A | B;
			`ALU_nor: C <= ~(A | B);
			`ALU_and: C <= A & B;
			`ALU_xor: C <= A ^ B;
			`ALU_eq: C <= (A==B)?{{(operand_width-1){1'd0}}, 1'b1}:{{(operand_width-1){1'd0}}, 1'b0};
			`ALU_ne: C <= (A==B)?{{(operand_width-1){1'd0}}, 1'b0}:{{(operand_width-1){1'd0}}, 1'b1};
			`ALU_le: C <= (A<=0)?{{(operand_width-1){1'd0}}, 1'b1}:{{(operand_width-1){1'd0}}, 1'b0};
			`ALU_gt: C <= (A<=0)?{{(operand_width-1){1'd0}}, 1'b0}:{{(operand_width-1){1'd0}}, 1'b1};
			`ALU_add: C <= A + B;
			`ALU_sub: C <= A - B;
			`ALU_sll: C <= A << Sa;
			`ALU_srl: C <= A >> Sa;
			`ALU_sra: C <= A >>> Sa;
			default C <= {operand_width{1'b0}};
		endcase
	end

endmodule



