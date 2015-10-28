vlog -reportprogress 300 -work work regfile.t.v regfile.v
vsim -voptargs="+acc" customtest

add wave -position insertpoint  \
sim:/customtest/q \
sim:/customtest/d \
sim:/customtest/wrenable \
sim:/customtest/clk \
run -all

wave zoom full