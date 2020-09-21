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
L power:VCC #PWR05
U 1 1 5F5CD844
P 7300 2050
F 0 "#PWR05" H 7300 1900 50  0001 C CNN
F 1 "VCC" V 7315 2178 50  0000 L CNN
F 2 "" H 7300 2050 50  0001 C CNN
F 3 "" H 7300 2050 50  0001 C CNN
	1    7300 2050
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR04
U 1 1 5F5CDE5A
P 6800 2050
F 0 "#PWR04" H 6800 1900 50  0001 C CNN
F 1 "VCC" V 6815 2177 50  0000 L CNN
F 2 "" H 6800 2050 50  0001 C CNN
F 3 "" H 6800 2050 50  0001 C CNN
	1    6800 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5F5CEA62
P 6800 3550
F 0 "#PWR010" H 6800 3300 50  0001 C CNN
F 1 "GND" H 6805 3377 50  0000 C CNN
F 2 "" H 6800 3550 50  0001 C CNN
F 3 "" H 6800 3550 50  0001 C CNN
	1    6800 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F5CEFB2
P 7300 3550
F 0 "#PWR011" H 7300 3300 50  0001 C CNN
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
F 2 "Package_DIP:DIP-24_W15.24mm_Socket" H 4700 2250 50  0001 C CNN
F 3 "~" H 4700 2250 50  0001 C CNN
	1    4700 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5F5D3739
P 4500 2850
F 0 "#PWR08" H 4500 2600 50  0001 C CNN
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
F 2 "Package_DIP:DIP-24_W15.24mm_Socket" H 4700 4050 50  0001 C CNN
F 3 "~" H 4700 4050 50  0001 C CNN
	1    4700 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5F5D8DE8
P 4500 4650
F 0 "#PWR014" H 4500 4400 50  0001 C CNN
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
Text GLabel 4500 4550 0    50   Input ~ 0
D6
Text GLabel 5000 4650 2    50   Input ~ 0
D7
Text GLabel 5000 4550 2    50   Input ~ 0
D8
Text GLabel 5000 4450 2    50   Input ~ 0
D9
Text GLabel 5000 4350 2    50   Input ~ 0
D10
Text GLabel 5000 4250 2    50   Input ~ 0
D11
Text GLabel 5000 2850 2    50   Input ~ 0
D1
Text GLabel 5000 2750 2    50   Input ~ 0
D2
Text GLabel 5000 2650 2    50   Input ~ 0
D3
Text GLabel 5000 2550 2    50   Input ~ 0
D4
Text GLabel 5000 2450 2    50   Input ~ 0
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
Text GLabel 2350 6100 2    50   Input ~ 0
~WE
$Comp
L Device:R R5
U 1 1 5F5EFBBC
P 2150 5850
F 0 "R5" H 2220 5896 50  0000 L CNN
F 1 "10k" H 2220 5805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2080 5850 50  0001 C CNN
F 3 "~" H 2150 5850 50  0001 C CNN
	1    2150 5850
	1    0    0    -1  
$EndComp
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
L Device:R R6
U 1 1 5F5F59B0
P 3750 5850
F 0 "R6" H 3820 5896 50  0000 L CNN
F 1 "10k" H 3820 5805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3680 5850 50  0001 C CNN
F 3 "~" H 3750 5850 50  0001 C CNN
	1    3750 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6000 3750 6100
Wire Wire Line
	3750 6100 3950 6100
Connection ~ 3750 6100
Wire Wire Line
	3750 6100 3750 6250
$Comp
L power:GND #PWR013
U 1 1 5F5F8D09
P 3850 4550
F 0 "#PWR013" H 3850 4300 50  0001 C CNN
F 1 "GND" H 3855 4377 50  0000 C CNN
F 2 "" H 3850 4550 50  0001 C CNN
F 3 "" H 3850 4550 50  0001 C CNN
	1    3850 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F5F8D03
P 4000 4550
F 0 "R4" H 4070 4596 50  0000 L CNN
F 1 "10k" H 4070 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 4550 50  0001 C CNN
F 3 "~" H 4000 4550 50  0001 C CNN
	1    4000 4550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5F5F655D
P 3850 4300
F 0 "#PWR012" H 3850 4050 50  0001 C CNN
F 1 "GND" H 3855 4127 50  0000 C CNN
F 2 "" H 3850 4300 50  0001 C CNN
F 3 "" H 3850 4300 50  0001 C CNN
	1    3850 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F5F5F1B
P 4000 4300
F 0 "R3" H 4070 4346 50  0000 L CNN
F 1 "10k" H 4070 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 4300 50  0001 C CNN
F 3 "~" H 4000 4300 50  0001 C CNN
	1    4000 4300
	0    1    1    0   
$EndComp
Text GLabel 4500 2750 0    50   Input ~ 0
D0
Text GLabel 4500 4250 0    50   Input ~ 0
A0
Text GLabel 4500 4050 0    50   Input ~ 0
A2
Text GLabel 4500 4150 0    50   Input ~ 0
A1
$Comp
L power:GND #PWR07
U 1 1 5F5FA735
P 3800 2750
F 0 "#PWR07" H 3800 2500 50  0001 C CNN
F 1 "GND" H 3805 2577 50  0000 C CNN
F 2 "" H 3800 2750 50  0001 C CNN
F 3 "" H 3800 2750 50  0001 C CNN
	1    3800 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5F5FA73B
