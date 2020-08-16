// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Full Version"
// CREATED		"Sat Aug 15 11:39:39 2020"

module non_pipeline(
	clk,
	rst_n,
	constant_four,
	zero_5bits
);


input wire	clk;
input wire	rst_n;
input wire	[31:0] constant_four;
input wire	[4:0] zero_5bits;

wire	ALU_out;
wire	ALU_src;
wire	comp_unsigned;
wire	lb_w;
wire	memory_rd;
wire	memory_wr;
wire	[1:0] PC_src;
wire	read1_src;
wire	[1:0] reg_wr_src;
wire	reg_write;
wire	sb_w;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_39;
wire	[31:0] SYNTHESIZED_WIRE_40;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_41;
wire	[31:0] SYNTHESIZED_WIRE_42;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_20;
wire	[4:0] SYNTHESIZED_WIRE_22;
wire	[4:0] SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[4:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	[4:0] SYNTHESIZED_WIRE_27;
wire	[3:0] SYNTHESIZED_WIRE_33;
wire	[4:0] SYNTHESIZED_WIRE_35;





PC	b2v_inst(
	.clk(clk),
	.rst_n(rst_n),
	.pc_in(SYNTHESIZED_WIRE_0),
	.pc_out(SYNTHESIZED_WIRE_36));
	defparam	b2v_inst.PC_width = 32;


instMem	b2v_inst1(
	.PC(SYNTHESIZED_WIRE_36),
	.instruction(SYNTHESIZED_WIRE_37));
	defparam	b2v_inst1.inst_width = 32;
	defparam	b2v_inst1.instMem_addr_width = 13;
	defparam	b2v_inst1.instMem_depth = 8192;
	defparam	b2v_inst1.PC_width = 32;


ALUctl	b2v_inst10(
	.inst_in(SYNTHESIZED_WIRE_37),
	.ALUop_out(SYNTHESIZED_WIRE_33));
	defparam	b2v_inst10.ALUop_width = 4;
	defparam	b2v_inst10.inst_op_width = 17;
	defparam	b2v_inst10.inst_width = 32;


ALUSaGen	b2v_inst11(
	.ALU_src_in(SYNTHESIZED_WIRE_38),
	.Sa_out(SYNTHESIZED_WIRE_35));
	defparam	b2v_inst11.operand_width = 32;
	defparam	b2v_inst11.Sa_width = 5;


comparator	b2v_inst12(
	.comp_unsigned(comp_unsigned),
	.comp_A(SYNTHESIZED_WIRE_39),
	.comp_B(SYNTHESIZED_WIRE_38),
	.C(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst12.in_width = 32;
	defparam	b2v_inst12.out_width = 32;


adder	b2v_inst13(
	.offset_in(SYNTHESIZED_WIRE_40),
	.PC_in(SYNTHESIZED_WIRE_36),
	.C(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst13.operand_width = 32;


mul2t1	b2v_inst14(
	.sel_in(ALU_out),
	.d1_in(SYNTHESIZED_WIRE_8),
	.d2_in(SYNTHESIZED_WIRE_9),
	.d_out(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst14.data_width = 32;


mul3t1	b2v_inst16(
	.d1_in(SYNTHESIZED_WIRE_41),
	.d2_in(SYNTHESIZED_WIRE_42),
	.d3_in(SYNTHESIZED_WIRE_12),
	.sel_in(PC_src),
	.d_out(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst16.data_width = 32;


mul3t1	b2v_inst17(
	.d1_in(SYNTHESIZED_WIRE_42),
	.d2_in(SYNTHESIZED_WIRE_14),
	.d3_in(SYNTHESIZED_WIRE_41),
	.sel_in(reg_wr_src),
	.d_out(SYNTHESIZED_WIRE_24));
	defparam	b2v_inst17.data_width = 32;


LSBextract	b2v_inst19(
	.data_input(SYNTHESIZED_WIRE_42),
	.lsb(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst19.in_dwidth = 32;


regnumDecoder	b2v_inst2(
	.instruction(SYNTHESIZED_WIRE_37),
	.rd(SYNTHESIZED_WIRE_25),
	.rs1(SYNTHESIZED_WIRE_27),
	.rs2(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst2.inst_width = 32;
	defparam	b2v_inst2.num_width = 5;


memory	b2v_inst20(
	.clk(clk),
	.sb_w(sb_w),
	.memory_read(memory_rd),
	.memory_write(memory_wr),
	.address(SYNTHESIZED_WIRE_42),
	.data_in(SYNTHESIZED_WIRE_43),
	.data_out(SYNTHESIZED_WIRE_26));
	defparam	b2v_inst20.addr_width = 12;
	defparam	b2v_inst20.data_width = 32;
	defparam	b2v_inst20.memory_depth = 2048;


control	b2v_inst21(
	.AB_relation(SYNTHESIZED_WIRE_20),
	.inst_in(SYNTHESIZED_WIRE_37),
	.read1_src(read1_src),
	.reg_write(reg_write),
	.ALU_src(ALU_src),
	.comp_unsigned(comp_unsigned),
	.ALU_out(ALU_out),
	.sb_w(sb_w),
	.memory_rd(memory_rd),
	.memory_wr(memory_wr),
	.lb_w(lb_w),
	.PC_src(PC_src),
	.reg_wr_src(reg_wr_src));
	defparam	b2v_inst21.inst_op_width = 17;
	defparam	b2v_inst21.inst_width = 32;


regFile	b2v_inst3(
	.rst_n(rst_n),
	.clk(clk),
	.wr_en(reg_write),
	.rd_num1(SYNTHESIZED_WIRE_22),
	.rd_num2(SYNTHESIZED_WIRE_23),
	.wr_data(SYNTHESIZED_WIRE_24),
	.wr_num(SYNTHESIZED_WIRE_25),
	.rd_data1(SYNTHESIZED_WIRE_39),
	.rd_data2(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst3.reg_addrwidth = 5;
	defparam	b2v_inst3.reg_dwidth = 32;
	defparam	b2v_inst3.reg_num = 32;


dataModifier	b2v_inst4(
	.lb_w(lb_w),
	.data_in(SYNTHESIZED_WIRE_26),
	.data_out(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst4.mem_dwidth = 32;


mul2t1	b2v_inst5(
	.sel_in(read1_src),
	.d1_in(SYNTHESIZED_WIRE_27),
	.d2_in(zero_5bits),
	.d_out(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst5.data_width = 5;


adder	b2v_inst6(
	.offset_in(constant_four),
	.PC_in(SYNTHESIZED_WIRE_36),
	.C(SYNTHESIZED_WIRE_41));
	defparam	b2v_inst6.operand_width = 32;


immGen	b2v_inst7(
	.inst_in(SYNTHESIZED_WIRE_37),
	.imm_out(SYNTHESIZED_WIRE_40));
	defparam	b2v_inst7.imm_width = 32;
	defparam	b2v_inst7.inst_width = 32;


mul2t1	b2v_inst8(
	.sel_in(ALU_src),
	.d1_in(SYNTHESIZED_WIRE_43),
	.d2_in(SYNTHESIZED_WIRE_40),
	.d_out(SYNTHESIZED_WIRE_38));
	defparam	b2v_inst8.data_width = 32;


ALU	b2v_inst9(
	.A(SYNTHESIZED_WIRE_39),
	.ALUop(SYNTHESIZED_WIRE_33),
	.B(SYNTHESIZED_WIRE_38),
	.Sa(SYNTHESIZED_WIRE_35),
	
	.C(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst9.opcode_width = 4;
	defparam	b2v_inst9.operand_width = 32;
	defparam	b2v_inst9.Sa_width = 5;


endmodule
