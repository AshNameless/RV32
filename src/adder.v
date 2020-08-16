/************************************************* 
 
Copyright:Call_Me_ZK

File name:adder.v

Author:ZK
 
Date:2020-08-9
 
Description:

  加法器，可以参数化输入加数的宽度，主要用于PC自增4以及
  PC+imm实现跳转。

**************************************************/

module adder

	#(parameter operand_width = 32)

(PC_in, offset_in, C);

	input signed [operand_width-1:0] PC_in, offset_in;
	output reg signed [operand_width-1:0] C;
	
	always@(PC_in, offset_in) C <= PC_in + offset_in;

endmodule




