EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 9
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
U 1 1 5F262DE6
P 8400 4000
AR Path="/5F262DE6" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F262DE6" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F262DE6" Ref="Q52"  Part="1" 
F 0 "Q52" H 8606 4046 50  0000 L CNN
F 1 "2N7002" H 8606 3955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8600 3925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8400 4000 50  0001 L CNN
	1    8400 4000
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F264AFB
P 8400 4400
AR Path="/5F264AFB" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5F264AFB" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F264AFB" Ref="Q54"  Part="1" 
F 0 "Q54" H 8606 4446 50  0000 L CNN
F 1 "2N7002" H 8606 4355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8600 4325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8400 4400 50  0001 L CNN
	1    8400 4400
	1    0    0    -1  
$EndComp
Text GLabel 8200 4400 0    50   Input ~ 0
RDX_ABUS
$Comp
L power:GND #PWR?
U 1 1 5F267F8B
P 8500 4600
AR Path="/5F267F8B" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F267F8B" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F267F8B" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 8500 4350 50  0001 C CNN
F 1 "GND" H 8505 4427 50  0000 C CNN
F 2 "" H 8500 4600 50  0001 C CNN
F 3 "" H 8500 4600 50  0001 C CNN
	1    8500 4600
	1    0    0    -1  
$EndComp
Text GLabel 8200 4000 0    50   Input ~ 0
~XOUT
Text GLabel 8750 3600 2    50   Input ~ 0
ABUS
Wire Wire Line
	8500 3800 8500 3600
Wire Wire Line
	8500 3600 8750 3600
$Sheet
S 6800 1750 1300 1100
U 5ECA19CD
F0 "X DFF" 50
F1 "dff.sch" 50
F2 "~Q" I R 8100 2200 50 
F3 "CLK" I L 6800 2100 50 
F4 "D" I L 6800 2500 50 
F5 "Q" I R 8100 2000 50 
F6 "SET" I R 8100 2500 50 
F7 "CLR" I R 8100 2700 50 
$EndSheet
Text GLabel 6500 2100 0    50   Input ~ 0
WRX
Wire Wire Line
	6500 2100 6800 2100
Text GLabel 8350 2200 2    50   Input ~ 0
~XOUT
Wire Wire Line
	8100 2200 8350 2200
Wire Wire Line
	5350 2150 5350 2500
$Comp
L power:VCC #PWR?
U 1 1 5F2E087F
P 5350 1850
AR Path="/5F2E087F" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F2E087F" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F2E087F" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 5350 1700 50  0001 C CNN
F 1 "VCC" H 5367 2023 50  0000 C CNN
F 2 "" H 5350 1850 50  0001 C CNN
F 3 "" H 5350 1850 50  0001 C CNN
	1    5350 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F2E0879
P 5350 2000
AR Path="/5F2E0879" Ref="R?"  Part="1" 
AR Path="/5EF45566/5F2E0879" Ref="R?"  Part="1" 
AR Path="/5F227145/5F2E0879" Ref="R19"  Part="1" 
F 0 "R19" H 5420 2046 50  0000 L CNN
F 1 "R" H 5420 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 2000 50  0001 C CNN
F 3 "~" H 5350 2000 50  0001 C CNN
	1    5350 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2500 5350 2500
Connection ~ 5350 2500
Wire Wire Line
	5350 2500 5850 2500
Wire Wire Line
	5850 3000 5850 2500
Text GLabel 5550 3200 0    50   Input ~ 0
~XIN
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5ECBB00C
P 5750 3200
AR Path="/5ECBB00C" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5ECBB00C" Ref="Q?"  Part="1" 
AR Path="/5F227145/5ECBB00C" Ref="Q48"  Part="1" 
F 0 "Q48" H 5956 3246 50  0000 L CNN
F 1 "2N7002" H 5956 3155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5950 3125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5750 3200 50  0001 L CNN
	1    5750 3200
	1    0    0    -1  
