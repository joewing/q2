EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L power:VCC #PWR0101
U 1 1 5F5CD844
P 7300 2050
F 0 "#PWR0101" H 7300 1900 50  0001 C CNN
F 1 "VCC" V 7315 2178 50  0000 L CNN
F 2 "" H 7300 2050 50  0001 C CNN
F 3 "" H 7300 2050 50  0001 C CNN
	1    7300 2050
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5F5CDE5A
P 6800 2050
F 0 "#PWR0102" H 6800 1900 50  0001 C CNN
F 1 "VCC" V 6815 2177 50  0000 L CNN
F 2 "" H 6800 2050 50  0001 C CNN
F 3 "" H 6800 2050 50  0001 C CNN
	1    6800 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5F5CEA62
P 6800 3550
F 0 "#PWR0103" H 6800 3300 50  0001 C CNN
F 1 "GND" H 6805 3377 50  0000 C CNN
F 2 "" H 6800 3550 50  0001 C CNN
F 3 "" H 6800 3550 50  0001 C CNN
	1    6800 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5F5CEFB2
P 7300 3550
F 0 "#PWR0104" H 7300 3300 50  0001 C CNN
F 1 "GND" H 7305 3377 50  0000 C CNN
F 2 "" H 7300 3550 50  0001 C CNN
F 3 "" H 7300 3550 50  0001 C CNN
	1    7300 3550
	1    0    0    -1  
$EndComp
Text GLabel 6800 3150 0    50   Input ~ 0
A1
Text GLabel 6800 2150 0    50   Input ~ 0
A11
Text GLabel 6800 2250 0    50   Input ~ 0
A10
Text GLabel 6800 2350 0    50   Input ~ 0
A9
Text GLabel 6800 2450 0    50   Input ~ 0
A8
Text GLabel 6800 2550 0    50   Input ~ 0
A7
Text GLabel 6800 2650 0    50   Input ~ 0
A6
Text GLabel 6800 2750 0    50   Input ~ 0
A5
Text GLabel 6800 2850 0    50   Input ~ 0
A4
Text GLabel 6800 2950 0    50   Input ~ 0
A3
Text GLabel 6800 3050 0    50   Input ~ 0
A2
Text GLabel 6800 3250 0    50   Input ~ 0
A0
$Comp
L Connector_Generic:Conn_02x12_Counter_Clockwise J1
U 1 1 5F5D2970
P 4700 2250
F 0 "J1" H 4750 2967 50  0000 C CNN
F 1 "6116" H 4750 2876 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 4700 2250 50  0001 C CNN
F 3 "~" H 4700 2250 50  0001 C CNN
	1    4700 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5F5D3739
P 4500 2850
F 0 "#PWR0105" H 4500 2600 50  0001 C CNN
F 1 "GND" H 4505 2677 50  0000 C CNN
F 2 "" H 4500 2850 50  0001 C CNN
F 3 "" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
Text GLabel 4500 2350 0    50   Input ~ 0
A1
Text GLabel 4500 1750 0    50   Input ~ 0
A7
Text GLabel 4500 1850 0    50   Input ~ 0
A6
Text GLabel 4500 1950 0    50   Input ~ 0
A5
Text GLabel 4500 2050 0    50   Input ~ 0
A4
Text GLabel 4500 2150 0    50   Input ~ 0
A3
Text GLabel 4500 2250 0    50   Input ~ 0
A2
Text GLabel 4500 2450 0    50   Input ~ 0
A0
Text GLabel 5000 2250 2    50   Input ~ 0
A10
Text GLabel 5000 1950 2    50   Input ~ 0
A9
Text GLabel 5000 1850 2    50   Input ~ 0
A8
Text GLabel 5000 2350 2    50   Input ~ 0
A11
Text GLabel 5200 2050 2    50   Input ~ 0
~WE
Text GLabel 5400 2150 2    50   Input ~ 0
~OE
Wire Wire Line
	5000 2050 5200 2050
