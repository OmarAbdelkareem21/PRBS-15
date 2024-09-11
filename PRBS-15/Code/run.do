vlib work 
vlog -f sourcefile.txt
vsim -voptargs=+accs work.Wrapper_tb
add wave *
run -all