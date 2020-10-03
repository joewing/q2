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
L power:GND #PWR010
U 1 1 5F722627
P 7600 2550
F 0 "#PWR010" H 7600 2300 50  0001 C CNN
F 1 "GND" H 7605 2377 50  0000 C CNN
F 2 "" H 7600 2550 50  0001 C CNN
F 3 "" H 7600 2550 50  0001 C CNN
	1    7600 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5F722A68
P 7100 2550
F 0 "#PWR09" H 7100 2300 50  0001 C CNN
F 1 "GND" H 7105 2377 50  0000 C CNN
F 2 "" H 7100 2550 50  0001 C CNN
F 3 "" H 7100 2550 50  0001 C CNN
	1    7100 2550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5F722EA8
P 7100 1050
F 0 "#PWR01" H 7100 900 50  0001 C CNN
F 1 "VCC" V 7115 1177 50  0000 L CNN
F 2 "" H 7100 1050 50  0001 C CNN
F 3 "" H 7100 1050 50  0001 C CNN
	1    7100 1050
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 5F72352A
P 7600 1050
F 0 "#PWR02" H 7600 900 50  0001 C CNN
F 1 "VCC" V 7615 1178 50  0000 L CNN
F 2 "" H 7600 1050 50  0001 C CNN
F 3 "" H 7600 1050 50  0001 C CNN
	1    7600 1050
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q21
U 1 1 5F728F5A
P 2100 5800
F 0 "Q21" H 2304 5846 50  0000 L CNN
F 1 "2N7002" H 2304 5755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 5725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 5800 50  0001 L CNN
	1    2100 5800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q17
U 1 1 5F72A60D
P 2100 5400
F 0 "Q17" H 2304 5446 50  0000 L CNN
F 1 "2N7002" H 2304 5355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 5325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 5400 50  0001 L CNN
	1    2100 5400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q16
U 1 1 5F72DB7A
P 2100 5000
F 0 "Q16" H 2304 5046 50  0000 L CNN
F 1 "2N7002" H 2304 4955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 4925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 5000 50  0001 L CNN
	1    2100 5000
	1    0    0    -1  
$EndComp
Text GLabel 1900 2600 0    50   Input ~ 0
A1
Text GLabel 1900 3000 0    50   Input ~ 0
A2
Text GLabel 1900 3400 0    50   Input ~ 0
A3
$Comp
L Transistor_FET:2N7002 Q14
U 1 1 5F737B7F
P 2100 4600
F 0 "Q14" H 2304 4646 50  0000 L CNN
F 1 "2N7002" H 2304 4555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 4525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 4600 50  0001 L CNN
	1    2100 4600
	1    0    0    -1  
$EndComp
Text GLabel 1900 3800 0    50   Input ~ 0
A4
$Comp
L Transistor_FET:2N7002 Q13
U 1 1 5F73B621
P 2100 4200
F 0 "Q13" H 2304 4246 50  0000 L CNN
F 1 "2N7002" H 2304 4155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 4125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 4200 50  0001 L CNN
	1    2100 4200
	1    0    0    -1  
$EndComp
Text GLabel 1900 4200 0    50   Input ~ 0
A5
$Comp
L Transistor_FET:2N7002 Q9
U 1 1 5F73F35A
P 2100 3800
F 0 "Q9" H 2304 3846 50  0000 L CNN
F 1 "2N7002" H 2304 3755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 3725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 3800 50  0001 L CNN
	1    2100 3800
	1    0    0    -1  
$EndComp
Text GLabel 1900 4600 0    50   Input ~ 0
A6
$Comp
L Transistor_FET:2N7002 Q8
U 1 1 5F74251C
P 2100 3400
F 0 "Q8" H 2304 3446 50  0000 L CNN
F 1 "2N7002" H 2304 3355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 3325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 3400 50  0001 L CNN
	1    2100 3400
	1    0    0    -1  
$EndComp
Text GLabel 1900 5000 0    50   Input ~ 0
A7
$Comp
L Transistor_FET:2N7002 Q5
U 1 1 5F7463A3
P 2100 3000
F 0 "Q5" H 2304 3046 50  0000 L CNN
F 1 "2N7002" H 2304 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 3000 50  0001 L CNN
	1    2100 3000
	1    0    0    -1  
$EndComp
Text GLabel 1900 5400 0    50   Input ~ 0
A8
$Comp
L Transistor_FET:2N7002 Q4
U 1 1 5F7654B7
P 2100 2600
F 0 "Q4" H 2304 2646 50  0000 L CNN
F 1 "2N7002" H 2304 2555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 2525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 2600 50  0001 L CNN
	1    2100 2600
	1    0    0    -1  
