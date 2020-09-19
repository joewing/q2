EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5F566C5C
P 6500 6600
AR Path="/5E49A150/5F566C5C" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F566C5C" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F566C5C" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 6500 6350 50  0001 C CNN
F 1 "GND" H 6505 6427 50  0000 C CNN
F 2 "" H 6500 6600 50  0001 C CNN
F 3 "" H 6500 6600 50  0001 C CNN
	1    6500 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5400 6300 5400
Wire Wire Line
	6050 5300 6050 5400
$Comp
L power:VCC #PWR?
U 1 1 5F566C66
P 6050 5000
AR Path="/5E49A150/5F566C66" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F566C66" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F566C66" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 6050 4850 50  0001 C CNN
F 1 "VCC" H 6067 5173 50  0000 C CNN
F 2 "" H 6050 5000 50  0001 C CNN
F 3 "" H 6050 5000 50  0001 C CNN
	1    6050 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F566C6C
P 6050 5150
AR Path="/5E49A150/5F566C6C" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F566C6C" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F566C6C" Ref="R17"  Part="1" 
F 0 "R17" H 6120 5196 50  0000 L CNN
F 1 "R" H 6120 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5980 5150 50  0001 C CNN
F 3 "~" H 6050 5150 50  0001 C CNN
	1    6050 5150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F566C74
P 5950 5900
AR Path="/5E49A150/5F566C74" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F566C74" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F566C74" Ref="Q31"  Part="1" 
F 0 "Q31" H 6156 5946 50  0000 L CNN
F 1 "2N7002" H 6156 5855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6150 5825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5950 5900 50  0001 L CNN
	1    5950 5900
	1    0    0    -1  
$EndComp
Text GLabel 5350 700  0    50   Input ~ 0
RDP_ABUS
Text GLabel 5350 1150 0    50   Input ~ 0
RDX_ABUS
Text GLabel 8050 2400 0    50   Input ~ 0
XHIN_P
Text GLabel 14300 2350 2    50   Input ~ 0
XHIN_DBUS
Text GLabel 10900 1950 0    50   Input ~ 0
XHIN_ZERO
Text GLabel 5350 850  0    50   Input ~ 0
XHIN_SHIFT
Text GLabel 13800 5900 2    50   Input ~ 0
~WRP
Text GLabel 5000 3450 2    50   Input ~ 0
INCP_CLK
Text GLabel 5350 1000 0    50   Input ~ 0
XLIN_SHIFT
Text GLabel 5350 1600 0    50   Input ~ 0
RDM
Text GLabel 4100 8650 2    50   Input ~ 0
WRM
Text GLabel 5350 1450 0    50   Input ~ 0
XLIN_DBUS
Text GLabel 5350 1300 0    50   Input ~ 0
RDA_DBUS
Text GLabel 6300 5400 2    50   Input ~ 0
WRF
Text GLabel 9250 6900 2    50   Input ~ 0
FOUT
Text GLabel 2900 1400 2    50   Input ~ 0
WRO
Text GLabel 2150 2050 0    50   Input ~ 0
~STATE_FETCH
$Comp
L power:GND #PWR?
U 1 1 5F56C9C2
P 2450 2250
AR Path="/5E49A150/5F56C9C2" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F56C9C2" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F56C9C2" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 2450 2000 50  0001 C CNN
F 1 "GND" H 2455 2077 50  0000 C CNN
F 2 "" H 2450 2250 50  0001 C CNN
F 3 "" H 2450 2250 50  0001 C CNN
	1    2450 2250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F56C9CC
P 2450 1150
AR Path="/5E49A150/5F56C9CC" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F56C9CC" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F56C9CC" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 2450 1000 50  0001 C CNN
F 1 "VCC" H 2467 1323 50  0000 C CNN
F 2 "" H 2450 1150 50  0001 C CNN
F 3 "" H 2450 1150 50  0001 C CNN
	1    2450 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F56C9D2
P 2450 1300
AR Path="/5E49A150/5F56C9D2" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F56C9D2" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F56C9D2" Ref="R9"  Part="1" 
F 0 "R9" H 2520 1346 50  0000 L CNN
F 1 "R" H 2520 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2380 1300 50  0001 C CNN
F 3 "~" H 2450 1300 50  0001 C CNN
	1    2450 1300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F56C9D8
P 2350 2050
AR Path="/5E49A150/5F56C9D8" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F56C9D8" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F56C9D8" Ref="Q17"  Part="1" 
F 0 "Q17" H 2556 2096 50  0000 L CNN
F 1 "2N7002" H 2556 2005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2550 1975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2350 2050 50  0001 L CNN
	1    2350 2050
	1    0    0    -1  
$EndComp
Text GLabel 3050 2050 0    50   Input ~ 0
~WS
$Comp
L power:GND #PWR?
U 1 1 5F5719C5
P 3350 2250
AR Path="/5E49A150/5F5719C5" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5719C5" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5719C5" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 3350 2000 50  0001 C CNN
F 1 "GND" H 3355 2077 50  0000 C CNN
F 2 "" H 3350 2250 50  0001 C CNN
F 3 "" H 3350 2250 50  0001 C CNN
	1    3350 2250
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5719CC
P 3250 2050
AR Path="/5E49A150/5F5719CC" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5719CC" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5719CC" Ref="Q18"  Part="1" 
F 0 "Q18" H 3456 2096 50  0000 L CNN
F 1 "2N7002" H 3456 2005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3450 1975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3250 2050 50  0001 L CNN
	1    3250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1450 2450 1650
Wire Wire Line
	2450 1650 2750 1650
Wire Wire Line
	3350 1650 3350 1850
Connection ~ 2450 1650
Wire Wire Line
	2450 1650 2450 1850
Wire Wire Line
	2900 1400 2750 1400
Wire Wire Line
	2750 1400 2750 1650
Connection ~ 2750 1650
Wire Wire Line
	2750 1650 3350 1650
