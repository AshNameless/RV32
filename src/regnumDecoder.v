/************************************************* 
 
Copyright:Call_Me_ZK

File name:regnumDecoder.v

Author:ZK
 
Date:2020-08-15
 
Description:

  从32位指令中解析出rs1, rs2, rd

**************************************************/

module regnumDecoder

	#(parameter inst_width = 32, num_width = 5)

(instruction, rs1, rs2, rd);
	
	input [inst_width-1:0] instruction;
	output [num_width-1:0] rs1, rs2, rd;
	
	assign rs1 = instruction[19:15];
	assign rs2 = instruction[24:20];
	assign rd = instruction[11:7];


endmodule