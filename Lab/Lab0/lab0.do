vlog -reportprogress 300 -lab0work lab0work lab0.v
vsim -voptargs="+acc" testfour_bit_adder
run 100