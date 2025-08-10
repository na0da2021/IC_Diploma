onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/clk
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/rstn
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/parity_enable
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/RX_IN
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/prescale
add wave -noupdate -group FSM -radix unsigned /UART_RX_TB/top/FSM/edge_count
add wave -noupdate -group FSM -radix unsigned /UART_RX_TB/top/FSM/bit_count
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/stop_error
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/parity_error
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/start_glitch
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/data_sample_en
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/edge_bit_count_en
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/des_en
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/stp_chk_en
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/strt_chk_en
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/parity_chk_en
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/check_edge
add wave -noupdate -group FSM /UART_RX_TB/top/FSM/next_state
add wave -noupdate -group FSM -color {Medium Violet Red} /UART_RX_TB/top/FSM/data_valid
add wave -noupdate -group start_check /UART_RX_TB/top/strt_chk/clk
add wave -noupdate -group start_check /UART_RX_TB/top/strt_chk/rstn
add wave -noupdate -group start_check /UART_RX_TB/top/strt_chk/enable
add wave -noupdate -group start_check /UART_RX_TB/top/strt_chk/sampled_bit
add wave -noupdate -group start_check /UART_RX_TB/top/strt_chk/start_glitch
add wave -noupdate -group stop_check /UART_RX_TB/top/stp_chk/clk
add wave -noupdate -group stop_check /UART_RX_TB/top/stp_chk/rstn
add wave -noupdate -group stop_check /UART_RX_TB/top/stp_chk/enable
add wave -noupdate -group stop_check /UART_RX_TB/top/stp_chk/sampled_bit
add wave -noupdate -group stop_check -radix unsigned /UART_RX_TB/top/edge_bit_counter/bit_count
add wave -noupdate -group stop_check /UART_RX_TB/top/stp_chk/stop_error
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/clk
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/rstn
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/parity_type
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/enable
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/sampled_bit
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/P_DATA
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/calc_par_bit
add wave -noupdate -group parity_check /UART_RX_TB/top/par_chk/parity_error
add wave -noupdate -group des /UART_RX_TB/top/des/clk
add wave -noupdate -group des /UART_RX_TB/top/des/rstn
add wave -noupdate -group des /UART_RX_TB/top/des/enable
add wave -noupdate -group des -radix unsigned /UART_RX_TB/top/des/prescale
add wave -noupdate -group des -radix unsigned /UART_RX_TB/top/des/edge_count
add wave -noupdate -group des /UART_RX_TB/top/des/sampled_bit
add wave -noupdate -group des /UART_RX_TB/top/des/P_DATA
add wave -noupdate -group data_sampling /UART_RX_TB/top/data_sampling/clk
add wave -noupdate -group data_sampling /UART_RX_TB/top/data_sampling/rstn
add wave -noupdate -group data_sampling -radix unsigned /UART_RX_TB/top/data_sampling/prescale
add wave -noupdate -group data_sampling /UART_RX_TB/top/data_sampling/enable
add wave -noupdate -group data_sampling -radix unsigned /UART_RX_TB/top/data_sampling/edge_count
add wave -noupdate -group data_sampling -radix unsigned /UART_RX_TB/top/data_sampling/centre
add wave -noupdate -group data_sampling -radix unsigned /UART_RX_TB/top/data_sampling/centre_minus_one
add wave -noupdate -group data_sampling -radix unsigned /UART_RX_TB/top/data_sampling/centre_plus_one
add wave -noupdate -group data_sampling -color Cyan /UART_RX_TB/top/data_sampling/RX_IN
add wave -noupdate -group data_sampling /UART_RX_TB/top/data_sampling/oversamples
add wave -noupdate -group data_sampling /UART_RX_TB/top/data_sampling/sampled_bit
add wave -noupdate -group edge_bit_counter /UART_RX_TB/top/edge_bit_counter/clk
add wave -noupdate -group edge_bit_counter /UART_RX_TB/top/edge_bit_counter/rstn
add wave -noupdate -group edge_bit_counter -radix unsigned /UART_RX_TB/top/edge_bit_counter/prescale
add wave -noupdate -group edge_bit_counter /UART_RX_TB/top/edge_bit_counter/enable
add wave -noupdate -group edge_bit_counter -radix unsigned /UART_RX_TB/top/edge_bit_counter/edge_count
add wave -noupdate -group edge_bit_counter -radix unsigned /UART_RX_TB/top/edge_bit_counter/complete_bit
add wave -noupdate -group edge_bit_counter -radix unsigned /UART_RX_TB/top/edge_bit_counter/bit_count
add wave -noupdate /UART_RX_TB/clk
add wave -noupdate /UART_RX_TB/rstn
add wave -noupdate /UART_RX_TB/RX_IN
add wave -noupdate /UART_RX_TB/prescale
add wave -noupdate /UART_RX_TB/parity_enable
add wave -noupdate /UART_RX_TB/parity_type
add wave -noupdate -color Magenta /UART_RX_TB/parity_error
add wave -noupdate -color Magenta /UART_RX_TB/stop_error
add wave -noupdate -color Coral /UART_RX_TB/P_DATA
add wave -noupdate /UART_RX_TB/top/FSM/curent_state
add wave -noupdate -color Coral /UART_RX_TB/data_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {506116019 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
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
WaveRestoreZoom {435646667 ps} {671334081 ps}
