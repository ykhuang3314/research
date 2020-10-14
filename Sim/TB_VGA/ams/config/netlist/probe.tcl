
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
probe -create -emptyok -database ams_database {TB_VGA.Vin}
probe -create -emptyok -database ams_database {TB_VGA.Gain_Sel[2]}
probe -create -emptyok -database ams_database {TB_VGA.Gain_Sel[1]}
probe -create -emptyok -database ams_database {TB_VGA.Gain_Sel[0]}
probe -create -emptyok -database ams_database {TB_VGA.Vout2}
probe -create -emptyok -database ams_database {TB_VGA.CLK}

