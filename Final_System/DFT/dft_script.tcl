
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

############################# Formality Setup File ##########################
                                                   
set_svf $top_module.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

#Add the path of the libraries and RTL files to the search_path variable

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

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format_v verilog
set file_format_sv sverilog

#ALU
analyze -format $file_format_v ALU.v
#FIFO
analyze -format $file_format_v DF_SYNC.v
analyze -format $file_format_v FIFO_mem.v
analyze -format $file_format_v FIFO_RD.v
analyze -format $file_format_v FIFO_WR.v
analyze -format $file_format_v FIFO_TOP.v
#CLK_DIVIDER MUX
analyze -format $file_format_v CLKDIV_MUX.v
#CLK_DIVIDER
analyze -format $file_format_v CLK_DIV.v
#CLK_GATING
analyze -format $file_format_v CLK_GATE.v
#DATA_SYNC
analyze -format $file_format_v DATA_SYNC.v
#REGISTER_FILE
analyze -format $file_format_v RegFile.v
#PULSE_GENERATOR
analyze -format $file_format_v PULSE_GEN.v
#RST_SYNC
analyze -format $file_format_v RST_SYNC.v
#SYS_CONTROLLER
analyze -format $file_format_sv SYS_CTRL.sv
#UART_RX
analyze -format $file_format_v data_sampling.v
analyze -format $file_format_v des.v
analyze -format $file_format_v edge_bit_counter.v
analyze -format $file_format_v parity_check.v
analyze -format $file_format_v stop_check.v
analyze -format $file_format_v start_check.v
analyze -format $file_format_v UART_RX_TOP.v
analyze -format $file_format_sv FSM_UART_RX.sv
#UART_TX
analyze -format $file_format_sv tx_mux.sv
analyze -format $file_format_sv parity_calc.sv
analyze -format $file_format_sv ser.sv
analyze -format $file_format_sv UART_TX_TOP.sv
analyze -format $file_format_sv fsm_uart_tx.sv
#MUX
analyze -format $file_format_v mux2X1.v
#SYS_TOP
analyze -format $file_format_v SYS_TOP_dft.v

elaborate -lib WORK SYS_TOP

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design >> reports/check_design.rpt

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix  -style multiplexed_flip_flop -replace true -max_length 100  

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -scan

################################################################### 
# Setting Test Timing Variables
################################################################### 

# Preclock Measure Protocol (default protocol)
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports scan_clk]  -type ScanClock   -view existing_dft  -timing {30 60}
set_dft_signal -port [get_ports scan_rst]  -type Reset       -view existing_dft  -active_state 0
set_dft_signal -port [get_ports test_mode] -type Constant    -view existing_dft  -active_state 1 
set_dft_signal -port [get_ports test_mode] -type TestMode    -view spec          -active_state 1 
set_dft_signal -port [get_ports SE]        -type ScanEnable  -view spec          -active_state 1   -usage scan
set_dft_signal -port [get_ports SI]        -type ScanDataIn  -view spec 
set_dft_signal -port [get_ports SO]        -type ScanDataOut -view spec  

############################# Create Test Protocol #####################

create_test_protocol
                            
###################### Pre-DFT Design Rule Checking ####################

dft_drc -verbose

############################# Preview DFT ##############################

insert_dft

############################# Insert DFT ###############################

compile -scan -incremental

######################## Optimize Logic post DFT #######################

dft_drc -verbose -coverage_estimate

###################### Design Rule Checking post DFT ###################


##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out files
#############################################################################

write_file -format verilog -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v
write_sdf  sdf/$top_module.sdf
write_sdc  -nosplit sdc/$top_module.sdc

####################### reporting ##########################################

report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -delay_type min -max_paths 20 > reports/hold.rpt
report_timing -delay_type max -max_paths 20 > reports/setup.rpt
report_clock -attributes > reports/clocks.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

################# starting graphical user interface #######################

#gui_start

#exit