Text GLabel 2050 3400 2    50   Input ~ 0
WRA
Text GLabel 1300 4050 0    50   Input ~ 0
~STATE_ALU
$Comp
L power:GND #PWR?
U 1 1 5F57E379
P 1600 4250
AR Path="/5E49A150/5F57E379" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57E379" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57E379" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 1600 4000 50  0001 C CNN
F 1 "GND" H 1605 4077 50  0000 C CNN
F 2 "" H 1600 4250 50  0001 C CNN
F 3 "" H 1600 4250 50  0001 C CNN
	1    1600 4250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F57E37F
P 1600 3150
AR Path="/5E49A150/5F57E37F" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57E37F" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57E37F" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 1600 3000 50  0001 C CNN
F 1 "VCC" H 1617 3323 50  0000 C CNN
F 2 "" H 1600 3150 50  0001 C CNN
F 3 "" H 1600 3150 50  0001 C CNN
	1    1600 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F57E385
P 1600 3300
AR Path="/5E49A150/5F57E385" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F57E385" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F57E385" Ref="R13"  Part="1" 
F 0 "R13" H 1670 3346 50  0000 L CNN
F 1 "R" H 1670 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1530 3300 50  0001 C CNN
F 3 "~" H 1600 3300 50  0001 C CNN
	1    1600 3300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57E38B
P 1500 4050
AR Path="/5E49A150/5F57E38B" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57E38B" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57E38B" Ref="Q25"  Part="1" 
F 0 "Q25" H 1706 4096 50  0000 L CNN
F 1 "2N7002" H 1706 4005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1700 3975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 1500 4050 50  0001 L CNN
	1    1500 4050
	1    0    0    -1  
$EndComp
Text GLabel 2200 4050 0    50   Input ~ 0
~WS
$Comp
L power:GND #PWR?
U 1 1 5F57E392
P 2500 4250
AR Path="/5E49A150/5F57E392" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57E392" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57E392" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 2500 4000 50  0001 C CNN
F 1 "GND" H 2505 4077 50  0000 C CNN
F 2 "" H 2500 4250 50  0001 C CNN
F 3 "" H 2500 4250 50  0001 C CNN
	1    2500 4250
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57E398
P 2400 4050
AR Path="/5E49A150/5F57E398" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57E398" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57E398" Ref="Q26"  Part="1" 
F 0 "Q26" H 2606 4096 50  0000 L CNN
F 1 "2N7002" H 2606 4005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2600 3975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2400 4050 50  0001 L CNN
	1    2400 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3450 1600 3650
Wire Wire Line
	1600 3650 1900 3650
Wire Wire Line
	2500 3650 2500 3850
Connection ~ 1600 3650
Wire Wire Line
	1600 3650 1600 3850
Wire Wire Line
	2050 3400 1900 3400
Wire Wire Line
	1900 3400 1900 3650
Connection ~ 1900 3650
Wire Wire Line
	1900 3650 2500 3650
Text GLabel 2650 6000 0    50   Input ~ 0
~STATE_ALU
$Comp
L power:GND #PWR?
U 1 1 5F591EF8
P 2950 7400
AR Path="/5E49A150/5F591EF8" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F591EF8" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F591EF8" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 2950 7150 50  0001 C CNN
F 1 "GND" H 2955 7227 50  0000 C CNN
F 2 "" H 2950 7400 50  0001 C CNN
F 3 "" H 2950 7400 50  0001 C CNN
	1    2950 7400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F591EFE
P 2850 6000
AR Path="/5E49A150/5F591EFE" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F591EFE" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F591EFE" Ref="Q33"  Part="1" 
F 0 "Q33" H 3056 6046 50  0000 L CNN
F 1 "2N7002" H 3056 5955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3050 5925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2850 6000 50  0001 L CNN
	1    2850 6000
	1    0    0    -1  
$EndComp
Text GLabel 3550 6000 0    50   Input ~ 0
~WS
$Comp
L power:GND #PWR?
U 1 1 5F591F05
P 3850 6200
AR Path="/5E49A150/5F591F05" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F591F05" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F591F05" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 3850 5950 50  0001 C CNN
F 1 "GND" H 3855 6027 50  0000 C CNN
F 2 "" H 3850 6200 50  0001 C CNN
F 3 "" H 3850 6200 50  0001 C CNN
	1    3850 6200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F591F0B
P 3750 6000
AR Path="/5E49A150/5F591F0B" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F591F0B" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F591F0B" Ref="Q34"  Part="1" 
F 0 "Q34" H 3956 6046 50  0000 L CNN
F 1 "2N7002" H 3956 5955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3950 5925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3750 6000 50  0001 L CNN
	1    3750 6000
	1    0    0    -1  
$EndComp
Text GLabel 2650 6800 0    50   Input ~ 0
~STATE_DEREF
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F567973
P 2850 6800
AR Path="/5E49A150/5F567973" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F567973" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F567973" Ref="Q39"  Part="1" 
F 0 "Q39" H 3056 6846 50  0000 L CNN
F 1 "2N7002" H 3056 6755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3050 6725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2850 6800 50  0001 L CNN
	1    2850 6800
	1    0    0    -1  
$EndComp
Text GLabel 2650 6400 0    50   Input ~ 0
~STATE_LOAD
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57189E
P 2850 6400
AR Path="/5E49A150/5F57189E" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57189E" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57189E" Ref="Q36"  Part="1" 
F 0 "Q36" H 3056 6446 50  0000 L CNN
F 1 "2N7002" H 3056 6355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3050 6325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2850 6400 50  0001 L CNN
	1    2850 6400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F574A9C
P 2850 7200
AR Path="/5E49A150/5F574A9C" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F574A9C" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F574A9C" Ref="Q42"  Part="1" 
F 0 "Q42" H 3056 7246 50  0000 L CNN
F 1 "2N7002" H 3056 7155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3050 7125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2850 7200 50  0001 L CNN
	1    2850 7200
	1    0    0    -1  
$EndComp
Text GLabel 2650 7200 0    50   Input ~ 0
~STATE_FETCH
$Comp
L power:VCC #PWR?
U 1 1 5F57BFA4
P 2950 5300
AR Path="/5E49A150/5F57BFA4" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57BFA4" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57BFA4" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 2950 5150 50  0001 C CNN
F 1 "VCC" H 2967 5473 50  0000 C CNN
F 2 "" H 2950 5300 50  0001 C CNN
F 3 "" H 2950 5300 50  0001 C CNN
	1    2950 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F57BFAA
