onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {writing side} -color Coral /TB_ASYNC_FIFO/wclk
add wave -noupdate -expand -group {writing side} -color Coral /TB_ASYNC_FIFO/wrst_n
add wave -noupdate -expand -group {writing side} -color Coral /TB_ASYNC_FIFO/winc
add wave -noupdate -expand -group {writing side} /TB_ASYNC_FIFO/Dut/FIFO_mem/w_clk_en
add wave -noupdate -expand -group {writing side} -radix unsigned /TB_ASYNC_FIFO/Dut/FIFO_mem/w_addr
add wave -noupdate -expand -group {writing side} -color Coral -radix unsigned /TB_ASYNC_FIFO/wdata
add wave -noupdate -color Cyan /TB_ASYNC_FIFO/Dut/FIFO_WR/wq2_rptr
add wave -noupdate -color Cyan /TB_ASYNC_FIFO/Dut/FIFO_WR/wptr
add wave -noupdate -color Cyan /TB_ASYNC_FIFO/wfull
add wave -noupdate -expand -group {Reading side} -color Magenta /TB_ASYNC_FIFO/rclk
add wave -noupdate -expand -group {Reading side} -color Magenta /TB_ASYNC_FIFO/rrst_n
add wave -noupdate -expand -group {Reading side} -color Magenta /TB_ASYNC_FIFO/rinc
add wave -noupdate -expand -group {Reading side} -radix unsigned /TB_ASYNC_FIFO/Dut/FIFO_mem/r_addr
add wave -noupdate -expand -group {Reading side} -radix unsigned /TB_ASYNC_FIFO/rdata
add wave -noupdate -color Cyan /TB_ASYNC_FIFO/Dut/FIFO_RD/rq2_wptr
add wave -noupdate -color Cyan /TB_ASYNC_FIFO/Dut/FIFO_RD/rptr
add wave -noupdate -color Cyan /TB_ASYNC_FIFO/rempty
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156379 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 128
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
WaveRestoreZoom {0 ps} {393750 ps}
