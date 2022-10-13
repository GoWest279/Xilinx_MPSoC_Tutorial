iverilog -o wave top_module.v iic_tb.v
vvp -n wave -lxt2
#gtkwave wave.vcd & 