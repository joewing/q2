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
L power:GND #PWR0101
U 1 1 5F6910DD
P 4900 5950
F 0 "#PWR0101" H 4900 5700 50  0001 C CNN
F 1 "GND" H 4905 5777 50  0000 C CNN
F 2 "" H 4900 5950 50  0001 C CNN
F 3 "" H 4900 5950 50  0001 C CNN
	1    4900 5950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5F69155A
P 4900 4550
F 0 "#PWR0102" H 4900 4400 50  0001 C CNN
F 1 "VCC" V 4915 4677 50  0000 L CNN
F 2 "" H 4900 4550 50  0001 C CNN
F 3 "" H 4900 4550 50  0001 C CNN
	1    4900 4550
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 5F69964F
P 9750 3500
F 0 "SW3" H 9750 3785 50  0000 C CNN
F 1 "3" H 9750 3694 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 9750 3700 50  0001 C CNN
F 3 "~" H 9750 3700 50  0001 C CNN
	1    9750 3500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW7
U 1 1 5F69C9D2
P 9750 4000
F 0 "SW7" H 9750 4285 50  0000 C CNN
F 1 "6" H 9750 4194 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 9750 4200 50  0001 C CNN
F 3 "~" H 9750 4200 50  0001 C CNN
	1    9750 4000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW8
U 1 1 5F69C9D8
P 9750 4900
F 0 "SW8" H 9750 5185 50  0000 C CNN
F 1 "B" H 9750 5094 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 9750 5100 50  0001 C CNN
F 3 "~" H 9750 5100 50  0001 C CNN
	1    9750 4900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW11
U 1 1 5F69E7EA
P 9750 4450
F 0 "SW11" H 9750 4735 50  0000 C CNN
F 1 "9" H 9750 4644 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 9750 4650 50  0001 C CNN
F 3 "~" H 9750 4650 50  0001 C CNN
	1    9750 4450
	1    0    0    -1  
$EndComp
$Comp
L Display_Character:WC1602A DS1
U 1 1 5F695676
P 9750 1900
F 0 "DS1" H 9900 2800 50  0000 C CNN
F 1 "WC1602A" H 10000 2700 50  0000 C CNN
F 2 "Display:WC1602A" H 9750 1000 50  0001 C CIN
F 3 "http://www.wincomlcd.com/pdf/WC1602A-SFYLYHTC06.pdf" H 10450 1900 50  0001 C CNN
	1    9750 1900
	1    0    0    -1  
$EndComp
Text GLabel 9350 1800 0    50   Input ~ 0
D0
Text GLabel 9350 1300 0    50   Input ~ 0
WR_TERM
$Comp
L power:GND #PWR0103
U 1 1 5F697631
P 9750 2700
F 0 "#PWR0103" H 9750 2450 50  0001 C CNN
F 1 "GND" H 9755 2527 50  0000 C CNN
F 2 "" H 9750 2700 50  0001 C CNN
F 3 "" H 9750 2700 50  0001 C CNN
	1    9750 2700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5F697AB0
P 9750 1100
F 0 "#PWR0104" H 9750 950 50  0001 C CNN
F 1 "VCC" V 9765 1227 50  0000 L CNN
F 2 "" H 9750 1100 50  0001 C CNN
F 3 "" H 9750 1100 50  0001 C CNN
	1    9750 1100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 5F6983D9
P 10150 1600
F 0 "#PWR0105" H 10150 1450 50  0001 C CNN
F 1 "VCC" V 10165 1727 50  0000 L CNN
F 2 "" H 10150 1600 50  0001 C CNN
F 3 "" H 10150 1600 50  0001 C CNN
	1    10150 1600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5F69893C
P 10150 1700
F 0 "#PWR0106" H 10150 1450 50  0001 C CNN
F 1 "GND" H 10155 1527 50  0000 C CNN
F 2 "" H 10150 1700 50  0001 C CNN
F 3 "" H 10150 1700 50  0001 C CNN
	1    10150 1700
	0    -1   -1   0   
$EndComp
Text GLabel 9350 1900 0    50   Input ~ 0
D1
Text GLabel 9350 2000 0    50   Input ~ 0
D2
Text GLabel 9350 2100 0    50   Input ~ 0
D3
Text GLabel 9350 2200 0    50   Input ~ 0
D4
Text GLabel 9350 2300 0    50   Input ~ 0
D5
Text GLabel 9350 2400 0    50   Input ~ 0
D6
Text GLabel 9350 2500 0    50   Input ~ 0
D7
Text GLabel 8350 1800 0    50   Input ~ 0
D8
$Comp
L power:GND #PWR0107
U 1 1 5F699E8A
P 9350 1400
F 0 "#PWR0107" H 9350 1150 50  0001 C CNN
F 1 "GND" H 9355 1227 50  0000 C CNN
F 2 "" H 9350 1400 50  0001 C CNN
F 3 "" H 9350 1400 50  0001 C CNN
	1    9350 1400
	0    1    1    0   
