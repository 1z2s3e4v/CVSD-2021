###############################################################
#  Generated by:      Cadence Innovus 20.10-p004_1
#  OS:                Linux x86_64(Host ID cad29)
#  Generated on:      Tue Dec 28 21:49:33 2021
#  Design:            ipdc
#  Command:           create_ccopt_clock_tree_spec -file ./ccopt.spec
###############################################################
#-------------------------------------------------------------------------------
# Clock tree setup script - dialect: Innovus
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

if { [get_ccopt_clock_trees] != {} } {
  error {Cannot run clock tree spec: clock trees are already defined.}
}

namespace eval ::ccopt {}
namespace eval ::ccopt::ilm {}
set ::ccopt::ilm::ccoptSpecRestoreData {}
# Start by checking for unflattened ILMs.
# Will flatten if so and then check the db sync.
if { [catch {ccopt_check_and_flatten_ilms_no_restore}] } {
  return -code error
}
# cache the value of the restore command output by the ILM flattening code
set ::ccopt::ilm::ccoptSpecRestoreData $::ccopt::ilm::ccoptRestoreILMState

# The following pins are clock sources
set_ccopt_property cts_is_sdc_clock_root -pin i_clk true

# Clocks present at pin i_clk
#   i_clk (period 6.800ns) in timing_config func_mode([ipdc_syn_cts.sdc])
create_ccopt_clock_tree -name i_clk -source i_clk -no_skew_group

# Clock period setting for source pin of i_clk
set_ccopt_property clock_period -pin i_clk 6.8

# Skew group to balance non generated clock:i_clk in timing_config:func_mode (sdc ipdc_syn_cts.sdc)
create_ccopt_skew_group -name i_clk/func_mode -sources i_clk -auto_sinks
set_ccopt_property include_source_latency -skew_group i_clk/func_mode true
set_ccopt_property extracted_from_clock_name -skew_group i_clk/func_mode i_clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group i_clk/func_mode func_mode
set_ccopt_property extracted_from_delay_corners -skew_group i_clk/func_mode Delay_Corner_max


check_ccopt_clock_tree_convergence
# Restore the ILM status if possible
if { [get_ccopt_property auto_design_state_for_ilms] == 0 } {
  if {$::ccopt::ilm::ccoptSpecRestoreData != {} } {
    eval $::ccopt::ilm::ccoptSpecRestoreData
  }
}

