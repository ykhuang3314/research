*******************************************************************************
****** Ext_Iref_ST schematic Stimulator_IMP  <vs>  Ext_Iref_ST layout Stimulator_IMP
*******************************************************************************

Reduce Statistics
=================                               Original             Reduced
Cell/Device                               schematic  layout   schematic  layout
(ne3) MOS                                         8       8           5       5
(rpp1k1) RES                                      1       1           1       1

Match Statistics
================                                  Total             Unmatched
Cell/Device                               schematic  layout   schematic  layout
(ne3) MOS                                         5       5           0       0
(rpp1k1) RES                                      1       1           0       0
                                             ------  ------      ------  ------
Total                                             6       6           0       0

Match Statistics for Nets                         6       7           0       1

==================================================================[Ext_Iref_ST]
====== Unmatched Internal Nets ================================================
===============================================================================

L ?avC7

==================================================================[Ext_Iref_ST]
====== Bad Matched Nets (don't really match) ==================================
===============================================================================

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =(badmatch 1)
Schematic Net:  VD_M1
S       2   of ne3 {D S}

Layout Net:  avC4
L      *1   of ne3 {D S}

==================================================================[Ext_Iref_ST]
====== Open Internal Nets =====================================================
===============================================================================

These layout nets should connect together:
L        avC4
L        avC7

==================================================================[Ext_Iref_ST]
====== Problem Schematic Nets (no exact match in layout) ======================
===============================================================================
S
S ?VD_M1
S       2   of ne3 {D S}

==================================================================[Ext_Iref_ST]
====== Problem Layout Nets (no exact match in schematic) ======================
===============================================================================
L
L ?avC4 ?avC7
L (total 2) with:
L       1   of ne3 {D S}

==================================================================[Ext_Iref_ST]
====== Matched Instances with Bad Net Connections =============================
===============================================================================

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =(badcon 1)
Schematic Instance: M1  ne3
Layout Instance:    avD32_6  ne3

Pin        SchNet                      : LayNet
---        ------                      : ------
D          VD_M1                       : ?avC7
S          vss                         : vss

==================================================================[Ext_Iref_ST]
====== Summary of Errors ======================================================
===============================================================================

Schematic  Layout     Error Type
---------  ------     ----------
 1          1         Bad Matched Nets
 -          1         Unmatched Internal Nets
 -          1         Open Internal Nets
 1          1         Matched Instances with Bad Net Connections

