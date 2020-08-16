/************************************************* 
 
Copyright:Call_Me_ZK

File name:mul2t1.v

Author:ZK
 
Date:2020-08-10
 
Description:
	2选1多路选择器
**************************************************/

module mul2t1

	#(parameter data_width = 32)

(d1_in, d2_in, sel_in, d_out);
	
	input [data_width-1:0] d1_in, d2_in;
	input sel_in;  //选择位
	output reg [data_width-1:0] d_out;
	
	always@(d1_in, d2_in, sel_in) begin
		if(sel_in)
			d_out <= d2_in;
		else
			d_out <= d1_in;
	end

endmodule