P 2950 5450
AR Path="/5E49A150/5F57BFAA" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F57BFAA" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F57BFAA" Ref="R18"  Part="1" 
F 0 "R18" H 3020 5496 50  0000 L CNN
F 1 "R" H 3020 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2880 5450 50  0001 C CNN
F 3 "~" H 2950 5450 50  0001 C CNN
	1    2950 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5600 2950 5700
Wire Wire Line
	2950 5700 3300 5700
Wire Wire Line
	3850 5700 3850 5800
Connection ~ 2950 5700
Wire Wire Line
	2950 5700 2950 5800
Text GLabel 3450 5500 2    50   Input ~ 0
WRX
Wire Wire Line
	3450 5500 3300 5500
Wire Wire Line
	3300 5500 3300 5700
Connection ~ 3300 5700
Wire Wire Line
	3300 5700 3850 5700
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F58BC93
P 4400 4100
AR Path="/5E49A150/5F58BC93" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F58BC93" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F58BC93" Ref="Q27"  Part="1" 
F 0 "Q27" H 4606 4146 50  0000 L CNN
F 1 "2N7002" H 4606 4055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4600 4025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4400 4100 50  0001 L CNN
	1    4400 4100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F58E362
P 5350 4100
AR Path="/5E49A150/5F58E362" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F58E362" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F58E362" Ref="Q28"  Part="1" 
F 0 "Q28" H 5556 4146 50  0000 L CNN
F 1 "2N7002" H 5556 4055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5550 4025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5350 4100 50  0001 L CNN
	1    5350 4100
	1    0    0    -1  
$EndComp
Text GLabel 5150 4100 0    50   Input ~ 0
~WS
Text GLabel 4950 4500 0    50   Input ~ 0
INCP_DB
Wire Wire Line
	4500 4300 4500 4400
Wire Wire Line
	4500 4400 5100 4400
Wire Wire Line
	5450 4400 5450 4300
Wire Wire Line
	4950 4500 5100 4500
Wire Wire Line
	5100 4500 5100 4400
Connection ~ 5100 4400
Wire Wire Line
	5100 4400 5450 4400
Text GLabel 4200 4100 0    50   Input ~ 0
~STATE_FETCH
$Comp
L power:VCC #PWR?
U 1 1 5F596552
P 4500 3250
AR Path="/5E49A150/5F596552" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F596552" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F596552" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 4500 3100 50  0001 C CNN
F 1 "VCC" H 4517 3423 50  0000 C CNN
F 2 "" H 4500 3250 50  0001 C CNN
F 3 "" H 4500 3250 50  0001 C CNN
	1    4500 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F596558
P 4500 3400
AR Path="/5E49A150/5F596558" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F596558" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F596558" Ref="R14"  Part="1" 
F 0 "R14" H 4570 3446 50  0000 L CNN
F 1 "R" H 4570 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4430 3400 50  0001 C CNN
F 3 "~" H 4500 3400 50  0001 C CNN
	1    4500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3550 4500 3700
Wire Wire Line
	4500 3700 4850 3700
Wire Wire Line
	5450 3700 5450 3900
Connection ~ 4500 3700
Wire Wire Line
	4500 3700 4500 3900
Wire Wire Line
	5000 3450 4850 3450
Wire Wire Line
	4850 3450 4850 3700
Connection ~ 4850 3700
Wire Wire Line
	4850 3700 5450 3700
Text GLabel 5600 850  2    50   Input ~ 0
STATE_ALU
Text GLabel 5600 1000 2    50   Input ~ 0
STATE_ALU
Wire Wire Line
	5350 850  5600 850 
Wire Wire Line
	5350 1000 5600 1000
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5AA109
P 7400 3000
AR Path="/5E49A150/5F5AA109" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5AA109" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5AA109" Ref="Q22"  Part="1" 
F 0 "Q22" H 7606 3046 50  0000 L CNN
F 1 "2N7002" H 7606 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7600 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7400 3000 50  0001 L CNN
	1    7400 3000
	1    0    0    -1  
$EndComp
Text GLabel 7200 3000 0    50   Input ~ 0
~STATE_FETCH
$Comp
L power:GND #PWR?
U 1 1 5F5AB9AF
P 7500 3200
AR Path="/5E49A150/5F5AB9AF" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5AB9AF" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5AB9AF" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 7500 2950 50  0001 C CNN
F 1 "GND" H 7505 3027 50  0000 C CNN
F 2 "" H 7500 3200 50  0001 C CNN
F 3 "" H 7500 3200 50  0001 C CNN
	1    7500 3200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5ABF41
P 8450 3000
AR Path="/5E49A150/5F5ABF41" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5ABF41" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5ABF41" Ref="Q23"  Part="1" 
F 0 "Q23" H 8656 3046 50  0000 L CNN
F 1 "2N7002" H 8656 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8650 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8450 3000 50  0001 L CNN
	1    8450 3000
	1    0    0    -1  
$EndComp
Text GLabel 8250 3000 0    50   Input ~ 0
DBUS7
$Comp
L power:GND #PWR?
U 1 1 5F5B06A7
P 8550 3200
AR Path="/5E49A150/5F5B06A7" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5B06A7" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5B06A7" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 8550 2950 50  0001 C CNN
F 1 "GND" H 8555 3027 50  0000 C CNN
F 2 "" H 8550 3200 50  0001 C CNN
F 3 "" H 8550 3200 50  0001 C CNN
	1    8550 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2800 7500 2600
Wire Wire Line
	7500 2600 8250 2600
Wire Wire Line
	8550 2600 8550 2800
Wire Wire Line
	7500 2350 7500 2600
$Comp
L power:VCC #PWR?
U 1 1 5F5B2A25
P 7500 2050
AR Path="/5E49A150/5F5B2A25" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5B2A25" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5B2A25" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 7500 1900 50  0001 C CNN
F 1 "VCC" H 7517 2223 50  0000 C CNN
F 2 "" H 7500 2050 50  0001 C CNN
F 3 "" H 7500 2050 50  0001 C CNN
	1    7500 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5B2A2B
