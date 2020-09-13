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
P 8950 4900
AR Path="/5E49A150/5F566C5C" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F566C5C" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F566C5C" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 8950 4650 50  0001 C CNN
F 1 "GND" H 8955 4727 50  0000 C CNN
F 2 "" H 8950 4900 50  0001 C CNN
F 3 "" H 8950 4900 50  0001 C CNN
	1    8950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3700 8750 3700
Wire Wire Line
	8500 3600 8500 3700
$Comp
L power:VCC #PWR?
U 1 1 5F566C66
P 8500 3300
AR Path="/5E49A150/5F566C66" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F566C66" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F566C66" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 8500 3150 50  0001 C CNN
F 1 "VCC" H 8517 3473 50  0000 C CNN
F 2 "" H 8500 3300 50  0001 C CNN
F 3 "" H 8500 3300 50  0001 C CNN
	1    8500 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F566C6C
P 8500 3450
AR Path="/5E49A150/5F566C6C" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F566C6C" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F566C6C" Ref="R15"  Part="1" 
F 0 "R15" H 8570 3496 50  0000 L CNN
F 1 "R" H 8570 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8430 3450 50  0001 C CNN
F 3 "~" H 8500 3450 50  0001 C CNN
	1    8500 3450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F566C74
P 8400 4200
AR Path="/5E49A150/5F566C74" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F566C74" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F566C74" Ref="Q32"  Part="1" 
F 0 "Q32" H 8606 4246 50  0000 L CNN
F 1 "2N7002" H 8606 4155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8600 4125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8400 4200 50  0001 L CNN
	1    8400 4200
	1    0    0    -1  
$EndComp
Text GLabel 5350 700  0    50   Input ~ 0
RDP_ABUS
Text GLabel 5350 1150 0    50   Input ~ 0
RDX_ABUS
Text GLabel 7250 1600 0    50   Input ~ 0
XHIN_P
Text GLabel 14300 2350 2    50   Input ~ 0
XHIN_DBUS
Text GLabel 9600 1550 0    50   Input ~ 0
XHIN_ZERO
Text GLabel 5350 850  0    50   Input ~ 0
XHIN_SHIFT
Text GLabel 11050 7250 2    50   Input ~ 0
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
Text GLabel 8750 3700 2    50   Input ~ 0
WRF
Text GLabel 7350 6300 2    50   Input ~ 0
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
AR Path="/5E5E8038/5F56C9C2" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 2450 2000 50  0001 C CNN
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
AR Path="/5E5E8038/5F56C9CC" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 2450 1000 50  0001 C CNN
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
AR Path="/5E5E8038/5F56C9D8" Ref="Q15"  Part="1" 
F 0 "Q15" H 2556 2096 50  0000 L CNN
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
AR Path="/5E5E8038/5F5719C5" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 3350 2000 50  0001 C CNN
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
AR Path="/5E5E8038/5F5719CC" Ref="Q16"  Part="1" 
F 0 "Q16" H 3456 2096 50  0000 L CNN
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
AR Path="/5E5E8038/5F57E379" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 1600 4000 50  0001 C CNN
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
AR Path="/5E5E8038/5F57E37F" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 1600 3000 50  0001 C CNN
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
AR Path="/5E5E8038/5F57E38B" Ref="Q28"  Part="1" 
F 0 "Q28" H 1706 4096 50  0000 L CNN
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
AR Path="/5E5E8038/5F57E392" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 2500 4000 50  0001 C CNN
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
AR Path="/5E5E8038/5F57E398" Ref="Q29"  Part="1" 
F 0 "Q29" H 2606 4096 50  0000 L CNN
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
AR Path="/5E5E8038/5F591EFE" Ref="Q38"  Part="1" 
F 0 "Q38" H 3056 6046 50  0000 L CNN
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
AR Path="/5E5E8038/5F591F05" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 3850 5950 50  0001 C CNN
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
AR Path="/5E5E8038/5F591F0B" Ref="Q39"  Part="1" 
F 0 "Q39" H 3956 6046 50  0000 L CNN
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
AR Path="/5E5E8038/5F567973" Ref="Q41"  Part="1" 
F 0 "Q41" H 3056 6846 50  0000 L CNN
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
AR Path="/5E5E8038/5F57189E" Ref="Q40"  Part="1" 
F 0 "Q40" H 3056 6446 50  0000 L CNN
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
AR Path="/5E5E8038/5F574A9C" Ref="Q44"  Part="1" 
F 0 "Q44" H 3056 7246 50  0000 L CNN
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
AR Path="/5E5E8038/5F57BFA4" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 2950 5150 50  0001 C CNN
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
AR Path="/5E5E8038/5F58BC93" Ref="Q30"  Part="1" 
F 0 "Q30" H 4606 4146 50  0000 L CNN
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
AR Path="/5E5E8038/5F58E362" Ref="Q31"  Part="1" 
F 0 "Q31" H 5556 4146 50  0000 L CNN
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
AR Path="/5E5E8038/5F596552" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 4500 3100 50  0001 C CNN
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
P 6600 2200
AR Path="/5E49A150/5F5AA109" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5AA109" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5AA109" Ref="Q19"  Part="1" 
F 0 "Q19" H 6806 2246 50  0000 L CNN
F 1 "2N7002" H 6806 2155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6800 2125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6600 2200 50  0001 L CNN
	1    6600 2200
	1    0    0    -1  
