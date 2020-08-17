/************************************************* 
 
Copyright:Call_Me_ZK

File name:MEMWB.v

Author:ZK
 
Date:2020-08-16
 
Description:

  MEMWB
  
  保存有: reg_write, wr_num, wr_data
  其中wr_data根据reg_wr_src从EXMEM中的ALU_result和当前memory读出的数据中选择.

**************************************************/

module MEMWB

	#(parameter num_width = 5, operand_width = 32, ALUop_width = 4)

(//输入
clk, rst_n, wr_num_in, reg_write_in, reg_wr_src_in,
ALU_result_in, memory_data_in,
//输出
wr_num_out, reg_write_out, wr_data_out
);
	
	//输入
	input clk, rst_n;
	input [num_width-1:0] wr_num_in;
	input [operand_width-1:0] ALU_result_in, memory_data_in;
	input reg_write_in;
	input [1:0] reg_wr_src_in;
	//相关输出
	output reg [num_width-1:0] wr_num_out;
	output reg [operand_width-1:0] wr_data_out;
	output reg reg_write_out;
	
	always@(posedge clk) begin
		if(!rst_n) begin
			wr_num_out <= 0;
			wr_data_out <= 0;
	      reg_write_out <= 0;
		end else begin
			wr_num_out <= wr_num_in;
	      reg_write_out <= reg_write_in;
			
			//10表示指令为lb/w, 写入寄存器的应为读取出的数据
			if(reg_wr_src_in == 2'b10)
				wr_data_out <= memory_data_in;
			else
				wr_data_out <= ALU_result_in;

		end
	end

endmodule
