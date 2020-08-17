/************************************************* 
 
Copyright:Call_Me_ZK

File name:branchHandler.v

Author:ZK
 
Date:2020-08-17
 
Description:
  
  1.完成分支指令的跳转. 从ID/EX寄存器中读取指令, 同时获取
  当前EX阶段操作数的大小关系信号, 判断分支是否跳转. 
  
  2.若分支跳转, 则在下一个上升沿到来时将PC置为目标地址, 同时
  输出flush信号将IF/ID ID/EX清空, 避免后续两条指令.
  
  3.分支指令本身则被写入EX/MEM, 对于beq系列指令, 由于不进行
  任何写操作, 直接通过后续两个stages. 对于jal jalr, 置PC
  的同时也需要将PC+4保存到某一个寄存器中, 在WB阶段便可完成.
  
  4.实现照搬control模块

**************************************************/

`include "paras.v"

module branchHandler

	#(parameter inst_width = 32, inst_op_width = 17)

(inst_in, AB_relation, PC_src, flush);

	input [inst_width-1:0] inst_in;
	input AB_relation;
	
	output reg [1:0] PC_src;
	output reg flush;
	
	//提取指令中的操作部分
	wire[inst_op_width-1:0] operation;
	assign operation = {inst_in[6:0], inst_in[14:12], inst_in[31:25]};
	
	//PC_src: PC的值可以是PC+4, PC+imm, ALU操作数1+imm.
	//遇到分支指令则根据分支条件(AB的大小关系)是否成立来置位
	always@(operation, AB_relation) begin
		casex(operation)
			`JALR: PC_src <= 2'b10;
			`AUIPC, `JAL: PC_src <= 2'b11;
			`BEQ, `BNE, `BLT, `BLTU: begin //BEQ BNE利用ALU eq ne操作, BLT BLTU利用比较器结果. 当结果为1时, 说明结果成立
			if(AB_relation == 1'b1)
				PC_src <= 2'b11;
			else
				PC_src <= 2'b00;
			end
	
			`BGE, `BGEU: begin //利用比较器结果. 当结果为1时, 说明 A < B, 所以不跳转
			if(AB_relation == 1'b1)
				PC_src <= 2'b00;
			else
				PC_src <= 2'b11;
			end
			
			default:  PC_src <= 2'b00;
		endcase
	end
	
	always@(PC_src) begin
		if(PC_src == 2'b00)
			flush <= 1'b0;
		else
			flush <= 1'b1;
	end

endmodule