$EndComp
Text GLabel 6400 2200 0    50   Input ~ 0
~STATE_FETCH
$Comp
L power:GND #PWR?
U 1 1 5F5AB9AF
P 6700 2400
AR Path="/5E49A150/5F5AB9AF" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5AB9AF" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5AB9AF" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 6700 2150 50  0001 C CNN
F 1 "GND" H 6705 2227 50  0000 C CNN
F 2 "" H 6700 2400 50  0001 C CNN
F 3 "" H 6700 2400 50  0001 C CNN
	1    6700 2400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5ABF41
P 7650 2200
AR Path="/5E49A150/5F5ABF41" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5ABF41" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5ABF41" Ref="Q20"  Part="1" 
F 0 "Q20" H 7856 2246 50  0000 L CNN
F 1 "2N7002" H 7856 2155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7850 2125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7650 2200 50  0001 L CNN
	1    7650 2200
	1    0    0    -1  
$EndComp
Text GLabel 7450 2200 0    50   Input ~ 0
DBUS6
$Comp
L power:GND #PWR?
U 1 1 5F5B06A7
P 7750 2400
AR Path="/5E49A150/5F5B06A7" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5B06A7" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5B06A7" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 7750 2150 50  0001 C CNN
F 1 "GND" H 7755 2227 50  0000 C CNN
F 2 "" H 7750 2400 50  0001 C CNN
F 3 "" H 7750 2400 50  0001 C CNN
	1    7750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2000 6700 1800
Wire Wire Line
	6700 1800 7450 1800
Wire Wire Line
	7750 1800 7750 2000
Wire Wire Line
	6700 1550 6700 1800
$Comp
L power:VCC #PWR?
U 1 1 5F5B2A25
P 6700 1250
AR Path="/5E49A150/5F5B2A25" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5B2A25" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5B2A25" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 6700 1100 50  0001 C CNN
F 1 "VCC" H 6717 1423 50  0000 C CNN
F 2 "" H 6700 1250 50  0001 C CNN
F 3 "" H 6700 1250 50  0001 C CNN
	1    6700 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5B2A2B
P 6700 1400
AR Path="/5E49A150/5F5B2A2B" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5B2A2B" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5B2A2B" Ref="R11"  Part="1" 
F 0 "R11" H 6770 1446 50  0000 L CNN
F 1 "R" H 6770 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6630 1400 50  0001 C CNN
F 3 "~" H 6700 1400 50  0001 C CNN
	1    6700 1400
	1    0    0    -1  
$EndComp
Connection ~ 6700 1800
Wire Wire Line
	7250 1600 7450 1600
Wire Wire Line
	7450 1600 7450 1800
Connection ~ 7450 1800
Wire Wire Line
	7450 1800 7750 1800
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BFADC
P 8950 2150
AR Path="/5E49A150/5F5BFADC" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BFADC" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BFADC" Ref="Q17"  Part="1" 
F 0 "Q17" H 9156 2196 50  0000 L CNN
F 1 "2N7002" H 9156 2105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9150 2075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8950 2150 50  0001 L CNN
	1    8950 2150
	1    0    0    -1  
