
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
probe -create -emptyok -database ams_database {TB_HBridge_V2.EN_ST}
probe -create -emptyok -database ams_database {TB_HBridge_V2.ANO_ST}
probe -create -emptyok -database ams_database {TB_HBridge_V2.CAT_ST}
probe -create -emptyok -database ams_database {TB_HBridge_V2.CtrlHS_L}
probe -create -emptyok -database ams_database {TB_HBridge_V2.CtrlHS_R}
probe -create -emptyok -database ams_database {TB_HBridge_V2.CtrlLS_L}
probe -create -emptyok -database ams_database {TB_HBridge_V2.CtrlLS_R}
probe -create -emptyok -database ams_database -flow {TB_HBridge_V2.R0.1}
probe -create -emptyok -database ams_database -flow {TB_HBridge_V2.I10.Iout}