$EndComp
Text GLabel 1900 5800 0    50   Input ~ 0
A9
$Comp
L Transistor_FET:2N7002 Q3
U 1 1 5F767BBC
P 2100 2200
F 0 "Q3" H 2304 2246 50  0000 L CNN
F 1 "2N7002" H 2304 2155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 2125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 2200 50  0001 L CNN
	1    2100 2200
	1    0    0    -1  
$EndComp
Text GLabel 1900 6200 0    50   Input ~ 0
A10
Text GLabel 1900 2200 0    50   Input ~ 0
A0
$Comp
L power:GND #PWR026
U 1 1 5F725D6B
P 2200 7150
F 0 "#PWR026" H 2200 6900 50  0001 C CNN
F 1 "GND" H 2205 6977 50  0000 C CNN
F 2 "" H 2200 7150 50  0001 C CNN
F 3 "" H 2200 7150 50  0001 C CNN
	1    2200 7150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q22
U 1 1 5F7252A4
P 2100 6200
F 0 "Q22" H 2304 6246 50  0000 L CNN
F 1 "2N7002" H 2304 6155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 6125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 6200 50  0001 L CNN
	1    2100 6200
	1    0    0    -1  
$EndComp
Text GLabel 1900 6950 0    50   Input ~ 0
A11
$Comp
L Transistor_FET:2N7002 Q23
U 1 1 5F7702C3
P 2100 6950
F 0 "Q23" H 2304 6996 50  0000 L CNN
F 1 "2N7002" H 2304 6905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 6875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2100 6950 50  0001 L CNN
	1    2100 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5F78138E
P 2900 6000
F 0 "R7" H 2970 6046 50  0000 L CNN
F 1 "10k" H 2970 5955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2830 6000 50  0001 C CNN
F 3 "~" H 2900 6000 50  0001 C CNN
	1    2900 6000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR025
U 1 1 5F781729
P 2900 5850
F 0 "#PWR025" H 2900 5700 50  0001 C CNN
F 1 "VCC" H 2915 6023 50  0000 C CNN
F 2 "" H 2900 5850 50  0001 C CNN
F 3 "" H 2900 5850 50  0001 C CNN
	1    2900 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6400 2200 6600
Wire Wire Line
	2200 6600 2900 6600
Connection ~ 2200 6600
Wire Wire Line
	2200 6600 2200 6750
$Comp
L Transistor_FET:2N7002 Q19
U 1 1 5F783B25
P 6100 5500
F 0 "Q19" H 6304 5546 50  0000 L CNN
F 1 "2N7002" H 6304 5455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6300 5425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6100 5500 50  0001 L CNN
	1    6100 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5F786A98
P 6200 5700
F 0 "#PWR023" H 6200 5450 50  0001 C CNN
F 1 "GND" H 6205 5527 50  0000 C CNN
F 2 "" H 6200 5700 50  0001 C CNN
F 3 "" H 6200 5700 50  0001 C CNN
	1    6200 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6150 2900 6600
Connection ~ 2900 6600
Wire Wire Line
	2900 6600 3300 6600
$Comp
L Device:R R6
U 1 1 5F7B7FA2
P 6200 4950
F 0 "R6" H 6270 4996 50  0000 L CNN
F 1 "10k" H 6270 4905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6130 4950 50  0001 C CNN
F 3 "~" H 6200 4950 50  0001 C CNN
	1    6200 4950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR021
U 1 1 5F7B7FA8
P 6200 4800
F 0 "#PWR021" H 6200 4650 50  0001 C CNN
F 1 "VCC" H 6215 4973 50  0000 C CNN
F 2 "" H 6200 4800 50  0001 C CNN
F 3 "" H 6200 4800 50  0001 C CNN
	1    6200 4800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q20
U 1 1 5F7B8426
P 7050 5500
F 0 "Q20" H 7254 5546 50  0000 L CNN
F 1 "2N7002" H 7254 5455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7250 5425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7050 5500 50  0001 L CNN
	1    7050 5500
	1    0    0    -1  
$EndComp
Text GLabel 6850 5500 0    50   Input ~ 0
~RDM
Wire Wire Line
	6200 5100 6200 5200
