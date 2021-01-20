
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
probe -create -emptyok -database ams_database {TB_Current_Source.CLK}
probe -create -emptyok -database ams_database {TB_Current_Source.count_out[4]}
probe -create -emptyok -database ams_database {TB_Current_Source.count_out[3]}
probe -create -emptyok -database ams_database {TB_Current_Source.count_out[2]}
probe -create -emptyok -database ams_database {TB_Current_Source.count_out[1]}
probe -create -emptyok -database ams_database {TB_Current_Source.count_out[0]}
probe -create -emptyok -database ams_database -flow {TB_Current_Source.I0.Ioutn}
probe -create -emptyok -database ams_database -flow {TB_Current_Source.R0.1}

