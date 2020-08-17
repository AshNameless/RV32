/************************************************* 
 
Copyright:Call_Me_ZK

File name:IFID.v

Author:ZK
 
Date:2020-08-16
 
Description:

  IF_ID流水线寄存器
  保存PC Instruction PC+4 rd_num1 rd_num2 wr_num
  
  当flush置位时说明EX阶段是分支指令且分支跳转, 上升沿
  到来后该寄存器被清零, 同时PC被设置为跳转地址, 进入IF
  阶段. 待下一个上升沿, IFID内部写入该指令信息, 进入ID
  阶段. 
  
  当hazard置位说明检测到了data hazard, 数据保持一个周期

**************************************************/

module IFID

	#(parameter PC_width = 32, inst_width = 32, num_width = 5)

(clk, rst_n, flush, hazard, PC_in, PC4_in, inst_in,rd_num1_in, rd_num2_in, wr_num_in,
PC_out, PC4_out, inst_out, rd_num1_out, rd_num2_out, wr_num_out);
	
	//输入信号
	input clk, rst_n, flush, hazard;
	input [PC_width-1:0] PC_in, PC4_in;
	input [inst_width-1:0] inst_in;
	input [num_width-1:0] rd_num1_in, rd_num2_in, wr_num_in;
	//相应输出
	output reg [PC_width-1:0] PC_out, PC4_out;
	output reg [inst_width-1:0] inst_out;
	output reg [num_width-1:0] rd_num1_out, rd_num2_out, wr_num_out;
	
	//清零信号, 当rst_n和flush有效时清零寄存器
	wire zero = ~rst_n | flush;
	
	always@(posedge clk) begin
		if(zero) begin
			PC_out <= 0;
			PC4_out <= 0;
			inst_out <= 0;
			rd_num1_out <= 0;
			rd_num2_out <= 0;
			wr_num_out <= 0;
		end else if(hazard) begin
			PC_out <= PC_out;
			PC4_out <= PC4_out;
			inst_out <= inst_out;
			rd_num1_out <= rd_num1_out;
			rd_num2_out <= rd_num2_out;
			wr_num_out <= wr_num_out;
		end else begin
			PC_out <= PC_in;
			PC4_out <= PC4_in;
			inst_out <= inst_in;
			rd_num1_out <= rd_num1_in;
			rd_num2_out <= rd_num2_in;
			wr_num_out <= wr_num_in;
		
		end
	end

endmodule
