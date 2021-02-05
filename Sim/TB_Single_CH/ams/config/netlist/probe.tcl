
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
probe -create -emptyok -database ams_database {TB_Single_CH.ANO}
probe -create -emptyok -database ams_database {TB_Single_CH.CAT}
probe -create -emptyok -database ams_database {TB_Single_CH.Mag[4]}
probe -create -emptyok -database ams_database {TB_Single_CH.Mag[3]}
probe -create -emptyok -database ams_database {TB_Single_CH.Mag[2]}
probe -create -emptyok -database ams_database {TB_Single_CH.Mag[1]}
probe -create -emptyok -database ams_database {TB_Single_CH.Mag[0]}
probe -create -emptyok -database ams_database {TB_Single_CH.Vout_ANO}
probe -create -emptyok -database ams_database {TB_Single_CH.Vout_CAT}
probe -create -emptyok -database ams_database -flow {TB_Single_CH.I3.Ist}
probe -create -emptyok -database ams_database -flow {TB_Single_CH.R4.1}