$Comp
L power:GND #PWR024
U 1 1 5F7CC048
P 7150 5700
F 0 "#PWR024" H 7150 5450 50  0001 C CNN
F 1 "GND" H 7155 5527 50  0000 C CNN
F 2 "" H 7150 5700 50  0001 C CNN
F 3 "" H 7150 5700 50  0001 C CNN
	1    7150 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5200 6550 5200
Wire Wire Line
	6200 5200 6200 5300
Wire Wire Line
	7150 5200 7150 5300
Text GLabel 3300 6600 2    50   Input ~ 0
~A11
Text GLabel 5900 5500 0    50   Input ~ 0
~A11
Connection ~ 6200 5200
Text GLabel 6750 5000 2    50   Input ~ 0
RD_DISK
Wire Wire Line
	6750 5000 6550 5000
Wire Wire Line
	6550 5000 6550 5200
Connection ~ 6550 5200
Wire Wire Line
	6550 5200 6200 5200
$Comp
L Transistor_FET:2N7002 Q11
U 1 1 5F7DBAEC
P 6100 4050
F 0 "Q11" H 6304 4096 50  0000 L CNN
F 1 "2N7002" H 6304 4005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6300 3975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6100 4050 50  0001 L CNN
	1    6100 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5F7DBAF2
P 6200 4250
F 0 "#PWR018" H 6200 4000 50  0001 C CNN
F 1 "GND" H 6205 4077 50  0000 C CNN
F 2 "" H 6200 4250 50  0001 C CNN
F 3 "" H 6200 4250 50  0001 C CNN
	1    6200 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5F7DBAF8
P 6200 3500
F 0 "R4" H 6270 3546 50  0000 L CNN
F 1 "10k" H 6270 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6130 3500 50  0001 C CNN
F 3 "~" H 6200 3500 50  0001 C CNN
	1    6200 3500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR013
U 1 1 5F7DBAFE
P 6200 3350
F 0 "#PWR013" H 6200 3200 50  0001 C CNN
F 1 "VCC" H 6215 3523 50  0000 C CNN
F 2 "" H 6200 3350 50  0001 C CNN
F 3 "" H 6200 3350 50  0001 C CNN
	1    6200 3350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q12
U 1 1 5F7DBB04
P 7050 4050
F 0 "Q12" H 7254 4096 50  0000 L CNN
F 1 "2N7002" H 7254 4005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7250 3975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7050 4050 50  0001 L CNN
	1    7050 4050
	1    0    0    -1  
$EndComp
Text GLabel 6850 4050 0    50   Input ~ 0
~WRM
Wire Wire Line
	6200 3650 6200 3750
$Comp
L power:GND #PWR019
U 1 1 5F7DBB0C
P 7150 4250
F 0 "#PWR019" H 7150 4000 50  0001 C CNN
F 1 "GND" H 7155 4077 50  0000 C CNN
F 2 "" H 7150 4250 50  0001 C CNN
F 3 "" H 7150 4250 50  0001 C CNN
	1    7150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3750 6550 3750
Wire Wire Line
	6200 3750 6200 3850
Wire Wire Line
	7150 3750 7150 3850
Text GLabel 5900 4050 0    50   Input ~ 0
~A11
Connection ~ 6200 3750
Text GLabel 6750 3550 2    50   Input ~ 0
WR_DISK
Wire Wire Line
	6750 3550 6550 3550
Wire Wire Line
	6550 3550 6550 3750
Connection ~ 6550 3750
Wire Wire Line
	6550 3750 6200 3750
$Comp
L Device:R R2
U 1 1 5F7DCEED
P 2200 1400
F 0 "R2" H 2270 1446 50  0000 L CNN
F 1 "10k" H 2270 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2130 1400 50  0001 C CNN
F 3 "~" H 2200 1400 50  0001 C CNN
	1    2200 1400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 5F7DCEF3
P 2200 1250
F 0 "#PWR05" H 2200 1100 50  0001 C CNN
F 1 "VCC" H 2215 1423 50  0000 C CNN
F 2 "" H 2200 1250 50  0001 C CNN
F 3 "" H 2200 1250 50  0001 C CNN
	1    2200 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1550 2200 1800
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 5F7ED0E0
P 3750 1800
F 0 "Q1" H 3954 1846 50  0000 L CNN
F 1 "2N7002" H 3954 1755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3950 1725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3750 1800 50  0001 L CNN
	1    3750 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F7ED0E6
P 3850 2000
F 0 "#PWR06" H 3850 1750 50  0001 C CNN
F 1 "GND" H 3855 1827 50  0000 C CNN
F 2 "" H 3850 2000 50  0001 C CNN
F 3 "" H 3850 2000 50  0001 C CNN
	1    3850 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F7ED0EC