$EndComp
Text GLabel 8750 2150 0    50   Input ~ 0
~STATE_FETCH
$Comp
L power:GND #PWR?
U 1 1 5F5BFAE3
P 9050 2350
AR Path="/5E49A150/5F5BFAE3" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BFAE3" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BFAE3" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 9050 2100 50  0001 C CNN
F 1 "GND" H 9055 2177 50  0000 C CNN
F 2 "" H 9050 2350 50  0001 C CNN
F 3 "" H 9050 2350 50  0001 C CNN
	1    9050 2350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BFAE9
P 10000 2150
AR Path="/5E49A150/5F5BFAE9" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BFAE9" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BFAE9" Ref="Q18"  Part="1" 
F 0 "Q18" H 10206 2196 50  0000 L CNN
F 1 "2N7002" H 10206 2105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10200 2075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 10000 2150 50  0001 L CNN
	1    10000 2150
	1    0    0    -1  
$EndComp
Text GLabel 9800 2150 0    50   Input ~ 0
~DBUS6
$Comp
L power:GND #PWR?
U 1 1 5F5BFAF0
P 10100 2350
AR Path="/5E49A150/5F5BFAF0" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BFAF0" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BFAF0" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 10100 2100 50  0001 C CNN
F 1 "GND" H 10105 2177 50  0000 C CNN
F 2 "" H 10100 2350 50  0001 C CNN
F 3 "" H 10100 2350 50  0001 C CNN
	1    10100 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1950 9050 1750
Wire Wire Line
	9050 1750 9800 1750
Wire Wire Line
	10100 1750 10100 1950
Wire Wire Line
	9050 1500 9050 1750
$Comp
L power:VCC #PWR?
U 1 1 5F5BFAFA
P 9050 1200
AR Path="/5E49A150/5F5BFAFA" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BFAFA" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BFAFA" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 9050 1050 50  0001 C CNN
F 1 "VCC" H 9067 1373 50  0000 C CNN
F 2 "" H 9050 1200 50  0001 C CNN
F 3 "" H 9050 1200 50  0001 C CNN
	1    9050 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5BFB00
P 9050 1350
AR Path="/5E49A150/5F5BFB00" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5BFB00" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5BFB00" Ref="R10"  Part="1" 
F 0 "R10" H 9120 1396 50  0000 L CNN
F 1 "R" H 9120 1305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8980 1350 50  0001 C CNN
F 3 "~" H 9050 1350 50  0001 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
Connection ~ 9050 1750
Wire Wire Line
	9600 1550 9800 1550
Wire Wire Line
	9800 1550 9800 1750
Connection ~ 9800 1750
Wire Wire Line
	9800 1750 10100 1750
Text Notes 7000 1400 0    50   ~ 0
Relative (Z=0)
Text Notes 9350 1350 0    50   ~ 0
Zero-Page (Z=1)
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5C7BF6
P 14050 2700
AR Path="/5E49A150/5F5C7BF6" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5C7BF6" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5C7BF6" Ref="Q23"  Part="1" 
F 0 "Q23" H 14256 2746 50  0000 L CNN
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
AR Path="/5E5E8038/5F5CA784" Ref="Q25"  Part="1" 
F 0 "Q25" H 14256 3146 50  0000 L CNN
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
AR Path="/5E5E8038/5F5CFA33" Ref="R12"  Part="1" 
F 0 "R12" H 14220 2146 50  0000 L CNN
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
P 8850 4700
AR Path="/5E49A150/5F5738FB" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5738FB" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5738FB" Ref="Q35"  Part="1" 
F 0 "Q35" H 9056 4746 50  0000 L CNN
F 1 "2N7002" H 9056 4655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9050 4625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8850 4700 50  0001 L CNN
	1    8850 4700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57833F
P 9300 4200
AR Path="/5E49A150/5F57833F" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57833F" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57833F" Ref="Q33"  Part="1" 
F 0 "Q33" H 9506 4246 50  0000 L CNN
F 1 "2N7002" H 9506 4155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9500 4125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9300 4200 50  0001 L CNN
	1    9300 4200
	1    0    0    -1  
