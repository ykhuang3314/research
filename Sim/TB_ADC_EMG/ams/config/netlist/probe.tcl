
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
probe -create -emptyok -database ams_database {TB_ADC_EMG.vin0}
probe -create -emptyok -database ams_database {TB_ADC_EMG.CLK_EMG}
probe -create -emptyok -database ams_database {TB_ADC_EMG.MUX_CLK_EMG}
probe -create -emptyok -database ams_database {TB_ADC_EMG.EN_ADC_EMG}
probe -create -emptyok -database ams_database {TB_ADC_EMG.START_EMG}
probe -create -emptyok -database ams_database {TB_ADC_EMG.CH_SEL_EMG[3]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.CH_SEL_EMG[2]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.CH_SEL_EMG[1]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.CH_SEL_EMG[0]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.out_mux}
probe -create -emptyok -database ams_database {TB_ADC_EMG.out_dac}
probe -create -emptyok -database ams_database {TB_ADC_EMG.EoC}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[11]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[10]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[9]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[8]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[7]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[6]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[5]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[4]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[3]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[2]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[1]}
probe -create -emptyok -database ams_database {TB_ADC_EMG.Dout[0]}

