*******************************************************************************
****** CurrentMirror_ST schematic Stimulator_IMP  <vs>  CurrentMirror_ST layout Stimulator_IMP
*******************************************************************************

Reduce Statistics
=================                               Original             Reduced
Cell/Device                               schematic  layout   schematic  layout
(CurrentMirror_x10_LV) Cell                       1       1           1       1
(LSHVT18U3VX2) Cell                               1       1           1       1
(rpp1k1) RES                                      3       3           3       3
(csft5a) CAP                                      2      60*          2       2
(nedia_bjt) Generic                              11      33*         11      20*
(ped_bjt) Generic                                 6       6           6       6

Match Statistics
================                                  Total             Unmatched
Cell/Device                               schematic  layout   schematic  layout
(CurrentMirror_x10_LV) Cell                       1       1           0       0
(LSHVT18U3VX2) Cell                               1       1           0       0
(rpp1k1) RES                                      3       3           0       0
(csft5a) CAP                                      2       2           0       0
(nedia_bjt) Generic                              11      20*          1      10*
(ped_bjt) Generic                                 6       6           0       0
                                             ------  ------      ------  ------
Total                                            24      33           1      10

Match Statistics for Nets                        22      32           0      10

=============================================================[CurrentMirror_ST]
====== Bad Initial Net Bindings (nets don't match) ============================
===============================================================================

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (badbind 1)
Schematic Net:  Ist
S      *1   of nedia_bjt D

Layout Net:  Ist
        (nothing)

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (badbind 2)
Schematic Net:  gnd!
S       1   of csft5a MINUS
S       5   of nedia_bjt S
S       11  of nedia_bjt SB
S       1   of LSHVT18U3VX2 gnd
S       6   of ped_bjt SB
S       2   of rpp1k1 {PLUS MINUS}
S       1   of CurrentMirror_x10_LV gnd!

Layout Net:  gnd!
L       1   of csft5a MINUS
L       5   of nedia_bjt S
L      *20  of nedia_bjt SB
L       1   of LSHVT18U3VX2 gnd
L       6   of ped_bjt SB
L       2   of rpp1k1 {PLUS MINUS}
L       1   of CurrentMirror_x10_LV gnd!

=============================================================[CurrentMirror_ST]
====== Unmatched Internal Nets ================================================
===============================================================================

L ?avC22
L ?avC21
L ?avC20
L ?avC19
L ?avC17
L ?avC27
L ?avC26
L ?avC25
L ?avC24
L ?avC23

=============================================================[CurrentMirror_ST]
====== Bad Matched Nets (don't really match) ==================================
===============================================================================

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =(badmatch 1)
Schematic Net:  VB
S       1   of nedia_bjt D
S       2   of nedia_bjt G
S       1   of nedia_bjt S

Layout Net:  avC9
L       1   of nedia_bjt D
L      *11  of nedia_bjt G
L       1   of nedia_bjt S

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =(badmatch 2)
Schematic Net:  VD_M3
S       1   of nedia_bjt D
S       1   of nedia_bjt S

Layout Net:  avC18
L       1   of nedia_bjt D
L      *10  of nedia_bjt S

=============================================================[CurrentMirror_ST]
====== Problem Schematic Nets (no exact match in layout) ======================
===============================================================================
S
S ?Ist
S       1   of nedia_bjt D
S
S ?VD_M3
S       1   of nedia_bjt D
S       1   of nedia_bjt S
S
S ?VB
S       1   of nedia_bjt D
S       2   of nedia_bjt G
S       1   of nedia_bjt S
S
S ?gnd!
S       1   of csft5a MINUS
S       5   of nedia_bjt S
S       11  of nedia_bjt SB
S       1   of LSHVT18U3VX2 gnd
S       6   of ped_bjt SB
S       2   of rpp1k1 {PLUS MINUS}
S       1   of CurrentMirror_x10_LV gnd!

=============================================================[CurrentMirror_ST]
====== Problem Layout Nets (no exact match in schematic) ======================
===============================================================================
L
L ?Ist
        (nothing)
L
L ?avC22 ?avC21 ?avC20 ?avC19 ?avC17 ?avC27 ?avC26 ?avC25 ?avC24 ?avC23
L (total 10) with:
L       1   of nedia_bjt D
L
L ?avC18
L       1   of nedia_bjt D
L       10  of nedia_bjt S
L
L ?avC9
L       1   of nedia_bjt D
L       11  of nedia_bjt G
L       1   of nedia_bjt S
L
L ?gnd!
L       1   of csft5a MINUS
L       5   of nedia_bjt S
L       20  of nedia_bjt SB
L       1   of LSHVT18U3VX2 gnd
L       6   of ped_bjt SB
L       2   of rpp1k1 {PLUS MINUS}
L       1   of CurrentMirror_x10_LV gnd!

=============================================================[CurrentMirror_ST]
====== Unmatched Schematic Instances ==========================================
===============================================================================

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (schinst 1)
Schematic Instance: M0  nedia_bjt

S Pin        Net
S ---        ---
S D          Ist
S G          VB
S S          VD_M3
S SB         gnd!

=============================================================[CurrentMirror_ST]
====== Unmatched Layout Instances =============================================
===============================================================================

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 1)
Layout Instance:    avI46/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC22
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 2)
Layout Instance:    avI48/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC21
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 3)
Layout Instance:    avI51/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC20
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 4)
Layout Instance:    avI53/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC19
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 5)
Layout Instance:    avI55/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC17
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 6)
Layout Instance:    avI56/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC27
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 7)
Layout Instance:    avI58/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC26
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 8)
Layout Instance:    avI60/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC25
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = (layinst 9)
Layout Instance:    avI63/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC24
L G          VB
L S          VD_M3
L SB         gnd!

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =(layinst 10)
Layout Instance:    avI65/avD98_1  nedia_bjt

L Pin        Net
L ---        ---
L D          ?avC23
L G          VB
L S          VD_M3
L SB         gnd!

=============================================================[CurrentMirror_ST]
====== Summary of Errors ======================================================
===============================================================================

Schematic  Layout     Error Type
---------  ------     ----------
 2          2         Bad Initial Net Bindings
 2          2         Bad Matched Nets
 -          10        Unmatched Internal Nets
 1          10        Unmatched Instances

