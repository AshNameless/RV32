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
// CREATED		"Mon Aug 17 16:11:27 2020"

module pipeline(
	clk,
	rst_n,
	const_4,
	zero
);


input wire	clk;
input wire	rst_n;
input wire	[31:0] const_4;
input wire	[4:0] zero;

wire	[3:0] EX_ALUop;
wire	EX_ALUout;
wire	[31:0] EX_ALUresult;
wire	EX_comp;
wire	EX_flush;
wire	EX_lbw;
wire	EX_memread;
wire	EX_memwr;
wire	[31:0] EX_PC4;
wire	[31:0] EX_PCimm;
wire	[1:0] EX_PCsrc;
wire	[4:0] EX_rdnum1;
wire	[4:0] EX_rdnum2;
wire	EX_regwr;
wire	[1:0] EX_regwsrc;
wire	EX_sbw;
wire	[4:0] EX_wrnum;
wire	[1:0] foward_A;
wire	[1:0] foward_B;
wire	hazard;
wire	[31:0] ID_inst;
wire	[31:0] ID_PC4_;
wire	[31:0] ID_PC_;
wire	[4:0] ID_rnum1;
wire	[4:0] ID_rnum2;
wire	[4:0] ID_wrnum;
wire	[31:0] MEM_ALUresult;
wire	MEM_regwr;
wire	[1:0] MEM_regwsrc;
wire	[4:0] MEM_wrnum;
wire	WB_regwr;
wire	[31:0] WB_wrdata;
wire	[4:0] WB_wrnum;
wire	SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[1:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_53;
wire	[31:0] SYNTHESIZED_WIRE_54;
wire	[4:0] SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_55;
wire	[31:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_56;
wire	[31:0] SYNTHESIZED_WIRE_57;
wire	[4:0] SYNTHESIZED_WIRE_29;
wire	[4:0] SYNTHESIZED_WIRE_30;
wire	[4:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	[31:0] SYNTHESIZED_WIRE_58;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	[31:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[31:0] SYNTHESIZED_WIRE_47;
wire	[31:0] SYNTHESIZED_WIRE_48;
wire	[4:0] SYNTHESIZED_WIRE_51;





PC	b2v_inst(
	.clk(clk),
	.rst_n(rst_n),
	.pc_write(SYNTHESIZED_WIRE_0),
	.pc_in(SYNTHESIZED_WIRE_1),
	.pc_out(SYNTHESIZED_WIRE_52));
	defparam	b2v_inst.PC_width = 32;


instMem	b2v_inst1(
	.PC(SYNTHESIZED_WIRE_52),
	.instruction(SYNTHESIZED_WIRE_56));
	defparam	b2v_inst1.inst_width = 32;
	defparam	b2v_inst1.instMem_addr_width = 13;
	defparam	b2v_inst1.instMem_depth = 8192;
	defparam	b2v_inst1.PC_width = 32;


mul2t1	b2v_inst10(
	.sel_in(SYNTHESIZED_WIRE_3),
	.d1_in(ID_rnum1),
	.d2_in(zero),
	.d_out(SYNTHESIZED_WIRE_51));
	defparam	b2v_inst10.data_width = 5;


ALUctl	b2v_inst11(
	.inst_in(ID_inst),
	.ALUop_out(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst11.ALUop_width = 4;
	defparam	b2v_inst11.inst_op_width = 17;
	defparam	b2v_inst11.inst_width = 32;


control	b2v_inst12(
	
	.inst_in(ID_inst),
	.read1_src(SYNTHESIZED_WIRE_3),
	.reg_write(SYNTHESIZED_WIRE_11),
	.ALU_src(SYNTHESIZED_WIRE_4),
	.comp_unsigned(SYNTHESIZED_WIRE_5),
	.ALU_out(SYNTHESIZED_WIRE_6),
	.sb_w(SYNTHESIZED_WIRE_7),
	.memory_rd(SYNTHESIZED_WIRE_8),
	.memory_wr(SYNTHESIZED_WIRE_9),
	.lb_w(SYNTHESIZED_WIRE_10),
	
	.reg_wr_src(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst12.inst_op_width = 17;
	defparam	b2v_inst12.inst_width = 32;


IDEX	b2v_inst14(
	.clk(clk),
	.rst_n(rst_n),
	.flush(EX_flush),
	.rd_after_ld(hazard),
	.ALUsrc_in(SYNTHESIZED_WIRE_4),
	.comp_unsigned_in(SYNTHESIZED_WIRE_5),
	.ALU_out_in(SYNTHESIZED_WIRE_6),
	.sb_w_in(SYNTHESIZED_WIRE_7),
	.memory_rd_in(SYNTHESIZED_WIRE_8),
	.memory_wr_in(SYNTHESIZED_WIRE_9),
	.lb_w_in(SYNTHESIZED_WIRE_10),
	.reg_write_in(SYNTHESIZED_WIRE_11),
	.ALUop_in(SYNTHESIZED_WIRE_12),
	.imm_in(SYNTHESIZED_WIRE_13),
	.inst_in(ID_inst),
	.PC4_in(ID_PC4_),
	.PC_in(ID_PC_),
	.rd_num1_in(ID_rnum1),
	.rd_num2_in(ID_rnum2),
	.reg_wr_src_in(SYNTHESIZED_WIRE_14),
	.rs1_in(SYNTHESIZED_WIRE_15),
	.rs2_in(SYNTHESIZED_WIRE_16),
	.wr_num_in(ID_wrnum),
	.ALUsrc_out(SYNTHESIZED_WIRE_35),
	.comp_unsigned_out(EX_comp),
	.ALU_out_out(EX_ALUout),
	.sb_w_out(EX_sbw),
	.memory_rd_out(EX_memread),
	.memory_wr_out(EX_memwr),
	.lb_w_out(EX_lbw),
	.reg_write_out(EX_regwr),
	.ALUop_out(EX_ALUop),
	.imm_out(SYNTHESIZED_WIRE_55),
	.inst_out(SYNTHESIZED_WIRE_21),
	.PC4_out(EX_PC4),
	.PC_out(SYNTHESIZED_WIRE_25),
	.rd_num1_out(EX_rdnum1),
	.rd_num2_out(EX_rdnum2),
	.reg_wr_src_out(EX_regwsrc),
	.rs1_out(SYNTHESIZED_WIRE_34),
	.rs2_out(SYNTHESIZED_WIRE_33),
	.wr_num_out(EX_wrnum));
	defparam	b2v_inst14.ALUop_width = 4;
	defparam	b2v_inst14.inst_width = 32;
	defparam	b2v_inst14.num_width = 5;
	defparam	b2v_inst14.operand_width = 32;
	defparam	b2v_inst14.PC_width = 32;


ALU	b2v_inst15(
	.A(SYNTHESIZED_WIRE_53),
	.ALUop(EX_ALUop),
	.B(SYNTHESIZED_WIRE_54),
	.Sa(SYNTHESIZED_WIRE_19),
	
	.C(SYNTHESIZED_WIRE_38));
	defparam	b2v_inst15.opcode_width = 4;
	defparam	b2v_inst15.operand_width = 32;
	defparam	b2v_inst15.Sa_width = 5;


branchHandler	b2v_inst16(
	.AB_relation(SYNTHESIZED_WIRE_20),
	.inst_in(SYNTHESIZED_WIRE_21),
	.flush(EX_flush),
	.PC_src(EX_PCsrc));
	defparam	b2v_inst16.inst_op_width = 17;
	defparam	b2v_inst16.inst_width = 32;


comparator	b2v_inst17(
	.comp_unsigned(EX_comp),
	.comp_A(SYNTHESIZED_WIRE_53),
	.comp_B(SYNTHESIZED_WIRE_54),
	.C(SYNTHESIZED_WIRE_39));
	defparam	b2v_inst17.in_width = 32;
	defparam	b2v_inst17.out_width = 32;


adder	b2v_inst18(
	.offset_in(SYNTHESIZED_WIRE_55),
	.PC_in(SYNTHESIZED_WIRE_25),
	.C(EX_PCimm));
	defparam	b2v_inst18.operand_width = 32;


LSBextract	b2v_inst19(
	.data_input(EX_ALUresult),
	.lsb(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst19.in_dwidth = 32;


IFID	b2v_inst2(
	.clk(clk),
	.rst_n(rst_n),
	.flush(EX_flush),
	.hazard(hazard),
	.inst_in(SYNTHESIZED_WIRE_56),
	.PC4_in(SYNTHESIZED_WIRE_57),
	.PC_in(SYNTHESIZED_WIRE_52),
	.rd_num1_in(SYNTHESIZED_WIRE_29),
	.rd_num2_in(SYNTHESIZED_WIRE_30),
	.wr_num_in(SYNTHESIZED_WIRE_31),
	.inst_out(ID_inst),
	.PC4_out(ID_PC4_),
	.PC_out(ID_PC_),
	.rd_num1_out(ID_rnum1),
	.rd_num2_out(ID_rnum2),
	.wr_num_out(ID_wrnum));
	defparam	b2v_inst2.inst_width = 32;
	defparam	b2v_inst2.num_width = 5;
	defparam	b2v_inst2.PC_width = 32;


ALUSaGen	b2v_inst20(
	.ALU_src_in(SYNTHESIZED_WIRE_54),
	.Sa_out(SYNTHESIZED_WIRE_19));
	defparam	b2v_inst20.operand_width = 32;
	defparam	b2v_inst20.Sa_width = 5;


mul3t1	b2v_inst22(
	.d1_in(SYNTHESIZED_WIRE_33),
	.d2_in(MEM_ALUresult),
	.d3_in(WB_wrdata),
	.sel_in(foward_B),
	.d_out(SYNTHESIZED_WIRE_58));
	defparam	b2v_inst22.data_width = 32;


mul3t1	b2v_inst23(
	.d1_in(SYNTHESIZED_WIRE_34),
	.d2_in(MEM_ALUresult),
	.d3_in(WB_wrdata),
	.sel_in(foward_A),
	.d_out(SYNTHESIZED_WIRE_53));
	defparam	b2v_inst23.data_width = 32;


mul2t1	b2v_inst24(
	.sel_in(SYNTHESIZED_WIRE_35),
	.d1_in(SYNTHESIZED_WIRE_58),
	.d2_in(SYNTHESIZED_WIRE_55),
	.d_out(SYNTHESIZED_WIRE_54));
	defparam	b2v_inst24.data_width = 32;


mul2t1	b2v_inst25(
	.sel_in(EX_ALUout),
	.d1_in(SYNTHESIZED_WIRE_38),
	.d2_in(SYNTHESIZED_WIRE_39),
	.d_out(EX_ALUresult));
	defparam	b2v_inst25.data_width = 32;


EXMEM	b2v_inst26(
	.clk(clk),
	.rst_n(rst_n),
	.sb_w_in(EX_sbw),
	.memory_rd_in(EX_memread),
	.memory_wr_in(EX_memwr),
	.lb_w_in(EX_lbw),
	.reg_write_in(EX_regwr),
	.ALU_result_in(EX_ALUresult),
	.PC4_in(EX_PC4),
	.reg_wr_src_in(EX_regwsrc),
	.rs2_in(SYNTHESIZED_WIRE_58),
	.wr_num_in(EX_wrnum),
	.sb_w_out(SYNTHESIZED_WIRE_42),
	.memory_rd_out(SYNTHESIZED_WIRE_43),
	.memory_wr_out(SYNTHESIZED_WIRE_44),
	.lb_w_out(SYNTHESIZED_WIRE_46),
	.reg_write_out(MEM_regwr),
	.ALU_result_out(MEM_ALUresult),
	.reg_wr_src_out(MEM_regwsrc),
	.rs2_out(SYNTHESIZED_WIRE_45),
	.wr_num_out(MEM_wrnum));
	defparam	b2v_inst26.ALUop_width = 4;
	defparam	b2v_inst26.num_width = 5;
	defparam	b2v_inst26.operand_width = 32;
	defparam	b2v_inst26.PC_width = 32;


mul3t1	b2v_inst27(
	.d1_in(SYNTHESIZED_WIRE_57),
	.d2_in(EX_ALUresult),
	.d3_in(EX_PCimm),
	.sel_in(EX_PCsrc),
	.d_out(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst27.data_width = 32;


memory	b2v_inst28(
	.clk(clk),
	.sb_w(SYNTHESIZED_WIRE_42),
	.memory_read(SYNTHESIZED_WIRE_43),
	.memory_write(SYNTHESIZED_WIRE_44),
	.address(MEM_ALUresult),
	.data_in(SYNTHESIZED_WIRE_45),
	.data_out(SYNTHESIZED_WIRE_47));
	defparam	b2v_inst28.addr_width = 12;
	defparam	b2v_inst28.data_width = 32;
	defparam	b2v_inst28.memory_depth = 2048;


dataModifier	b2v_inst29(
	.lb_w(SYNTHESIZED_WIRE_46),
	.data_in(SYNTHESIZED_WIRE_47),
	.data_out(SYNTHESIZED_WIRE_48));
	defparam	b2v_inst29.mem_dwidth = 32;


MEMWB	b2v_inst30(
	.clk(clk),
	.rst_n(rst_n),
	.reg_write_in(MEM_regwr),
	.ALU_result_in(MEM_ALUresult),
	.memory_data_in(SYNTHESIZED_WIRE_48),
	.reg_wr_src_in(MEM_regwsrc),
	.wr_num_in(MEM_wrnum),
	.reg_write_out(WB_regwr),
	.wr_data_out(WB_wrdata),
	.wr_num_out(WB_wrnum));
	defparam	b2v_inst30.ALUop_width = 4;
	defparam	b2v_inst30.num_width = 5;
	defparam	b2v_inst30.operand_width = 32;


foward	b2v_inst31(
	.MEM_regwr(MEM_regwr),
	.WB_regwr(WB_regwr),
	.EX_rs1(EX_rdnum1),
	.EX_rs2(EX_rdnum2),
	.MEM_rd(MEM_wrnum),
	.WB_rd(WB_wrnum),
	.EX_rs1src(foward_A),
	.EX_rs2src(foward_B));
	defparam	b2v_inst31.num_width = 5;


hazardDetect	b2v_inst32(
	.EX_memread(EX_memread),
	.EX_rd(EX_wrnum),
	.ID_rs1(ID_rnum1),
	.ID_rs2(ID_rnum2),
	.hazard(hazard));
	defparam	b2v_inst32.num_width = 5;

assign	SYNTHESIZED_WIRE_0 =  ~hazard;


regnumDecoder	b2v_inst6(
	.instruction(SYNTHESIZED_WIRE_56),
	.rd(SYNTHESIZED_WIRE_31),
	.rs1(SYNTHESIZED_WIRE_29),
	.rs2(SYNTHESIZED_WIRE_30));
	defparam	b2v_inst6.inst_width = 32;
	defparam	b2v_inst6.num_width = 5;


adder	b2v_inst7(
	.offset_in(const_4),
	.PC_in(SYNTHESIZED_WIRE_52),
	.C(SYNTHESIZED_WIRE_57));
	defparam	b2v_inst7.operand_width = 32;


regFile	b2v_inst8(
	.rst_n(rst_n),
	.clk(clk),
	.wr_en(WB_regwr),
	.rd_num1(SYNTHESIZED_WIRE_51),
	.rd_num2(ID_rnum2),
	.wr_data(WB_wrdata),
	.wr_num(WB_wrnum),
	.rd_data1(SYNTHESIZED_WIRE_15),
	.rd_data2(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst8.reg_addrwidth = 5;
	defparam	b2v_inst8.reg_dwidth = 32;
	defparam	b2v_inst8.reg_num = 32;


immGen	b2v_inst9(
	.inst_in(ID_inst),
	.imm_out(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst9.imm_width = 32;
	defparam	b2v_inst9.inst_width = 32;


endmodule
