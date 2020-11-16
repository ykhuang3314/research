
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
probe -create -emptyok -database ams_database {TB_AFE_MEG.vsig}
probe -create -emptyok -database ams_database {TB_AFE_MEG.Vout}
probe -create -emptyok -database ams_database {TB_AFE_MEG.net8}
probe -create -emptyok -database ams_database {TB_AFE_MEG.I0.net14}
probe -create -emptyok -database ams_database {TB_AFE_MEG.I0.net13}
probe -create -emptyok -database ams_database {TB_AFE_MEG.I0.net15}
probe -create -emptyok -database ams_database {TB_AFE_MEG.I0.net16}

