/************************************************* 
 
Copyright:Call_Me_ZK

File name:LSBextract.v

Author:ZK
 
Date:2020-08-10
 
Description:
	提取出输入数据的最低位。slt或branch指令中ALU或者比较器
	输出比较结果，最低位为1或0，其他位全0。提取出最低位送到
	控制单元，结合指令控制
**************************************************/

module LSBextract
	
	#(parameter in_dwidth = 32)

(data_input, lsb);
	
	input [in_dwidth-1:0] data_input;
	output lsb;
	
	assign lsb = data_input[0];
	
endmodule
