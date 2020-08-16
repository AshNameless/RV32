/************************************************* 
 
Copyright:Call_Me_ZK

File name:dataModifier.v

Author:ZK
 
Date:2020-08-9
 
Description:

	此模块根据LB/LW指令控制的lb_w信号将memory输出的32位
	数据做调整，如果是LW指令就直接输出，如果是LB就输出
	最低字节。

**************************************************/

module dataModifier

	#(parameter mem_dwidth = 32)

(data_in, lb_w, data_out);

	input [mem_dwidth-1:0] data_in;
	input lb_w;
	
	output reg [mem_dwidth-1:0] data_out;
	
	always@(data_in, lb_w) begin
		if(lb_w)
			data_out <= {24'b0, data_in[31:24]};
		else
			data_out <= data_in;
	end

endmodule