$EndComp
Connection ~ 8500 3700
Wire Wire Line
	8500 3700 8500 3850
Wire Wire Line
	8500 3850 9400 3850
Wire Wire Line
	9400 3850 9400 4000
Connection ~ 8500 3850
Wire Wire Line
	8500 3850 8500 4000
$Comp
L power:GND #PWR?
U 1 1 5F582E41
P 9400 4400
AR Path="/5E49A150/5F582E41" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F582E41" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F582E41" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 9400 4150 50  0001 C CNN
F 1 "GND" H 9405 4227 50  0000 C CNN
F 2 "" H 9400 4400 50  0001 C CNN
F 3 "" H 9400 4400 50  0001 C CNN
	1    9400 4400
	1    0    0    -1  
$EndComp
Text GLabel 9100 4200 0    50   Input ~ 0
~WS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5833E0
P 7950 4700
AR Path="/5E49A150/5F5833E0" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5833E0" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5833E0" Ref="Q34"  Part="1" 
F 0 "Q34" H 8156 4746 50  0000 L CNN
F 1 "2N7002" H 8156 4655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8150 4625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7950 4700 50  0001 L CNN
	1    7950 4700
	1    0    0    -1  
$EndComp
Text GLabel 8650 4700 0    50   Input ~ 0
OP5
$Comp
L power:GND #PWR?
U 1 1 5F596E05
P 8050 4900
AR Path="/5E49A150/5F596E05" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F596E05" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F596E05" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 8050 4650 50  0001 C CNN
F 1 "GND" H 8055 4727 50  0000 C CNN
F 2 "" H 8050 4900 50  0001 C CNN
F 3 "" H 8050 4900 50  0001 C CNN
	1    8050 4900
	1    0    0    -1  
$EndComp
Text GLabel 8200 4200 0    50   Input ~ 0
~STATE_ALU
Text GLabel 7750 4700 0    50   Input ~ 0
~STATE_EXEC
Wire Wire Line
	8050 4500 8500 4500
Wire Wire Line
	8500 4500 8500 4400
Wire Wire Line
	8500 4500 8950 4500
Connection ~ 8500 4500
Wire Wire Line
	5350 1300 5600 1300
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5A3BE8
P 10750 9150
AR Path="/5E49A150/5F5A3BE8" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5A3BE8" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5A3BE8" Ref="Q52"  Part="1" 
F 0 "Q52" H 10956 9196 50  0000 L CNN
F 1 "2N7002" H 10956 9105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10950 9075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 10750 9150 50  0001 L CNN
	1    10750 9150
	1    0    0    -1  
$EndComp
Text GLabel 10550 9150 0    50   Input ~ 0
OP5
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5B17A5
P 10750 8750
AR Path="/5E49A150/5F5B17A5" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5B17A5" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5B17A5" Ref="Q50"  Part="1" 
F 0 "Q50" H 10956 8796 50  0000 L CNN
F 1 "2N7002" H 10956 8705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10950 8675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 10750 8750 50  0001 L CNN
	1    10750 8750
	1    0    0    -1  
$EndComp
Text GLabel 10550 8750 0    50   Input ~ 0
OP4
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5B3D55
P 10350 8150
AR Path="/5E49A150/5F5B3D55" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5B3D55" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5B3D55" Ref="Q48"  Part="1" 
F 0 "Q48" H 10556 8196 50  0000 L CNN
F 1 "2N7002" H 10556 8105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10550 8075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 10350 8150 50  0001 L CNN
	1    10350 8150
	1    0    0    -1  
$EndComp
Text GLabel 10150 8150 0    50   Input ~ 0
OP3
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5B751F
P 11200 8150
AR Path="/5E49A150/5F5B751F" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5B751F" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5B751F" Ref="Q49"  Part="1" 
F 0 "Q49" H 11406 8196 50  0000 L CNN
F 1 "2N7002" H 11406 8105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 11400 8075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11200 8150 50  0001 L CNN
	1    11200 8150
	1    0    0    -1  