P 3850 1250
F 0 "R1" H 3920 1296 50  0000 L CNN
F 1 "10k" H 3920 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3780 1250 50  0001 C CNN
F 3 "~" H 3850 1250 50  0001 C CNN
	1    3850 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 5F7ED0F2
P 3850 1100
F 0 "#PWR03" H 3850 950 50  0001 C CNN
F 1 "VCC" H 3865 1273 50  0000 C CNN
F 2 "" H 3850 1100 50  0001 C CNN
F 3 "" H 3850 1100 50  0001 C CNN
	1    3850 1100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 5F7ED0F8
P 4700 1800
F 0 "Q2" H 4904 1846 50  0000 L CNN
F 1 "2N7002" H 4904 1755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4900 1725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4700 1800 50  0001 L CNN
	1    4700 1800
	1    0    0    -1  
$EndComp
Text GLabel 4500 1800 0    50   Input ~ 0
~WRM
Wire Wire Line
	3850 1400 3850 1500
$Comp
L power:GND #PWR07
U 1 1 5F7ED100
P 4800 2000
F 0 "#PWR07" H 4800 1750 50  0001 C CNN
F 1 "GND" H 4805 1827 50  0000 C CNN
F 2 "" H 4800 2000 50  0001 C CNN
F 3 "" H 4800 2000 50  0001 C CNN
	1    4800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1500 4200 1500
Wire Wire Line
	3850 1500 3850 1600
Wire Wire Line
	4800 1500 4800 1600
Connection ~ 3850 1500
Text GLabel 4400 1300 2    50   Input ~ 0
WR_TERM
Wire Wire Line
	4400 1300 4200 1300
Wire Wire Line
	4200 1300 4200 1500
Connection ~ 4200 1500
Wire Wire Line
	4200 1500 3850 1500
$Comp
L Transistor_FET:2N7002 Q6
U 1 1 5F7F6370
P 3750 3200
F 0 "Q6" H 3954 3246 50  0000 L CNN
F 1 "2N7002" H 3954 3155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3950 3125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3750 3200 50  0001 L CNN
	1    3750 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5F7F6376
P 3850 3400
F 0 "#PWR014" H 3850 3150 50  0001 C CNN
F 1 "GND" H 3855 3227 50  0000 C CNN
F 2 "" H 3850 3400 50  0001 C CNN
F 3 "" H 3850 3400 50  0001 C CNN
	1    3850 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5F7F637C
P 3850 2650
F 0 "R3" H 3920 2696 50  0000 L CNN
F 1 "10k" H 3920 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3780 2650 50  0001 C CNN
F 3 "~" H 3850 2650 50  0001 C CNN
	1    3850 2650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR08
U 1 1 5F7F6382
P 3850 2500
F 0 "#PWR08" H 3850 2350 50  0001 C CNN
F 1 "VCC" H 3865 2673 50  0000 C CNN
F 2 "" H 3850 2500 50  0001 C CNN
F 3 "" H 3850 2500 50  0001 C CNN
	1    3850 2500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q7
U 1 1 5F7F6388
P 4700 3200
F 0 "Q7" H 4904 3246 50  0000 L CNN
F 1 "2N7002" H 4904 3155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4900 3125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4700 3200 50  0001 L CNN
	1    4700 3200
	1    0    0    -1  
$EndComp
Text GLabel 4500 3200 0    50   Input ~ 0
~RDM
Wire Wire Line
	3850 2800 3850 2900
$Comp
L power:GND #PWR015
U 1 1 5F7F6390
P 4800 3400
F 0 "#PWR015" H 4800 3150 50  0001 C CNN
F 1 "GND" H 4805 3227 50  0000 C CNN
F 2 "" H 4800 3400 50  0001 C CNN
F 3 "" H 4800 3400 50  0001 C CNN
	1    4800 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2900 4200 2900
Wire Wire Line
	3850 2900 3850 3000
Wire Wire Line
	4800 2900 4800 3000
Connection ~ 3850 2900
Text GLabel 4400 2700 2    50   Input ~ 0
RD_TERM
Wire Wire Line
	4400 2700 4200 2700
Wire Wire Line
	4200 2700 4200 2900
Connection ~ 4200 2900
Wire Wire Line
	4200 2900 3850 2900
Wire Wire Line
	3550 3200 3250 3200
Wire Wire Line
	3250 3200 3250 1800
Wire Wire Line
	3250 1800 3550 1800