P 7500 2200
AR Path="/5E49A150/5F5B2A2B" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5B2A2B" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5B2A2B" Ref="R12"  Part="1" 
F 0 "R12" H 7570 2246 50  0000 L CNN
F 1 "R" H 7570 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7430 2200 50  0001 C CNN
F 3 "~" H 7500 2200 50  0001 C CNN
	1    7500 2200
	1    0    0    -1  
$EndComp
Connection ~ 7500 2600
Wire Wire Line
	8050 2400 8250 2400
Wire Wire Line
	8250 2400 8250 2600
Connection ~ 8250 2600
Wire Wire Line
	8250 2600 8550 2600
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BFADC
P 10250 2550
AR Path="/5E49A150/5F5BFADC" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BFADC" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BFADC" Ref="Q19"  Part="1" 
F 0 "Q19" H 10456 2596 50  0000 L CNN
F 1 "2N7002" H 10456 2505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10450 2475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 10250 2550 50  0001 L CNN
	1    10250 2550
	1    0    0    -1  
$EndComp
Text GLabel 10050 2550 0    50   Input ~ 0
~STATE_FETCH
$Comp
L power:GND #PWR?
U 1 1 5F5BFAE3
P 10350 2750
AR Path="/5E49A150/5F5BFAE3" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BFAE3" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BFAE3" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 10350 2500 50  0001 C CNN
F 1 "GND" H 10355 2577 50  0000 C CNN
F 2 "" H 10350 2750 50  0001 C CNN
F 3 "" H 10350 2750 50  0001 C CNN
	1    10350 2750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BFAE9
P 11300 2550
AR Path="/5E49A150/5F5BFAE9" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BFAE9" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BFAE9" Ref="Q20"  Part="1" 
F 0 "Q20" H 11506 2596 50  0000 L CNN
F 1 "2N7002" H 11506 2505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 11500 2475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11300 2550 50  0001 L CNN
	1    11300 2550
	1    0    0    -1  
$EndComp
Text GLabel 11100 2550 0    50   Input ~ 0
~DBUS7
Wire Wire Line
	10350 2350 10350 2150
Wire Wire Line
	10350 2150 11100 2150
Wire Wire Line
	11400 2150 11400 2350
Wire Wire Line
	10350 1900 10350 2150
$Comp
L power:VCC #PWR?
U 1 1 5F5BFAFA
P 10350 1600
AR Path="/5E49A150/5F5BFAFA" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BFAFA" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BFAFA" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 10350 1450 50  0001 C CNN
F 1 "VCC" H 10367 1773 50  0000 C CNN
F 2 "" H 10350 1600 50  0001 C CNN
F 3 "" H 10350 1600 50  0001 C CNN
	1    10350 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5BFB00
P 10350 1750
AR Path="/5E49A150/5F5BFB00" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5BFB00" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5BFB00" Ref="R10"  Part="1" 
F 0 "R10" H 10420 1796 50  0000 L CNN
F 1 "R" H 10420 1705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10280 1750 50  0001 C CNN
F 3 "~" H 10350 1750 50  0001 C CNN
	1    10350 1750
	1    0    0    -1  
$EndComp
Connection ~ 10350 2150
Wire Wire Line
	10900 1950 11100 1950
Wire Wire Line
	11100 1950 11100 2150
Connection ~ 11100 2150
Wire Wire Line
	11100 2150 11400 2150
Text Notes 7800 2200 0    50   ~ 0
Relative (Z=0)
Text Notes 10650 1750 0    50   ~ 0
Zero-Page (Z=1)
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5C7BF6
P 14050 2700
AR Path="/5E49A150/5F5C7BF6" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5C7BF6" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5C7BF6" Ref="Q21"  Part="1" 
F 0 "Q21" H 14256 2746 50  0000 L CNN
F 1 "2N7002" H 14256 2655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 14250 2625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 14050 2700 50  0001 L CNN
	1    14050 2700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5CA784
P 14050 3100
AR Path="/5E49A150/5F5CA784" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5CA784" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5CA784" Ref="Q24"  Part="1" 
F 0 "Q24" H 14256 3146 50  0000 L CNN
F 1 "2N7002" H 14256 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 14250 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 14050 3100 50  0001 L CNN
	1    14050 3100
	1    0    0    -1  
$EndComp
Text GLabel 13850 2700 0    50   Input ~ 0
~STATE_LOAD
Wire Wire Line
	14150 2250 14150 2350
$Comp
L power:VCC #PWR?
U 1 1 5F5CFA2D
P 14150 1950
AR Path="/5E49A150/5F5CFA2D" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5CFA2D" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5CFA2D" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 14150 1800 50  0001 C CNN
F 1 "VCC" H 14167 2123 50  0000 C CNN
F 2 "" H 14150 1950 50  0001 C CNN
F 3 "" H 14150 1950 50  0001 C CNN
	1    14150 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5CFA33
P 14150 2100
AR Path="/5E49A150/5F5CFA33" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5CFA33" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5CFA33" Ref="R11"  Part="1" 
F 0 "R11" H 14220 2146 50  0000 L CNN
F 1 "R" H 14220 2055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14080 2100 50  0001 C CNN
F 3 "~" H 14150 2100 50  0001 C CNN
	1    14150 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 2350 14300 2350
Connection ~ 14150 2350
Wire Wire Line
	14150 2350 14150 2500
Text GLabel 13850 3100 0    50   Input ~ 0
~STATE_DEREF
$Comp
L power:GND #PWR?
U 1 1 5F5D3124
P 14150 3300
AR Path="/5E49A150/5F5D3124" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5D3124" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5D3124" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 14150 3050 50  0001 C CNN
F 1 "GND" H 14155 3127 50  0000 C CNN
F 2 "" H 14150 3300 50  0001 C CNN
F 3 "" H 14150 3300 50  0001 C CNN
	1    14150 3300
	1    0    0    -1  
$EndComp
Text GLabel 5600 1150 2    50   Input ~ 0
~STATE_FETCH
Wire Wire Line
	5350 1150 5600 1150
