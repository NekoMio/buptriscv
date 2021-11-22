vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_std.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ddr3_mem_mig_sim.v" \
"../../../../buptriscv.gen/sources_1/ip/ddr3_mem/ddr3_mem/user_design/rtl/ddr3_mem.v" \


vlog -work xil_defaultlib \
"glbl.v"

