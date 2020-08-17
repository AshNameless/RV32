/************************************************* 
 
Copyright:Call_Me_ZK

File name:control.v

Author:ZK
 
Date:2020-08-10
 
Description:

	控制单元, 根据当前指令以及ALU或操作数比较器的输出结
	果(针对slt类以及branch类), 产生各个模块的控制信号.
	
	2020-8-17:
	由于流水线实现中分支部分有独立的原件, 所以此单元的分支
	相关信号在流水线中就不使用. 
	
**************************************************/

`include "paras.v"

module control

	#(parameter inst_width = 32, inst_op_width = 17)

(inst_in, AB_relation, 
read1_src, reg_write, ALU_src, comp_unsigned, ALU_out, sb_w,
memory_rd, memory_wr, lb_w, reg_wr_src, PC_src);
	
	//输入指令及AB关系
	input [inst_width-1:0] inst_in;
	input AB_relation;
	
	//输出 信号含义及功能见该信号的always模块
	output reg read1_src;  //寄存器文件第一个读端口选择信号
	output reg reg_write;  //寄存器写
	output reg ALU_src;  //ALU第二操作数选择
	output reg comp_unsigned;  //比较器是否无符号操作
	output reg ALU_out;  //ALU和比较器二选一输出
	output reg sb_w;  //存byte or word
	output reg memory_rd;  //存储器读
	output reg memory_wr;  //存储器写
	output reg lb_w;  //读byte or word
	output reg [1:0] reg_wr_src;  //寄存器写数据源选择
	output reg [1:0] PC_src;  //PC更新源选择
	
	//提取指令中的操作部分
	wire[inst_op_width-1:0] operation;
	assign operation = {inst_in[6:0], inst_in[14:12], inst_in[31:25]};
	
	//read1_src: 当遇到LUI(load uppder imm)指令时, 将RF(register file第一个读端口选为0, 读取x0
	//再加上imm, 就可以利用ALU完成这条指令. 由于LUI中含有不定态, ==运算符会给出不确定结果, 因此全用casex
	always@(operation) begin
		casex(operation)
			`LUI: read1_src <= 1'b1;
			default: read1_src <= 1'b0;
		endcase
	end
	
	//reg_write: 寄存器写, 当前指令需要写寄存器时置位
	always@(operation) begin
		casex(operation)
			`ADD, `SUB, `AND, `OR, `XOR, `SLT, `SLTU, `SRA,
			`SRL, `SLL, `ADDI, `ANDI, `ORI, `XORI, `SLTI, `SLTIU,
			`SRAI, `SRLI, `SLLI, `JALR, `LW, `LB, `LUI, `JAL:
			reg_write <= 1'b1;
			default: reg_write <= 1'b0;
		endcase
	end
	
	//ALU_src: 选择ALU的第二个操作数是寄存器还是imm
	always@(operation) begin
		casex(operation)
			`ADDI, `ANDI, `ORI, `XORI, `SLTI, `SLTIU, `SRAI, 
			`SRLI, `SLLI, `JALR, `LW, `LB, `LUI, `SB, `SW:
			ALU_src <= 1'b1;
			default: ALU_src <= 1'b0;
		endcase
	end
	
	//comp_unsigned: 指示AB比较器是以有符号解释还是无符号解释. 当指令
	//需要无符号时才使用
	always@(operation) begin
		casex(operation)
			`SLTU, `SLTIU, `BLTU, `BGEU:
			comp_unsigned <= 1'b1;
			default: comp_unsigned <= 1'b0;
		endcase
	end

	//ALU_out: ALU和比较器的输出进行二选一, SLT类以及除了beq bne
	//之外的branch指令将使其置位
	always@(operation) begin
		casex(operation)
			`SLT, `SLTU, `SLTI, `SLTIU, `BLT, `BGE, `BLTU, `BGEU:
			 ALU_out <= 1'b1;
			default: ALU_out <= 1'b0;
		endcase
	end
	
	//sb_w: 是否存储字节, 仅SB指令置位
	always@(operation) begin
		casex(operation)
			`SB: sb_w <= 1'b1;
			default: sb_w <= 1'b0;
		endcase
	end
	
	//memory_rd: 需要读存储器的指令置位
	always@(operation) begin
		casex(operation)
			`LB, `LW: memory_rd <= 1'b1;
			default: memory_rd <= 1'b0;
		endcase
	end
	
	//memory_wr: 需要写存储器的指令置位
	always@(operation) begin
		casex(operation)
			`SB, `SW: memory_wr <= 1'b1;
			default: memory_wr <= 1'b0;
		endcase
	end
	
	//lb_w: 读寄存器时读字节还是字. 只有LB指令置位
	always@(operation) begin
		casex(operation)
			`LB: lb_w <= 1'b1;
			default: lb_w <= 1'b0;
		endcase
	end
	
	//reg_wr_src: RF写数据源. RF写入的数据可以是ALU计算结果(R-type)
	//存储器读出数据(LB LW), PC+4(子程序跳转保存下一条指令地址)
	always@(operation) begin
		casex(operation)
			`JALR, `JAL: reg_wr_src <= 2'b11;
			`LW, `LB: reg_wr_src <= 2'b10;
			default: reg_wr_src <= 2'b00;
		endcase
	end
	
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

endmodule