$EndComp
Text GLabel 11000 8150 0    50   Input ~ 0
~F
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BAB24
P 10750 7600
AR Path="/5E49A150/5F5BAB24" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BAB24" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BAB24" Ref="Q45"  Part="1" 
F 0 "Q45" H 10956 7646 50  0000 L CNN
F 1 "2N7002" H 10956 7555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10950 7525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 10750 7600 50  0001 L CNN
	1    10750 7600
	1    0    0    -1  
$EndComp
Text GLabel 10550 7600 0    50   Input ~ 0
~WS
$Comp
L power:VCC #PWR?
U 1 1 5F5BDE35
P 10850 6900
AR Path="/5E49A150/5F5BDE35" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5BDE35" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5BDE35" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 10850 6750 50  0001 C CNN
F 1 "VCC" H 10867 7073 50  0000 C CNN
F 2 "" H 10850 6900 50  0001 C CNN
F 3 "" H 10850 6900 50  0001 C CNN
	1    10850 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5BDE3B
P 10850 7050
AR Path="/5E49A150/5F5BDE3B" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5BDE3B" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5BDE3B" Ref="R20"  Part="1" 
F 0 "R20" H 10920 7096 50  0000 L CNN
F 1 "R" H 10920 7005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10780 7050 50  0001 C CNN
F 3 "~" H 10850 7050 50  0001 C CNN
	1    10850 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	11050 7250 10850 7250
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
AR Path="/5E5E8038/5F569DF6" Ref="Q58"  Part="1" 
F 0 "Q58" H 5756 9696 50  0000 L CNN
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
AR Path="/5E5E8038/5F56BF94" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 5650 9600 50  0001 C CNN
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
AR Path="/5E5E8038/5F59CDFE" Ref="Q55"  Part="1" 
F 0 "Q55" H 2756 9696 50  0000 L CNN
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
AR Path="/5E5E8038/5F5A3F04" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 2650 9600 50  0001 C CNN
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
AR Path="/5E5E8038/5F5AF815" Ref="Q56"  Part="1" 
F 0 "Q56" H 3656 9696 50  0000 L CNN
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
AR Path="/5E5E8038/5F5AF81B" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 3550 9600 50  0001 C CNN
F 1 "GND" H 3555 9677 50  0000 C CNN
F 2 "" H 3550 9850 50  0001 C CNN
F 3 "" H 3550 9850 50  0001 C CNN
	1    3550 9850
	1    0    0    -1  
$EndComp
Text GLabel 3250 9650 0    50   Input ~ 0
OP3
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5BA2B1
P 1600 9650
AR Path="/5E49A150/5F5BA2B1" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5BA2B1" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5BA2B1" Ref="Q54"  Part="1" 
F 0 "Q54" H 1806 9696 50  0000 L CNN
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
AR Path="/5E5E8038/5F5BA2B7" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 1700 9600 50  0001 C CNN
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
AR Path="/5E5E8038/5F5CF83C" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 3950 8100 50  0001 C CNN
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
AR Path="/5E5E8038/5F5F88E1" Ref="Q57"  Part="1" 
F 0 "Q57" H 4856 9696 50  0000 L CNN
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
AR Path="/5E5E8038/5F5FB34C" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 4750 9600 50  0001 C CNN
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
AR Path="/5E5E8038/5F60D1AB" Ref="Q51"  Part="1" 
F 0 "Q51" H 4056 8996 50  0000 L CNN
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
Text Notes 11350 7300 0    50   ~ 0
110 - JNF\n111 - JMP
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F64CE7B
P 11800 2200
AR Path="/5E49A150/5F64CE7B" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F64CE7B" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F64CE7B" Ref="Q21"  Part="1" 
F 0 "Q21" H 12006 2246 50  0000 L CNN
F 1 "2N7002" H 12006 2155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 12000 2125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11800 2200 50  0001 L CNN
	1    11800 2200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F6544FC
P 11800 2600
AR Path="/5E49A150/5F6544FC" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F6544FC" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F6544FC" Ref="Q22"  Part="1" 
F 0 "Q22" H 12006 2646 50  0000 L CNN
F 1 "2N7002" H 12006 2555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 12000 2525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11800 2600 50  0001 L CNN
	1    11800 2600
	1    0    0    -1  