$EndComp
Text GLabel 5550 3600 0    50   Input ~ 0
XIN_SHIFT
$Comp
L power:GND #PWR?
U 1 1 5ECB11BF
P 5850 3800
AR Path="/5ECB11BF" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5ECB11BF" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5ECB11BF" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 5850 3550 50  0001 C CNN
F 1 "GND" H 5855 3627 50  0000 C CNN
F 2 "" H 5850 3800 50  0001 C CNN
F 3 "" H 5850 3800 50  0001 C CNN
	1    5850 3800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5ECAECC1
P 5750 3600
AR Path="/5ECAECC1" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5ECAECC1" Ref="Q?"  Part="1" 
AR Path="/5F227145/5ECAECC1" Ref="Q51"  Part="1" 
F 0 "Q51" H 5956 3646 50  0000 L CNN
F 1 "2N7002" H 5956 3555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5950 3525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5750 3600 50  0001 L CNN
	1    5750 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3000 4700 2500
Text GLabel 4400 3200 0    50   Input ~ 0
~P
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5ECAB642
P 4600 3200
AR Path="/5ECAB642" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5ECAB642" Ref="Q?"  Part="1" 
AR Path="/5F227145/5ECAB642" Ref="Q47"  Part="1" 
F 0 "Q47" H 4806 3246 50  0000 L CNN
F 1 "2N7002" H 4806 3155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4800 3125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4600 3200 50  0001 L CNN
	1    4600 3200
	1    0    0    -1  
$EndComp
Text GLabel 4400 3600 0    50   Input ~ 0
XIN_P
$Comp
L power:GND #PWR?
U 1 1 5ECA7BF9
P 4700 3800
AR Path="/5ECA7BF9" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5ECA7BF9" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5ECA7BF9" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 4700 3550 50  0001 C CNN
F 1 "GND" H 4705 3627 50  0000 C CNN
F 2 "" H 4700 3800 50  0001 C CNN
F 3 "" H 4700 3800 50  0001 C CNN
	1    4700 3800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5ECA4B58
P 4600 3600
AR Path="/5ECA4B58" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5ECA4B58" Ref="Q?"  Part="1" 
AR Path="/5F227145/5ECA4B58" Ref="Q50"  Part="1" 
F 0 "Q50" H 4806 3646 50  0000 L CNN
F 1 "2N7002" H 4806 3555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4800 3525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4600 3600 50  0001 L CNN
	1    4600 3600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EFD00AD
P 3600 3550
AR Path="/5EFD00AD" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EFD00AD" Ref="Q?"  Part="1" 
AR Path="/5F227145/5EFD00AD" Ref="Q49"  Part="1" 
F 0 "Q49" H 3806 3596 50  0000 L CNN
F 1 "2N7002" H 3806 3505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3800 3475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3600 3550 50  0001 L CNN
	1    3600 3550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EFD152A
P 3600 3150
AR Path="/5EFD152A" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EFD152A" Ref="Q?"  Part="1" 
AR Path="/5F227145/5EFD152A" Ref="Q46"  Part="1" 
F 0 "Q46" H 3806 3196 50  0000 L CNN
F 1 "2N7002" H 3806 3105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3800 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3600 3150 50  0001 L CNN
	1    3600 3150
	1    0    0    -1  
$EndComp
Text GLabel 3400 3550 0    50   Input ~ 0
XIN_DBUS
$Comp
L power:GND #PWR?
U 1 1 5EFD518A
P 3700 3750
AR Path="/5EFD518A" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EFD518A" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5EFD518A" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 3700 3500 50  0001 C CNN
F 1 "GND" H 3705 3577 50  0000 C CNN
F 2 "" H 3700 3750 50  0001 C CNN
F 3 "" H 3700 3750 50  0001 C CNN
	1    3700 3750
	1    0    0    -1  
