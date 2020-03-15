EESchema Schematic File Version 4
LIBS:slice-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
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
L Transistor_FET:2N7002 Q?
U 1 1 5F25E3C2
P 7350 2950
AR Path="/5F25E3C2" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E3C2" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E3C2" Ref="Q107"  Part="1" 
F 0 "Q107" H 7556 2996 50  0000 L CNN
F 1 "2N7002" H 7556 2905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7550 2875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7350 2950 50  0001 L CNN
	1    7350 2950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E3C8
P 8300 2950
AR Path="/5F25E3C8" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E3C8" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E3C8" Ref="Q108"  Part="1" 
F 0 "Q108" H 8506 2996 50  0000 L CNN
F 1 "2N7002" H 8506 2905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8500 2875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8300 2950 50  0001 L CNN
	1    8300 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F25E3CE
P 10100 2200
AR Path="/5F25E3CE" Ref="R?"  Part="1" 
AR Path="/5EF45566/5F25E3CE" Ref="R?"  Part="1" 
AR Path="/5F227145/5F25E3CE" Ref="R34"  Part="1" 
F 0 "R34" H 10170 2246 50  0000 L CNN
F 1 "R" H 10170 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10030 2200 50  0001 C CNN
F 3 "~" H 10100 2200 50  0001 C CNN
	1    10100 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F25E3D4
P 10100 2050
AR Path="/5F25E3D4" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E3D4" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E3D4" Ref="#PWR093"  Part="1" 
F 0 "#PWR093" H 10100 1900 50  0001 C CNN
F 1 "VCC" H 10117 2223 50  0000 C CNN
F 2 "" H 10100 2050 50  0001 C CNN
F 3 "" H 10100 2050 50  0001 C CNN
	1    10100 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F25E3DA
P 8400 3150
AR Path="/5F25E3DA" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E3DA" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E3DA" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 8400 2900 50  0001 C CNN
F 1 "GND" H 8405 2977 50  0000 C CNN
F 2 "" H 8400 3150 50  0001 C CNN
F 3 "" H 8400 3150 50  0001 C CNN
	1    8400 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F25E3E0
P 7450 3150
AR Path="/5F25E3E0" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E3E0" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E3E0" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 7450 2900 50  0001 C CNN
F 1 "GND" H 7455 2977 50  0000 C CNN
F 2 "" H 7450 3150 50  0001 C CNN
F 3 "" H 7450 3150 50  0001 C CNN
	1    7450 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F25E3E6
P 6350 2050
AR Path="/5F25E3E6" Ref="R?"  Part="1" 
AR Path="/5EF45566/5F25E3E6" Ref="R?"  Part="1" 
AR Path="/5F227145/5F25E3E6" Ref="R33"  Part="1" 
F 0 "R33" H 6420 2096 50  0000 L CNN
F 1 "R" H 6420 2005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6280 2050 50  0001 C CNN
F 3 "~" H 6350 2050 50  0001 C CNN
	1    6350 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F25E3EC
P 6350 1900
AR Path="/5F25E3EC" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E3EC" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E3EC" Ref="#PWR092"  Part="1" 
F 0 "#PWR092" H 6350 1750 50  0001 C CNN
F 1 "VCC" H 6367 2073 50  0000 C CNN
F 2 "" H 6350 1900 50  0001 C CNN
F 3 "" H 6350 1900 50  0001 C CNN
	1    6350 1900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E3F2
P 6250 2750
AR Path="/5F25E3F2" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E3F2" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E3F2" Ref="Q103"  Part="1" 
F 0 "Q103" H 6456 2796 50  0000 L CNN
F 1 "2N7002" H 6456 2705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6450 2675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6250 2750 50  0001 L CNN
	1    6250 2750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E3F8
P 9250 2750
AR Path="/5F25E3F8" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E3F8" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E3F8" Ref="Q104"  Part="1" 
F 0 "Q104" H 9456 2796 50  0000 L CNN
F 1 "2N7002" H 9456 2705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9450 2675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9250 2750 50  0001 L CNN
	1    9250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2950 8100 2600
