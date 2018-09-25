onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipelined_cpustim/clk
add wave -noupdate /pipelined_cpustim/reset
add wave -noupdate /pipelined_cpustim/dut/registersyo/regs/register
add wave -noupdate /pipelined_cpustim/dut/Memory/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {592340308 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 306
configure wave -valuecolwidth 234
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
WaveRestoreZoom {0 ps} {608005507 ps}