Wire Wire Line
	5000 2150 5400 2150
$Comp
L Connector_Generic:Conn_02x12_Counter_Clockwise J3
U 1 1 5F5D8DE2
P 4700 4050
F 0 "J3" H 4750 4767 50  0000 C CNN
F 1 "6116" H 4750 4676 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 4700 4050 50  0001 C CNN
F 3 "~" H 4700 4050 50  0001 C CNN
	1    4700 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5F5D8DE8
P 4500 4650
F 0 "#PWR0107" H 4500 4400 50  0001 C CNN
F 1 "GND" H 4505 4477 50  0000 C CNN
F 2 "" H 4500 4650 50  0001 C CNN
F 3 "" H 4500 4650 50  0001 C CNN
	1    4500 4650
	1    0    0    -1  
$EndComp
Text GLabel 4500 3550 0    50   Input ~ 0
A7
Text GLabel 4500 3650 0    50   Input ~ 0
A6
Text GLabel 4500 3750 0    50   Input ~ 0
A5
Text GLabel 4500 3850 0    50   Input ~ 0
A4
Text GLabel 4500 3950 0    50   Input ~ 0
A3
Text GLabel 5000 4050 2    50   Input ~ 0
A10
Text GLabel 5000 3750 2    50   Input ~ 0
A9
Text GLabel 5000 3650 2    50   Input ~ 0
A8
Text GLabel 5000 4150 2    50   Input ~ 0
A11
Text GLabel 5200 3850 2    50   Input ~ 0
~WE
Text GLabel 5400 3950 2    50   Input ~ 0
~OE
Wire Wire Line
	5000 3850 5200 3850
Wire Wire Line
	5000 3950 5400 3950
Text GLabel 7300 3250 2    50   Input ~ 0
D0
Text GLabel 7300 3150 2    50   Input ~ 0
D1
Text GLabel 7300 3050 2    50   Input ~ 0
D2
Text GLabel 7300 2950 2    50   Input ~ 0
D3
Text GLabel 7300 2850 2    50   Input ~ 0
D4
Text GLabel 7300 2750 2    50   Input ~ 0
D5
Text GLabel 7300 2650 2    50   Input ~ 0
D6
Text GLabel 7300 2550 2    50   Input ~ 0
D7
Text GLabel 7300 2450 2    50   Input ~ 0
D8
Text GLabel 7300 2350 2    50   Input ~ 0
D9
Text GLabel 7300 2250 2    50   Input ~ 0
D10
Text GLabel 7300 2150 2    50   Input ~ 0
D11
Text GLabel 4500 2750 0    50   Input ~ 0
D6
Text GLabel 5000 2850 2    50   Input ~ 0
D7
Text GLabel 5000 2750 2    50   Input ~ 0
D8
Text GLabel 5000 2650 2    50   Input ~ 0
D9
Text GLabel 5000 2550 2    50   Input ~ 0
D10
Text GLabel 5000 2450 2    50   Input ~ 0
D11
Text GLabel 5000 4650 2    50   Input ~ 0
D1
Text GLabel 5000 4550 2    50   Input ~ 0
D2
Text GLabel 5000 4450 2    50   Input ~ 0
D3
Text GLabel 5000 4350 2    50   Input ~ 0
D4
Text GLabel 5000 4250 2    50   Input ~ 0
D5
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 5F5DB272
P 2050 6450
F 0 "Q1" H 2254 6496 50  0000 L CNN
F 1 "2N7002" H 2254 6405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2250 6375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2050 6450 50  0001 L CNN
	1    2050 6450
	1    0    0    -1  