Wire Wire Line
	8100 2600 7450 2600
Connection ~ 7450 2600
Wire Wire Line
	7450 2600 7450 2750
Wire Wire Line
	7150 2950 7150 2400
Wire Wire Line
	7150 2400 8400 2400
Wire Wire Line
	8400 2400 8400 2500
Wire Wire Line
	7450 2500 6350 2500
Wire Wire Line
	7450 2500 7450 2600
Connection ~ 6350 2500
Wire Wire Line
	6350 2500 6350 2550
Wire Wire Line
	8400 2500 9350 2500
Connection ~ 8400 2500
Wire Wire Line
	8400 2500 8400 2750
Wire Wire Line
	9350 2500 9350 2550
$Comp
L Device:LED D?
U 1 1 5F25E422
P 10100 2900
AR Path="/5F25E422" Ref="D?"  Part="1" 
AR Path="/5EF45566/5F25E422" Ref="D?"  Part="1" 
AR Path="/5F227145/5F25E422" Ref="D3"  Part="1" 
F 0 "D3" V 10139 2783 50  0000 R CNN
F 1 "X" V 10048 2783 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 10100 2900 50  0001 C CNN
F 3 "~" H 10100 2900 50  0001 C CNN
	1    10100 2900
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E42A
P 3100 2850
AR Path="/5F25E42A" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E42A" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E42A" Ref="Q105"  Part="1" 
F 0 "Q105" H 3306 2896 50  0000 L CNN
F 1 "2N7002" H 3306 2805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3300 2775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3100 2850 50  0001 L CNN
	1    3100 2850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E430
P 4050 2850
AR Path="/5F25E430" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E430" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E430" Ref="Q106"  Part="1" 
F 0 "Q106" H 4256 2896 50  0000 L CNN
F 1 "2N7002" H 4256 2805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4250 2775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4050 2850 50  0001 L CNN
	1    4050 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F25E436
P 4150 2050
AR Path="/5F25E436" Ref="R?"  Part="1" 
AR Path="/5EF45566/5F25E436" Ref="R?"  Part="1" 
AR Path="/5F227145/5F25E436" Ref="R32"  Part="1" 
F 0 "R32" H 4220 2096 50  0000 L CNN
F 1 "R" H 4220 2005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4080 2050 50  0001 C CNN
F 3 "~" H 4150 2050 50  0001 C CNN
	1    4150 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F25E43C
P 4150 1900
AR Path="/5F25E43C" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E43C" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E43C" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 4150 1750 50  0001 C CNN
F 1 "VCC" H 4167 2073 50  0000 C CNN
F 2 "" H 4150 1900 50  0001 C CNN
F 3 "" H 4150 1900 50  0001 C CNN
	1    4150 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F25E442
P 4150 3050
AR Path="/5F25E442" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E442" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E442" Ref="#PWR095"  Part="1" 
F 0 "#PWR095" H 4150 2800 50  0001 C CNN
F 1 "GND" H 4155 2877 50  0000 C CNN
F 2 "" H 4150 3050 50  0001 C CNN
F 3 "" H 4150 3050 50  0001 C CNN
	1    4150 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F25E448
P 3200 3050
AR Path="/5F25E448" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E448" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E448" Ref="#PWR094"  Part="1" 
F 0 "#PWR094" H 3200 2800 50  0001 C CNN
F 1 "GND" H 3205 2877 50  0000 C CNN
F 2 "" H 3200 3050 50  0001 C CNN
F 3 "" H 3200 3050 50  0001 C CNN
	1    3200 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F25E44E
P 2100 1950
AR Path="/5F25E44E" Ref="R?"  Part="1" 
AR Path="/5EF45566/5F25E44E" Ref="R?"  Part="1" 
AR Path="/5F227145/5F25E44E" Ref="R31"  Part="1" 
F 0 "R31" H 2170 1996 50  0000 L CNN
F 1 "R" H 2170 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2030 1950 50  0001 C CNN
F 3 "~" H 2100 1950 50  0001 C CNN
	1    2100 1950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F25E454
