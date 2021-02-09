
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
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.ANO}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.CAT}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.DIS}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.net07}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.Vout}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.inp}
probe -create -emptyok -database ams_database -flow {Sim_StimulusArtifact.R4.1}

