setSrouteMode -viaConnectToShape { ring stripe blockring }
sroute -connect { corePin } -layerChangeRange { METAL1(1) METAL8(8) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { METAL1(1) METAL8(8) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { METAL1(1) METAL8(8) }
addIoFiller -cell PFEED20Z -prefix IOFILLER
addIoFiller -cell PFEED10Z -prefix IOFILLER
addIoFiller -cell PFEED5Z -prefix IOFILLER
addIoFiller -cell PFEED1Z -prefix IOFILLER
addIoFiller -cell PFEED0_1Z -prefix IOFILLER
addIoFiller -cell PFEED0_01Z -prefix IOFILLER
addIoFiller -cell PFEED0_005Z -prefix IOFILLER -fillAnyGap
redraw
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyConnectivity -nets {VDD VSS} -type special -error 1000 -warning 50
saveDesign DBS/powerplan