Text GLabel 5600 1300 2    50   Input ~ 0
STATE_EXEC
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5738FB
P 6400 6400
AR Path="/5E49A150/5F5738FB" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5738FB" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5738FB" Ref="Q38"  Part="1" 
F 0 "Q38" H 6606 6446 50  0000 L CNN
F 1 "2N7002" H 6606 6355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6600 6325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6400 6400 50  0001 L CNN
	1    6400 6400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57833F
P 6850 5900
AR Path="/5E49A150/5F57833F" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57833F" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57833F" Ref="Q32"  Part="1" 
F 0 "Q32" H 7056 5946 50  0000 L CNN
F 1 "2N7002" H 7056 5855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7050 5825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6850 5900 50  0001 L CNN
	1    6850 5900
	1    0    0    -1  
$EndComp
Connection ~ 6050 5400
Wire Wire Line
	6050 5400 6050 5550
Wire Wire Line
	6050 5550 6950 5550
Wire Wire Line
	6950 5550 6950 5700
Connection ~ 6050 5550
Wire Wire Line
	6050 5550 6050 5700
$Comp
L power:GND #PWR?
U 1 1 5F582E41
P 6950 6100
AR Path="/5E49A150/5F582E41" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F582E41" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F582E41" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 6950 5850 50  0001 C CNN
F 1 "GND" H 6955 5927 50  0000 C CNN
F 2 "" H 6950 6100 50  0001 C CNN
F 3 "" H 6950 6100 50  0001 C CNN
	1    6950 6100
	1    0    0    -1  
$EndComp
Text GLabel 6650 5900 0    50   Input ~ 0
~WS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5833E0
P 5500 6400
AR Path="/5E49A150/5F5833E0" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5833E0" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5833E0" Ref="Q37"  Part="1" 
F 0 "Q37" H 5706 6446 50  0000 L CNN
F 1 "2N7002" H 5706 6355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5700 6325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5500 6400 50  0001 L CNN
	1    5500 6400
	1    0    0    -1  
$EndComp
Text GLabel 6200 6400 0    50   Input ~ 0
OP5
$Comp
L power:GND #PWR?
U 1 1 5F596E05
P 5600 6600
AR Path="/5E49A150/5F596E05" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F596E05" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F596E05" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 5600 6350 50  0001 C CNN
F 1 "GND" H 5605 6427 50  0000 C CNN
F 2 "" H 5600 6600 50  0001 C CNN
F 3 "" H 5600 6600 50  0001 C CNN
	1    5600 6600
	1    0    0    -1  
$EndComp
Text GLabel 5750 5900 0    50   Input ~ 0
~STATE_ALU
Text GLabel 5300 6400 0    50   Input ~ 0
~STATE_EXEC
Wire Wire Line
	5600 6200 6050 6200
Wire Wire Line
	6050 6200 6050 6100
Wire Wire Line
	6050 6200 6500 6200
Connection ~ 6050 6200
Wire Wire Line
	5350 1300 5600 1300
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5A3BE8
P 13500 7800
AR Path="/5E49A150/5F5A3BE8" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5A3BE8" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5A3BE8" Ref="Q46"  Part="1" 
F 0 "Q46" H 13706 7846 50  0000 L CNN
F 1 "2N7002" H 13706 7755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 13700 7725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 13500 7800 50  0001 L CNN
	1    13500 7800
	1    0    0    -1  
$EndComp
Text GLabel 13300 7800 0    50   Input ~ 0
OP5
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5B17A5
P 13500 7400
AR Path="/5E49A150/5F5B17A5" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5B17A5" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5B17A5" Ref="Q43"  Part="1" 
F 0 "Q43" H 13706 7446 50  0000 L CNN
F 1 "2N7002" H 13706 7355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 13700 7325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 13500 7400 50  0001 L CNN
	1    13500 7400
	1    0    0    -1  
$EndComp
Text GLabel 13300 7400 0    50   Input ~ 0
OP4
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5B3D55
P 13100 6800
AR Path="/5E49A150/5F5B3D55" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5B3D55" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5B3D55" Ref="Q40"  Part="1" 
F 0 "Q40" H 13306 6846 50  0000 L CNN
F 1 "2N7002" H 13306 6755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 13300 6725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 13100 6800 50  0001 L CNN
	1    13100 6800
	1    0    0    -1  
$EndComp
Text GLabel 12900 6800 0    50   Input ~ 0
~OP3
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5B751F
P 13950 6800
AR Path="/5E49A150/5F5B751F" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5B751F" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5B751F" Ref="Q41"  Part="1" 
F 0 "Q41" H 14156 6846 50  0000 L CNN
F 1 "2N7002" H 14156 6755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 14150 6725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 13950 6800 50  0001 L CNN
	1    13950 6800
	1    0    0    -1  
$EndComp
Text GLabel 13750 6800 0    50   Input ~ 0
~F
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BAB24
P 13500 6250
AR Path="/5E49A150/5F5BAB24" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BAB24" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BAB24" Ref="Q35"  Part="1" 
F 0 "Q35" H 13706 6296 50  0000 L CNN
F 1 "2N7002" H 13706 6205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 13700 6175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 13500 6250 50  0001 L CNN
	1    13500 6250
	1    0    0    -1  
$EndComp
Text GLabel 13300 6250 0    50   Input ~ 0
WS
$Comp
L power:VCC #PWR?
U 1 1 5F5BDE35
P 13600 5550
AR Path="/5E49A150/5F5BDE35" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BDE35" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BDE35" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 13600 5400 50  0001 C CNN
F 1 "VCC" H 13617 5723 50  0000 C CNN
F 2 "" H 13600 5550 50  0001 C CNN
F 3 "" H 13600 5550 50  0001 C CNN
	1    13600 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5BDE3B
P 13600 5700
AR Path="/5E49A150/5F5BDE3B" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5BDE3B" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5BDE3B" Ref="R19"  Part="1" 
F 0 "R19" H 13670 5746 50  0000 L CNN
F 1 "R" H 13670 5655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 13530 5700 50  0001 C CNN
F 3 "~" H 13600 5700 50  0001 C CNN
	1    13600 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 5900 13600 5900
