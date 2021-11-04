# ----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2021.03
# platform  : Linux 2.6.32-754.27.1.el6.x86_64
# version   : 2021.03 FCS 64 bits
# build date: 2021.03.23 02:50:43 UTC
# ----------------------------------------
# started   : 2021-11-02 16:39:52 CST
# hostname  : cad29.cad41
# pid       : 36819
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:46734' '-style' 'windows' '-data' 'AAABxHic1Yy7CsJAEEXP4g/4JT7iK0gKQSwERbCwDzGgEFIkbmMj+KX+yXqZhIAI9s4yc2fOzF4HJI8QAha9u0qfHXuObFQPnKS4J0M8NZU0I+XcaU6pLte8ZW3U21XNRfvKNgVXuylFv+eBXFJuLJkREeutWu8pk46ORAtzzcTGLCwbVuq3F42Y6zpWfvJfvv9DLdyrURLXNrwBqzVBSQ==' '-proj' '/home/raid7_1/userd/d10013/lab3/rak_jaspergold_fpv/verilog_sva/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/raid7_1/userd/d10013/lab3/rak_jaspergold_fpv/verilog_sva/jgproject/.tmp/.initCmds.tcl'
source run.tcl
assume {ing2.int_valid == 1'b0}
assume {ing3.int_valid == 1'b0}


prove -bg -all
visualize -property <embedded>::top.ing0.i_ingress.c_rd_ready -new_window
source run.tcl
prove -bg -all
source run.tcl
prove -bg -all
source run.tcl
prove -bg -all
source run.tcl
prove -bg -all
source run.tcl
prove -bg -all
source run.tcl
prove -all -time_limit 3m
source run.tcl
prove -all -time_limit 3m
source run.tcl
source run.tcl

prove -bg -all
source run.tcl
include /home/raid7_1/userd/d10013/lab3/rak_jaspergold_fpv/verilog_sva/run.tcl
source run.tcl
prove -all -time_limit 3m
