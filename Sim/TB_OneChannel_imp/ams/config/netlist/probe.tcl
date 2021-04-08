
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
probe -create -emptyok -database ams_database {TB_OneChannel_imp.EN_ST}
probe -create -emptyok -database ams_database {TB_OneChannel_imp.ANO_ST}
probe -create -emptyok -database ams_database {TB_OneChannel_imp.CAT_ST}
probe -create -emptyok -database ams_database {TB_OneChannel_imp.net181}
probe -create -emptyok -database ams_database {TB_OneChannel_imp.net0109}
probe -create -emptyok -database ams_database -flow {TB_OneChannel_imp.M26.1}
probe -create -emptyok -database ams_database -flow {TB_OneChannel_imp.R0.1}

