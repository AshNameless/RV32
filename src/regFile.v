/************************************************* 
 
Copyright:Call_Me_ZK

File name:regFile.v

Author:ZK
 
Date:2020-08-7
 
Description:

  寄存器文件。包含32个32bits寄存器，从x0 x1至x31。其中
  x0恒为零。有两个读端口，一个写端口。读出是组合逻辑，
  给定地址可直接读取；写入随时钟同步，在时钟上升沿写入，
  此时恰好是PC将要变成下一条指令。

**************************************************/

module regFile

	#(parameter reg_num = 32, reg_addrwidth = 5, reg_dwidth = 32)
	
(rst_n, clk, rd_num1, rd_num2, rd_data1, rd_data2, wr_num, wr_data, wr_en);

	input clk, rst_n;
	
	//读端口寄存器标号和输出
	input [reg_addrwidth-1:0] rd_num1, rd_num2;
	output [reg_dwidth-1:0] rd_data1, rd_data2;
	
	//写寄存器标号、内容、使能
	input [reg_addrwidth-1:0] wr_num;
	input [reg_dwidth-1:0] wr_data;
	input wr_en;
	
	//寄存器组
	reg [reg_dwidth-1:0] registers [0:reg_num-1];
	
	//输出数据
	assign rd_data1 = registers[rd_num1];
	assign rd_data2 = registers[rd_num2];
	
	//寄存器复位及写入
	always@(posedge clk or negedge rst_n) begin : write_to_reg
		integer i;
		if(!rst_n) begin	//复位
			for(i=0; i<reg_num; i=i+1)
				registers[i] <= 0;
		end else begin
			if(wr_en) begin
				if(wr_num == 0)
					registers[wr_num] <= 0;
				else
					registers[wr_num] <= wr_data;
			end else
				registers[wr_num] <= registers[wr_num];
		end
	end

endmodule