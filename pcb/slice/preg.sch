EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 9
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
U 1 1 5E729E77
P 7200 4550
AR Path="/5E729E77" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5E729E77" Ref="Q31"  Part="1" 
F 0 "Q31" H 7406 4596 50  0000 L CNN
F 1 "2N7002" H 7406 4505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7400 4475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7200 4550 50  0001 L CNN
F 4 "C8545" H 7200 4550 50  0001 C CNN "LCSC"
	1    7200 4550
	1    0    0    -1  
$EndComp
Text GLabel 7000 4550 0    50   Input ~ 0
SW
Text GLabel 4950 4550 0    50   Input ~ 0
~SW
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E63437C
P 6200 4550
AR Path="/5E63437C" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5E63437C" Ref="Q30"  Part="1" 
F 0 "Q30" H 6406 4596 50  0000 L CNN
F 1 "2N7002" H 6406 4505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6400 4475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6200 4550 50  0001 L CNN
F 4 "C8545" H 6200 4550 50  0001 C CNN "LCSC"
	1    6200 4550
	1    0    0    -1  
$EndComp
Text GLabel 4000 4550 0    50   Input ~ 0
~RST
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E630751
P 5150 3950
AR Path="/5E630751" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5E630751" Ref="Q25"  Part="1" 
F 0 "Q25" H 5356 3996 50  0000 L CNN
F 1 "2N7002" H 5356 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5350 3875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5150 3950 50  0001 L CNN
F 4 "C8545" H 5150 3950 50  0001 C CNN "LCSC"
	1    5150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1750 9950 1750
Wire Wire Line
	9700 1950 9700 1750
Text GLabel 9950 1750 2    50   Input ~ 0
ABUS
Text GLabel 9400 2150 0    50   Input ~ 0
~P
Text GLabel 9400 2550 0    50   Input ~ 0
RDP_ABUS
$Comp
L power:GND #PWR?
U 1 1 5F28DB85
P 9700 2750
AR Path="/5F28DB85" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5F28DB85" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 9700 2500 50  0001 C CNN
F 1 "GND" H 9705 2577 50  0000 C CNN
F 2 "" H 9700 2750 50  0001 C CNN
F 3 "" H 9700 2750 50  0001 C CNN
	1    9700 2750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F28AF00
P 9600 2150
AR Path="/5F28AF00" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F28AF00" Ref="Q22"  Part="1" 
F 0 "Q22" H 9806 2196 50  0000 L CNN
F 1 "2N7002" H 9806 2105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9800 2075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9600 2150 50  0001 L CNN
F 4 "C8545" H 9600 2150 50  0001 C CNN "LCSC"
	1    9600 2150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F288DDD
P 9600 2550
AR Path="/5F288DDD" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F288DDD" Ref="Q23"  Part="1" 
F 0 "Q23" H 9806 2596 50  0000 L CNN
F 1 "2N7002" H 9806 2505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9800 2475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9600 2550 50  0001 L CNN
F 4 "C8545" H 9600 2550 50  0001 C CNN "LCSC"
	1    9600 2550
	1    0    0    -1  
$EndComp
$Sheet
S 5300 1100 1350 1150
U 5ECD3C9D
F0 "P DFF" 50
F1 "dff.sch" 50
F2 "Q" I R 6650 1450 50 
F3 "~Q" I R 6650 1650 50 
F4 "CLK" I L 5300 1450 50 
F5 "D" I L 5300 1900 50 
F6 "SET" I R 6650 2000 50 
F7 "CLR" I R 6650 2150 50 
$EndSheet
Text GLabel 7100 1450 2    50   Input ~ 0
P
Wire Wire Line
	7100 1450 6650 1450
Text GLabel 7100 1650 2    50   Input ~ 0
~P
Wire Wire Line
	7100 1650 6650 1650
Wire Wire Line
	5050 1450 5300 1450
$Comp
L Device:R R?
U 1 1 5F7A9983
P 8300 1200
AR Path="/5F7A9983" Ref="R?"  Part="1" 
AR Path="/5EE1D251/5F7A9983" Ref="R?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7A9983" Ref="R?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7A9983" Ref="R?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7A9983" Ref="R?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7A9983" Ref="R?"  Part="1" 
AR Path="/5EF9DF90/5F7A9983" Ref="R12"  Part="1" 
F 0 "R12" H 8370 1246 50  0000 L CNN
F 1 "1k" H 8370 1155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8230 1200 50  0001 C CNN
F 3 "~" H 8300 1200 50  0001 C CNN
F 4 "C17513" H 8300 1200 50  0001 C CNN "LCSC"
	1    8300 1200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F7A9989
