set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer METAL8 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top METAL3 bottom METAL3 left METAL2 right METAL2} -width {top 8 bottom 8 left 8 right 8} -spacing {top 0.24 bottom 0.24 left 0.24 right 0.24} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 4 -use_interleaving_wire_group 1
undo
redo
setLayerPreference pinObj -isVisible 0
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference pinObj -isVisible 0
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference pinObj -isVisible 0
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference pinObj -isVisible 0
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference pinObj -isVisible 0
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setSrouteMode -viaConnectToShape { ring }
sroute -connect { padPin } -layerChangeRange { METAL1(1) METAL8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort allGeom } -padPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { METAL1(1) METAL8(8) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { METAL1(1) METAL8(8) }
setLayerPreference pinObj -isVisible 0
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
setLayerPreference pinObj -isVisible 0
setLayerPreference pinblock -isVisible 0
setLayerPreference pinstdCell -isVisible 0
setLayerPreference pinio -isVisible 0
setLayerPreference piniopin -isVisible 0
setLayerPreference pinother -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference pinblock -isVisible 1
setLayerPreference pinstdCell -isVisible 1
setLayerPreference pinio -isVisible 1
setLayerPreference piniopin -isVisible 1
setLayerPreference pinother -isVisible 1
saveDesign DBS/powerring