$EndComp
Text GLabel 3400 3150 0    50   Input ~ 0
~DBUS
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EFD985C
P 3550 5350
AR Path="/5EFD985C" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EFD985C" Ref="Q?"  Part="1" 
AR Path="/5F227145/5EFD985C" Ref="Q55"  Part="1" 
F 0 "Q55" H 3756 5396 50  0000 L CNN
F 1 "2N7002" H 3756 5305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3750 5275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3550 5350 50  0001 L CNN
	1    3550 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDAC30
P 3650 5550
AR Path="/5EFDAC30" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EFDAC30" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5EFDAC30" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 3650 5300 50  0001 C CNN
F 1 "GND" H 3655 5377 50  0000 C CNN
F 2 "" H 3650 5550 50  0001 C CNN
F 3 "" H 3650 5550 50  0001 C CNN
	1    3650 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4800 3650 4950
$Comp
L power:VCC #PWR?
U 1 1 5EFDB507
P 3650 4500
AR Path="/5EFDB507" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EFDB507" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5EFDB507" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 3650 4350 50  0001 C CNN
F 1 "VCC" H 3667 4673 50  0000 C CNN
F 2 "" H 3650 4500 50  0001 C CNN
F 3 "" H 3650 4500 50  0001 C CNN
	1    3650 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EFDB50D
P 3650 4650
AR Path="/5EFDB50D" Ref="R?"  Part="1" 
AR Path="/5EF45566/5EFDB50D" Ref="R?"  Part="1" 
AR Path="/5F227145/5EFDB50D" Ref="R21"  Part="1" 
F 0 "R21" H 3720 4696 50  0000 L CNN
F 1 "R" H 3720 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3580 4650 50  0001 C CNN
F 3 "~" H 3650 4650 50  0001 C CNN
	1    3650 4650
	1    0    0    -1  
$EndComp
Text GLabel 3900 4950 2    50   Input ~ 0
~DBUS
Text GLabel 3350 5350 0    50   Input ~ 0
DBUS
Wire Wire Line
	3650 4950 3900 4950
Connection ~ 3650 4950
Wire Wire Line
	3650 4950 3650 5150
$Comp
L Device:R R?
U 1 1 5F7AE036
P 7150 3750
AR Path="/5F7AE036" Ref="R?"  Part="1" 
AR Path="/5EE1D251/5F7AE036" Ref="R?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7AE036" Ref="R?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7AE036" Ref="R?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7AE036" Ref="R?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7AE036" Ref="R?"  Part="1" 
AR Path="/5F227145/5F7AE036" Ref="R20"  Part="1" 
F 0 "R20" H 7220 3796 50  0000 L CNN
F 1 "R" H 7220 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7080 3750 50  0001 C CNN
F 3 "~" H 7150 3750 50  0001 C CNN
	1    7150 3750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F7AE03C
P 7150 3600
AR Path="/5F7AE03C" Ref="#PWR?"  Part="1" 
AR Path="/5EE1D251/5F7AE03C" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7AE03C" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7AE03C" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7AE03C" Ref="#PWR?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7AE03C" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F7AE03C" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 7150 3450 50  0001 C CNN
F 1 "VCC" H 7167 3773 50  0000 C CNN
F 2 "" H 7150 3600 50  0001 C CNN
F 3 "" H 7150 3600 50  0001 C CNN
	1    7150 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F7AE042