$EndComp
Text GLabel 7900 5500 0    50   Input ~ 0
RD_TERM
$Comp
L power:GND #PWR0108
U 1 1 5F69CFEB
P 8200 5700
F 0 "#PWR0108" H 8200 5450 50  0001 C CNN
F 1 "GND" H 8205 5527 50  0000 C CNN
F 2 "" H 8200 5700 50  0001 C CNN
F 3 "" H 8200 5700 50  0001 C CNN
	1    8200 5700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 5F6AB237
P 8550 1800
F 0 "Q1" H 8754 1846 50  0000 L CNN
F 1 "2N7002" H 8754 1755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8750 1725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8550 1800 50  0001 L CNN
	1    8550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5F6AB23E
P 8650 2000
F 0 "#PWR0109" H 8650 1750 50  0001 C CNN
F 1 "GND" H 8655 1827 50  0000 C CNN
F 2 "" H 8650 2000 50  0001 C CNN
F 3 "" H 8650 2000 50  0001 C CNN
	1    8650 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F6AB70A
P 8650 1250
F 0 "R1" H 8720 1296 50  0000 L CNN
F 1 "10k" H 8720 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8580 1250 50  0001 C CNN
F 3 "~" H 8650 1250 50  0001 C CNN
	1    8650 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0110
U 1 1 5F6AC70D
P 8650 1100
F 0 "#PWR0110" H 8650 950 50  0001 C CNN
F 1 "VCC" V 8665 1227 50  0000 L CNN
F 2 "" H 8650 1100 50  0001 C CNN
F 3 "" H 8650 1100 50  0001 C CNN
	1    8650 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1400 8650 1500
Wire Wire Line
	9350 1500 8650 1500
Connection ~ 8650 1500
Wire Wire Line
	8650 1500 8650 1600
$Comp
L Device:D D3
U 1 1 5F6B97FE
P 10100 3500
F 0 "D3" H 10100 3717 50  0000 C CNN
F 1 "1N4148" H 10100 3626 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 10100 3500 50  0001 C CNN
F 3 "~" H 10100 3500 50  0001 C CNN
	1    10100 3500
	1    0    0    -1  
$EndComp
Text GLabel 10250 3500 2    50   Input ~ 0
D3
$Comp
L Device:D D6
U 1 1 5F6CD5EC
P 10100 4000
F 0 "D6" H 10100 4217 50  0000 C CNN
F 1 "1N4148" H 10100 4126 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 10100 4000 50  0001 C CNN
F 3 "~" H 10100 4000 50  0001 C CNN
	1    10100 4000
	1    0    0    -1  
$EndComp
Text GLabel 10250 4000 2    50   Input ~ 0
D6
$Comp
L Device:D D9
U 1 1 5F6D4392
P 10100 4450
F 0 "D9" H 10100 4667 50  0000 C CNN
F 1 "1N4148" H 10100 4576 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 10100 4450 50  0001 C CNN
F 3 "~" H 10100 4450 50  0001 C CNN
	1    10100 4450
	1    0    0    -1  
$EndComp
Text GLabel 10250 4450 2    50   Input ~ 0
D9
$Comp
L Device:D D12
U 1 1 5F6D9A58
P 10100 4900
F 0 "D12" H 10100 5117 50  0000 C CNN
F 1 "1N4148" H 10100 5026 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 10100 4900 50  0001 C CNN
F 3 "~" H 10100 4900 50  0001 C CNN
	1    10100 4900
	1    0    0    -1  
$EndComp
Text GLabel 10250 4900 2    50   Input ~ 0
D11
$Comp
L Device:CP C1
U 1 1 5F6E94A2
P 6200 6600
F 0 "C1" H 6318 6646 50  0000 L CNN
F 1 "0.47u" H 6318 6555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6238 6450 50  0001 C CNN
F 3 "~" H 6200 6600 50  0001 C CNN
	1    6200 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F6E9CD8
