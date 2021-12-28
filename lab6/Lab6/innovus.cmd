#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Tue Dec 14 16:37:00 2021                
#                                                     
#######################################################

#@(#)CDS: Innovus v20.10-p004_1 (64bit) 05/07/2020 20:02 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.10-p004_1 NR200413-0234/20_10-UB (database version 18.20.505) {superthreading v1.69}
#@(#)CDS: AAE 20.10-p005 (64bit) 05/07/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.10-p005_1 () Apr 14 2020 09:14:28 ( )
#@(#)CDS: SYNTECH 20.10-b004_1 () Mar 12 2020 22:18:21 ( )
#@(#)CDS: CPE v20.10-p006
#@(#)CDS: IQuantus/TQuantus 19.1.3-s155 (64bit) Sun Nov 3 18:26:52 PST 2019 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
save_global CHIP.conf
set init_gnd_net VSS
set init_lef_file {library/lef/tsmc13fsg_8lm_cic.lef library/lef/tpz013g3_8lm_cic.lef library/lef/RF2SH64x16.vclef library/lef/antenna_8.lef}
set init_verilog design_data/CHIP.v
set init_mmmc_file mmmc.view
set init_io_file design_data/CHIP.ioc
set init_top_cell CHIP
set init_pwr_net VDD
init_design
zoomBox -571.67000 -94.58500 1818.14000 1272.46000
zoomBox -495.84450 -70.40150 1535.49400 1091.58700
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VDD -type net -net VDD
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VSS -type net -net VSS
panPage 1 0
panPage 1 0
panPage -1 0
saveDesign DBS/init
setDesignMode -process 130
specifyScanChain scan1 -start ipad_SCAN_IN/C -stop opad_SCAN_OUT/I
scanTrace
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site TSM13SITE -r 1 0.7 80 80 80 80
uiSetTool select
getIoFlowFlag
fit
setDrawView fplan
::mp::clearAllSeed
setPlanDesignMode -effort high -incremental false -boundaryPlace true -fixPlacedMacros false -noColorize false
planDesign
setLayerPreference layoutObj -isVisible 1
setLayerPreference layoutObj -isVisible 0
setLayerPreference layoutObj -isVisible 1
setLayerPreference layoutObj -isVisible 0
zoomBox 19.57450 64.27850 959.39350 905.61700
setLayerPreference layoutObj -isVisible 1
setLayerPreference layoutObj -isVisible 0
zoomBox -75.25850 0.98500 1030.41100 990.79500
zoomBox -187.33150 -73.47800 1113.45600 1091.00450
setLayerPreference layoutObj -isVisible 1
setLayerPreference layoutObj -isVisible 0
setLayerPreference pinObj -isVisible 1
addHaloToBlock {30 30 30 30} -allBlock
saveDesign DBS/floorplan
zoomBox -71.97750 0.48000 2306.71450 1207.70550
zoomBox 26.07400 63.34450 2047.96200 1089.48600
panPage -1 0
