vlib work
vlog *.*v
vsim -voptargs=+acc work.TB_ASYNC_FIFO
do wave.do
run -all