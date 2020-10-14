
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
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin0}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin1}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin2}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin3}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin4}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin5}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin6}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin7}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin8}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin9}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin10}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin11}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin12}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin13}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin14}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vin15}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.CLK}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.sel[3]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.sel[2]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.sel[1]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.sel[0]}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.net5}
probe -create -emptyok -database ams_database {TB_MultiplexingADC.Vout}

