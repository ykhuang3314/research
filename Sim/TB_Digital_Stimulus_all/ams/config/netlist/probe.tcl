
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
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.ADC_En_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.ADC_Start_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.Clk_En_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CountEnable_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.Fsel_BioZ[3]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.Fsel_BioZ[2]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.Fsel_BioZ[1]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.Fsel_BioZ[0]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.G_CTRL_TCA_AFE_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.G_CTRL_TIA_AFE_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.Gain_TCA_SigGen_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.Restn_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.StepNum_BioZ}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.ADC_CLK_EMG}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.MUX_CLK_EMG}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.EN_ADC_EMG}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CH_SEL_EMG[3]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CH_SEL_EMG[2]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CH_SEL_EMG[1]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CH_SEL_EMG[0]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.EN_ST}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.ANO_ST}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CAT_ST}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.DIS_ST}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CH_SEL_ST[1]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.CH_SEL_ST[0]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.MAG_ST[4]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.MAG_ST[3]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.MAG_ST[2]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.MAG_ST[1]}
probe -create -emptyok -database ams_database {TB_Digital_Stimulus_all.MAG_ST[0]}

