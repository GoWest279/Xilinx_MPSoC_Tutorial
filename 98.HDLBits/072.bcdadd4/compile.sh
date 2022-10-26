iverilog -o wave count10.v tb.v
vvp -n wave -lxt2
gtkwave wave.vcd & 