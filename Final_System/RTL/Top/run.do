vlib work
vlog *.*v
vsim -voptargs=+acc work.tb_sys_top
do wave.do
run -all