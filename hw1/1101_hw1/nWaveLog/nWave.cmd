wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/raid7_1/userd/d10013/hw1/1101_hw1/tb.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/o_data\[11:0\]} \
{/tb/o_overflow} \
{/tb/o_valid} \
{/tb/test_inA\[11:0\]} \
{/tb/test_inB\[11:0\]} \
{/tb/test_inst\[2:0\]} \
{/tb/test_outD\[11:0\]} \
{/tb/test_outO} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 8972.961373 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvResizeWindow -win $_nWave1 304 178 1287 740
wvResizeWindow -win $_nWave1 304 178 1287 740
wvResizeWindow -win $_nWave1 304 178 1287 740
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectGroup -win $_nWave1 {G2}
wvSelectGroup -win $_nWave1 {G1}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb"
wvGetSignalSetScope -win $_nWave1 "/tb"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/o_data\[11:0\]} \
{/tb/o_overflow} \
{/tb/o_valid} \
{/tb/test_inst\[2:0\]} \
{/tb/i_clk} \
{/tb/test_inA\[11:0\]} \
{/tb/test_inB\[11:0\]} \
{/tb/test_outD\[11:0\]} \
{/tb/test_outO} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/i_clk} \
{/tb/i\[31:0\]} \
{/tb/i_data_a\[11:0\]} \
{/tb/i_data_b\[11:0\]} \
{/tb/i_inst\[2:0\]} \
{/tb/i_rst_n} \
{/tb/i_valid} \
{/tb/o_data\[11:0\]} \
{/tb/o_overflow} \
{/tb/o_valid} \
{/tb/test_inst\[2:0\]} \
{/tb/test_inA\[11:0\]} \
{/tb/test_inB\[11:0\]} \
{/tb/test_outD\[11:0\]} \
{/tb/test_outO} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 13 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 13 14 15 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetCursor -win $_nWave1 273609.918079 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetCursor -win $_nWave1 101487.686039 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 262224.460762 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 16832.376906 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 779.276709 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 5260.117783 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 1870.264101 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 4480.841075 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 23884.831119 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 17416.834437 -snap {("G1" 5)}
