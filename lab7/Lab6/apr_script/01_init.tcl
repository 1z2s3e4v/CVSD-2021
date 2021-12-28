save_global CHIP.conf
set init_gnd_net VSS
set init_lef_file {library/lef/tsmc13fsg_8lm_cic.lef library/lef/tpz013g3_8lm_cic.lef library/lef/RF2SH64x16.vclef library/lef/antenna_8.lef}
set init_verilog design_data/CHIP.v
set init_mmmc_file mmmc.view
set init_io_file design_data/CHIP.ioc
set init_top_cell CHIP
set init_pwr_net VDD
init_design
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VDD -type net -net VDD
globalNetConnect VSS -type pgpin -pin VSS -inst *
globalNetConnect VSS -type net -net VSS
saveDesign DBS/init