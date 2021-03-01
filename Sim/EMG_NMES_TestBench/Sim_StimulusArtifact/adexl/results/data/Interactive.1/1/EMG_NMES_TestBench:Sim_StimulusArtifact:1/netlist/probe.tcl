
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
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.Vinp}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.Vout}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.EN_ST}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.ANO_ST}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.CAT_ST}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.DIS_ST}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.MAG_ST[4]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.MAG_ST[3]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.MAG_ST[2]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.MAG_ST[1]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.MAG_ST[0]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.CH_SEL_U_ST[1]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.CH_SEL_U_ST[0]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.CH_SEL_D_ST[1]}
probe -create -emptyok -database ams_database {Sim_StimulusArtifact.CH_SEL_D_ST[0]}
probe -create -emptyok -database ams_database -flow {Sim_StimulusArtifact.R4.1}

