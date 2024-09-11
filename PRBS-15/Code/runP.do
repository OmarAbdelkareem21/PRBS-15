vlib work 
vlog -f sourcefile.txt
vsim -voptargs=+accs work.PRBS_tb
add wave *
run -all