P 6200 6750
F 0 "#PWR0111" H 6200 6500 50  0001 C CNN
F 1 "GND" H 6205 6577 50  0000 C CNN
F 2 "" H 6200 6750 50  0001 C CNN
F 3 "" H 6200 6750 50  0001 C CNN
	1    6200 6750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0112
U 1 1 5F6EA075
P 6200 6450
F 0 "#PWR0112" H 6200 6300 50  0001 C CNN
F 1 "VCC" V 6215 6577 50  0000 L CNN
F 2 "" H 6200 6450 50  0001 C CNN
F 3 "" H 6200 6450 50  0001 C CNN
	1    6200 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5F6EB0F8
P 10700 1300
F 0 "RV1" H 10630 1254 50  0000 R CNN
F 1 "10k" H 10630 1345 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3386F_Vertical" H 10700 1300 50  0001 C CNN
F 3 "~" H 10700 1300 50  0001 C CNN
	1    10700 1300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5F6EBB05
P 10700 1450
F 0 "#PWR0113" H 10700 1200 50  0001 C CNN
F 1 "GND" H 10705 1277 50  0000 C CNN
F 2 "" H 10700 1450 50  0001 C CNN
F 3 "" H 10700 1450 50  0001 C CNN
	1    10700 1450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0114
U 1 1 5F6EBE3C
P 10700 1150
F 0 "#PWR0114" H 10700 1000 50  0001 C CNN
F 1 "VCC" V 10715 1277 50  0000 L CNN
F 2 "" H 10700 1150 50  0001 C CNN
F 3 "" H 10700 1150 50  0001 C CNN
	1    10700 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1300 10550 1300
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 5F6FE2CD
P 7400 1950
F 0 "Q2" H 7604 1996 50  0000 L CNN
F 1 "2N7002" H 7604 1905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7600 1875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7400 1950 50  0001 L CNN
	1    7400 1950
	1    0    0    -1  
$EndComp
Text GLabel 7200 1950 0    50   Input ~ 0
RD_TERM
$Comp
L power:GND #PWR0115
U 1 1 5F6FE2D4
P 7500 2150
F 0 "#PWR0115" H 7500 1900 50  0001 C CNN
F 1 "GND" H 7505 1977 50  0000 C CNN
F 2 "" H 7500 2150 50  0001 C CNN
F 3 "" H 7500 2150 50  0001 C CNN
	1    7500 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F6FF1C1
P 7500 1300
F 0 "R2" H 7570 1346 50  0000 L CNN
F 1 "10k" H 7570 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7430 1300 50  0001 C CNN
F 3 "~" H 7500 1300 50  0001 C CNN
	1    7500 1300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0116
U 1 1 5F6FF1C7
P 7500 1150
F 0 "#PWR0116" H 7500 1000 50  0001 C CNN
F 1 "VCC" V 7515 1277 50  0000 L CNN
F 2 "" H 7500 1150 50  0001 C CNN
F 3 "" H 7500 1150 50  0001 C CNN
	1    7500 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D13
U 1 1 5F6FFC1F
P 7500 1600
F 0 "D13" V 7539 1482 50  0000 R CNN
F 1 "RD" V 7448 1482 50  0000 R CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7500 1600 50  0001 C CNN
F 3 "~" H 7500 1600 50  0001 C CNN
	1    7500 1600
	0    -1   -1   0   
$EndComp
Connection ~ 9350 4900
Wire Wire Line
	9350 5100 9350 4900
Wire Wire Line
	8200 5100 9350 5100
Connection ~ 8200 4900
Connection ~ 8200 5100
Wire Wire Line
	8200 5100 8200 4900
Connection ~ 7000 4900
Wire Wire Line
	8200 5100 8200 5300
Wire Wire Line
	7000 5100 8200 5100
Wire Wire Line
	7000 4900 7000 5100
Connection ~ 9350 4450
Wire Wire Line
	9350 4900 9550 4900
Wire Wire Line
	9350 4450 9350 4900
Connection ~ 9350 4000
Wire Wire Line
	9350 4450 9550 4450
Wire Wire Line
	9350 4000 9350 4450
Wire Wire Line
	9350 4000 9550 4000
Wire Wire Line
	9350 3500 9350 4000
Wire Wire Line
	9550 3500 9350 3500
Connection ~ 8200 4450
Wire Wire Line
	8200 4900 8400 4900
Wire Wire Line
	8200 4450 8200 4900
Connection ~ 8200 4000
Wire Wire Line
	8200 4450 8400 4450
Wire Wire Line
	8200 4000 8200 4450
Wire Wire Line
	8200 4000 8400 4000
Wire Wire Line
	8200 3500 8200 4000
