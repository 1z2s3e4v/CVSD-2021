setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
setDesignMode -process 130
specifyScanChain scan1 -start ipad_SCAN_IN/C -stop opad_SCAN_OUT/I
scanTrace
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site TSM13SITE -r 1 0.7 80 80 80 80
uiSetTool select
getIoFlowFlag
fit
setDrawView ameba
setDrawView place
setDrawView fplan
::mp::clearAllSeed
setPlanDesignMode -effort high -incremental false -boundaryPlace true -fixPlacedMacros false -noColorize false
planDesign
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
addHaloToBlock {30 30 30 30} -allBlock
saveDesign DBS/floorplan