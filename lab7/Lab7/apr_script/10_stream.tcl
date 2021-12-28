setAnalysisMode -analysisType bcwc
write_sdf -max_view av_func_mode_max \
-min_view av_func_mode_min \
-edges noedge \
-splitsetuphold \
-remashold \
-splitrecrem \
-min_period_edges none \
CHIP.sdf
setStreamOutMode -specifyViaName default -SEvianames false -virtualConnection false -uniquifyCellNamesPrefix false -snapToMGrid false -textSize 1 -version 3
streamOut CHIP.gds -mapFile library/streamOut.map -merge {library/gds/tsmc13gfsg_fram.gds  library/gds/tpz013g3_v1.1.gds } -stripes 1 -units 1000 -mode ALL