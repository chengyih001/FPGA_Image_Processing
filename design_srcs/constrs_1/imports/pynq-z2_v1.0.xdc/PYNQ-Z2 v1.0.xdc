create_clock -period 10.000  -waveform {0.000 5.000} [get_ports clk]

set_property IOSTANDARD LVCMOS18 [get_ports G_x]
set_property IOSTANDARD LVCMOS18 [get_ports G_y]
set_property IOSTANDARD LVCMOS18 [get_ports Median]