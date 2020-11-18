
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
probe -create -emptyok -database ams_database {TB_MultiChannel.E15}
probe -create -emptyok -database ams_database {TB_MultiChannel.CLK}
probe -create -emptyok -database ams_database {TB_MultiChannel.Start}
probe -create -emptyok -database ams_database {TB_MultiChannel.CH_Sel[3]}
probe -create -emptyok -database ams_database {TB_MultiChannel.CH_Sel[2]}
probe -create -emptyok -database ams_database {TB_MultiChannel.CH_Sel[1]}
probe -create -emptyok -database ams_database {TB_MultiChannel.CH_Sel[0]}
probe -create -emptyok -database ams_database {TB_MultiChannel.EoC_ADC}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[0]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[1]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[2]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[3]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[4]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[5]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[6]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[7]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[8]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[9]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[10]}
probe -create -emptyok -database ams_database {TB_MultiChannel.net4[11]}
probe -create -emptyok -database ams_database {TB_MultiChannel.OUT_DAC}