$EndComp
Text GLabel 6800 3350 0    50   Input ~ 0
WRM
Text GLabel 6800 3450 0    50   Input ~ 0
RDM
Text GLabel 1500 6450 0    50   Input ~ 0
WRM
$Comp
L Diode:1N4148W D1
U 1 1 5F5DFA3A
P 2500 1500
F 0 "D1" H 2500 1717 50  0000 C CNN
F 1 "1N4148W" H 2500 1626 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2500 1325 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 2500 1500 50  0001 C CNN
	1    2500 1500
	1    0    0    -1  
$EndComp
Text GLabel 5000 1750 2    50   Input ~ 0
RAM_VCC
Text GLabel 5000 3550 2    50   Input ~ 0
RAM_VCC
Text GLabel 1750 1950 0    50   Input ~ 0
RAM_VCC
$Comp
L Diode:1N4148W D3
U 1 1 5F5E13CD
P 2500 2250
F 0 "D3" H 2500 2467 50  0000 C CNN
F 1 "1N4148W" H 2500 2376 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2500 2075 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 2500 2250 50  0001 C CNN
	1    2500 2250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0108
U 1 1 5F5E3196
P 2850 1400
F 0 "#PWR0108" H 2850 1250 50  0001 C CNN
F 1 "VCC" V 2865 1527 50  0000 L CNN
F 2 "" H 2850 1400 50  0001 C CNN
F 3 "" H 2850 1400 50  0001 C CNN
	1    2850 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5F5E439F
P 2850 2450
F 0 "C2" H 2968 2496 50  0000 L CNN
F 1 "CP" H 2968 2405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 2888 2300 50  0001 C CNN
F 3 "~" H 2850 2450 50  0001 C CNN
	1    2850 2450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148W D2
U 1 1 5F5E5F35
P 2850 1750
F 0 "D2" V 2896 1670 50  0000 R CNN
F 1 "1N4148W" V 2805 1670 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2850 1575 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 2850 1750 50  0001 C CNN
	1    2850 1750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F5E7E27
P 2850 2050
F 0 "R1" H 2920 2096 50  0000 L CNN
F 1 "R" H 2920 2005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2780 2050 50  0001 C CNN
F 3 "~" H 2850 2050 50  0001 C CNN
	1    2850 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1950 1850 1950
Wire Wire Line
	1850 1950 1850 2250
Wire Wire Line
	1850 2250 2350 2250
Wire Wire Line
	1850 1950 1850 1500
Wire Wire Line
	1850 1500 2350 1500
Connection ~ 1850 1950
Wire Wire Line
	2650 1500 2850 1500
Wire Wire Line
	2850 1500 2850 1600
Wire Wire Line
	2850 1500 2850 1400
Connection ~ 2850 1500
Wire Wire Line
	2650 2250 2850 2250
Wire Wire Line
	2850 2250 2850 2300
Wire Wire Line
	2850 2250 2850 2200
Connection ~ 2850 2250
$Comp
L power:GND #PWR0109
U 1 1 5F5EC4F2
P 2850 2600
F 0 "#PWR0109" H 2850 2350 50  0001 C CNN
F 1 "GND" H 2855 2427 50  0000 C CNN
F 2 "" H 2850 2600 50  0001 C CNN
F 3 "" H 2850 2600 50  0001 C CNN
	1    2850 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F5ECE76
P 1850 2400
F 0 "C1" H 1965 2446 50  0000 L CNN
F 1 "C" H 1965 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1888 2250 50  0001 C CNN
F 3 "~" H 1850 2400 50  0001 C CNN
	1    1850 2400
	1    0    0    -1  
$EndComp
Connection ~ 1850 2250
$Comp
L power:GND #PWR0110
U 1 1 5F5ED87E
P 1850 2550
F 0 "#PWR0110" H 1850 2300 50  0001 C CNN
F 1 "GND" H 1855 2377 50  0000 C CNN
F 2 "" H 1850 2550 50  0001 C CNN
F 3 "" H 1850 2550 50  0001 C CNN
	1    1850 2550
	1    0    0    -1  