$EndComp
Text GLabel 12000 1800 2    50   Input ~ 0
RUN
Wire Wire Line
	12000 1800 11900 1800
Wire Wire Line
	11900 1800 11900 2000
Text Notes 12350 2100 0    50   ~ 0
101 - HLT
Text GLabel 11600 2200 0    50   Input ~ 0
OP5
Text GLabel 11600 2600 0    50   Input ~ 0
~OP4
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F56D454
P 11800 3000
AR Path="/5E49A150/5F56D454" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F56D454" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F56D454" Ref="Q24"  Part="1" 
F 0 "Q24" H 12006 3046 50  0000 L CNN
F 1 "2N7002" H 12006 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 12000 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11800 3000 50  0001 L CNN
	1    11800 3000
	1    0    0    -1  
$EndComp
Text GLabel 11600 3000 0    50   Input ~ 0
OP3
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F56F029
P 11800 3400
AR Path="/5E49A150/5F56F029" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F56F029" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F56F029" Ref="Q26"  Part="1" 
F 0 "Q26" H 12006 3446 50  0000 L CNN
F 1 "2N7002" H 12006 3355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 12000 3325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11800 3400 50  0001 L CNN
	1    11800 3400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5718E5
P 11800 3800
AR Path="/5E49A150/5F5718E5" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5718E5" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5718E5" Ref="Q27"  Part="1" 
F 0 "Q27" H 12006 3846 50  0000 L CNN
F 1 "2N7002" H 12006 3755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 12000 3725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11800 3800 50  0001 L CNN
	1    11800 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5740F6
P 11900 4000
AR Path="/5E49A150/5F5740F6" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5740F6" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5740F6" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 11900 3750 50  0001 C CNN
F 1 "GND" H 11905 3827 50  0000 C CNN
F 2 "" H 11900 4000 50  0001 C CNN
F 3 "" H 11900 4000 50  0001 C CNN
	1    11900 4000
	1    0    0    -1  
$EndComp
Text GLabel 11600 3800 0    50   Input ~ 0
STATE_EXEC
Text GLabel 11600 3400 0    50   Input ~ 0
WS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F575BC0
P 6750 6950
AR Path="/5E49A150/5F575BC0" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F575BC0" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F575BC0" Ref="Q42"  Part="1" 
F 0 "Q42" H 6956 6996 50  0000 L CNN
F 1 "2N7002" H 6956 6905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6950 6875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6750 6950 50  0001 L CNN
	1    6750 6950
	1    0    0    -1  
$EndComp
Text GLabel 6550 6950 0    50   Input ~ 0
~ALU_COUT
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F577641
P 7950 6950
AR Path="/5E49A150/5F577641" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F577641" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F577641" Ref="Q43"  Part="1" 
F 0 "Q43" H 8156 6996 50  0000 L CNN
F 1 "2N7002" H 8156 6905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8150 6875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7950 6950 50  0001 L CNN
	1    7950 6950
	1    0    0    -1  
$EndComp
Text GLabel 7750 6950 0    50   Input ~ 0
~STATE_ALU
$Comp
L power:GND #PWR?
U 1 1 5F57A4C5
P 6850 7850
AR Path="/5E49A150/5F57A4C5" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57A4C5" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57A4C5" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 6850 7600 50  0001 C CNN
F 1 "GND" H 6855 7677 50  0000 C CNN
F 2 "" H 6850 7850 50  0001 C CNN
F 3 "" H 6850 7850 50  0001 C CNN
	1    6850 7850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57A99C
P 7950 7650
AR Path="/5E49A150/5F57A99C" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57A99C" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57A99C" Ref="Q47"  Part="1" 
F 0 "Q47" H 8156 7696 50  0000 L CNN
F 1 "2N7002" H 8156 7605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8150 7575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7950 7650 50  0001 L CNN
	1    7950 7650
	1    0    0    -1  