P 2100 1800
AR Path="/5F25E454" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E454" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E454" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 2100 1650 50  0001 C CNN
F 1 "VCC" H 2117 1973 50  0000 C CNN
F 2 "" H 2100 1800 50  0001 C CNN
F 3 "" H 2100 1800 50  0001 C CNN
	1    2100 1800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E45A
P 2000 2650
AR Path="/5F25E45A" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E45A" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E45A" Ref="Q101"  Part="1" 
F 0 "Q101" H 2206 2696 50  0000 L CNN
F 1 "2N7002" H 2206 2605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2200 2575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2000 2650 50  0001 L CNN
	1    2000 2650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E460
P 5000 2650
AR Path="/5F25E460" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E460" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E460" Ref="Q102"  Part="1" 
F 0 "Q102" H 5206 2696 50  0000 L CNN
F 1 "2N7002" H 5206 2605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5200 2575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5000 2650 50  0001 L CNN
	1    5000 2650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F25E466
P 2000 3050
AR Path="/5F25E466" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F25E466" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F25E466" Ref="Q109"  Part="1" 
F 0 "Q109" H 2206 3096 50  0000 L CNN
F 1 "2N7002" H 2206 3005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2200 2975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2000 3050 50  0001 L CNN
	1    2000 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F25E46C
P 2100 3250
AR Path="/5F25E46C" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F25E46C" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F25E46C" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 2100 3000 50  0001 C CNN
F 1 "GND" H 2105 3077 50  0000 C CNN
F 2 "" H 2100 3250 50  0001 C CNN
F 3 "" H 2100 3250 50  0001 C CNN
	1    2100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2200 4150 2300
Wire Wire Line
	3850 2850 3850 2500
Wire Wire Line
	3850 2500 3200 2500
Connection ~ 3200 2500
Wire Wire Line
	3200 2500 3200 2650
Wire Wire Line
	2900 2850 2900 2300
Wire Wire Line
	2900 2300 4150 2300
Connection ~ 4150 2300
Wire Wire Line
	4150 2300 4150 2400
Wire Wire Line
	3200 2400 2500 2400
Wire Wire Line
	3200 2400 3200 2500
Connection ~ 2100 2400
Wire Wire Line
	2100 2400 2100 2450
Wire Wire Line
	4150 2400 5100 2400
Connection ~ 4150 2400
Wire Wire Line
	4150 2400 4150 2650
Wire Wire Line
	5100 2400 5100 2450
Wire Wire Line
	5100 2400 6050 2400
Wire Wire Line
	6050 2400 6050 2750
Connection ~ 5100 2400
Wire Wire Line
	2100 2100 2100 2400
Wire Wire Line
	2500 2400 2500 1300
Wire Wire Line
	2500 1300 9050 1300
Wire Wire Line
	9050 1300 9050 2750
Connection ~ 2500 2400
Wire Wire Line
	2500 2400 2100 2400
Text GLabel 1800 3050 0    50   Input ~ 0
WRX
Text GLabel 1800 2650 0    50   Input ~ 0
XIN
Text GLabel 4800 2650 0    50   Input ~ 0
~XIN
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F262DE6
P 7150 4850
AR Path="/5F262DE6" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F262DE6" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F262DE6" Ref="Q113"  Part="1" 
F 0 "Q113" H 7356 4896 50  0000 L CNN
F 1 "2N7002" H 7356 4805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7350 4775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7150 4850 50  0001 L CNN
	1    7150 4850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F264AFB
P 7150 5250
AR Path="/5F264AFB" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F264AFB" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F264AFB" Ref="Q115"  Part="1" 
F 0 "Q115" H 7356 5296 50  0000 L CNN
F 1 "2N7002" H 7356 5205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7350 5175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7150 5250 50  0001 L CNN
	1    7150 5250
	1    0    0    -1  
