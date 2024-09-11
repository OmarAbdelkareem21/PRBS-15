vlib work 
vlog -f sourcefile.txt
vsim -voptargs=+accs work.PatternDetector_tb
add wave *
run -all