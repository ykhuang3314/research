
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
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.EN}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.ANO}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.CAT}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.DIS}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.CH_SEL[1]}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.CH_SEL[0]}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.MAG[4]}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.MAG[3]}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.MAG[2]}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.MAG[1]}
probe -create -emptyok -database ams_database {Digital_Stimulus_TB.MAG[0]}

