
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
probe -create -emptyok -database ams_database {TB_SingleChannel.Vinp}
probe -create -emptyok -database ams_database {TB_SingleChannel.Vinn}
probe -create -emptyok -database ams_database {TB_SingleChannel.Voutp_IA}
probe -create -emptyok -database ams_database {TB_SingleChannel.Voutn_IA}
probe -create -emptyok -database ams_database {TB_SingleChannel.Voutp_BPF}
probe -create -emptyok -database ams_database {TB_SingleChannel.Voutn_BPF}
probe -create -emptyok -database ams_database {TB_SingleChannel.Vout}
probe -create -emptyok -database ams_database {TB_SingleChannel.vsig}

