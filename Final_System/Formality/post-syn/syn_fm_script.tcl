
############################  Search PATH ################################

set PROJECT_PATH /home/IC/final_system
set LIB_PATH     /home/IC/tsmc_fb_cl013g_sc/aci/sc-m

lappend search_path $LIB_PATH/synopsys
lappend search_path $PROJECT_PATH/rtl/ALU
lappend search_path $PROJECT_PATH/rtl/ASYNC_FIFO
lappend search_path $PROJECT_PATH/rtl/Clock_Divider
lappend search_path $PROJECT_PATH/rtl/Clock_Gating
lappend search_path $PROJECT_PATH/rtl/DATA_SYNC
lappend search_path $PROJECT_PATH/rtl/RegFile
lappend search_path $PROJECT_PATH/rtl/PULSE_GEN
lappend search_path $PROJECT_PATH/rtl/RST_SYNC
lappend search_path $PROJECT_PATH/rtl/SYS_CTRL
lappend search_path $PROJECT_PATH/rtl/CLKDIV_MUX
lappend search_path $PROJECT_PATH/rtl/UART/UART_RX
lappend search_path $PROJECT_PATH/rtl/UART/UART_TX
lappend search_path $PROJECT_PATH/rtl/Top

########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../../Synthesis/$top_module.svf"

####################### Read Reference tech libs ########################
 

set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

###################  Read Reference Design Files ######################## 
read_verilog -container Ref "ALU.v"
read_verilog -container Ref "DF_SYNC.v"
read_verilog -container Ref "FIFO_mem.v"
read_verilog -container Ref "FIFO_RD.v"
read_verilog -container Ref "FIFO_WR.v"
read_verilog -container Ref "FIFO_TOP.v"
read_verilog -container Ref "CLKDIV_MUX.v"
read_verilog -container Ref "CLK_DIV.v"
read_verilog -container Ref "CLK_GATE.v"
read_verilog -container Ref "DATA_SYNC.v"
read_verilog -container Ref "RegFile.v"
read_verilog -container Ref "PULSE_GEN.v"
read_verilog -container Ref "RST_SYNC.v"
read_sverilog -container Ref "SYS_CTRL.sv"
read_verilog -container Ref "data_sampling.v"
read_verilog -container Ref "des.v"
read_verilog -container Ref "edge_bit_counter.v"
read_verilog -container Ref "parity_check.v"
read_verilog -container Ref "stop_check.v"
read_verilog -container Ref "start_check.v"
read_verilog -container Ref "UART_RX_TOP.v"
read_sverilog -container Ref "FSM_UART_RX.sv"
read_sverilog -container Ref "tx_mux.sv"
read_sverilog -container Ref "parity_calc.sv"
read_sverilog -container Ref "ser.sv"
read_sverilog -container Ref "fsm_uart_tx.sv"
read_sverilog -container Ref "UART_TX_TOP.sv"
read_verilog -container Ref "SYS_TOP.v"

######################## set the top Reference Design ######################## 

set_reference_design SYS_TOP
set_top SYS_TOP

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "/home/IC/final_system/Synthesis/netlists/SYS_TOP.v"

####################  set the top Implementation Design ######################

set_implementation_design SYS_TOP
set_top SYS_TOP


## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
