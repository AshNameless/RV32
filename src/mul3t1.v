/************************************************* 
 
Copyright:Call_Me_ZK

File name:mul3t1.v

Author:ZK
 
Date:2020-08-10
 
Description:
	3选1多路选择器
**************************************************/

module mul3t1

	#(parameter data_width = 32)

(d1_in, d2_in, d3_in, sel_in, d_out);
	
	input [data_width-1:0] d1_in, d2_in, d3_in;
	input [1:0] sel_in;  //选择位
	output reg [data_width-1:0] d_out;
	
	always@(d1_in, d2_in, d3_in, sel_in) begin
		case(sel_in)
			2'b00: d_out <= d1_in;
			2'b10: d_out <= d2_in;
			2'b11: d_out <= d3_in;
			default: d_out <= d1_in;
		endcase
	end

endmodule