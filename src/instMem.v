/************************************************* 
 
Copyright:Call_Me_ZK

File name:instMem.v

Author:ZK
 
Date:2020-08-6 
 
Description:

  指令存储器，接受PC地址，输出改地址上的数据（即指令）
  低地址是高字节
 
**************************************************/

module instMem

	#(parameter PC_width = 32, 
	
	inst_width = 32, instMem_depth = 8192, instMem_addr_width = 13)
(PC, instruction);

	//端口定义
	input [PC_width-1:0] PC;
	output [inst_width-1:0] instruction;
	
	//指令存储器的地址
	wire [instMem_addr_width-1:0] addr;
	assign addr = PC[instMem_addr_width-1:0];
	//指令存储器
	reg [7:0] memory[0:instMem_depth-1];
	assign instruction = {memory[addr], memory[addr+1], memory[addr+2], memory[addr+3]};
	
endmodule
