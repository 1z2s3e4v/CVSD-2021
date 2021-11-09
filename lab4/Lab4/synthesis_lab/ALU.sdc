###################################################################

# Created by write_sdc on Tue Nov  9 17:43:28 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions typical -library typical
set_wire_load_mode segmented
set_wire_load_model -name ForQA -library typical
set_max_transition 1 [current_design]
set_max_fanout 8 [current_design]
set_max_area 0
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_input_delay -clock clk  2.5  [get_ports {inputA[7]}]
set_input_delay -clock clk  2.5  [get_ports {inputA[6]}]
set_input_delay -clock clk  2.5  [get_ports {inputA[5]}]
set_input_delay -clock clk  2.5  [get_ports {inputA[4]}]
set_input_delay -clock clk  2.5  [get_ports {inputA[3]}]
set_input_delay -clock clk  2.5  [get_ports {inputA[2]}]
set_input_delay -clock clk  2.5  [get_ports {inputA[1]}]
set_input_delay -clock clk  2.5  [get_ports {inputA[0]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[7]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[6]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[5]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[4]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[3]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[2]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[1]}]
set_input_delay -clock clk  3.8  [get_ports {inputB[0]}]
set_input_delay -clock clk  4.5  [get_ports {instruction[3]}]
set_input_delay -clock clk  4.5  [get_ports {instruction[2]}]
set_input_delay -clock clk  4.5  [get_ports {instruction[1]}]
set_input_delay -clock clk  4.5  [get_ports {instruction[0]}]
set_input_delay -clock clk  5.2  [get_ports reset]
set_output_delay -clock clk  8  [get_ports {alu_out[7]}]
set_output_delay -clock clk  8  [get_ports {alu_out[6]}]
set_output_delay -clock clk  8  [get_ports {alu_out[5]}]
set_output_delay -clock clk  8  [get_ports {alu_out[4]}]
set_output_delay -clock clk  8  [get_ports {alu_out[3]}]
set_output_delay -clock clk  8  [get_ports {alu_out[2]}]
set_output_delay -clock clk  8  [get_ports {alu_out[1]}]
set_output_delay -clock clk  8  [get_ports {alu_out[0]}]
