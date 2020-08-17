/************************************************* 
 
Copyright:Call_Me_ZK

File name:foward.v

Author:ZK
 
Date:2020-08-17
 
Description:
  
  foward, 当指令间存在data hazard时完成data foward操作.
  
  处在EX stage的指令i, 其信息保存在ID/EX中. 能够foward的
  有以下两类数据依赖:
  
  1.i的源操作数是i-1的目的操作数, i-1在EX/MEM中. 若i-1.reg_write = 1,
    则i-1的值应该是最新的值, 需要送给i使用
    注意: i-1不能为lb lw指令!!!
  
  2.i的源操作数是i-2的目的操作数, i-2在MEM/WB中. 若i-2.reg_write = 1,
    则i-2的值要送到EX阶段. 因为该阶段的指令已经完成了存储器操作, 
	 所以i-2可以是lb lw指令.
	
  对于第一种情况, 若i-1是lw/b指令, 必须等i-1完成MEM阶段后
  才能执行i的操作. 因此, 这种情况需要插入一个stall, 这由另一个
  hazard detect模块完成.
  
  此外, 当写入寄存器是x0时, 不进行传递. 因为x0必须是0

**************************************************/

module foward

	#(parameter num_width = 5)

(EX_rs1, EX_rs2, MEM_rd, MEM_regwr, WB_rd, WB_regwr, EX_rs1src, EX_rs2src);
	
	//EX MEM WB三阶段指令相关的寄存器标号
	input [num_width-1:0] EX_rs1, EX_rs2, MEM_rd, WB_rd;
	input MEM_regwr, WB_regwr;  //寄存器写信号
	
	output reg [1:0] EX_rs1src, EX_rs2src;  //EX阶段两个operands源
	
	//00: no foward 10:foward from MEM 11:foward from WB
	always@(EX_rs1, EX_rs2, MEM_rd, MEM_regwr, WB_rd, WB_regwr) begin
		//EX_rs1src
		if(MEM_rd == EX_rs1 && EX_rs1 != 0) begin
			if(MEM_regwr == 1'b1)
				EX_rs1src <= 2'b10;
			else
				EX_rs1src <= 2'b00;
		end else if(WB_rd == EX_rs1 && EX_rs1 != 0) begin
			if(WB_regwr == 1'b1)
				EX_rs1src <= 2'b11;
			else
				EX_rs1src <= 2'b00;
		end else
			EX_rs1src <= 2'b00;

		//EX_rs2src
		if(MEM_rd == EX_rs2 && EX_rs2 != 0) begin
			if(MEM_regwr == 1'b1)
				EX_rs2src <= 2'b10;
			else
				EX_rs2src <= 2'b00;
		end else if(WB_rd == EX_rs2 && EX_rs2 != 0) begin
			if(WB_regwr == 1'b1)
				EX_rs2src <= 2'b11;
			else
				EX_rs2src <= 2'b00;
		end else
			EX_rs2src <= 2'b00;
	end
	

endmodule