$EndComp
Text GLabel 2350 6100 2    50   Input ~ 0
~WE
$Comp
L Device:R R4
U 1 1 5F5EFBBC
P 2150 5850
F 0 "R4" H 2220 5896 50  0000 L CNN
F 1 "R" H 2220 5805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2080 5850 50  0001 C CNN
F 3 "~" H 2150 5850 50  0001 C CNN
	1    2150 5850
	1    0    0    -1  
$EndComp
Text GLabel 2000 5550 0    50   Input ~ 0
RAM_VCC
Wire Wire Line
	2000 5550 2150 5550
Wire Wire Line
	2150 5550 2150 5700
Wire Wire Line
	2150 6000 2150 6100
Wire Wire Line
	2150 6100 2350 6100
Connection ~ 2150 6100
Wire Wire Line
	2150 6100 2150 6250
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 5F5F59A2
P 3650 6450
F 0 "Q2" H 3854 6496 50  0000 L CNN
F 1 "2N7002" H 3854 6405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3850 6375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3650 6450 50  0001 L CNN
	1    3650 6450
	1    0    0    -1  
$EndComp
Text GLabel 3150 6450 0    50   Input ~ 0
RDM
Text GLabel 3950 6100 2    50   Input ~ 0
~OE
$Comp
L Device:R R7
U 1 1 5F5F59B0
P 3750 5850
F 0 "R7" H 3820 5896 50  0000 L CNN
F 1 "R" H 3820 5805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3680 5850 50  0001 C CNN
F 3 "~" H 3750 5850 50  0001 C CNN
	1    3750 5850
	1    0    0    -1  
$EndComp
Text GLabel 3600 5550 0    50   Input ~ 0
RAM_VCC
Wire Wire Line
	3600 5550 3750 5550
Wire Wire Line
	3750 5550 3750 5700
Wire Wire Line
	3750 6000 3750 6100
Wire Wire Line
	3750 6100 3950 6100
Connection ~ 3750 6100
Wire Wire Line
	3750 6100 3750 6250
$Comp
L power:GND #PWR0112
U 1 1 5F5F8D09
P 3850 4550
F 0 "#PWR0112" H 3850 4300 50  0001 C CNN
F 1 "GND" H 3855 4377 50  0000 C CNN
F 2 "" H 3850 4550 50  0001 C CNN
F 3 "" H 3850 4550 50  0001 C CNN
	1    3850 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F5F8D03
P 4000 4550
F 0 "R6" H 4070 4596 50  0000 L CNN
F 1 "R" H 4070 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 4550 50  0001 C CNN
F 3 "~" H 4000 4550 50  0001 C CNN
	1    4000 4550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5F5F655D
P 3850 4300
F 0 "#PWR0113" H 3850 4050 50  0001 C CNN
F 1 "GND" H 3855 4127 50  0000 C CNN
F 2 "" H 3850 4300 50  0001 C CNN
F 3 "" H 3850 4300 50  0001 C CNN
	1    3850 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5F5F5F1B
P 4000 4300
F 0 "R5" H 4070 4346 50  0000 L CNN
F 1 "R" H 4070 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 4300 50  0001 C CNN
F 3 "~" H 4000 4300 50  0001 C CNN
	1    4000 4300
	0    1    1    0   
$EndComp
Text GLabel 4500 4550 0    50   Input ~ 0
D0
Text GLabel 4500 4250 0    50   Input ~ 0
A0
Text GLabel 4500 4050 0    50   Input ~ 0
A2
Text GLabel 4500 4150 0    50   Input ~ 0
A1
$Comp
L power:GND #PWR0114
U 1 1 5F5FA735
P 3800 2750
F 0 "#PWR0114" H 3800 2500 50  0001 C CNN
F 1 "GND" H 3805 2577 50  0000 C CNN
F 2 "" H 3800 2750 50  0001 C CNN
F 3 "" H 3800 2750 50  0001 C CNN
	1    3800 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F5FA73B
