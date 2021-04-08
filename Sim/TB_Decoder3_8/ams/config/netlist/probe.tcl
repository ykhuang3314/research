
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
probe -create -emptyok -database ams_database {TB_Decoder3_8.CLK}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Bin[2]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Bin[1]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Bin[0]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[7]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[6]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[5]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[4]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[3]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[2]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[1]}
probe -create -emptyok -database ams_database {TB_Decoder3_8.Dout[0]}

