/************************************************* 
 
Copyright:Call_Me_ZK

File name:PC.v

Author:ZK
 
Date:2020-08-6 
 
Description:

  Program Counter程序计数器, 保存当前指令的地址. 复位时
  归零, 否则在时钟上升到来时将pc_in写入到内部寄存器并输出.
  
  2020-8-16:
  为适配流水线, 加入pc_write信号, 当出现read after load hazard
  时pc_write为0, PC的值不回改变, 延长一个周期


**************************************************/

module PC

	#(parameter PC_width = 32)
	
(clk, rst_n, pc_in, pc_write, pc_out);

	//端口定义
	input clk, rst_n, pc_write;
	input [PC_width-1:0] pc_in;
	output reg[PC_width-1:0] pc_out;
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			pc_out <= 0;
		else if(pc_write == 1'b1)
			pc_out <= pc_in;
		else
			pc_out <= pc_out;
	end
endmodule