Text GLabel 5600 700  2    50   Input ~ 0
STATE_FETCH
Wire Wire Line
	5350 700  5600 700 
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F569DF6
P 5550 9650
AR Path="/5E49A150/5F569DF6" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F569DF6" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F569DF6" Ref="Q57"  Part="1" 
F 0 "Q57" H 5756 9696 50  0000 L CNN
F 1 "2N7002" H 5756 9605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5750 9575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5550 9650 50  0001 L CNN
	1    5550 9650
	1    0    0    -1  
$EndComp
Text GLabel 5350 9650 0    50   Input ~ 0
~WS
$Comp
L power:GND #PWR?
U 1 1 5F56BF94
P 5650 9850
AR Path="/5E49A150/5F56BF94" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F56BF94" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F56BF94" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 5650 9600 50  0001 C CNN
F 1 "GND" H 5655 9677 50  0000 C CNN
F 2 "" H 5650 9850 50  0001 C CNN
F 3 "" H 5650 9850 50  0001 C CNN
	1    5650 9850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F59CDFE
P 2550 9650
AR Path="/5E49A150/5F59CDFE" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F59CDFE" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F59CDFE" Ref="Q54"  Part="1" 
F 0 "Q54" H 2756 9696 50  0000 L CNN
F 1 "2N7002" H 2756 9605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2750 9575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2550 9650 50  0001 L CNN
	1    2550 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5A3F04
P 2650 9850
AR Path="/5E49A150/5F5A3F04" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5A3F04" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5A3F04" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 2650 9600 50  0001 C CNN
F 1 "GND" H 2655 9677 50  0000 C CNN
F 2 "" H 2650 9850 50  0001 C CNN
F 3 "" H 2650 9850 50  0001 C CNN
	1    2650 9850
	1    0    0    -1  
$EndComp
Text GLabel 2350 9650 0    50   Input ~ 0
OP4
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5AF815
P 3450 9650
AR Path="/5E49A150/5F5AF815" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5AF815" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5AF815" Ref="Q55"  Part="1" 
F 0 "Q55" H 3656 9696 50  0000 L CNN
F 1 "2N7002" H 3656 9605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3650 9575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3450 9650 50  0001 L CNN
	1    3450 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5AF81B
P 3550 9850
AR Path="/5E49A150/5F5AF81B" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5AF81B" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5AF81B" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 3550 9600 50  0001 C CNN
F 1 "GND" H 3555 9677 50  0000 C CNN
F 2 "" H 3550 9850 50  0001 C CNN
F 3 "" H 3550 9850 50  0001 C CNN
	1    3550 9850
	1    0    0    -1  
$EndComp
Text GLabel 3250 9650 0    50   Input ~ 0
~OP3
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BA2B1
P 1600 9650
AR Path="/5E49A150/5F5BA2B1" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BA2B1" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BA2B1" Ref="Q53"  Part="1" 
F 0 "Q53" H 1806 9696 50  0000 L CNN
F 1 "2N7002" H 1806 9605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1800 9575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 1600 9650 50  0001 L CNN
	1    1600 9650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5BA2B7
P 1700 9850
AR Path="/5E49A150/5F5BA2B7" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BA2B7" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BA2B7" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 1700 9600 50  0001 C CNN
F 1 "GND" H 1705 9677 50  0000 C CNN
F 2 "" H 1700 9850 50  0001 C CNN
F 3 "" H 1700 9850 50  0001 C CNN
	1    1700 9850
	1    0    0    -1  
$EndComp
Text GLabel 1400 9650 0    50   Input ~ 0
~OP5
$Comp
L power:VCC #PWR?
U 1 1 5F5CF83C
P 3950 8250
AR Path="/5E49A150/5F5CF83C" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5CF83C" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5CF83C" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 3950 8100 50  0001 C CNN
F 1 "VCC" H 3967 8423 50  0000 C CNN
F 2 "" H 3950 8250 50  0001 C CNN
F 3 "" H 3950 8250 50  0001 C CNN
	1    3950 8250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5CF842
P 3950 8400
AR Path="/5E49A150/5F5CF842" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5CF842" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5CF842" Ref="R21"  Part="1" 
F 0 "R21" H 4020 8446 50  0000 L CNN
F 1 "R" H 4020 8355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 8400 50  0001 C CNN
F 3 "~" H 3950 8400 50  0001 C CNN
	1    3950 8400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 9350 2650 9450
Wire Wire Line
	1700 9350 1700 9450
Wire Wire Line
	2650 9350 3550 9350
Wire Wire Line
	3550 9350 3550 9450
Connection ~ 2650 9350
Wire Wire Line
	5650 9350 5650 9450
Connection ~ 3550 9350
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5F88E1
P 4650 9650
AR Path="/5E49A150/5F5F88E1" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5F88E1" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5F88E1" Ref="Q56"  Part="1" 
F 0 "Q56" H 4856 9696 50  0000 L CNN
F 1 "2N7002" H 4856 9605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4850 9575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4650 9650 50  0001 L CNN
	1    4650 9650
	1    0    0    -1  
$EndComp
Text GLabel 4450 9650 0    50   Input ~ 0
~STATE_EXEC
$Comp
L power:GND #PWR?
U 1 1 5F5FB34C
P 4750 9850
AR Path="/5E49A150/5F5FB34C" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5FB34C" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5FB34C" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 4750 9600 50  0001 C CNN
F 1 "GND" H 4755 9677 50  0000 C CNN
F 2 "" H 4750 9850 50  0001 C CNN
F 3 "" H 4750 9850 50  0001 C CNN
	1    4750 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 9350 3950 9350
Wire Wire Line
	4750 9350 4750 9450
Connection ~ 4750 9350
Wire Wire Line
	4750 9350 5650 9350
Wire Wire Line
	4100 8650 3950 8650
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F60D1AB
P 3850 8950
AR Path="/5E49A150/5F60D1AB" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F60D1AB" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F60D1AB" Ref="Q50"  Part="1" 
F 0 "Q50" H 4056 8996 50  0000 L CNN
F 1 "2N7002" H 4056 8905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4050 8875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3850 8950 50  0001 L CNN
	1    3850 8950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 9350 2650 9350
Wire Wire Line
	3950 9150 3950 9350
Connection ~ 3950 9350
Wire Wire Line
	3950 9350 4750 9350
