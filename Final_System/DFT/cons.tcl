
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set verilogout_no_tri true
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_RISE 0.05
set CLK_FALL 0.05
################################## REF_CLK_MASTER ##################################
create_clock -name REF_CLK -period 20 -waveform "0 10" [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks REF_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks REF_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks REF_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks REF_CLK]
################################## UART_CLK_MASTER ##################################
create_clock -name UART_CLK -period 271.297 -waveform "0 135.64" [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks UART_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks UART_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks UART_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks UART_CLK]
################################## ALU_CLK_Generated ##################################
create_generated_clock -master_clock REF_CLK -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_port CLK_GATE/GATED_CLK] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks ALU_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks ALU_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks ALU_CLK]
################################## RX_CLK_Generated ##################################
create_generated_clock -master_clock UART_CLK  -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_port CLK_DIV_UART_RX/gen_clk] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks UART_RX_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks UART_RX_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks UART_RX_CLK]


################################## TX_CLK_Generated ##################################	
create_generated_clock -master_clock UART_CLK  -source [get_ports UART_CLK] \
                       -name "UART_TX_CLK" [get_port CLK_DIV_UART_TX/gen_clk] \
                       -divide_by 32
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks UART_TX_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks UART_TX_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks UART_TX_CLK]


####################################### Scan_CLK ######################################
create_clock -name scan_clk -period 100 -waveform "0 50" [get_ports scan_clk]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks scan_clk]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks scan_clk]


set_dont_touch_network [get_clocks {REF_CLK UART_CLK ALU_CLK UART_RX_CLK UART_TX_CLK scan_clk}]	
set_dont_touch_network [get_ports {RST_N scan_rst}]			   

####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "REF_CLK ALU_CLK"]  \
                               -group [get_clocks "UART_CLK UART_TX_CLK UART_RX_CLK"] \
                               -group [get_clocks "scan_clk"] 

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################
set REF_CLK_PER 20
set UART_CLK_PER 271.28
set Scan_CLK_PER 100
set ALU_CLK_PER [expr $REF_CLK_PER]
set UART_TX_CLK_PER [expr $UART_CLK_PER * 32]
set UART_RX_CLK_PER [expr $UART_CLK_PER]

set in1_delay  [expr 0.2*$UART_RX_CLK_PER]
set in2_delay  [expr 0.2*$Scan_CLK_PER]
set out1_delay [expr 0.2*$UART_RX_CLK_PER]
set out2_delay [expr 0.2*$UART_TX_CLK_PER]
set out3_delay [expr 0.2*$REF_CLK_PER]
set out4_delay [expr 0.2*$Scan_CLK_PER]
#Constrain input Paths
set_input_delay $in1_delay -clock UART_RX_CLK [get_port UART_RX_IN]

#Constrain Scan Input Paths
set_input_delay $in2_delay -clock scan_clk [get_port test_mode]
set_input_delay $in2_delay -clock scan_clk [get_port SI]
set_input_delay $in2_delay -clock scan_clk [get_port SE]

#Constrain Output Paths
set_output_delay $out1_delay -clock UART_RX_CLK [get_port parity_error]
set_output_delay $out1_delay -clock UART_RX_CLK [get_port framing_error]

set_output_delay $out2_delay -clock UART_TX_CLK [get_port UART_TX_O]
#set_output_delay $out3_delay -clock REF_CLK [get_port ASYNC_FIFO_full] 

#Constrain Scan Output Paths
set_output_delay $out4_delay -clock scan_clk [get_port SO]
                        
####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port test_mode]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SI]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SE]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.5 [get_port UART_TX_O]
set_load 0.5 [get_port parity_error]
set_load 0.5 [get_port framing_error]
#set_load 0.5 [get_port ASYNC_FIFO_full]
set_load 0.5 [get_port SO]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
						 -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
						 -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"


####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################

set_case_analysis 1 [get_port test_mode]

####################################################################################