Wire Wire Line
	3250 1800 2200 1800
Connection ~ 3250 1800
Connection ~ 2200 1800
Wire Wire Line
	2200 1800 2200 2000
Text GLabel 7100 2450 0    50   Input ~ 0
~RDM
Text GLabel 6800 2350 0    50   Input ~ 0
~WRM
Text GLabel 7100 2250 0    50   Input ~ 0
A0
Text GLabel 7100 2150 0    50   Input ~ 0
A1
Text GLabel 7100 2050 0    50   Input ~ 0
A2
Text GLabel 7100 1950 0    50   Input ~ 0
A3
Text GLabel 7100 1850 0    50   Input ~ 0
A4
Text GLabel 7100 1750 0    50   Input ~ 0
A5
Text GLabel 7100 1650 0    50   Input ~ 0
A6
Text GLabel 7100 1550 0    50   Input ~ 0
A7
Text GLabel 7100 1450 0    50   Input ~ 0
A8
Text GLabel 7100 1350 0    50   Input ~ 0
A9
Text GLabel 7100 1250 0    50   Input ~ 0
A10
Text GLabel 7100 1150 0    50   Input ~ 0
A11
Text GLabel 7600 2250 2    50   Input ~ 0
D0
NoConn ~ 7600 2450
NoConn ~ 7600 2350
Text GLabel 7600 2150 2    50   Input ~ 0
D1
Text GLabel 7600 2050 2    50   Input ~ 0
D2
Text GLabel 7600 1950 2    50   Input ~ 0
D3
Text GLabel 7600 1850 2    50   Input ~ 0
D4
Text GLabel 7600 1750 2    50   Input ~ 0
D5
Text GLabel 7600 1650 2    50   Input ~ 0
D6
Text GLabel 7600 1550 2    50   Input ~ 0
D7
Text GLabel 7600 1450 2    50   Input ~ 0
D8
Text GLabel 7600 1350 2    50   Input ~ 0
D9
Text GLabel 7600 1250 2    50   Input ~ 0
D10
Text GLabel 7600 1150 2    50   Input ~ 0
D11
$Comp
L power:GND #PWR012
U 1 1 5F6A22AF
P 9450 2600
F 0 "#PWR012" H 9450 2350 50  0001 C CNN
F 1 "GND" H 9455 2427 50  0000 C CNN
F 2 "" H 9450 2600 50  0001 C CNN
F 3 "" H 9450 2600 50  0001 C CNN
	1    9450 2600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR04
U 1 1 5F6A22BB
P 8950 1200
F 0 "#PWR04" H 8950 1050 50  0001 C CNN
F 1 "VCC" V 8965 1328 50  0000 L CNN
F 2 "" H 8950 1200 50  0001 C CNN
F 3 "" H 8950 1200 50  0001 C CNN
	1    8950 1200
	0    -1   -1   0   
$EndComp
Text GLabel 8950 2500 0    50   Input ~ 0
RD_DISK
Text GLabel 8950 2400 0    50   Input ~ 0
WR_DISK
Text GLabel 8950 2300 0    50   Input ~ 0
A0
Text GLabel 8950 2200 0    50   Input ~ 0
A1
Text GLabel 8950 2100 0    50   Input ~ 0
A2
Text GLabel 8950 2000 0    50   Input ~ 0
A3
Text GLabel 8950 1900 0    50   Input ~ 0
A4
Text GLabel 8950 1800 0    50   Input ~ 0
A5
Text GLabel 8950 1700 0    50   Input ~ 0
A6
Text GLabel 8950 1600 0    50   Input ~ 0
A7
Text GLabel 8950 1500 0    50   Input ~ 0
A8
Text GLabel 8950 1400 0    50   Input ~ 0
A9
Text GLabel 8950 1300 0    50   Input ~ 0
A10
Text GLabel 9450 2300 2    50   Input ~ 0
D0
Text GLabel 9450 2200 2    50   Input ~ 0
D1
Text GLabel 9450 2100 2    50   Input ~ 0
D2
Text GLabel 9450 2000 2    50   Input ~ 0
D3
Text GLabel 9450 1900 2    50   Input ~ 0
D4
Text GLabel 9450 1800 2    50   Input ~ 0
D5
Text GLabel 9450 1700 2    50   Input ~ 0
D6
Text GLabel 9450 1600 2    50   Input ~ 0
D7
Text GLabel 9450 1500 2    50   Input ~ 0
D8
Text GLabel 9450 1400 2    50   Input ~ 0
D9
Text GLabel 9450 1300 2    50   Input ~ 0
D10
Text GLabel 9450 1200 2    50   Input ~ 0
D11
$Comp
L Connector_Generic:Conn_02x15_Odd_Even J2
U 1 1 5F6ADE41
P 9150 1900
F 0 "J2" H 9200 2817 50  0000 C CNN
F 1 "Disk" H 9200 2726 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x15_P2.54mm_Horizontal" H 9150 1900 50  0001 C CNN
F 3 "~" H 9150 1900 50  0001 C CNN
	1    9150 1900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q10
