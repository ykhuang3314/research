
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
probe -create -emptyok -database ams_database {TB_Multi_CH.ANO}
probe -create -emptyok -database ams_database {TB_Multi_CH.CAT}
probe -create -emptyok -database ams_database {TB_Multi_CH.Mag[4]}
probe -create -emptyok -database ams_database {TB_Multi_CH.Mag[3]}
probe -create -emptyok -database ams_database {TB_Multi_CH.Mag[2]}
probe -create -emptyok -database ams_database {TB_Multi_CH.Mag[1]}
probe -create -emptyok -database ams_database {TB_Multi_CH.Mag[0]}
probe -create -emptyok -database ams_database {TB_Multi_CH.CH_SEL[1]}
probe -create -emptyok -database ams_database {TB_Multi_CH.CH_SEL[0]}
probe -create -emptyok -database ams_database -flow {TB_Multi_CH.I6.Ist}
probe -create -emptyok -database ams_database -flow {TB_Multi_CH.R4.1}
probe -create -emptyok -database ams_database -flow {TB_Multi_CH.R1.1}
probe -create -emptyok -database ams_database -flow {TB_Multi_CH.R10.1}
probe -create -emptyok -database ams_database -flow {TB_Multi_CH.R7.1}

