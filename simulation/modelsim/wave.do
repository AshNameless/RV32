onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst/clk
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst/rst_n
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst/pc_write
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst/pc_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst/pc_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst2/clk
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst2/rst_n
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst2/flush
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst2/hazard
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/PC_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/PC4_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst2/inst_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/rd_num1_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/rd_num2_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/wr_num_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/PC_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/PC4_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst2/inst_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/rd_num1_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/rd_num2_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst2/wr_num_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst2/zero
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/PC_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/PC4_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/inst_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/rd_num1_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/rd_num2_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/wr_num_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/rs1_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/rs2_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/imm_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/ALUop_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/ALUsrc_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/comp_unsigned_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/ALU_out_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/sb_w_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/memory_rd_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/memory_wr_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/lb_w_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/reg_write_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/reg_wr_src_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/PC_out
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/PC4_out
add wave -noupdate -radix symbolic /pipeline_vlg_tst/i1/b2v_inst14/inst_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/rd_num1_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/rd_num2_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst14/wr_num_out
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/rs1_out
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/rs2_out
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst14/imm_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/ALUop_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/ALUsrc_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/comp_unsigned_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/ALU_out_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/sb_w_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/memory_rd_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/memory_wr_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/lb_w_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/reg_write_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst14/reg_wr_src_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst26/PC4_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst26/wr_num_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst26/rs2_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst26/ALU_result_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/sb_w_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/memory_rd_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/memory_wr_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/lb_w_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/reg_write_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/reg_wr_src_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst26/wr_num_out
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst26/rs2_out
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst26/ALU_result_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/sb_w_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/memory_rd_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/memory_wr_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/lb_w_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/reg_write_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst26/reg_wr_src_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst30/wr_num_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst30/ALU_result_in
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst30/memory_data_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst30/reg_write_in
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst30/reg_wr_src_in
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst30/wr_num_out
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst30/wr_data_out
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst30/reg_write_out
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst31/EX_rs1
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst31/EX_rs2
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst31/MEM_rd
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst31/WB_rd
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst31/MEM_regwr
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst31/WB_regwr
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst31/EX_rs1src
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst31/EX_rs2src
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst32/ID_rs1
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst32/ID_rs2
add wave -noupdate -radix unsigned /pipeline_vlg_tst/i1/b2v_inst32/EX_rd
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst32/EX_memread
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst32/hazard
add wave -noupdate -radix decimal /pipeline_vlg_tst/i1/b2v_inst8/registers
add wave -noupdate /pipeline_vlg_tst/i1/b2v_inst28/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {975804 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 254
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {968827 ps} {1001641 ps}
