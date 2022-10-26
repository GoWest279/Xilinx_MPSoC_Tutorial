iverilog -o wave countbcd.v tb.v
vvp -n wave -lxt2
#gtkwave wave.vcd & 