U 1 1 5F6C330F
P 5200 4050
F 0 "Q10" H 5404 4096 50  0000 L CNN
F 1 "2N7002" H 5404 4005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5400 3975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5200 4050 50  0001 L CNN
	1    5200 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5F6C672F
P 5300 4250
F 0 "#PWR017" H 5300 4000 50  0001 C CNN
F 1 "GND" H 5305 4077 50  0000 C CNN
F 2 "" H 5300 4250 50  0001 C CNN
F 3 "" H 5300 4250 50  0001 C CNN
	1    5300 4250
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q18
U 1 1 5F6CDB58
P 5150 5500
F 0 "Q18" H 5354 5546 50  0000 L CNN
F 1 "2N7002" H 5354 5455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5350 5425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5150 5500 50  0001 L CNN
	1    5150 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5F6CDB5E
P 5250 5700
F 0 "#PWR022" H 5250 5450 50  0001 C CNN
F 1 "GND" H 5255 5527 50  0000 C CNN
F 2 "" H 5250 5700 50  0001 C CNN
F 3 "" H 5250 5700 50  0001 C CNN
	1    5250 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5200 5250 5300
Text GLabel 9450 2400 2    50   Input ~ 0
WR_TERM
Text GLabel 9450 2500 2    50   Input ~ 0
RD_TERM
$Comp
L power:GND #PWR011
U 1 1 5F6B4409
P 8950 2600
F 0 "#PWR011" H 8950 2350 50  0001 C CNN
F 1 "GND" H 8955 2427 50  0000 C CNN
F 2 "" H 8950 2600 50  0001 C CNN
F 3 "" H 8950 2600 50  0001 C CNN
	1    8950 2600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q15
U 1 1 5F6C1BAE
P 3750 4600
F 0 "Q15" H 3954 4646 50  0000 L CNN
F 1 "2N7002" H 3954 4555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3950 4525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3750 4600 50  0001 L CNN
	1    3750 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5F6C6885
P 3850 4800
F 0 "#PWR020" H 3850 4550 50  0001 C CNN
F 1 "GND" H 3855 4627 50  0000 C CNN
F 2 "" H 3850 4800 50  0001 C CNN
F 3 "" H 3850 4800 50  0001 C CNN
	1    3850 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5F712C47
P 3850 4000
F 0 "R5" H 3920 4046 50  0000 L CNN
F 1 "10k" H 3920 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3780 4000 50  0001 C CNN
F 3 "~" H 3850 4000 50  0001 C CNN
	1    3850 4000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR016
U 1 1 5F712C4D
P 3850 3850
F 0 "#PWR016" H 3850 3700 50  0001 C CNN
F 1 "VCC" H 3865 4023 50  0000 C CNN
F 2 "" H 3850 3850 50  0001 C CNN
F 3 "" H 3850 3850 50  0001 C CNN
	1    3850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4150 3850 4250
Wire Wire Line
	5300 3750 6200 3750
Wire Wire Line
	5300 3750 5300 3850
Wire Wire Line
	5250 5200 6200 5200
Wire Wire Line
	3850 4250 4550 4250
Wire Wire Line
	4550 4250 4550 4050
Wire Wire Line
	4550 4050 5000 4050
Connection ~ 3850 4250
Wire Wire Line
	3850 4250 3850 4400
Wire Wire Line
	4550 4250 4550 5500
Wire Wire Line
	4550 5500 4950 5500
Connection ~ 4550 4250
Wire Wire Line
	3550 4600 3250 4600
Wire Wire Line
	3250 4600 3250 3200
Connection ~ 3250 3200
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J1
U 1 1 5F72061C
P 7400 1750
F 0 "J1" H 7450 2667 50  0000 C CNN
F 1 "Main" H 7450 2576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x16_P2.54mm_Horizontal" H 7400 1750 50  0001 C CNN
F 3 "~" H 7400 1750 50  0001 C CNN
	1    7400 1750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6800 2350 7100 2350
$EndSCHEMATC
