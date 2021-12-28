getFillerMode -quiet
addFiller -cell FILL1 FILL2 FILL4 FILL8 FILL16 FILL32 FILL64 -prefix FILLER
verify_drc
verifyConnectivity -type all -error 1000 -warning 50
verifyProcessAntenna -report CHIP.antenna.rpt -error 1000
saveNetlist CHIP_pr.v
saveDesign DBS/final