P 3950 2750
F 0 "R3" H 4020 2796 50  0000 L CNN
F 1 "R" H 4020 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 2750 50  0001 C CNN
F 3 "~" H 3950 2750 50  0001 C CNN
	1    3950 2750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F5FA741
P 3800 2500
F 0 "#PWR0115" H 3800 2250 50  0001 C CNN
F 1 "GND" H 3805 2327 50  0000 C CNN
F 2 "" H 3800 2500 50  0001 C CNN
F 3 "" H 3800 2500 50  0001 C CNN
	1    3800 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5F5FA747
P 3950 2500
F 0 "R2" H 4020 2546 50  0000 L CNN
F 1 "R" H 4020 2455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 2500 50  0001 C CNN
F 3 "~" H 3950 2500 50  0001 C CNN
	1    3950 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 2500 4100 2550
Wire Wire Line
	4100 2550 4500 2550
Wire Wire Line
	4100 2750 4100 2650
Wire Wire Line
	4100 2650 4500 2650
Wire Wire Line
	4150 4300 4150 4350
Wire Wire Line
	4150 4350 4500 4350
Wire Wire Line
	4150 4550 4150 4450
Wire Wire Line
	4150 4450 4500 4450
$Comp
L Device:R R8
U 1 1 5F609061
P 1700 6700
F 0 "R8" H 1770 6746 50  0000 L CNN
F 1 "R" H 1770 6655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 6700 50  0001 C CNN
F 3 "~" H 1700 6700 50  0001 C CNN
	1    1700 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F609FE8
P 1950 7000
F 0 "#PWR01" H 1950 6750 50  0001 C CNN
F 1 "GND" H 1955 6827 50  0000 C CNN
F 2 "" H 1950 7000 50  0001 C CNN
F 3 "" H 1950 7000 50  0001 C CNN
	1    1950 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6450 1700 6450
Wire Wire Line
	1700 6450 1700 6550
Connection ~ 1700 6450
Wire Wire Line
	1700 6450 1850 6450
Wire Wire Line
	1700 6850 1700 7000
Wire Wire Line
	1700 7000 1950 7000
Wire Wire Line
	1950 7000 2150 7000
Wire Wire Line
	2150 7000 2150 6650
Connection ~ 1950 7000
$Comp
L Device:R R9
U 1 1 5F6104C9
P 3300 6700
F 0 "R9" H 3370 6746 50  0000 L CNN
F 1 "R" H 3370 6655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3230 6700 50  0001 C CNN
F 3 "~" H 3300 6700 50  0001 C CNN
	1    3300 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F6104CF
P 3550 7000
F 0 "#PWR02" H 3550 6750 50  0001 C CNN
F 1 "GND" H 3555 6827 50  0000 C CNN
F 2 "" H 3550 7000 50  0001 C CNN
F 3 "" H 3550 7000 50  0001 C CNN
	1    3550 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6850 3300 7000
Wire Wire Line
	3300 7000 3550 7000
Wire Wire Line
	3550 7000 3750 7000
Wire Wire Line
	3750 7000 3750 6650
Connection ~ 3550 7000
Wire Wire Line
	3150 6450 3300 6450
Wire Wire Line
	3300 6450 3300 6550
Connection ~ 3300 6450
Wire Wire Line
	3300 6450 3450 6450
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J2
U 1 1 5F62A550
P 7000 2750
F 0 "J2" H 7050 3667 50  0000 C CNN
F 1 "Conn_02x16_Odd_Even" H 7050 3576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x16_P2.54mm_Horizontal" H 7000 2750 50  0001 C CNN
F 3 "~" H 7000 2750 50  0001 C CNN
	1    7000 2750
	1    0    0    -1  
$EndComp
NoConn ~ 7300 3350
NoConn ~ 7300 3450
$EndSCHEMATC
