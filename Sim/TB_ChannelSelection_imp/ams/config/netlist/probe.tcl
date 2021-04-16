
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
probe -create -emptyok -database ams_database {TB_ChannelSelection_imp.Enable_ST}
probe -create -emptyok -database ams_database {TB_ChannelSelection_imp.ChSel_HS[2]}
probe -create -emptyok -database ams_database {TB_ChannelSelection_imp.ChSel_HS[1]}
probe -create -emptyok -database ams_database {TB_ChannelSelection_imp.ChSel_HS[0]}
probe -create -emptyok -database ams_database {TB_ChannelSelection_imp.ChSel_LS[2]}
probe -create -emptyok -database ams_database {TB_ChannelSelection_imp.ChSel_LS[1]}
probe -create -emptyok -database ams_database {TB_ChannelSelection_imp.ChSel_LS[0]}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.R2.1}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.R4.1}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.R7.1}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.R1.1}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.R3.1}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.R5.1}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.R6.1}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.I26.Ist}
probe -create -emptyok -database ams_database -flow {TB_ChannelSelection_imp.I32.EN_ST}

