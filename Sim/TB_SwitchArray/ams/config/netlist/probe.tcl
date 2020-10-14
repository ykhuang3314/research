
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
probe -create -emptyok -database ams_database {TB_SwitchArray.Col[2]}
probe -create -emptyok -database ams_database {TB_SwitchArray.Col[1]}
probe -create -emptyok -database ams_database {TB_SwitchArray.Col[0]}
probe -create -emptyok -database ams_database {TB_SwitchArray.BI_Ip}
probe -create -emptyok -database ams_database {TB_SwitchArray.BI_Vp}
probe -create -emptyok -database ams_database {TB_SwitchArray.BI_Vn}
probe -create -emptyok -database ams_database {TB_SwitchArray.BI_In}

