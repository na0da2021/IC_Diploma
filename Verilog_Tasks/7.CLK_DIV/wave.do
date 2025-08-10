onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CLK_DIV_TB/i_ref_clk
add wave -noupdate /CLK_DIV_TB/i_rstn
add wave -noupdate /CLK_DIV_TB/i_clk_en
add wave -noupdate -radix unsigned /CLK_DIV_TB/i_divide_ratio
add wave -noupdate /CLK_DIV_TB/gen_clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {208250 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {330750 ps}