$EndComp
Text GLabel 7750 7650 0    50   Input ~ 0
~STATE_EXEC
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57CF9E
P 6750 7650
AR Path="/5E49A150/5F57CF9E" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57CF9E" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57CF9E" Ref="Q46"  Part="1" 
F 0 "Q46" H 6956 7696 50  0000 L CNN
F 1 "2N7002" H 6956 7605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6950 7575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6750 7650 50  0001 L CNN
	1    6750 7650
	1    0    0    -1  
$EndComp
Text GLabel 6550 7650 0    50   Input ~ 0
OP4
Text Notes 7700 6300 0    50   ~ 0
000 - LDA (Z start 1)\n001 - NOR (Z start 1)\n010 - ADD (C start 0)\n011 - SHR (C start 0)
Wire Wire Line
	6850 6750 6850 6550
Wire Wire Line
	6850 6550 7150 6550
$Comp
L power:VCC #PWR?
U 1 1 5F581036
P 6850 6050
AR Path="/5E49A150/5F581036" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F581036" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F581036" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 6850 5900 50  0001 C CNN
F 1 "VCC" H 6867 6223 50  0000 C CNN
F 2 "" H 6850 6050 50  0001 C CNN
F 3 "" H 6850 6050 50  0001 C CNN
	1    6850 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F58103C
P 6850 6200
AR Path="/5E49A150/5F58103C" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F58103C" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F58103C" Ref="R19"  Part="1" 
F 0 "R19" H 6920 6246 50  0000 L CNN
F 1 "R" H 6920 6155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6780 6200 50  0001 C CNN
F 3 "~" H 6850 6200 50  0001 C CNN
	1    6850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 6350 6850 6550
Connection ~ 6850 6550
Wire Wire Line
	7350 6300 7150 6300
Wire Wire Line
	7150 6300 7150 6550
Text GLabel 12050 5200 2    50   Input ~ 0
~DBUS6
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F57F058
P 11700 5450
AR Path="/5E49A150/5F57F058" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F57F058" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F57F058" Ref="Q36"  Part="1" 
F 0 "Q36" H 11906 5496 50  0000 L CNN
F 1 "2N7002" H 11906 5405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 11900 5375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 11700 5450 50  0001 L CNN
	1    11700 5450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F57F05F
P 11800 4800
AR Path="/5E49A150/5F57F05F" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F57F05F" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F57F05F" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 11800 4650 50  0001 C CNN
F 1 "VCC" H 11817 4973 50  0000 C CNN
F 2 "" H 11800 4800 50  0001 C CNN
F 3 "" H 11800 4800 50  0001 C CNN
	1    11800 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F57F065
P 11800 4950
AR Path="/5E49A150/5F57F065" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F57F065" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F57F065" Ref="R16"  Part="1" 
F 0 "R16" H 11870 4996 50  0000 L CNN
F 1 "R" H 11870 4905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 11730 4950 50  0001 C CNN
F 3 "~" H 11800 4950 50  0001 C CNN
	1    11800 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	11800 5100 11800 5200
Text GLabel 11500 5450 0    50   Input ~ 0
DBUS6
Wire Wire Line
	11800 5200 12050 5200
Connection ~ 11800 5200
Wire Wire Line
	11800 5200 11800 5250
$Comp
L power:GND #PWR?
U 1 1 5F581EA8
P 11800 5650
AR Path="/5E49A150/5F581EA8" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F581EA8" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F581EA8" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 11800 5400 50  0001 C CNN
F 1 "GND" H 11805 5477 50  0000 C CNN
F 2 "" H 11800 5650 50  0001 C CNN
F 3 "" H 11800 5650 50  0001 C CNN
	1    11800 5650
	1    0    0    -1  
$EndComp
Text GLabel 13400 5250 2    50   Input ~ 0
~WS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5971D7
P 13050 5500
AR Path="/5E49A150/5F5971D7" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5971D7" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5971D7" Ref="Q37"  Part="1" 
F 0 "Q37" H 13256 5546 50  0000 L CNN
F 1 "2N7002" H 13256 5455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 13250 5425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 13050 5500 50  0001 L CNN
	1    13050 5500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F5971DD