$EndComp
Text GLabel 6950 5250 0    50   Input ~ 0
RDX_ABUS
$Comp
L power:GND #PWR?
U 1 1 5F267F8B
P 7250 5450
AR Path="/5F267F8B" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F267F8B" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F267F8B" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 7250 5200 50  0001 C CNN
F 1 "GND" H 7255 5277 50  0000 C CNN
F 2 "" H 7250 5450 50  0001 C CNN
F 3 "" H 7250 5450 50  0001 C CNN
	1    7250 5450
	1    0    0    -1  
$EndComp
Text GLabel 6950 4850 0    50   Input ~ 0
~X
Text GLabel 7500 4450 2    50   Input ~ 0
ABUS
Wire Wire Line
	7250 4650 7250 4450
Wire Wire Line
	7250 4450 7500 4450
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2706BF
P 9100 4850
AR Path="/5F2706BF" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F2706BF" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F2706BF" Ref="Q114"  Part="1" 
F 0 "Q114" H 9306 4896 50  0000 L CNN
F 1 "2N7002" H 9306 4805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9300 4775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9100 4850 50  0001 L CNN
	1    9100 4850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2706C5
P 9100 5250
AR Path="/5F2706C5" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F2706C5" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F2706C5" Ref="Q116"  Part="1" 
F 0 "Q116" H 9306 5296 50  0000 L CNN
F 1 "2N7002" H 9306 5205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9300 5175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9100 5250 50  0001 L CNN
	1    9100 5250
	1    0    0    -1  
$EndComp
Text GLabel 8900 5250 0    50   Input ~ 0
RDX_DBUS
$Comp
L power:GND #PWR?
U 1 1 5F2706CC
P 9200 5450
AR Path="/5F2706CC" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2706CC" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2706CC" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 9200 5200 50  0001 C CNN
F 1 "GND" H 9205 5277 50  0000 C CNN
F 2 "" H 9200 5450 50  0001 C CNN
F 3 "" H 9200 5450 50  0001 C CNN
	1    9200 5450
	1    0    0    -1  
$EndComp
Text GLabel 8900 4850 0    50   Input ~ 0
~X
Text GLabel 9450 4450 2    50   Input ~ 0
DBUS
Wire Wire Line
	9200 4650 9200 4450
Wire Wire Line
	9200 4450 9450 4450
Wire Wire Line
	6350 2200 6350 2350
Text GLabel 6600 2350 2    50   Input ~ 0
~X
Wire Wire Line
	6600 2350 6350 2350
Connection ~ 6350 2350
Wire Wire Line
	6350 2350 6350 2500
Wire Wire Line
	9350 2500 10100 2500
Wire Wire Line
	10100 2500 10100 2750
Connection ~ 9350 2500
$Comp
L power:GND #PWR?
U 1 1 5F2791D4
P 10100 3050
AR Path="/5F2791D4" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2791D4" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2791D4" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 10100 2800 50  0001 C CNN
F 1 "GND" H 10105 2877 50  0000 C CNN
F 2 "" H 10100 3050 50  0001 C CNN
F 3 "" H 10100 3050 50  0001 C CNN
	1    10100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2350 10100 2500
Connection ~ 10100 2500
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2BD737
P 1800 5550
AR Path="/5F2BD737" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F2BD737" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F2BD737" Ref="Q118"  Part="1" 
F 0 "Q118" H 2006 5596 50  0000 L CNN
F 1 "2N7002" H 2006 5505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2000 5475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 1800 5550 50  0001 L CNN
	1    1800 5550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2C093F
P 1800 5950
AR Path="/5F2C093F" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F2C093F" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F2C093F" Ref="Q120"  Part="1" 
F 0 "Q120" H 2006 5996 50  0000 L CNN
F 1 "2N7002" H 2006 5905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2000 5875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 1800 5950 50  0001 L CNN
	1    1800 5950
	1    0    0    -1  
