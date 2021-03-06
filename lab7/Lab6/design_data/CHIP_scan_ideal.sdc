
set sdc_version 1.2
current_design CHIP
create_clock [get_ports {CLK}] -name CLK1 -period 100 -waveform {0 50} 
set_clock_latency 2 [get_clocks {CLK1}]

set_input_delay     3 -clock CLK1 [remove_from_collection [all_inputs] [get_ports CLK]]
set_output_delay    3 -clock CLK1 [all_outputs]

set_drive 0.1 [all_inputs]
set_load -pin_load 20 [all_outputs]

