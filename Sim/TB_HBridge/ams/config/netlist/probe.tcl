
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
probe -create -emptyok -database ams_database {TB_HBridge.ANO_ST}
probe -create -emptyok -database ams_database {TB_HBridge.CAT_ST}
probe -create -emptyok -database ams_database {TB_HBridge.EN_ST}
probe -create -emptyok -database ams_database {TB_HBridge.CtrlHS_L}
probe -create -emptyok -database ams_database {TB_HBridge.CtrlHS_R}
probe -create -emptyok -database ams_database {TB_HBridge.CtrlLS_L}
probe -create -emptyok -database ams_database {TB_HBridge.CtrlLS_R}
probe -create -emptyok -database ams_database {TB_HBridge.MAG_ST[4]}
probe -create -emptyok -database ams_database {TB_HBridge.MAG_ST[3]}
probe -create -emptyok -database ams_database {TB_HBridge.MAG_ST[2]}
probe -create -emptyok -database ams_database {TB_HBridge.MAG_ST[1]}
probe -create -emptyok -database ams_database {TB_HBridge.MAG_ST[0]}
probe -create -emptyok -database ams_database -flow {TB_HBridge.R0.1}

