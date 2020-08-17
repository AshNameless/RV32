/************************************************* 
 
Copyright:Call_Me_ZK

File name:hazardDetect.v

Author:ZK
 
Date:2020-08-17
 
Description:
  
  当第i条指令的源操作数是i-1的目的操作数, 且i-1是lw/b指令时, 
  必须等i-1完成MEM阶段后才能执行i的操作. 因此, 这种情况需要
  插入一个stall.
  
  由于两条指令相邻, 所以从ID EX两个阶段输入指令信息. 若检测到hazard,
  则将PC_wr拉低, hazard置位. 下一个上升沿到来时, PC的值不更新, i+1
  指令继续IF; IF/ID寄存器不更新, i指令继续ID; ID/EX寄存器的旧值传递到
  EX/MEM, 然后本身被清空. 这样, i-1的指令执行到MEM, i指令继续在ID, 中间
  插入一个stall. 
  
  之后, 流水线继续执行, i-1在MEM, i在ID, 可以通过forwad单元保证流水线
  继续执行.

**************************************************/

module hazardDetect

	#(parameter num_width = 5)

(ID_rs1, ID_rs2, EX_rd, EX_memread, hazard);
	
	input [num_width-1:0] ID_rs1, ID_rs2, EX_rd;  //寄存器编号
	input EX_memread;  //是否读存储器
	
	output reg hazard;
	
	always@(ID_rs1, ID_rs2, EX_rd, EX_memread) begin
		if(EX_memread == 1'b1 && (EX_rd == ID_rs1 || EX_rd == ID_rs2))
			hazard <= 1'b1;
		else
			hazard <= 1'b0;
	end
	

endmodule
