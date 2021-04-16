
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
probe -create -emptyok -database ams_database {SAR4_sim.comp}
probe -create -emptyok -database ams_database {SAR4_sim.clock}
probe -create -emptyok -database ams_database {SAR4_sim.start}
probe -create -emptyok -database ams_database {SAR4_sim.DAC_out0}
probe -create -emptyok -database ams_database {SAR4_sim.DAC_out1}
probe -create -emptyok -database ams_database {SAR4_sim.DAC_out2}
probe -create -emptyok -database ams_database {SAR4_sim.DAC_out3}
probe -create -emptyok -database ams_database {SAR4_sim.SW_inp}
probe -create -emptyok -database ams_database {SAR4_sim.SW_ref}
probe -create -emptyok -database ams_database {SAR4_sim.eoc}
probe -create -emptyok -database ams_database {SAR4_sim.out0}
probe -create -emptyok -database ams_database {SAR4_sim.out1}
probe -create -emptyok -database ams_database {SAR4_sim.out2}
probe -create -emptyok -database ams_database {SAR4_sim.out3}