Text GLabel 3650 8950 0    50   Input ~ 0
~DEP_SW
Wire Wire Line
	3950 8550 3950 8650
Connection ~ 3950 8650
Wire Wire Line
	3950 8650 3950 8750
Text Notes 14100 5950 0    50   ~ 0
110 - JMP\n111 - JFC
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F575BC0
P 8650 7550
AR Path="/5E49A150/5F575BC0" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F575BC0" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F575BC0" Ref="Q44"  Part="1" 
F 0 "Q44" H 8856 7596 50  0000 L CNN
F 1 "2N7002" H 8856 7505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8850 7475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8650 7550 50  0001 L CNN
	1    8650 7550
	1    0    0    -1  
$EndComp
Text GLabel 8450 7550 0    50   Input ~ 0
~ALU_COUT
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F577641
P 9850 7550
AR Path="/5E49A150/5F577641" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F577641" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F577641" Ref="Q45"  Part="1" 
F 0 "Q45" H 10056 7596 50  0000 L CNN
F 1 "2N7002" H 10056 7505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10050 7475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9850 7550 50  0001 L CNN
	1    9850 7550
	1    0    0    -1  
$EndComp
Text GLabel 9650 7550 0    50   Input ~ 0
~STATE_ALU
$Comp
L power:GND #PWR?
U 1 1 5F57A4C5
P 9200 9150
AR Path="/5E49A150/5F57A4C5" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57A4C5" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57A4C5" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 9200 8900 50  0001 C CNN
F 1 "GND" H 9205 8977 50  0000 C CNN
F 2 "" H 9200 9150 50  0001 C CNN
F 3 "" H 9200 9150 50  0001 C CNN
	1    9200 9150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57A99C
P 9850 8250
AR Path="/5E49A150/5F57A99C" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57A99C" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57A99C" Ref="Q49"  Part="1" 
F 0 "Q49" H 10056 8296 50  0000 L CNN
F 1 "2N7002" H 10056 8205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10050 8175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9850 8250 50  0001 L CNN
	1    9850 8250
	1    0    0    -1  
$EndComp
Text GLabel 9650 8250 0    50   Input ~ 0
~STATE_EXEC
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57CF9E
P 8650 8250
AR Path="/5E49A150/5F57CF9E" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57CF9E" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57CF9E" Ref="Q48"  Part="1" 
F 0 "Q48" H 8856 8296 50  0000 L CNN
F 1 "2N7002" H 8856 8205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8850 8175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8650 8250 50  0001 L CNN
	1    8650 8250
	1    0    0    -1  
$EndComp
Text GLabel 8450 8250 0    50   Input ~ 0
OP4
Text Notes 9600 6900 0    50   ~ 0
000 - LDA (Z start 1)\n001 - NOR (Z start 1)\n010 - ADD (C start 0)\n011 - SHR (C start X0)
Wire Wire Line
	8750 7350 8750 7150
Wire Wire Line
	8750 7150 9050 7150
$Comp
L power:VCC #PWR?
U 1 1 5F581036
P 8750 6650
AR Path="/5E49A150/5F581036" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F581036" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F581036" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 8750 6500 50  0001 C CNN
F 1 "VCC" H 8767 6823 50  0000 C CNN
F 2 "" H 8750 6650 50  0001 C CNN
F 3 "" H 8750 6650 50  0001 C CNN
	1    8750 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F58103C
P 8750 6800
AR Path="/5E49A150/5F58103C" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F58103C" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F58103C" Ref="R20"  Part="1" 
F 0 "R20" H 8820 6846 50  0000 L CNN
F 1 "R" H 8820 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8680 6800 50  0001 C CNN
F 3 "~" H 8750 6800 50  0001 C CNN
	1    8750 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 6950 8750 7150
Connection ~ 8750 7150
Wire Wire Line
	9250 6900 9050 6900
Wire Wire Line
	9050 6900 9050 7150
Text GLabel 10250 4500 2    50   Input ~ 0
~DBUS7
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57F058
P 9900 4750
AR Path="/5E49A150/5F57F058" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57F058" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57F058" Ref="Q29"  Part="1" 
F 0 "Q29" H 10106 4796 50  0000 L CNN
F 1 "2N7002" H 10106 4705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10100 4675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9900 4750 50  0001 L CNN
	1    9900 4750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F57F05F
P 10000 4100
AR Path="/5E49A150/5F57F05F" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57F05F" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57F05F" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 10000 3950 50  0001 C CNN
F 1 "VCC" H 10017 4273 50  0000 C CNN
F 2 "" H 10000 4100 50  0001 C CNN
F 3 "" H 10000 4100 50  0001 C CNN
	1    10000 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F57F065
P 10000 4250
AR Path="/5E49A150/5F57F065" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F57F065" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F57F065" Ref="R15"  Part="1" 
F 0 "R15" H 10070 4296 50  0000 L CNN
F 1 "R" H 10070 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9930 4250 50  0001 C CNN
F 3 "~" H 10000 4250 50  0001 C CNN
	1    10000 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4400 10000 4500
Text GLabel 9700 4750 0    50   Input ~ 0
DBUS7
Wire Wire Line
	10000 4500 10250 4500
Connection ~ 10000 4500
Wire Wire Line
	10000 4500 10000 4550
$Comp
L power:GND #PWR?
U 1 1 5F581EA8
P 10000 4950
AR Path="/5E49A150/5F581EA8" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F581EA8" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F581EA8" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 10000 4700 50  0001 C CNN
F 1 "GND" H 10005 4777 50  0000 C CNN
F 2 "" H 10000 4950 50  0001 C CNN
F 3 "" H 10000 4950 50  0001 C CNN
	1    10000 4950
	1    0    0    -1  
$EndComp
Text GLabel 11600 4550 2    50   Input ~ 0
~WS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5971D7
P 11250 4800
AR Path="/5E49A150/5F5971D7" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5971D7" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5971D7" Ref="Q30"  Part="1" 
F 0 "Q30" H 11456 4846 50  0000 L CNN
F 1 "2N7002" H 11456 4755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 11450 4725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11250 4800 50  0001 L CNN
	1    11250 4800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F5971DD
