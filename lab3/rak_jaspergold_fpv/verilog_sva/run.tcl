# Clear the environment
clear -all
# Analyze design files
analyze -verilog [glob source/design/*.v]
analyze -sv [glob source/properties/*.sva]
# Analyze SVA file
analyze -sv props.sva
# Elaborate design and properties
elaborate -top top
# Set up Clocks and Resets
clock clk
reset ~rstN

# Disable reads
assume -name no_read_0 {valid0 |-> wr_rd0}
assume -name no_read_1 {valid1 |-> wr_rd1}
assume -name no_read_2 {valid2 |-> wr_rd2}
assume -name no_read_3 {valid3 |-> wr_rd3}