P 13150 4850
AR Path="/5E49A150/5F5971DD" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5971DD" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5971DD" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 13150 4700 50  0001 C CNN
F 1 "VCC" H 13167 5023 50  0000 C CNN
F 2 "" H 13150 4850 50  0001 C CNN
F 3 "" H 13150 4850 50  0001 C CNN
	1    13150 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F5971E3
P 13150 5000
AR Path="/5E49A150/5F5971E3" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F5971E3" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5F5971E3" Ref="R17"  Part="1" 
F 0 "R17" H 13220 5046 50  0000 L CNN
F 1 "R" H 13220 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 13080 5000 50  0001 C CNN
F 3 "~" H 13150 5000 50  0001 C CNN
	1    13150 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 5150 13150 5250
Text GLabel 12850 5500 0    50   Input ~ 0
WS
Wire Wire Line
	13150 5250 13400 5250
Connection ~ 13150 5250
Wire Wire Line
	13150 5250 13150 5300
$Comp
L power:GND #PWR?
U 1 1 5F5971EE
P 13150 5700
AR Path="/5E49A150/5F5971EE" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5971EE" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5971EE" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 13150 5450 50  0001 C CNN
F 1 "GND" H 13155 5527 50  0000 C CNN
F 2 "" H 13150 5700 50  0001 C CNN
F 3 "" H 13150 5700 50  0001 C CNN
	1    13150 5700
	1    0    0    -1  
$EndComp
Text Notes 4600 8850 0    50   ~ 0
STA - 100
$Comp
L power:GND #PWR?
U 1 1 5F5EA83D
P 8050 7850
AR Path="/5E49A150/5F5EA83D" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5EA83D" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5EA83D" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 8050 7600 50  0001 C CNN
F 1 "GND" H 8055 7677 50  0000 C CNN
F 2 "" H 8050 7850 50  0001 C CNN
F 3 "" H 8050 7850 50  0001 C CNN
	1    8050 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 6550 8050 6550
Wire Wire Line
	8050 6550 8050 6750
Connection ~ 7150 6550
Wire Wire Line
	6850 7150 6850 7300
Wire Wire Line
	6850 7300 8050 7300
Wire Wire Line
	8050 7300 8050 7150
Connection ~ 6850 7300
Wire Wire Line
	6850 7300 6850 7450
Wire Wire Line
	8050 7300 8050 7450
Connection ~ 8050 7300
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F5C5812
P 10750 9550
AR Path="/5E49A150/5F5C5812" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F5C5812" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5F5C5812" Ref="Q53"  Part="1" 
F 0 "Q53" H 10956 9596 50  0000 L CNN
F 1 "2N7002" H 10956 9505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10950 9475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 10750 9550 50  0001 L CNN
	1    10750 9550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5CA2E8
P 10850 9750
AR Path="/5E49A150/5F5CA2E8" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5CA2E8" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5CA2E8" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 10850 9500 50  0001 C CNN
F 1 "GND" H 10855 9577 50  0000 C CNN
F 2 "" H 10850 9750 50  0001 C CNN
F 3 "" H 10850 9750 50  0001 C CNN
	1    10850 9750
	1    0    0    -1  
$EndComp
Text GLabel 10550 9550 0    50   Input ~ 0
STATE_EXEC
Text GLabel 5600 1450 2    50   Input ~ 0
~STATE_ALU
Wire Wire Line
	5350 1450 5600 1450
Wire Wire Line
	10450 8350 10450 8400
Wire Wire Line
	10450 8400 10850 8400
Wire Wire Line
	10850 8400 10850 8550
Wire Wire Line
	10850 8400 11300 8400
Wire Wire Line
	11300 8400 11300 8350
Connection ~ 10850 8400
Wire Wire Line
	10450 7950 10450 7900
Wire Wire Line
	10450 7900 10850 7900
Wire Wire Line
	10850 7900 10850 7800
Wire Wire Line
	10850 7900 11300 7900
Wire Wire Line
	11300 7900 11300 7950
Connection ~ 10850 7900
Wire Wire Line
	10850 7200 10850 7250
Connection ~ 10850 7250
Wire Wire Line
	10850 7250 10850 7400
Text GLabel 5600 1600 2    50   Input ~ 0
~STATE_EXEC
Wire Wire Line
	5600 1600 5350 1600
$EndSCHEMATC
