
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
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.net1}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.CLK_EMG}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.MUX_CLK_EMG}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.EN_ADC_EMG}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.START_EMG}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.CH_SEL_EMG[3]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.CH_SEL_EMG[2]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.CH_SEL_EMG[1]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_V2.CH_SEL_EMG[0]}

