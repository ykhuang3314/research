
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
probe -create -emptyok -database ams_database {SAR4_ADC_sim.CLK}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.DAC_out0}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.DAC_out1}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.DAC_out2}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.DAC_out3}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.SW_inp}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.SW_ref}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.eoc}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.DAC_analog}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.comp}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.Vcm}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.Vin}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.I1.c8}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.I1.c2}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.I1.c1}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.I1.c4}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.out0}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.out1}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.out2}
probe -create -emptyok -database ams_database {SAR4_ADC_sim.out3}

