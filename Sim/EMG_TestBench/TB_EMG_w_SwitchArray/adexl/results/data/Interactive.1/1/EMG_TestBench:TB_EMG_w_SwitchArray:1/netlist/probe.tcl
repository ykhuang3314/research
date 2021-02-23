
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
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E00}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E01}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E02}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E03}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E10}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E11}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E12}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E13}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E20}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E21}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E22}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E23}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E30}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E31}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E32}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.E33}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch1}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch2}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch3}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch4}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch5}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch6}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch7}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch8}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch9}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch10}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch11}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch12}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch13}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch14}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch15}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_Ch16}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[11]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[10]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[9]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[8]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[7]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[6]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[5]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[4]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[3]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[2]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[1]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_DOUT[0]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.OUT_DAC}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_CLK}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_MUX_CLK}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_CH_SEL[3]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_CH_SEL[2]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_CH_SEL[1]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_CH_SEL[0]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_START}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_ADC_EOC}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_GAIN_SEL[2]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_GAIN_SEL[1]}
probe -create -emptyok -database ams_database {TB_EMG_w_SwitchArray.EMG_GAIN_SEL[0]}

