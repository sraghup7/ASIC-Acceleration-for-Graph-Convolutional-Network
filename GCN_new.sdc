###################################################################

# Created by write_sdc on Thu Nov 16 13:28:37 2023

###################################################################
set sdc_version 2.0

set_units -time ps -resistance kOhm -capacitance fF -voltage V -current mA
set_wire_load_mode segmented
set_max_fanout 16 [current_design]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports data_in*]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports coo_in*]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports clk]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports reset]
set_driving_cell -lib_cell INVx3_ASAP7_75t_R [get_ports start]
set_load -pin_load 0.01 [get_ports {coo_address*}]
set_load -pin_load 0.01 [get_ports {read_address*}]
set_load -pin_load 0.01 [get_ports enable_read]
set_load -pin_load 0.01 [get_ports done]
set_load -pin_load 0.01 [get_ports max_addi_answer*]
create_clock [get_ports clk]  -period 2000  -waveform {0 1000}
set_clock_uncertainty 0.01  [get_clocks clk]
set_clock_transition -max -rise 0.1 [get_clocks clk]
set_clock_transition -max -fall 0.1 [get_clocks clk]
set_clock_transition -min -rise 0.1 [get_clocks clk]
set_clock_transition -min -fall 0.1 [get_clocks clk]
set_input_delay -clock clk  0.1  [get_ports reset]
set_input_delay -clock clk  0.1  [get_ports start]
set_input_delay -clock clk  0.1  [get_ports data_in*]
set_input_delay -clock clk  0.1  [get_ports coo_in*]
set_output_delay -clock clk  0.1  [get_ports {coo_address*}]
set_output_delay -clock clk  0.1  [get_ports {read_address*}]
set_output_delay -clock clk  0.1  [get_ports enable_read]
set_output_delay -clock clk  0.1  [get_ports done]
set_output_delay -clock clk  0.1  [get_ports max_addi_answer*]
