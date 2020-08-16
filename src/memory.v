/************************************************* 
 
Copyright:Call_Me_ZK

File name:memory.v

Author:ZK
 
Date:2020-08-9
 
Description:

  存储数据的memory。因为只仿真测试结果，所以直接用寄存器
  写一个模块吧，内存一般是用DRAM，这里就不管他了。
  注意:数据高字节在低地址

**************************************************/

module memory

	#(parameter memory_depth = 2048, addr_width = 12, data_width = 32)

(clk, address, sb_w, memory_read, memory_write, data_in, data_out);
	
	input clk;
	input [data_width-1:0] address;
	input sb_w;  //存储的是字还是字节
	input memory_read, memory_write;  //读写信号
	input [data_width-1:0] data_in;
	
	output reg [data_width-1:0] data_out;
	
	//由于存储器只设置为2048B, 重新设置地址宽度
	wire [addr_width-1:0] addr;
	assign addr = address[addr_width-1:0];
	
	//定义存储器，按字节寻址
	reg [7:0] mem[0:memory_depth-1];
	
	//读寄存器 只有read置位write为0才读出，否则就是0
	always@(addr, memory_read, memory_write, mem) begin
		if(memory_read == 1'b1 && memory_write == 1'b0)
			data_out <= {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]} ;
		else
			data_out <= 0;
	end
	
	//写寄存器, 与时钟同步
	always@(posedge clk) begin
		if(memory_read == 1'b0 && memory_write == 1'b1) begin
			if(sb_w)
				mem[addr] <= data_in[7:0];
			else
				{mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]} <= data_in;
		end else
			mem[addr] <= mem[addr];
	end
endmodule

