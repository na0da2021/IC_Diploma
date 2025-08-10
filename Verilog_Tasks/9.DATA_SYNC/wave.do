onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Magenta /TB_DATA_SYNC/DUT/clk
add wave -noupdate -color Magenta /TB_DATA_SYNC/DUT/rst
add wave -noupdate -color Magenta /TB_DATA_SYNC/DUT/unsync_bus
add wave -noupdate -color Magenta /TB_DATA_SYNC/DUT/bus_enable
add wave -noupdate /TB_DATA_SYNC/DUT/meta_flop
add wave -noupdate -color Cyan /TB_DATA_SYNC/DUT/sync_flop
add wave -noupdate -color Cyan /TB_DATA_SYNC/DUT/enable_flop
add wave -noupdate /TB_DATA_SYNC/DUT/enable_pulse_comb
add wave -noupdate /TB_DATA_SYNC/DUT/sync_bus_comb
add wave -noupdate /TB_DATA_SYNC/DUT/enable_pulse
add wave -noupdate -color Magenta /TB_DATA_SYNC/DUT/sync_bus
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {118281 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {7764 ps} {133802 ps}