$EndComp
Text GLabel 1600 5950 0    50   Input ~ 0
XIN_ABUS
$Comp
L power:GND #PWR?
U 1 1 5F2C496E
P 1900 6150
AR Path="/5F2C496E" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2C496E" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2C496E" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 1900 5900 50  0001 C CNN
F 1 "GND" H 1905 5977 50  0000 C CNN
F 2 "" H 1900 6150 50  0001 C CNN
F 3 "" H 1900 6150 50  0001 C CNN
	1    1900 6150
	1    0    0    -1  
$EndComp
Text GLabel 1600 5550 0    50   Input ~ 0
ABUS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2C4FD9
P 3750 5350
AR Path="/5F2C4FD9" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F2C4FD9" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F2C4FD9" Ref="Q117"  Part="1" 
F 0 "Q117" H 3956 5396 50  0000 L CNN
F 1 "2N7002" H 3956 5305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3950 5275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3750 5350 50  0001 L CNN
	1    3750 5350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2C698D
P 2950 5550
AR Path="/5F2C698D" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F2C698D" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F2C698D" Ref="Q119"  Part="1" 
F 0 "Q119" H 3156 5596 50  0000 L CNN
F 1 "2N7002" H 3156 5505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3150 5475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2950 5550 50  0001 L CNN
	1    2950 5550
	1    0    0    -1  
$EndComp
Text GLabel 2750 5950 0    50   Input ~ 0
XIN_DBUS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2CAED1
P 2950 5950
AR Path="/5F2CAED1" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F2CAED1" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F2CAED1" Ref="Q121"  Part="1" 
F 0 "Q121" H 3156 5996 50  0000 L CNN
F 1 "2N7002" H 3156 5905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3150 5875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2950 5950 50  0001 L CNN
	1    2950 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2CFC14
P 3050 6150
AR Path="/5F2CFC14" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2CFC14" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2CFC14" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 3050 5900 50  0001 C CNN
F 1 "GND" H 3055 5977 50  0000 C CNN
F 2 "" H 3050 6150 50  0001 C CNN
F 3 "" H 3050 6150 50  0001 C CNN
	1    3050 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5350 2500 5350
Wire Wire Line
	3550 5350 3050 5350
Connection ~ 3050 5350
Text GLabel 2750 5550 0    50   Input ~ 0
DBUS
$Comp
L power:GND #PWR?
U 1 1 5F2DCBA8
P 3850 5550
AR Path="/5F2DCBA8" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2DCBA8" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2DCBA8" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3850 5300 50  0001 C CNN
F 1 "GND" H 3855 5377 50  0000 C CNN
F 2 "" H 3850 5550 50  0001 C CNN
F 3 "" H 3850 5550 50  0001 C CNN
	1    3850 5550
	1    0    0    -1  
$EndComp
Text GLabel 2700 5050 2    50   Input ~ 0
~XIN
Wire Wire Line
	2700 5050 2500 5050
Wire Wire Line
	2500 5050 2500 5350
Connection ~ 2500 5350
Wire Wire Line
	2500 5350 3050 5350
$Comp
L Device:R R?
U 1 1 5F2E0879
P 2500 4900
AR Path="/5F2E0879" Ref="R?"  Part="1" 
AR Path="/5EF45566/5F2E0879" Ref="R?"  Part="1" 
AR Path="/5F227145/5F2E0879" Ref="R36"  Part="1" 
F 0 "R36" H 2570 4946 50  0000 L CNN
F 1 "R" H 2570 4855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 4900 50  0001 C CNN
F 3 "~" H 2500 4900 50  0001 C CNN
	1    2500 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F2E087F
P 2500 4750
AR Path="/5F2E087F" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2E087F" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2E087F" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2500 4600 50  0001 C CNN
F 1 "VCC" H 2517 4923 50  0000 C CNN
F 2 "" H 2500 4750 50  0001 C CNN
F 3 "" H 2500 4750 50  0001 C CNN
	1    2500 4750
	1    0    0    -1  
