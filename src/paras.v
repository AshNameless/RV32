/************************************************* 
 
Copyright:Call_Me_ZK

File name:paras.v

Author:ZK
 
Date:2020-08-6
 
Description:

保存相关常量

**************************************************/
`ifndef paras_v
`define paras_v

/*

ALU操作

*/
`define ALU_or  4'b0001
`define ALU_nor  4'b0101
`define ALU_and  4'b0011
`define ALU_xor  4'b0111
`define ALU_eq  4'b0010
`define ALU_ne  4'b0000
`define ALU_le  4'b0100
`define ALU_gt  4'b0110
`define ALU_add  4'b100x
`define ALU_sub  4'b110x
`define ALU_sll  4'b101x
`define ALU_srl  4'b1110
`define ALU_sra  4'b1111

/*

指令操作码

*/
				//op			func3	func7
//R-Type								
`define ADD  17'b0110011_000_0000000
`define SUB  17'b0110011_000_0100000
`define AND  17'b0110011_111_0000000
`define OR  17'b0110011_110_0000000
`define XOR  17'b0110011_100_0000000
`define SLT  17'b0110011_010_0000000
`define SLTU  17'b0110011_011_0000000
`define SRA  17'b0110011_101_0100000
`define SRL  17'b0110011_101_0000000
`define SLL  17'b0110011_001_0000000
//I-Type
`define ADDI  17'b0010011_000_xxxxxxx
`define ANDI  17'b0010011_111_xxxxxxx
`define ORI  17'b0010011_110_xxxxxxx
`define XORI  17'b0010011_100_xxxxxxx
`define SLTI  17'b0010011_010_xxxxxxx
`define SLTIU  17'b0010011_011_xxxxxxx
`define SRAI  17'b0010011_101_0100000
`define SRLI  17'b0010011_101_0000000
`define SLLI  17'b0010011_001_0000000
`define JALR  17'b1100111_000_xxxxxxx
`define LW  17'b0000011_010_xxxxxxx
`define LB  17'b0000011_000_xxxxxxx
//U-Type
`define AUIPC  17'b0010111_xxx_xxxxxxx
`define LUI  17'b0110111_xxx_xxxxxxx
//UJ-Type
`define JAL  17'b1101111_xxx_xxxxxxx
//SB-Type
`define BEQ  17'b1100011_000_xxxxxxx
`define BNE  17'b1100011_001_xxxxxxx
`define BLT  17'b1100011_100_xxxxxxx
`define BGE  17'b1100011_101_xxxxxxx
`define BLTU  17'b1100011_110_xxxxxxx
`define BGEU  17'b1100011_111_xxxxxxx
//S-Type
`define SB  17'b0100011_000_xxxxxxx
`define SW  17'b0100011_010_xxxxxxx


`endif
