
create_clock -period 20.000 -name clk [get_ports sys_clk]

set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]


