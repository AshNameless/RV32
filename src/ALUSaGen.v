/************************************************* 
 
Copyright:Call_Me_ZK

File name:ALUSaGen.v

Author:ZK
 
Date:2020-08-8
 
Description:

为ALU产生移位量。由于移位有R和I两种类型，所以直接从ALU第二
操作数截取下低5bits。

**************************************************/

module ALUSaGen

	#(parameter operand_width = 32, Sa_width = 5)

(ALU_src_in, Sa_out);

	input [operand_width-1:0] ALU_src_in;
	output [Sa_width-1:0] Sa_out;
	
	assign Sa_out = ALU_src_in[Sa_width-1:0];

endmodule