P 8300 1050
AR Path="/5F7A9989" Ref="#PWR?"  Part="1" 
AR Path="/5EE1D251/5F7A9989" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7A9989" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7A9989" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7A9989" Ref="#PWR?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7A9989" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5F7A9989" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 8300 900 50  0001 C CNN
F 1 "VCC" H 8317 1223 50  0000 C CNN
F 2 "" H 8300 1050 50  0001 C CNN
F 3 "" H 8300 1050 50  0001 C CNN
	1    8300 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F7A998F
P 8300 1500
AR Path="/5EF45566/5EBC02F6/5F7A998F" Ref="D?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7A998F" Ref="D?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7A998F" Ref="D?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7A998F" Ref="D?"  Part="1" 
AR Path="/5EF9DF90/5F7A998F" Ref="D2"  Part="1" 
F 0 "D2" V 8339 1383 50  0000 R CNN
F 1 "P" V 8248 1383 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 8300 1500 50  0001 C CNN
F 3 "~" H 8300 1500 50  0001 C CNN
	1    8300 1500
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F7A9995
P 8200 1850
AR Path="/5F7A9995" Ref="Q?"  Part="1" 
AR Path="/5EE1D251/5F7A9995" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7A9995" Ref="Q?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7A9995" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7A9995" Ref="Q?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7A9995" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F7A9995" Ref="Q21"  Part="1" 
F 0 "Q21" H 8406 1896 50  0000 L CNN
F 1 "2N7002" H 8406 1805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8400 1775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8200 1850 50  0001 L CNN
F 4 "C8545" H 8200 1850 50  0001 C CNN "LCSC"
	1    8200 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7A999B
P 8300 2050
AR Path="/5F7A999B" Ref="#PWR?"  Part="1" 
AR Path="/5EE1D251/5F7A999B" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7A999B" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7A999B" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7A999B" Ref="#PWR?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7A999B" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5F7A999B" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 8300 1800 50  0001 C CNN
F 1 "GND" H 8305 1877 50  0000 C CNN
F 2 "" H 8300 2050 50  0001 C CNN
F 3 "" H 8300 2050 50  0001 C CNN
	1    8300 2050
	1    0    0    -1  
$EndComp
Text GLabel 8000 1850 0    50   Input ~ 0
P
Text GLabel 7100 2000 2    50   Input ~ 0
SETP
Wire Wire Line
	7100 2000 6650 2000
Text GLabel 7100 2150 2    50   Input ~ 0
CLRP
Wire Wire Line
	7100 2150 6650 2150
Text GLabel 4950 3400 2    50   Input ~ 0
SETP
Wire Wire Line
	4650 3400 4950 3400
Wire Wire Line
	4650 3550 4650 3400
Text GLabel 6900 3450 2    50   Input ~ 0
CLRP
Wire Wire Line
	6700 3600 6700 3450
Wire Wire Line
	6700 3450 6900 3450
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2FCB05
P 4200 3950
AR Path="/5F2FCB05" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F2FCB05" Ref="Q24"  Part="1" 
F 0 "Q24" H 4406 3996 50  0000 L CNN
F 1 "2N7002" H 4406 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4400 3875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4200 3950 50  0001 L CNN
F 4 "C8545" H 4200 3950 50  0001 C CNN "LCSC"
	1    4200 3950
	1    0    0    -1  
$EndComp
Text GLabel 4000 3950 0    50   Input ~ 0
~WRP
Text GLabel 5050 1450 0    50   Input ~ 0
INCP_CLK
Text GLabel 5000 1900 0    50   Input ~ 0
~P
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F3F4742
P 7200 3950
AR Path="/5F3F4742" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F3F4742" Ref="Q27"  Part="1" 
F 0 "Q27" H 7406 3996 50  0000 L CNN
F 1 "2N7002" H 7406 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7400 3875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7200 3950 50  0001 L CNN
F 4 "C8545" H 7200 3950 50  0001 C CNN "LCSC"
	1    7200 3950
	1    0    0    -1  
