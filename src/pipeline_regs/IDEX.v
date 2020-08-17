/************************************************* 
 
Copyright:Call_Me_ZK

File name:IDEX.v

Author:ZK
 
Date:2020-08-16
 
Description:

  ID_EX
  
  存储的数据PC Instruction PC+4 rd_num1 rd_num2 wr_num
  
  ID读出的寄存器值和立即数rs1	rs2 imm
  
  控制信号:
  ALUop	comp_unsigned	ALU_out	PC sb/w	memory_rd	memory_wr	lb/w
  reg_write	reg_wr_src[1:0]


**************************************************/

module IDEX

	#(parameter PC_width = 32, inst_width = 32, num_width = 5, operand_width = 32, ALUop_width = 4)

(//输入
clk, rst_n, flush, rd_after_ld, PC_in, PC4_in, inst_in, rd_num1_in, rd_num2_in, wr_num_in,
rs1_in, rs2_in, imm_in, ALUop_in, ALUsrc_in, comp_unsigned_in, ALU_out_in, sb_w_in, memory_rd_in, memory_wr_in, lb_w_in,
reg_write_in, reg_wr_src_in,
//输出
PC_out, PC4_out, inst_out, rd_num1_out, rd_num2_out, wr_num_out,
rs1_out, rs2_out, imm_out, ALUop_out, ALUsrc_out ,comp_unsigned_out, ALU_out_out, sb_w_out, memory_rd_out, memory_wr_out, lb_w_out,
reg_write_out, reg_wr_src_out
);
	
	//输入
	input clk, rst_n, flush, rd_after_ld;
	input [PC_width-1:0] PC_in, PC4_in;
	input [inst_width-1:0] inst_in;
	input [num_width-1:0] rd_num1_in, rd_num2_in, wr_num_in;
	input [operand_width-1:0] rs1_in, rs2_in, imm_in;
	input [ALUop_width-1:0] ALUop_in;
	input ALUsrc_in, comp_unsigned_in, ALU_out_in, sb_w_in, memory_rd_in, memory_wr_in, lb_w_in,
	      reg_write_in;
	input [1:0] reg_wr_src_in;
	//相关输出
	output reg [PC_width-1:0] PC_out, PC4_out;
	output reg [inst_width-1:0] inst_out;
	output reg [num_width-1:0] rd_num1_out, rd_num2_out, wr_num_out;
	output reg [operand_width-1:0] rs1_out, rs2_out, imm_out;
	output reg [ALUop_width-1:0] ALUop_out;
	output reg ALUsrc_out, comp_unsigned_out, ALU_out_out, sb_w_out, memory_rd_out, memory_wr_out, lb_w_out,
	      reg_write_out;
	output reg [1:0] reg_wr_src_out;
	
	/*置零信号
	flush代表当前分支指令跳转, rd_after_ld代表有read after load hazard.
	*/
	wire zero = ~rst_n | flush | rd_after_ld;
	
	always@(posedge clk) begin
		if(zero) begin
			PC_out <= 0;
			PC4_out <= 0;
			inst_out <= 0;
			rd_num1_out <= 0;
			rd_num2_out <= 0;
			wr_num_out <= 0;
			rs1_out <= 0;
			rs2_out <= 0;
			imm_out <= 0;
			ALUop_out <= 0;
			ALUsrc_out <= 0;
			comp_unsigned_out <= 0; 
			ALU_out_out <= 0; 
			sb_w_out <= 0; 
			memory_rd_out <= 0;
			memory_wr_out <= 0; 
			lb_w_out <= 0;
	      reg_write_out <= 0;
			reg_wr_src_out <= 0;
		end else begin
			PC_out <= PC_in;
			PC4_out <= PC4_in;
			inst_out <= inst_in;
			rd_num1_out <= rd_num1_in;
			rd_num2_out <= rd_num2_in;
			wr_num_out <= wr_num_in;
			rs1_out <= rs1_in;
			rs2_out <= rs2_in;
			imm_out <= imm_in;
			ALUop_out <= ALUop_in;
			ALUsrc_out <= ALUsrc_in;
			comp_unsigned_out <= comp_unsigned_in;
			ALU_out_out <= ALU_out_in;
			sb_w_out <= sb_w_in;
			memory_rd_out <= memory_rd_in;
			memory_wr_out <= memory_wr_in;
			lb_w_out <= lb_w_in;
	      reg_write_out <= reg_write_in;
			reg_wr_src_out <= reg_wr_src_in;
		end
	end

endmodule
