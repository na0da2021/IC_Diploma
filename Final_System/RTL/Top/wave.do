onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group UART_RX /tb_sys_top/DUT/UART_RX/clk
add wave -noupdate -group UART_RX /tb_sys_top/DUT/UART_RX/rstn
add wave -noupdate -group UART_RX /tb_sys_top/DUT/UART_RX/RX_IN
add wave -noupdate -group UART_RX -radix unsigned /tb_sys_top/DUT/UART_RX/prescale
add wave -noupdate -group UART_RX -color Gold -itemcolor Gold -radix hexadecimal /tb_sys_top/DUT/UART_RX/P_DATA
add wave -noupdate -group UART_RX -color Gold -itemcolor Gold /tb_sys_top/DUT/UART_RX/data_valid
add wave -noupdate -group RX_DATA_SYNC /tb_sys_top/DUT/DATA_SYNCH/clk
add wave -noupdate -group RX_DATA_SYNC /tb_sys_top/DUT/DATA_SYNCH/rst
add wave -noupdate -group RX_DATA_SYNC -color {Medium Violet Red} -itemcolor {Medium Violet Red} /tb_sys_top/DUT/DATA_SYNCH/enable_pulse
add wave -noupdate -group RX_DATA_SYNC -color {Medium Violet Red} -itemcolor {Medium Violet Red} -radix hexadecimal /tb_sys_top/DUT/DATA_SYNCH/sync_bus
add wave -noupdate -group SYS_CTRL /tb_sys_top/DUT/SYS_CTRL/CLK
add wave -noupdate -group SYS_CTRL /tb_sys_top/DUT/SYS_CTRL/RST
add wave -noupdate -group SYS_CTRL -color {Medium Violet Red} -itemcolor {Medium Violet Red} -radix hexadecimal /tb_sys_top/DUT/SYS_CTRL/RX_P_DATA
add wave -noupdate -group SYS_CTRL -color {Medium Violet Red} -itemcolor {Medium Violet Red} /tb_sys_top/DUT/SYS_CTRL/RX_D_VLD
add wave -noupdate -group SYS_CTRL -color Cyan -itemcolor Cyan /tb_sys_top/DUT/SYS_CTRL/ALU_OUT
add wave -noupdate -group SYS_CTRL -color Cyan -itemcolor Cyan /tb_sys_top/DUT/SYS_CTRL/OUT_Valid
add wave -noupdate -group SYS_CTRL -color Cyan -itemcolor Cyan /tb_sys_top/DUT/SYS_CTRL/ALU_EN
add wave -noupdate -group SYS_CTRL -color Cyan -itemcolor Cyan /tb_sys_top/DUT/SYS_CTRL/ALU_FUN
add wave -noupdate -group SYS_CTRL -color Cyan -itemcolor Cyan /tb_sys_top/DUT/SYS_CTRL/CLK_EN
add wave -noupdate -group SYS_CTRL -radix hexadecimal /tb_sys_top/DUT/SYS_CTRL/Address_mid
add wave -noupdate -group SYS_CTRL -radix hexadecimal /tb_sys_top/DUT/SYS_CTRL/Address
add wave -noupdate -group SYS_CTRL /tb_sys_top/DUT/SYS_CTRL/WrEn
add wave -noupdate -group SYS_CTRL -radix hexadecimal /tb_sys_top/DUT/SYS_CTRL/WrData
add wave -noupdate -group SYS_CTRL /tb_sys_top/DUT/SYS_CTRL/RdEn
add wave -noupdate -group SYS_CTRL -color Violet -itemcolor Violet -radix hexadecimal /tb_sys_top/DUT/SYS_CTRL/RdData
add wave -noupdate -group SYS_CTRL -color Violet -itemcolor Violet /tb_sys_top/DUT/SYS_CTRL/RdData_Valid
add wave -noupdate -group SYS_CTRL /tb_sys_top/DUT/SYS_CTRL/clk_div_en
add wave -noupdate -group SYS_CTRL /tb_sys_top/DUT/SYS_CTRL/curent_state
add wave -noupdate -group SYS_CTRL /tb_sys_top/DUT/SYS_CTRL/next_state
add wave -noupdate -group SYS_CTRL -color Gold -itemcolor Gold -radix hexadecimal /tb_sys_top/DUT/SYS_CTRL/TX_P_DATA
add wave -noupdate -group SYS_CTRL -color Gold -itemcolor Gold /tb_sys_top/DUT/SYS_CTRL/TX_D_VLD
add wave -noupdate -group REG_File /tb_sys_top/DUT/reg_file/CLK
add wave -noupdate -group REG_File /tb_sys_top/DUT/reg_file/RST
add wave -noupdate -group REG_File -radix hexadecimal -childformat {{{/tb_sys_top/DUT/reg_file/Address[3]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/Address[2]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/Address[1]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/Address[0]} -radix hexadecimal}} -subitemconfig {{/tb_sys_top/DUT/reg_file/Address[3]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/Address[2]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/Address[1]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/Address[0]} {-height 15 -radix hexadecimal}} /tb_sys_top/DUT/reg_file/Address
add wave -noupdate -group REG_File /tb_sys_top/DUT/reg_file/WrEn
add wave -noupdate -group REG_File -radix hexadecimal -childformat {{{/tb_sys_top/DUT/reg_file/WrData[7]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/WrData[6]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/WrData[5]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/WrData[4]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/WrData[3]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/WrData[2]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/WrData[1]} -radix hexadecimal} {{/tb_sys_top/DUT/reg_file/WrData[0]} -radix hexadecimal}} -subitemconfig {{/tb_sys_top/DUT/reg_file/WrData[7]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/WrData[6]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/WrData[5]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/WrData[4]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/WrData[3]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/WrData[2]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/WrData[1]} {-height 15 -radix hexadecimal} {/tb_sys_top/DUT/reg_file/WrData[0]} {-height 15 -radix hexadecimal}} /tb_sys_top/DUT/reg_file/WrData
add wave -noupdate -group REG_File /tb_sys_top/DUT/reg_file/RdEn
add wave -noupdate -group REG_File -radix hexadecimal /tb_sys_top/DUT/reg_file/RdData
add wave -noupdate -group REG_File /tb_sys_top/DUT/reg_file/RdData_VLD
add wave -noupdate -group REG_File -radix unsigned /tb_sys_top/DUT/reg_file/REG0
add wave -noupdate -group REG_File -radix unsigned /tb_sys_top/DUT/reg_file/REG1
add wave -noupdate -group REG_File /tb_sys_top/DUT/reg_file/REG2
add wave -noupdate -group REG_File /tb_sys_top/DUT/reg_file/REG3
add wave -noupdate -group REF_RESET /tb_sys_top/DUT/REF_CLK_domain_RST_SYNC/clk
add wave -noupdate -group REF_RESET /tb_sys_top/DUT/REF_CLK_domain_RST_SYNC/rst
add wave -noupdate -group REF_RESET /tb_sys_top/DUT/REF_CLK_domain_RST_SYNC/sync_rst
add wave -noupdate -group UART_RESET /tb_sys_top/DUT/UART_CLK_domain_RST_SYNC/clk
add wave -noupdate -group UART_RESET /tb_sys_top/DUT/UART_CLK_domain_RST_SYNC/rst
add wave -noupdate -group UART_RESET /tb_sys_top/DUT/UART_CLK_domain_RST_SYNC/sync_rst
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/w_clk
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/wrst_n
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/w_inc
add wave -noupdate -group FIFO -radix hexadecimal /tb_sys_top/DUT/ASYNC_FIFO/w_data
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/r_clk
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/rrst_n
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/r_inc
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/wfull
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/rempty
add wave -noupdate -group FIFO -radix hexadecimal /tb_sys_top/DUT/ASYNC_FIFO/r_data
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/w_addr
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/r_addr
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/wq2_rptr
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/rq2_wptr
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/rptr
add wave -noupdate -group FIFO /tb_sys_top/DUT/ASYNC_FIFO/wptr
add wave -noupdate -expand -group busy_pulse /tb_sys_top/DUT/PULSE_GEN/clk
add wave -noupdate -expand -group busy_pulse /tb_sys_top/DUT/PULSE_GEN/rst
add wave -noupdate -expand -group busy_pulse /tb_sys_top/DUT/PULSE_GEN/lvl_sig
add wave -noupdate -expand -group busy_pulse /tb_sys_top/DUT/PULSE_GEN/pulse_sig
add wave -noupdate -group CLK_DIV_UART_TX /tb_sys_top/DUT/CLK_DIV_UART_TX/i_ref_clk
add wave -noupdate -group CLK_DIV_UART_TX /tb_sys_top/DUT/CLK_DIV_UART_TX/i_rstn
add wave -noupdate -group CLK_DIV_UART_TX /tb_sys_top/DUT/CLK_DIV_UART_TX/i_clk_en
add wave -noupdate -group CLK_DIV_UART_TX -radix unsigned /tb_sys_top/DUT/CLK_DIV_UART_TX/i_divide_ratio
add wave -noupdate -group CLK_DIV_UART_TX /tb_sys_top/DUT/CLK_DIV_UART_TX/gen_clk
add wave -noupdate -group CLK_DIV_RX_MUX -radix unsigned /tb_sys_top/DUT/CLKDIV_MUX/IN
add wave -noupdate -group CLK_DIV_RX_MUX -radix unsigned /tb_sys_top/DUT/CLKDIV_MUX/OUT
add wave -noupdate -group CLK_DIV_UART_RX /tb_sys_top/DUT/CLK_DIV_UART_RX/i_ref_clk
add wave -noupdate -group CLK_DIV_UART_RX /tb_sys_top/DUT/CLK_DIV_UART_RX/i_rstn
add wave -noupdate -group CLK_DIV_UART_RX /tb_sys_top/DUT/CLK_DIV_UART_RX/i_clk_en
add wave -noupdate -group CLK_DIV_UART_RX -radix unsigned /tb_sys_top/DUT/CLK_DIV_UART_RX/i_divide_ratio
add wave -noupdate -group CLK_DIV_UART_RX /tb_sys_top/DUT/CLK_DIV_UART_RX/gen_clk
add wave -noupdate -expand -group {UART_TX
} /tb_sys_top/DUT/UART_TX/clk
add wave -noupdate -expand -group {UART_TX
} /tb_sys_top/DUT/UART_TX/rstn
add wave -noupdate -expand -group {UART_TX
} -radix hexadecimal /tb_sys_top/DUT/UART_TX/P_DATA
add wave -noupdate -expand -group {UART_TX
} /tb_sys_top/DUT/UART_TX/data_valid
add wave -noupdate -expand -group {UART_TX
} /tb_sys_top/DUT/UART_TX/mux_sel
add wave -noupdate -expand -group {UART_TX
} -color {Medium Violet Red} /tb_sys_top/DUT/UART_TX/U0/curent_state
add wave -noupdate -expand -group {UART_TX
} -color {Medium Violet Red} /tb_sys_top/DUT/UART_TX/U3/cnt
add wave -noupdate -expand -group {UART_TX
} -color {Medium Violet Red} /tb_sys_top/DUT/UART_TX/ser_en
add wave -noupdate -expand -group {UART_TX
} -color {Medium Violet Red} /tb_sys_top/DUT/UART_TX/ser_data
add wave -noupdate -expand -group {UART_TX
} -color {Medium Violet Red} /tb_sys_top/DUT/UART_TX/ser_done
add wave -noupdate -expand -group {UART_TX
} -color {Medium Violet Red} /tb_sys_top/DUT/UART_TX/TX_OUT
add wave -noupdate -expand -group {UART_TX
} -color {Medium Violet Red} /tb_sys_top/DUT/UART_TX/busy
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/A
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/B
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/EN
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/ALU_FUN
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/CLK
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/RST
add wave -noupdate -group ALU -radix unsigned /tb_sys_top/DUT/ALU/ALU_OUT
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/OUT_VALID
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/ALU_OUT_Comb
add wave -noupdate -group ALU /tb_sys_top/DUT/ALU/OUT_VALID_Comb
add wave -noupdate -group CLK_Gating /tb_sys_top/DUT/CLK_GATE/CLK_EN
add wave -noupdate -group CLK_Gating /tb_sys_top/DUT/CLK_GATE/CLK
add wave -noupdate -group CLK_Gating /tb_sys_top/DUT/CLK_GATE/GATED_CLK
add wave -noupdate -group CLK_Gating /tb_sys_top/DUT/CLK_GATE/Latch_Out
add wave -noupdate -group SYSTEM_TOP /tb_sys_top/REF_CLK
add wave -noupdate -group SYSTEM_TOP /tb_sys_top/UART_CLK
add wave -noupdate -group SYSTEM_TOP /tb_sys_top/RST_N
add wave -noupdate -group SYSTEM_TOP /tb_sys_top/UART_RX_IN
add wave -noupdate -group SYSTEM_TOP /tb_sys_top/UART_TX_O
add wave -noupdate -group SYSTEM_TOP /tb_sys_top/parity_error
add wave -noupdate -group SYSTEM_TOP /tb_sys_top/framing_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3090019096 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 209
configure wave -valuecolwidth 90
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
WaveRestoreZoom {0 ps} {3628339352 ps}
