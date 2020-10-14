
# This is the NC-SIM(R) probe command file
# used in the AMS-ADE integration.


#
# Database settings
#
if { [info exists ::env(AMS_RESULTS_DIR) ] } { set AMS_RESULTS_DIR $env(AMS_RESULTS_DIR)} else {set AMS_RESULTS_DIR "../psf"}
database -open ams_database -into ${AMS_RESULTS_DIR} -default

#
# Probe settings
#
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch1}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch2}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch3}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch4}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch5}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch6}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch7}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch8}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch9}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch10}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch11}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch12}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch13}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch14}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch15}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vsig_ch16}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Mux_Out}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Sel[3]}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Sel[2]}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Sel[1]}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Sel[0]}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.CLK}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch8}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch7}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch6}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch2}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch5}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch4}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch3}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch1}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch9}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch10}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch11}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch12}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch13}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch14}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch15}
probe -create -emptyok -database ams_database {TB_HDEMG_AFE_16.Vout_ch16}

