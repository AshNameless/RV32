/************************************************* 
 
Copyright:Call_Me_ZK

File name:EXMEM.v

Author:ZK
 
Date:2020-08-16
 
Description:

  EXMEM
  
  存储写寄存器标号wr_num
  
  控制信号: sb/w memory_rd memory_wr lb/w reg_write reg_wr_src[1:0]
  
  可能写入存储器的值rs2
  
  EX阶段新产生的数据:
  ALU_result, 作为寄存器写入值或者访存地址. 作为写入值时其值也有可能是PC+4(jal x1, label)
  通过reg_wr_src进行选择. 因为只有lb/w sb/w指令能够访问存储器, 所以当指令为跳转指令时就可以
  直接将ALU_result存为PC+4, memory_write肯定是0, 地址为多少不影响.


**************************************************/

module EXMEM

	#(parameter PC_width = 32, num_width = 5, operand_width = 32, ALUop_width = 4)

(//输入
clk, rst_n, PC4_in, wr_num_in, rs2_in, sb_w_in, 
memory_rd_in, memory_wr_in, lb_w_in, reg_write_in, reg_wr_src_in,
ALU_result_in,
//输出
wr_num_out, rs2_out, sb_w_out, memory_rd_out, memory_wr_out, lb_w_out,
reg_write_out, reg_wr_src_out,
ALU_result_out
);
	
	//输入
	input clk, rst_n;
	input [PC_width-1:0] PC4_in;
	input [num_width-1:0] wr_num_in;
	input [operand_width-1:0] rs2_in, ALU_result_in;
	input sb_w_in, memory_rd_in, memory_wr_in, lb_w_in, reg_write_in;
	input [1:0] reg_wr_src_in;
	//相关输出
	output reg [num_width-1:0] wr_num_out;
	output reg [operand_width-1:0] rs2_out, ALU_result_out;
	output reg sb_w_out, memory_rd_out, memory_wr_out, lb_w_out, reg_write_out;
	output reg [1:0] reg_wr_src_out;
	
	always@(posedge clk) begin
		if(!rst_n) begin
			wr_num_out <= 0;
			rs2_out <= 0;
			ALU_result_out <= 0;
			sb_w_out <= 0; 
			memory_rd_out <= 0;
			memory_wr_out <= 0; 
			lb_w_out <= 0;
	      reg_write_out <= 0;
			reg_wr_src_out <= 0;
		end else begin
			wr_num_out <= wr_num_in;
			sb_w_out <= sb_w_in;
			memory_rd_out <= memory_rd_in;
			memory_wr_out <= memory_wr_in;
			lb_w_out <= lb_w_in;
	      reg_write_out <= reg_write_in;
			reg_wr_src_out <= reg_wr_src_in;
			
			rs2_out <= rs2_in;
			//只有跳转指令要保存PC+4到某一个寄存器, 此时将ALU_result设为PC+4
			if(reg_wr_src_in == 2'b11)
				ALU_result_out <= PC4_in;
			else
				ALU_result_out <= ALU_result_in;

		end
	end

endmodule