$EndComp
Connection ~ 2500 5050
$Comp
L Device:R R?
U 1 1 5F2E3975
P 3850 4850
AR Path="/5F2E3975" Ref="R?"  Part="1" 
AR Path="/5EF45566/5F2E3975" Ref="R?"  Part="1" 
AR Path="/5F227145/5F2E3975" Ref="R35"  Part="1" 
F 0 "R35" H 3920 4896 50  0000 L CNN
F 1 "R" H 3920 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3780 4850 50  0001 C CNN
F 3 "~" H 3850 4850 50  0001 C CNN
	1    3850 4850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F2E397B
P 3850 4700
AR Path="/5F2E397B" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2E397B" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2E397B" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 3850 4550 50  0001 C CNN
F 1 "VCC" H 3867 4873 50  0000 C CNN
F 2 "" H 3850 4700 50  0001 C CNN
F 3 "" H 3850 4700 50  0001 C CNN
	1    3850 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 5000 3850 5100
Text GLabel 4100 5100 2    50   Input ~ 0
XIN
Wire Wire Line
	3850 5100 4100 5100
Connection ~ 3850 5100
Wire Wire Line
	3850 5100 3850 5150
Text Notes 1700 6550 0    50   ~ 0
X can be set to 0 by asserting /WRX with XIN_ABUS and XIN_DBUS set to 0.
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF697D1
P 5000 3050
AR Path="/5EF697D1" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EF697D1" Ref="Q?"  Part="1" 
AR Path="/5F227145/5EF697D1" Ref="Q110"  Part="1" 
F 0 "Q110" H 5206 3096 50  0000 L CNN
F 1 "2N7002" H 5206 3005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5200 2975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5000 3050 50  0001 L CNN
	1    5000 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF697D7
P 5100 3250
AR Path="/5EF697D7" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EF697D7" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5EF697D7" Ref="#PWR0100"  Part="1" 
F 0 "#PWR0100" H 5100 3000 50  0001 C CNN
F 1 "GND" H 5105 3077 50  0000 C CNN
F 2 "" H 5100 3250 50  0001 C CNN
F 3 "" H 5100 3250 50  0001 C CNN
	1    5100 3250
	1    0    0    -1  
$EndComp
Text GLabel 4800 3050 0    50   Input ~ 0
WRX
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF738F1
P 6250 3150
AR Path="/5EF738F1" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EF738F1" Ref="Q?"  Part="1" 
AR Path="/5F227145/5EF738F1" Ref="Q111"  Part="1" 
F 0 "Q111" H 6456 3196 50  0000 L CNN
F 1 "2N7002" H 6456 3105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6450 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6250 3150 50  0001 L CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF738F7
P 6350 3350
AR Path="/5EF738F7" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EF738F7" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5EF738F7" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 6350 3100 50  0001 C CNN
F 1 "GND" H 6355 3177 50  0000 C CNN
F 2 "" H 6350 3350 50  0001 C CNN
F 3 "" H 6350 3350 50  0001 C CNN
	1    6350 3350
	1    0    0    -1  
$EndComp
Text GLabel 6050 3150 0    50   Input ~ 0
CLK2
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF85528
P 9250 3150
AR Path="/5EF85528" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EF85528" Ref="Q?"  Part="1" 
AR Path="/5F227145/5EF85528" Ref="Q112"  Part="1" 
F 0 "Q112" H 9456 3196 50  0000 L CNN
F 1 "2N7002" H 9456 3105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9450 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9250 3150 50  0001 L CNN
	1    9250 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF8552E
P 9350 3350
AR Path="/5EF8552E" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EF8552E" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5EF8552E" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 9350 3100 50  0001 C CNN
F 1 "GND" H 9355 3177 50  0000 C CNN
F 2 "" H 9350 3350 50  0001 C CNN
F 3 "" H 9350 3350 50  0001 C CNN
	1    9350 3350
	1    0    0    -1  
$EndComp
Text GLabel 9050 3150 0    50   Input ~ 0
CLK2
$EndSCHEMATC
