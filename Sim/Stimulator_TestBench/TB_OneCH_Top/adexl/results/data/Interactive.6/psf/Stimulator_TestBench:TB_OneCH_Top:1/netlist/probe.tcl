
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
probe -create -emptyok -database ams_database {TB_OneCH_Top.vout1}
probe -create -emptyok -database ams_database {TB_OneCH_Top.vout2}
probe -create -emptyok -database ams_database {TB_OneCH_Top.I0.net10}
probe -create -emptyok -database ams_database {TB_OneCH_Top.CtrlHS[0]}
probe -create -emptyok -database ams_database {TB_OneCH_Top.CtrlHS[1]}

