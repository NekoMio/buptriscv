-makelib ies_lib/xpm -sv \
  "D:/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../buptriscv.gen/sources_1/ip/clockgen/clockgen_clk_wiz.v" \
  "../../../../buptriscv.gen/sources_1/ip/clockgen/clockgen.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

