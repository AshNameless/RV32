onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst/clk
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst/rst_n
add wave -noupdate -radix unsigned /non_pipeline_vlg_tst/i1/b2v_inst/pc_in
add wave -noupdate -radix unsigned /non_pipeline_vlg_tst/i1/b2v_inst/pc_out
add wave -noupdate -radix unsigned /non_pipeline_vlg_tst/i1/b2v_inst3/rd_num1
add wave -noupdate -radix unsigned /non_pipeline_vlg_tst/i1/b2v_inst3/rd_num2
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst3/rd_data1
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst3/rd_data2
add wave -noupdate -radix unsigned /non_pipeline_vlg_tst/i1/b2v_inst3/wr_num
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst3/wr_data
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst3/wr_en
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst3/registers
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst20/memory_read
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst20/memory_write
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst20/data_in
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst20/data_out
add wave -noupdate -radix unsigned /non_pipeline_vlg_tst/i1/b2v_inst20/addr
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst20/mem
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst9/ALUop
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst9/A
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst9/B
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst9/C
add wave -noupdate -radix decimal /non_pipeline_vlg_tst/i1/b2v_inst7/imm_out
add wave -noupdate /non_pipeline_vlg_tst/i1/b2v_inst7/inst_type
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {102042373 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
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
WaveRestoreZoom {102014852 ps} {102067148 ps}
