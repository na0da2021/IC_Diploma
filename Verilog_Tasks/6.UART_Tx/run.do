vlib work
vlog *.*v
vsim -voptargs=+acc work.tb_uart_tx
do wave.do
run -all