P 7150 4050
AR Path="/5EF45566/5EBC02F6/5F7AE042" Ref="D?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7AE042" Ref="D?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7AE042" Ref="D?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7AE042" Ref="D?"  Part="1" 
AR Path="/5F227145/5F7AE042" Ref="D3"  Part="1" 
F 0 "D3" V 7189 3933 50  0000 R CNN
F 1 "X" V 7098 3933 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O1.27mm_Z2.0mm" H 7150 4050 50  0001 C CNN
F 3 "~" H 7150 4050 50  0001 C CNN
	1    7150 4050
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F7AE048
P 7050 4400
AR Path="/5F7AE048" Ref="Q?"  Part="1" 
AR Path="/5EE1D251/5F7AE048" Ref="Q?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7AE048" Ref="Q?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7AE048" Ref="Q?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7AE048" Ref="Q?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7AE048" Ref="Q?"  Part="1" 
AR Path="/5F227145/5F7AE048" Ref="Q53"  Part="1" 
F 0 "Q53" H 7256 4446 50  0000 L CNN
F 1 "2N7002" H 7256 4355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7250 4325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7050 4400 50  0001 L CNN
	1    7050 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7AE04E
P 7150 4600
AR Path="/5F7AE04E" Ref="#PWR?"  Part="1" 
AR Path="/5EE1D251/5F7AE04E" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5EBC02F6/5F7AE04E" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5ECA19CD/5F7AE04E" Ref="#PWR?"  Part="1" 
AR Path="/5EF9DF90/5ECD3C9D/5F7AE04E" Ref="#PWR?"  Part="1" 
AR Path="/5ED30EAA/5ED32497/5F7AE04E" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F7AE04E" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 7150 4350 50  0001 C CNN
F 1 "GND" H 7155 4427 50  0000 C CNN
F 2 "" H 7150 4600 50  0001 C CNN
F 3 "" H 7150 4600 50  0001 C CNN
	1    7150 4600
	1    0    0    -1  
$EndComp
Text GLabel 8350 2000 2    50   Input ~ 0
XOUT
Wire Wire Line
	8100 2000 8350 2000
Text GLabel 6850 4400 0    50   Input ~ 0
XOUT
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 60647DEC
P 2550 3150
AR Path="/60647DEC" Ref="Q?"  Part="1" 
AR Path="/5EF45566/60647DEC" Ref="Q?"  Part="1" 
AR Path="/5F227145/60647DEC" Ref="Q45"  Part="1" 
F 0 "Q45" H 2756 3196 50  0000 L CNN
F 1 "2N7002" H 2756 3105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2750 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2550 3150 50  0001 L CNN
	1    2550 3150
	1    0    0    -1  
$EndComp
Text GLabel 2350 3150 0    50   Input ~ 0
XIN_ZERO
$Comp
L power:GND #PWR?
U 1 1 60655A9D
P 2650 3350
AR Path="/60655A9D" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/60655A9D" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/60655A9D" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 2650 3100 50  0001 C CNN
F 1 "GND" H 2655 3177 50  0000 C CNN
F 2 "" H 2650 3350 50  0001 C CNN
F 3 "" H 2650 3350 50  0001 C CNN
	1    2650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2500 5850 2500
Connection ~ 5850 2500
Wire Wire Line
	4700 2500 3700 2500
Wire Wire Line
	3700 2500 3700 2950
Connection ~ 4700 2500
Wire Wire Line
	2650 2500 3700 2500
Wire Wire Line
	2650 2500 2650 2950
Connection ~ 3700 2500
$Comp
L power:GND #PWR?
U 1 1 5F5C985D
P 8100 2700
AR Path="/5F5C985D" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F5C985D" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F5C985D" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 8100 2450 50  0001 C CNN
F 1 "GND" H 8105 2527 50  0000 C CNN
F 2 "" H 8100 2700 50  0001 C CNN
F 3 "" H 8100 2700 50  0001 C CNN
	1    8100 2700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5C9ED1
P 8100 2500
AR Path="/5F5C9ED1" Ref="#PWR?"  Part="1" 
AR Path="/5EF45566/5F5C9ED1" Ref="#PWR?"  Part="1" 
AR Path="/5F227145/5F5C9ED1" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 8100 2250 50  0001 C CNN
F 1 "GND" H 8105 2327 50  0000 C CNN
F 2 "" H 8100 2500 50  0001 C CNN
F 3 "" H 8100 2500 50  0001 C CNN
	1    8100 2500
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
