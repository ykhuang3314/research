
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
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.Ain}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.sel[3]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.sel[2]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.sel[1]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.sel[0]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.CLK}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.Start}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.EoC}
probe -create -emptyok -database ams_database {TB_MultiplexingADC_v2.Vout}

