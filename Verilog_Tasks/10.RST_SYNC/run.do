vlib work
vlog *.*v
vsim -voptargs=+acc work.TB_RST_SYNC
do wave.do
run -all