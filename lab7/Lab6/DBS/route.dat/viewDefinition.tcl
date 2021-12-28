if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name lib_min\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast.lib\
    ${::IMEX::libVar}/mmmc/RF2SH64x16_fast@0C_syn.lib\
    ${::IMEX::libVar}/mmmc/tpz013g3lt.lib]\
   -si\
    [list ${::IMEX::libVar}/mmmc/fast.cdB]
create_library_set -name lib_max\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow.lib\
    ${::IMEX::libVar}/mmmc/RF2SH64x16_slow_syn.lib\
    ${::IMEX::libVar}/mmmc/tpz013g3wc.lib]\
   -si\
    [list ${::IMEX::libVar}/mmmc/slow.cdB]
create_rc_corner -name RC_corner\
   -cap_table ${::IMEX::libVar}/mmmc/tsmc013.capTbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/RC_corner/icecaps_8lm.tch
create_delay_corner -name Delay_Corner_min\
   -library_set lib_min\
   -rc_corner RC_corner
create_delay_corner -name Delay_Corner_max\
   -library_set lib_max\
   -rc_corner RC_corner
create_constraint_mode -name func_mode\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/func_mode.sdc]
create_constraint_mode -name scan_mode\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/CHIP_scan_cts.sdc]
create_analysis_view -name av_func_mode_max -constraint_mode func_mode -delay_corner Delay_Corner_max -latency_file ${::IMEX::libVar}/mmmc/latency.sdc
create_analysis_view -name av_func_mode_min -constraint_mode func_mode -delay_corner Delay_Corner_min -latency_file ${::IMEX::libVar}/mmmc/latency.sdc
create_analysis_view -name av_scan_mode_max -constraint_mode scan_mode -delay_corner Delay_Corner_max -latency_file /home/raid7_1/userd/d10013/CVSD/lab7/Lab6/DBS/cts2.dat/libs/mmmc/latency.sdc
create_analysis_view -name av_scan_mode_min -constraint_mode scan_mode -delay_corner Delay_Corner_min -latency_file /home/raid7_1/userd/d10013/CVSD/lab7/Lab6/DBS/cts2.dat/libs/mmmc/latency.sdc
set_analysis_view -setup [list av_func_mode_max av_scan_mode_max] -hold [list av_func_mode_min av_scan_mode_min]
catch {set_interactive_constraint_mode [list func_mode scan_mode] } 