$EndComp
Text GLabel 7000 3950 0    50   Input ~ 0
XOUT
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F427260
P 6200 3950
AR Path="/5F427260" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F427260" Ref="Q26"  Part="1" 
F 0 "Q26" H 6406 3996 50  0000 L CNN
F 1 "2N7002" H 6406 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6400 3875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6200 3950 50  0001 L CNN
F 4 "C8545" H 6200 3950 50  0001 C CNN "LCSC"
	1    6200 3950
	1    0    0    -1  
$EndComp
Text GLabel 4950 3950 0    50   Input ~ 0
~XOUT
Wire Wire Line
	5000 1900 5300 1900
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F486F09
P 5150 4550
AR Path="/5F486F09" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F486F09" Ref="Q29"  Part="1" 
F 0 "Q29" H 5356 4596 50  0000 L CNN
F 1 "2N7002" H 5356 4505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5350 4475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5150 4550 50  0001 L CNN
F 4 "C8545" H 5150 4550 50  0001 C CNN "LCSC"
	1    5150 4550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F4884D8
P 4200 4550
AR Path="/5F4884D8" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5F4884D8" Ref="Q28"  Part="1" 
F 0 "Q28" H 4406 4596 50  0000 L CNN
F 1 "2N7002" H 4406 4505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4400 4475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4200 4550 50  0001 L CNN
F 4 "C8545" H 4200 4550 50  0001 C CNN "LCSC"
	1    4200 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F48B0A4
P 4300 4750
AR Path="/5F48B0A4" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5F48B0A4" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 4300 4500 50  0001 C CNN
F 1 "GND" H 4305 4577 50  0000 C CNN
F 2 "" H 4300 4750 50  0001 C CNN
F 3 "" H 4300 4750 50  0001 C CNN
	1    4300 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3750 4300 3550
Wire Wire Line
	4300 3550 4650 3550
Wire Wire Line
	5250 3550 5250 3750
Connection ~ 4650 3550
Wire Wire Line
	4650 3550 5250 3550
Text GLabel 6000 4550 0    50   Input ~ 0
~RST
$Comp
L power:GND #PWR?
U 1 1 5F4A202C
P 6300 4750
AR Path="/5F4A202C" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5F4A202C" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 6300 4500 50  0001 C CNN
F 1 "GND" H 6305 4577 50  0000 C CNN
F 2 "" H 6300 4750 50  0001 C CNN
F 3 "" H 6300 4750 50  0001 C CNN
	1    6300 4750
	1    0    0    -1  
$EndComp
Text GLabel 6000 3950 0    50   Input ~ 0
~WRP
Wire Wire Line
	6300 3600 6700 3600
Wire Wire Line
	7300 3600 7300 3750
Wire Wire Line
	6300 3600 6300 3750
Connection ~ 6700 3600
Wire Wire Line
	6700 3600 7300 3600
$Comp
L power:GND #PWR?
U 1 1 60679DC1
P 5250 4750
AR Path="/60679DC1" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/60679DC1" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 5250 4500 50  0001 C CNN
F 1 "GND" H 5255 4577 50  0000 C CNN
F 2 "" H 5250 4750 50  0001 C CNN
F 3 "" H 5250 4750 50  0001 C CNN
	1    5250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4150 4300 4250
Wire Wire Line
	5250 4150 5250 4250
Wire Wire Line
	5250 4250 4300 4250
Connection ~ 5250 4250
Wire Wire Line
	5250 4250 5250 4350
Connection ~ 4300 4250
Wire Wire Line
	4300 4250 4300 4350
$Comp
L power:GND #PWR?
U 1 1 6068712F
P 7300 4750
AR Path="/6068712F" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/6068712F" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 7300 4500 50  0001 C CNN
F 1 "GND" H 7305 4577 50  0000 C CNN
F 2 "" H 7300 4750 50  0001 C CNN
F 3 "" H 7300 4750 50  0001 C CNN
	1    7300 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4150 7300 4250
Wire Wire Line
	6300 4150 6300 4250
Wire Wire Line
	6300 4250 7300 4250
Connection ~ 6300 4250
Wire Wire Line
	6300 4250 6300 4350
Connection ~ 7300 4250
Wire Wire Line
	7300 4250 7300 4350
$EndSCHEMATC