Wire Wire Line
	8400 3500 8200 3500
Connection ~ 7000 4450
Wire Wire Line
	7000 4900 7200 4900
Wire Wire Line
	7000 4450 7000 4900
Connection ~ 7000 4000
Wire Wire Line
	7000 4450 7200 4450
Wire Wire Line
	7000 4000 7000 4450
Wire Wire Line
	7000 4000 7200 4000
Wire Wire Line
	7000 3500 7000 4000
Wire Wire Line
	7200 3500 7000 3500
Text GLabel 9100 4900 2    50   Input ~ 0
D10
$Comp
L Device:D D11
U 1 1 5F6D95A6
P 8950 4900
F 0 "D11" H 8950 5117 50  0000 C CNN
F 1 "1N4148" H 8950 5026 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8950 4900 50  0001 C CNN
F 3 "~" H 8950 4900 50  0001 C CNN
	1    8950 4900
	1    0    0    -1  
$EndComp
Text GLabel 7900 4900 2    50   Input ~ 0
D0
$Comp
L Device:D D10
U 1 1 5F6D8D32
P 7750 4900
F 0 "D10" H 7750 5117 50  0000 C CNN
F 1 "1N4148" H 7750 5026 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 7750 4900 50  0001 C CNN
F 3 "~" H 7750 4900 50  0001 C CNN
	1    7750 4900
	1    0    0    -1  
$EndComp
Text GLabel 9100 4450 2    50   Input ~ 0
D8
$Comp
L Device:D D8
U 1 1 5F6D3666
P 8950 4450
F 0 "D8" H 8950 4667 50  0000 C CNN
F 1 "1N4148" H 8950 4576 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8950 4450 50  0001 C CNN
F 3 "~" H 8950 4450 50  0001 C CNN
	1    8950 4450
	1    0    0    -1  
$EndComp
Text GLabel 7900 4450 2    50   Input ~ 0
D7
$Comp
L Device:D D7
U 1 1 5F6D27CB
P 7750 4450
F 0 "D7" H 7750 4667 50  0000 C CNN
F 1 "1N4148" H 7750 4576 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 7750 4450 50  0001 C CNN
F 3 "~" H 7750 4450 50  0001 C CNN
	1    7750 4450
	1    0    0    -1  
$EndComp
Text GLabel 9100 4000 2    50   Input ~ 0
D5
$Comp
L Device:D D5
U 1 1 5F6C203A
P 8950 4000
F 0 "D5" H 8950 4217 50  0000 C CNN
F 1 "1N4148" H 8950 4126 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8950 4000 50  0001 C CNN
F 3 "~" H 8950 4000 50  0001 C CNN
	1    8950 4000
	1    0    0    -1  
$EndComp
Text GLabel 7900 4000 2    50   Input ~ 0
D4
$Comp
L Device:D D4
U 1 1 5F6C2031
P 7750 4000
F 0 "D4" H 7750 4217 50  0000 C CNN
F 1 "1N4148" H 7750 4126 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 7750 4000 50  0001 C CNN
F 3 "~" H 7750 4000 50  0001 C CNN
	1    7750 4000
	1    0    0    -1  
$EndComp
Text GLabel 9100 3500 2    50   Input ~ 0
D2
$Comp
L Device:D D2
U 1 1 5F6B91DE
P 8950 3500
F 0 "D2" H 8950 3717 50  0000 C CNN
F 1 "1N4148" H 8950 3626 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8950 3500 50  0001 C CNN
F 3 "~" H 8950 3500 50  0001 C CNN
	1    8950 3500
	1    0    0    -1  
$EndComp
Text GLabel 7900 3500 2    50   Input ~ 0
D1
$Comp
L Device:D D1
U 1 1 5F6B8596
P 7750 3500
F 0 "D1" H 7750 3717 50  0000 C CNN
F 1 "1N4148" H 7750 3626 50  0000 C CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 7750 3500 50  0001 C CNN
F 3 "~" H 7750 3500 50  0001 C CNN
	1    7750 3500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q3
U 1 1 5F69B377
P 8100 5500
F 0 "Q3" H 8304 5546 50  0000 L CNN
F 1 "2N7002" H 8304 5455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8300 5425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8100 5500 50  0001 L CNN
	1    8100 5500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW13
U 1 1 5F69F79E
P 7400 4900
F 0 "SW13" H 7400 5185 50  0000 C CNN
F 1 "0" H 7400 5094 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 7400 5100 50  0001 C CNN
F 3 "~" H 7400 5100 50  0001 C CNN
	1    7400 4900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW10
