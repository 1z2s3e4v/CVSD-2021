update_constraint_mode -name func_mode -sdc_files design_data/CHIP_cts.sdc
update_constraint_mode -name scan_mode -sdc_files design_data/CHIP_scan_cts.sdc
create_ccopt_clock_tree_spec -file ./ccopt.spec
get_ccopt_clock_trees
ccopt_check_and_flatten_ilms_no_restore
set_ccopt_property cts_is_sdc_clock_root -pin CLK true
create_ccopt_clock_tree -name CLK1 -source CLK -no_skew_group
set_ccopt_property clock_period -pin CLK 10
create_ccopt_skew_group -name CLK1/func_mode -sources CLK -auto_sinks
set_ccopt_property include_source_latency -skew_group CLK1/func_mode true
set_ccopt_property extracted_from_clock_name -skew_group CLK1/func_mode CLK1
set_ccopt_property extracted_from_constraint_mode_name -skew_group CLK1/func_mode func_mode
set_ccopt_property extracted_from_delay_corners -skew_group CLK1/func_mode {Delay_Corner_max Delay_Corner_min}
create_ccopt_skew_group -name CLK1/scan_mode -sources CLK -auto_sinks
set_ccopt_property include_source_latency -skew_group CLK1/scan_mode true
set_ccopt_property target_insertion_delay -skew_group CLK1/scan_mode 2.000
set_ccopt_property extracted_from_clock_name -skew_group CLK1/scan_mode CLK1
set_ccopt_property extracted_from_constraint_mode_name -skew_group CLK1/scan_mode scan_mode
set_ccopt_property extracted_from_delay_corners -skew_group CLK1/scan_mode {Delay_Corner_max Delay_Corner_min}
check_ccopt_clock_tree_convergence
get_ccopt_property auto_design_state_for_ilms
ccopt_design -cts
zoomBox -984.52000 -200.56550 2191.21800 1411.17400
zoomBox -239.83050 67.14000 1169.26150 782.27750
zoomBox 96.59200 184.03700 721.81400 501.34750
zoomBox 240.10950 240.77550 566.48000 406.41400
uiSetTool layerBlk
createRouteBlk -box 416.34550 338.51000 425.76600 351.46300
uiSetTool select
selectRouteBlk -box 416.345 338.51 425.765 351.465 defLayerBlkName -layer METAL3
setSelectedRouteBlk 416.345 338.51 425.765 351.465 defLayerBlkName {{3 } {4 } {V4 }} {Undefined ALLNET} {} {}
ccopt_design -cts
fit
saveDesign DBS/cts
ctd_win -side none -id ctd_window
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS -hold
saveDesign DBS/cts