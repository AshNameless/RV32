/************************************************* 
 
Copyright:Call_Me_ZK

File name:comparator.v

Author:ZK
 
Date:2020-08-8
 
Description:

用于完成SLT SLTI指令以及辅助BLT BGE的判断。输入A B，若
A < B 则输出C=00...01，否则C=00...00。支持signed和unsigned
两种形式。

**************************************************/


module comparator

	#(parameter in_width = 32, out_width = 32)

(comp_A, comp_B, comp_unsigned, C);
	
	//输入待比较数和符号指示信号
	input [in_width-1:0] comp_A, comp_B;
	input comp_unsigned;
	
	output reg [out_width-1:0] C;
	
	//将操作数变换解释方法
	reg [in_width-1:0] A, B;
	always@(comp_A, comp_B, comp_unsigned) begin
		if(comp_unsigned) begin
			if($unsigned(comp_A) < $unsigned(comp_B))
				C <= 1;
			else
				C <= 0;
		end else begin
			if($signed(comp_A) < $signed(comp_B))
				C <= 1;
			else
				C <= 0;
		end
	end


endmodule