U 1 1 5F69E7E4
P 8600 4450
F 0 "SW10" H 8600 4735 50  0000 C CNN
F 1 "8" H 8600 4644 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 8600 4650 50  0001 C CNN
F 3 "~" H 8600 4650 50  0001 C CNN
	1    8600 4450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW9
U 1 1 5F69E7DE
P 7400 4450
F 0 "SW9" H 7400 4735 50  0000 C CNN
F 1 "7" H 7400 4644 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 7400 4650 50  0001 C CNN
F 3 "~" H 7400 4650 50  0001 C CNN
	1    7400 4450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 5F69C9CC
P 8600 4000
F 0 "SW6" H 8600 4285 50  0000 C CNN
F 1 "5" H 8600 4194 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 8600 4200 50  0001 C CNN
F 3 "~" H 8600 4200 50  0001 C CNN
	1    8600 4000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 5F69C9C6
P 7400 4000
F 0 "SW5" H 7400 4285 50  0000 C CNN
F 1 "4" H 7400 4194 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 7400 4200 50  0001 C CNN
F 3 "~" H 7400 4200 50  0001 C CNN
	1    7400 4000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 5F699D66
P 8600 4900
F 0 "SW4" H 8600 5185 50  0000 C CNN
F 1 "A" H 8600 5094 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 8600 5100 50  0001 C CNN
F 3 "~" H 8600 5100 50  0001 C CNN
	1    8600 4900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5F698EE7
P 8600 3500
F 0 "SW2" H 8600 3785 50  0000 C CNN
F 1 "2" H 8600 3694 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 8600 3700 50  0001 C CNN
F 3 "~" H 8600 3700 50  0001 C CNN
	1    8600 3500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5F69731B
P 7400 3500
F 0 "SW1" H 7400 3785 50  0000 C CNN
F 1 "1" H 7400 3694 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 7400 3700 50  0001 C CNN
F 3 "~" H 7400 3700 50  0001 C CNN
	1    7400 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x15_Odd_Even J?
U 1 1 5F9C1D82
P 5100 5250
F 0 "J?" H 5150 6167 50  0000 C CNN
F 1 "Conn_02x15_Odd_Even" H 5150 6076 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x13_P2.54mm_Vertical" H 5100 5250 50  0001 C CNN
F 3 "~" H 5100 5250 50  0001 C CNN
	1    5100 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9C526D
P 5400 5950
F 0 "#PWR?" H 5400 5700 50  0001 C CNN
F 1 "GND" H 5405 5777 50  0000 C CNN
F 2 "" H 5400 5950 50  0001 C CNN
F 3 "" H 5400 5950 50  0001 C CNN
	1    5400 5950
	1    0    0    -1  
$EndComp
Text GLabel 5400 4550 2    50   Input ~ 0
D11
Text GLabel 5400 4650 2    50   Input ~ 0
D10
Text GLabel 5400 4750 2    50   Input ~ 0
D9
Text GLabel 5400 4850 2    50   Input ~ 0
D8
Text GLabel 5400 4950 2    50   Input ~ 0
D7
Text GLabel 5400 5050 2    50   Input ~ 0
D6
Text GLabel 5400 5150 2    50   Input ~ 0
D5
Text GLabel 5400 5250 2    50   Input ~ 0
D4
Text GLabel 5400 5350 2    50   Input ~ 0
D3
Text GLabel 5400 5450 2    50   Input ~ 0
D2
Text GLabel 5400 5550 2    50   Input ~ 0
D1
Text GLabel 5400 5650 2    50   Input ~ 0
D0
Text GLabel 5400 5850 2    50   Input ~ 0
RD_TERM
Text GLabel 5400 5750 2    50   Input ~ 0
WR_TERM
Text GLabel 4900 5750 0    50   Input ~ 0
WR_DISK
Text GLabel 4900 5850 0    50   Input ~ 0
RD_DISK
Text GLabel 4900 4650 0    50   Input ~ 0
A10
Text GLabel 4900 4750 0    50   Input ~ 0
A9
Text GLabel 4900 4850 0    50   Input ~ 0
A8
Text GLabel 4900 4950 0    50   Input ~ 0
A7
Text GLabel 4900 5150 0    50   Input ~ 0
A5
Text GLabel 4900 5050 0    50   Input ~ 0
A6
Text GLabel 4900 5250 0    50   Input ~ 0
A4
Text GLabel 4900 5350 0    50   Input ~ 0
A3
$EndSCHEMATC