P 11350 4150
AR Path="/5E49A150/5F5971DD" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5971DD" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5971DD" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 11350 4000 50  0001 C CNN
F 1 "VCC" H 11367 4323 50  0000 C CNN
F 2 "" H 11350 4150 50  0001 C CNN
F 3 "" H 11350 4150 50  0001 C CNN
	1    11350 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5971E3
P 11350 4300
AR Path="/5E49A150/5F5971E3" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5971E3" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5971E3" Ref="R16"  Part="1" 
F 0 "R16" H 11420 4346 50  0000 L CNN
F 1 "R" H 11420 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 11280 4300 50  0001 C CNN
F 3 "~" H 11350 4300 50  0001 C CNN
	1    11350 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 4450 11350 4550
Text GLabel 11050 4800 0    50   Input ~ 0
WS
Wire Wire Line
	11350 4550 11600 4550
Connection ~ 11350 4550
Wire Wire Line
	11350 4550 11350 4600
$Comp
L power:GND #PWR?
U 1 1 5F5971EE
P 11350 5000
AR Path="/5E49A150/5F5971EE" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5971EE" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5971EE" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 11350 4750 50  0001 C CNN
F 1 "GND" H 11355 4827 50  0000 C CNN
F 2 "" H 11350 5000 50  0001 C CNN
F 3 "" H 11350 5000 50  0001 C CNN
	1    11350 5000
	1    0    0    -1  
$EndComp
Text Notes 4600 8850 0    50   ~ 0
STA - 101
$Comp
L power:GND #PWR?
U 1 1 5F5EA83D
P 9950 8450
AR Path="/5E49A150/5F5EA83D" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5EA83D" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5EA83D" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 9950 8200 50  0001 C CNN
F 1 "GND" H 9955 8277 50  0000 C CNN
F 2 "" H 9950 8450 50  0001 C CNN
F 3 "" H 9950 8450 50  0001 C CNN
	1    9950 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 7150 9950 7150
Wire Wire Line
	9950 7150 9950 7350
Connection ~ 9050 7150
Wire Wire Line
	8750 7750 8750 7900
Wire Wire Line
	8750 7900 9950 7900
Wire Wire Line
	9950 7900 9950 7750
Connection ~ 8750 7900
Wire Wire Line
	8750 7900 8750 8050
Wire Wire Line
	9950 7900 9950 8050
Connection ~ 9950 7900
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5C5812
P 13500 8200
AR Path="/5E49A150/5F5C5812" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5C5812" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5C5812" Ref="Q47"  Part="1" 
F 0 "Q47" H 13706 8246 50  0000 L CNN
F 1 "2N7002" H 13706 8155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 13700 8125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 13500 8200 50  0001 L CNN
	1    13500 8200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5CA2E8
P 13600 8400
AR Path="/5E49A150/5F5CA2E8" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5CA2E8" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5CA2E8" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 13600 8150 50  0001 C CNN
F 1 "GND" H 13605 8227 50  0000 C CNN
F 2 "" H 13600 8400 50  0001 C CNN
F 3 "" H 13600 8400 50  0001 C CNN
	1    13600 8400
	1    0    0    -1  
$EndComp
Text GLabel 13300 8200 0    50   Input ~ 0
STATE_EXEC
Text GLabel 5600 1450 2    50   Input ~ 0
~STATE_ALU
Wire Wire Line
	5350 1450 5600 1450
Wire Wire Line
	13200 7000 13200 7050
Wire Wire Line
	13200 7050 13600 7050
Wire Wire Line
	13600 7050 13600 7200
Wire Wire Line
	13600 7050 14050 7050
Wire Wire Line
	14050 7050 14050 7000
Connection ~ 13600 7050
Wire Wire Line
	13200 6600 13200 6550
Wire Wire Line
	13200 6550 13600 6550
Wire Wire Line
	13600 6550 13600 6450
Wire Wire Line
	13600 6550 14050 6550
Wire Wire Line
	14050 6550 14050 6600
Connection ~ 13600 6550
Wire Wire Line
	13600 5850 13600 5900
Connection ~ 13600 5900
Wire Wire Line
	13600 5900 13600 6050
Text GLabel 5600 1600 2    50   Input ~ 0
~STATE_EXEC
Wire Wire Line
	5600 1600 5350 1600
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F60FB9F
P 8250 8950
AR Path="/5E49A150/5F60FB9F" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F60FB9F" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F60FB9F" Ref="Q51"  Part="1" 
F 0 "Q51" H 8456 8996 50  0000 L CNN
F 1 "2N7002" H 8456 8905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8450 8875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8250 8950 50  0001 L CNN
	1    8250 8950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F6111B0
P 9100 8950
AR Path="/5E49A150/5F6111B0" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F6111B0" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F6111B0" Ref="Q52"  Part="1" 
F 0 "Q52" H 9306 8996 50  0000 L CNN
F 1 "2N7002" H 9306 8905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9300 8875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9100 8950 50  0001 L CNN
	1    9100 8950
	1    0    0    -1  
$EndComp
Text GLabel 8050 8950 0    50   Input ~ 0
~OP3
Text GLabel 8900 8950 0    50   Input ~ 0
~X0
$Comp
L power:GND #PWR?
U 1 1 5F616096
P 8350 9150
AR Path="/5E49A150/5F616096" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F616096" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F616096" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 8350 8900 50  0001 C CNN
F 1 "GND" H 8355 8977 50  0000 C CNN
F 2 "" H 8350 9150 50  0001 C CNN
F 3 "" H 8350 9150 50  0001 C CNN
	1    8350 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 8750 8350 8600
Wire Wire Line
	8350 8600 8750 8600
Wire Wire Line
	8750 8600 8750 8450
Wire Wire Line
	8750 8600 9200 8600
Wire Wire Line
	9200 8600 9200 8750
Connection ~ 8750 8600
$Comp
L power:GND #PWR?
U 1 1 5F6A1020
P 11400 2750
AR Path="/5E49A150/5F6A1020" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F6A1020" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F6A1020" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 11400 2500 50  0001 C CNN
F 1 "GND" H 11405 2577 50  0000 C CNN
F 2 "" H 11400 2750 50  0001 C CNN
F 3 "" H 11400 2750 50  0001 C CNN
	1    11400 2750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
