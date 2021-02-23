
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
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.EN_ST}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.ANO_ST}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.CAT_ST}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.DIS_ST}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.CH_SEL_ST[1]}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.CH_SEL_ST[0]}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.MAG_ST[4]}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.MAG_ST[3]}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.MAG_ST[2]}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.MAG_ST[1]}
probe -create -emptyok -database ams_database {TB_ST_OutputDriver.MAG_ST[0]}
probe -create -emptyok -database ams_database -flow {TB_ST_OutputDriver.I3.Ioutn}
probe -create -emptyok -database ams_database -flow {TB_ST_OutputDriver.I1.Iout}

