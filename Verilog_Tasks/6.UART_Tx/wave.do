onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/clk
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/rstn
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/P_DATA
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/data_valid
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/par_en
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/par_typ
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/DUT/U0/ser_en
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/DUT/U0/ser_done
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/TX_OUT
add wave -noupdate -expand -group {tb_uart_tx
} /tb_uart_tx/busy
add wave -noupdate -expand -group {fsm
} /tb_uart_tx/DUT/U0/curent_state
add wave -noupdate -expand -group {fsm
} /tb_uart_tx/DUT/U0/next_state
add wave -noupdate -expand -group {mux
} /tb_uart_tx/DUT/U1/mux_sel
add wave -noupdate -expand -group {mux
} /tb_uart_tx/DUT/U1/TX_OUT
add wave -noupdate -expand -group {parity_calc
} /tb_uart_tx/DUT/U2/par_bit
add wave -noupdate -expand -group {serializer
} /tb_uart_tx/DUT/U3/ser_en
add wave -noupdate -expand -group {serializer
} /tb_uart_tx/DUT/U3/ser_done
add wave -noupdate -expand -group {serializer
} /tb_uart_tx/DUT/U3/ser_data
add wave -noupdate -expand -group {serializer
} /tb_uart_tx/DUT/U3/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {59117 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 138
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
WaveRestoreZoom {0 ps} {246750 ps}
