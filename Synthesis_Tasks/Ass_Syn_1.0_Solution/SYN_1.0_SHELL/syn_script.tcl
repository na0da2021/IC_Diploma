
##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

########################### Formality Setup file ############################



################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries           #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/IC/Assignments/Ass_Syn_1.0/rtl
lappend search_path /home/IC/Assignments/Ass_Syn_1.0/std_cells

set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

## Standard Cell libraries 
set target_library [list $TTLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $TTLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format verilog

analyze -format $file_format Down_Counter.v

elaborate -lib work Down_Counter

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile

############################################################################
# Write out Design after initial compile
#############################################################################

write -format verilog  -output Down_Counter.v

################# starting graphical user interface #######################

#gui_start

#exit
