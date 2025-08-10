vlib work
vlog *.*v
vsim -voptargs=+acc work.TB_DATA_SYNC
do wave.do
run -all