P 3950 2750
F 0 "R2" H 4020 2796 50  0000 L CNN
F 1 "10k" H 4020 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 2750 50  0001 C CNN
F 3 "~" H 3950 2750 50  0001 C CNN
	1    3950 2750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F5FA741
P 3800 2500
F 0 "#PWR06" H 3800 2250 50  0001 C CNN
F 1 "GND" H 3805 2327 50  0000 C CNN
F 2 "" H 3800 2500 50  0001 C CNN
F 3 "" H 3800 2500 50  0001 C CNN
	1    3800 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F5FA747
P 3950 2500
F 0 "R1" H 4020 2546 50  0000 L CNN
F 1 "10k" H 4020 2455 50  0000 L CNN
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
L Device:R R7
U 1 1 5F609061
P 1700 6700
F 0 "R7" H 1770 6746 50  0000 L CNN
F 1 "10k" H 1770 6655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 6700 50  0001 C CNN
F 3 "~" H 1700 6700 50  0001 C CNN
	1    1700 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5F609FE8
P 1950 7000
F 0 "#PWR017" H 1950 6750 50  0001 C CNN
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
L Device:R R8
U 1 1 5F6104C9
P 3300 6700
F 0 "R8" H 3370 6746 50  0000 L CNN
F 1 "10k" H 3370 6655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3230 6700 50  0001 C CNN
F 3 "~" H 3300 6700 50  0001 C CNN
	1    3300 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5F6104CF
P 3550 7000
F 0 "#PWR018" H 3550 6750 50  0001 C CNN
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
$Comp
L power:GND #PWR03
U 1 1 5F5ED87E
P 1700 1800
F 0 "#PWR03" H 1700 1550 50  0001 C CNN
F 1 "GND" H 1705 1627 50  0000 C CNN
F 2 "" H 1700 1800 50  0001 C CNN
F 3 "" H 1700 1800 50  0001 C CNN
	1    1700 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F5ECE76
P 1700 1650
F 0 "C1" H 1815 1696 50  0000 L CNN
F 1 "0.1u" H 1815 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1738 1500 50  0001 C CNN
F 3 "~" H 1700 1650 50  0001 C CNN
	1    1700 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5F684BD0
P 1700 1500
F 0 "#PWR01" H 1700 1350 50  0001 C CNN
F 1 "VCC" V 1715 1627 50  0000 L CNN
F 2 "" H 1700 1500 50  0001 C CNN
F 3 "" H 1700 1500 50  0001 C CNN
	1    1700 1500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR015
U 1 1 5F687F54
P 2150 5700
F 0 "#PWR015" H 2150 5550 50  0001 C CNN
F 1 "VCC" V 2165 5827 50  0000 L CNN
F 2 "" H 2150 5700 50  0001 C CNN
F 3 "" H 2150 5700 50  0001 C CNN
	1    2150 5700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR016
U 1 1 5F689CA5
P 3750 5700
F 0 "#PWR016" H 3750 5550 50  0001 C CNN
F 1 "VCC" V 3765 5827 50  0000 L CNN
F 2 "" H 3750 5700 50  0001 C CNN
F 3 "" H 3750 5700 50  0001 C CNN
	1    3750 5700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 5F68B2B7
P 5000 1750
F 0 "#PWR02" H 5000 1600 50  0001 C CNN
F 1 "VCC" V 5015 1877 50  0000 L CNN
F 2 "" H 5000 1750 50  0001 C CNN
F 3 "" H 5000 1750 50  0001 C CNN
	1    5000 1750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 5F68BB50
P 5000 3550
F 0 "#PWR09" H 5000 3400 50  0001 C CNN
F 1 "VCC" V 5015 3677 50  0000 L CNN
F 2 "" H 5000 3550 50  0001 C CNN
F 3 "" H 5000 3550 50  0001 C CNN
	1    5000 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F695A7F
P 2200 1800
F 0 "#PWR0101" H 2200 1550 50  0001 C CNN
F 1 "GND" H 2205 1627 50  0000 C CNN
F 2 "" H 2200 1800 50  0001 C CNN
F 3 "" H 2200 1800 50  0001 C CNN
	1    2200 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F695A85
P 2200 1650
F 0 "C2" H 2315 1696 50  0000 L CNN
F 1 "0.1u" H 2315 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2238 1500 50  0001 C CNN
F 3 "~" H 2200 1650 50  0001 C CNN
	1    2200 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5F695A8B
P 2200 1500
F 0 "#PWR0102" H 2200 1350 50  0001 C CNN
F 1 "VCC" V 2215 1627 50  0000 L CNN
F 2 "" H 2200 1500 50  0001 C CNN
F 3 "" H 2200 1500 50  0001 C CNN
	1    2200 1500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
