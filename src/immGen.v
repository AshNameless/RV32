/************************************************* 
 
Copyright:Call_Me_ZK

File name:immGen.v

Author:ZK
 
Date:2020-08-6 
 
Description:

  立即数产生逻辑。根据输入的指令提取出对应的立即数，以
  32位输出，注意imm是补码表示
  
immTypeRecog指令类型识别				
				op		func3	func7	
R-Type	0110011	xxx	0x000000	
				
I-Type	0010011	xxx	0x000000	
			1100111	000
			0000011  0x0
				
U-Type	0010111			
			0110111			
				
UJ-Type	1101111			
				
SB-Type	1100011			
				
S-Type	0100011			

各类指令的字段信息
									32bits					
		7				5			5		3			5					7
R	func7				rs2		rs1	func3		rd					opcode
I	imm[11:0]					|rs1	func3		rd					opcode
S	imm[11:5]		rs2		rs1	func3		imm[4:0]			opcode
SB	imm[12|10:5]	rs2		rs1	func3		imm[4:1|11]		opcode
U	imm[32:12]										|rd				opcode
UJ	imm[20|10:1|11|19:12]						|rd				opcode
 
**************************************************/

module immGen

	#(parameter inst_width = 32, imm_width = 32)
	
(inst_in, imm_out);
	//输入指令，输出立即数
	input [inst_width-1:0] inst_in;
	output reg[imm_width-1:0] imm_out;
	
	//指令类型，R I U UJ SB S|0 1 2 3 4 5
	reg [2:0] inst_type;
	
	//低7bits为opcode，由于指令不多可以只用opcode来解码指令类型
	always@(inst_in[6:0]) begin
		case(inst_in[6:0])
			7'b0110011: inst_type <= 3'b000;
			7'b0010011, 7'b1100111, 7'b0000011: inst_type <= 3'b001;
			7'b0010111, 7'b0110111: inst_type <= 3'b010;
			7'b1101111: inst_type <= 3'b011;
			7'b1100011: inst_type <= 3'b100;
			7'b0100011: inst_type <= 3'b101;
			default: inst_type <= 3'b000; 
		endcase
	end
	
	//根据指令类型产生立即数
	always@(inst_type, inst_in) begin
		case(inst_type)
			3'd0: imm_out <= 0;
			3'd1: imm_out <= {{20{inst_in[31]}}, inst_in[31:20]};
			3'd2: imm_out <= {inst_in[31:12], 12'b0};
			3'd3: imm_out <= {{11{inst_in[31]}}, inst_in[31], inst_in[19:12], inst_in[20], inst_in[30:21], 1'b0};
			3'd4: imm_out <= {{19{inst_in[31]}}, inst_in[31], inst_in[7], inst_in[30:25], inst_in[11:8] , 1'b0};
			3'd5: imm_out <= {{20{inst_in[31]}}, inst_in[31:25], inst_in[11:7]};
		default: imm_out <= 0;
		endcase
	end

endmodule





