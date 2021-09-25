EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 75 108
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
L Memory_RAM:CY62256-70PC U1
U 1 1 60A478CE
P 4500 3950
F 0 "U1" H 4750 4950 50  0000 C CNN
F 1 "6264" H 4750 4850 50  0000 C CNN
F 2 "Package_SO:SOP-28-330" H 4500 3850 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Lyontek-Inc-LY6264SL-70LLI_C261872.pdf" H 4500 3850 50  0001 C CNN
F 4 "C261872" H 4500 3950 50  0001 C CNN "LCSC"
	1    4500 3950
	1    0    0    -1  
$EndComp
Text GLabel 4000 3250 0    50   Input ~ 0
ABUS0
Text GLabel 4000 3350 0    50   Input ~ 0
ABUS1
Text GLabel 4000 3450 0    50   Input ~ 0
ABUS2
Text GLabel 4000 3550 0    50   Input ~ 0
ABUS3
Text GLabel 4000 3650 0    50   Input ~ 0
ABUS4
Text GLabel 4000 3750 0    50   Input ~ 0
ABUS5
Text GLabel 4000 3850 0    50   Input ~ 0
ABUS6
Text GLabel 4000 3950 0    50   Input ~ 0
ABUS7
Text GLabel 4000 4050 0    50   Input ~ 0
ABUS8
Text GLabel 4000 4150 0    50   Input ~ 0
ABUS9
Text GLabel 4000 4250 0    50   Input ~ 0
ABUS10
Text GLabel 4000 4350 0    50   Input ~ 0
ABUS11
$Comp
L power:GND #PWR0504
U 1 1 60A4956A
P 4500 4850
F 0 "#PWR0504" H 4500 4600 50  0001 C CNN
F 1 "GND" H 4505 4677 50  0000 C CNN
F 2 "" H 4500 4850 50  0001 C CNN
F 3 "" H 4500 4850 50  0001 C CNN
	1    4500 4850
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT43W-V D38
U 1 1 60A4AEE0
P 4500 2550
F 0 "D38" V 4546 2470 50  0000 R CNN
F 1 "BAT43W" V 4455 2470 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4500 2375 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 4500 2550 50  0001 C CNN
F 4 "C19167" H 4500 2550 50  0001 C CNN "LCSC"
	1    4500 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 2700 4500 2800
$Comp
L power:GND #PWR?
U 1 1 60B26D82
P 2300 3950
AR Path="/608D9BDD/608D9C42/608D9C9B/60B26D82" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B26D82" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/60B26D82" Ref="#PWR?"  Part="1" 
AR Path="/609A143E/60B26D82" Ref="#PWR?"  Part="1" 
AR Path="/609A36A9/60B26D82" Ref="#PWR?"  Part="1" 
AR Path="/609E7D64/60B26D82" Ref="#PWR?"  Part="1" 
AR Path="/60A0BC91/60B26D82" Ref="#PWR?"  Part="1" 
AR Path="/60A44A82/60B26D82" Ref="#PWR0499"  Part="1" 
AR Path="/60AE7F64/60B26D82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0499" H 2300 3700 50  0001 C CNN
F 1 "GND" H 2305 3777 50  0000 C CNN
F 2 "" H 2300 3950 50  0001 C CNN
F 3 "" H 2300 3950 50  0001 C CNN
	1    2300 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B26D8C
P 2300 3300
AR Path="/608D9BDD/608D9C42/608D9C9B/60B26D8C" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B26D8C" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B26D8C" Ref="R?"  Part="1" 
AR Path="/609A143E/60B26D8C" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B26D8C" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B26D8C" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B26D8C" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B26D8C" Ref="R281"  Part="1" 
AR Path="/60AE7F64/60B26D8C" Ref="R?"  Part="1" 
F 0 "R281" H 2370 3346 50  0000 L CNN
F 1 "10k" H 2370 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2230 3300 50  0001 C CNN
F 3 "~" H 2300 3300 50  0001 C CNN
F 4 "C25804" H 2300 3300 50  0001 C CNN "LCSC"
	1    2300 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3450 2300 3500
Text Label 2550 3500 0    50   ~ 0
~RAM_CE
Wire Wire Line
	2550 3500 2300 3500
Connection ~ 2300 3500
Wire Wire Line
	2300 3500 2300 3550
Text Label 5100 4150 0    50   ~ 0
~RAM_CE
Wire Wire Line
	5100 4150 5000 4150
Text Notes 2600 3300 0    50   ~ 0
Hold ~CE~ high even\nwhen Vcc is removed.
Wire Wire Line
	2300 3150 2300 3000
Wire Wire Line
	2300 3000 4500 3000
Connection ~ 4500 3000
Wire Wire Line
	4500 3000 4500 3050
Text GLabel 2000 3750 0    50   Input ~ 0
~IO
$Comp
L power:VCC #PWR0491
U 1 1 60B2C60D
P 4500 2400
F 0 "#PWR0491" H 4500 2250 50  0001 C CNN
F 1 "VCC" H 4515 2573 50  0000 C CNN
F 2 "" H 4500 2400 50  0001 C CNN
F 3 "" H 4500 2400 50  0001 C CNN
	1    4500 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4450 5000 4450
$Comp
L Device:R R?
U 1 1 60B2F9D5
P 5600 3750
AR Path="/608D9BDD/608D9C42/608D9C9B/60B2F9D5" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B2F9D5" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B2F9D5" Ref="R?"  Part="1" 
AR Path="/609A143E/60B2F9D5" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B2F9D5" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B2F9D5" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B2F9D5" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B2F9D5" Ref="R282"  Part="1" 
AR Path="/60AE7F64/60B2F9D5" Ref="R?"  Part="1" 
F 0 "R282" V 5393 3750 50  0000 C CNN
F 1 "100k" V 5484 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5530 3750 50  0001 C CNN
F 3 "~" H 5600 3750 50  0001 C CNN
F 4 "C25803" H 5600 3750 50  0001 C CNN "LCSC"
	1    5600 3750
	0    1    1    0   
$EndComp
Text GLabel 5000 3750 2    50   Input ~ 0
DBUS5
Text GLabel 5000 3650 2    50   Input ~ 0
DBUS4
Text GLabel 5000 3550 2    50   Input ~ 0
DBUS3
Text GLabel 5000 3450 2    50   Input ~ 0
DBUS2
Text GLabel 5000 3350 2    50   Input ~ 0
DBUS1
Text GLabel 5000 3250 2    50   Input ~ 0
DBUS0
Wire Wire Line
	5000 3850 5400 3850
Wire Wire Line
	5400 3850 5400 3750
Wire Wire Line
	5400 3750 5450 3750
$Comp
L Device:R R?
U 1 1 60B3171E
P 5600 4050
AR Path="/608D9BDD/608D9C42/608D9C9B/60B3171E" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B3171E" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B3171E" Ref="R?"  Part="1" 
AR Path="/609A143E/60B3171E" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B3171E" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B3171E" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B3171E" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B3171E" Ref="R284"  Part="1" 
AR Path="/60AE7F64/60B3171E" Ref="R?"  Part="1" 
F 0 "R284" V 5393 4050 50  0000 C CNN
F 1 "100k" V 5484 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5530 4050 50  0001 C CNN
F 3 "~" H 5600 4050 50  0001 C CNN
F 4 "C25803" H 5600 4050 50  0001 C CNN "LCSC"
	1    5600 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 4050 5400 4050
Wire Wire Line
	5400 4050 5400 3950
Wire Wire Line
	5400 3950 5000 3950
$Comp
L power:GND #PWR0497
U 1 1 60B3201F
P 5750 3750
F 0 "#PWR0497" H 5750 3500 50  0001 C CNN
F 1 "GND" V 5755 3622 50  0000 R CNN
F 2 "" H 5750 3750 50  0001 C CNN
F 3 "" H 5750 3750 50  0001 C CNN
	1    5750 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0500
U 1 1 60B329D0
P 5750 4050
F 0 "#PWR0500" H 5750 3800 50  0001 C CNN
F 1 "GND" V 5755 3922 50  0000 R CNN
F 2 "" H 5750 4050 50  0001 C CNN
F 3 "" H 5750 4050 50  0001 C CNN
	1    5750 4050
	0    -1   -1   0   
$EndComp
Text Label 5100 4350 0    50   ~ 0
~RAM_OE
Wire Wire Line
	5100 4350 5000 4350
Text Label 3650 4450 2    50   ~ 0
BANK
Wire Wire Line
	3650 4450 4000 4450
$Comp
L power:GND #PWR0502
U 1 1 60B3439C
P 4000 4650
F 0 "#PWR0502" H 4000 4400 50  0001 C CNN
F 1 "GND" V 4005 4522 50  0000 R CNN
F 2 "" H 4000 4650 50  0001 C CNN
F 3 "" H 4000 4650 50  0001 C CNN
	1    4000 4650
	0    1    1    0   
$EndComp
$Comp
L Diode:BAT43W-V D40
U 1 1 60B34794
P 2000 6100
F 0 "D40" V 1954 6180 50  0000 L CNN
F 1 "BAT43W" V 2045 6180 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 2000 5925 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 2000 6100 50  0001 C CNN
F 4 "C19167" H 2000 6100 50  0001 C CNN "LCSC"
	1    2000 6100
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0508
U 1 1 60B359AA
P 2000 5950
F 0 "#PWR0508" H 2000 5800 50  0001 C CNN
F 1 "VCC" H 2015 6123 50  0000 C CNN
F 2 "" H 2000 5950 50  0001 C CNN
F 3 "" H 2000 5950 50  0001 C CNN
	1    2000 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B3605A
P 2500 6100
AR Path="/608D9BDD/608D9C42/608D9C9B/60B3605A" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B3605A" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B3605A" Ref="R?"  Part="1" 
AR Path="/609A143E/60B3605A" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B3605A" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B3605A" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B3605A" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B3605A" Ref="R287"  Part="1" 
AR Path="/60AE7F64/60B3605A" Ref="R?"  Part="1" 
F 0 "R287" H 2430 6054 50  0000 R CNN
F 1 "100k" H 2430 6145 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2430 6100 50  0001 C CNN
F 3 "~" H 2500 6100 50  0001 C CNN
F 4 "C25803" H 2500 6100 50  0001 C CNN "LCSC"
	1    2500 6100
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR0509
U 1 1 60B36808
P 2500 5950
F 0 "#PWR0509" H 2500 5800 50  0001 C CNN
F 1 "VCC" H 2515 6123 50  0000 C CNN
F 2 "" H 2500 5950 50  0001 C CNN
F 3 "" H 2500 5950 50  0001 C CNN
	1    2500 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60B38928
P 2250 6600
AR Path="/60A0BC91/60B38928" Ref="C?"  Part="1" 
AR Path="/60A44A82/60B38928" Ref="C15"  Part="1" 
F 0 "C15" H 2135 6554 50  0000 R CNN
F 1 "0.1u" H 2135 6645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2288 6450 50  0001 C CNN
F 3 "~" H 2250 6600 50  0001 C CNN
F 4 "C49678" H 2250 6600 50  0001 C CNN "LCSC"
	1    2250 6600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 6250 2000 6350
Wire Wire Line
	2000 6350 2250 6350
Wire Wire Line
	2500 6350 2500 6250
Wire Wire Line
	2250 6450 2250 6350
Connection ~ 2250 6350
Wire Wire Line
	2250 6350 2500 6350
$Comp
L power:GND #PWR0510
U 1 1 60B39421
P 2250 6750
F 0 "#PWR0510" H 2250 6500 50  0001 C CNN
F 1 "GND" H 2255 6577 50  0000 C CNN
F 2 "" H 2250 6750 50  0001 C CNN
F 3 "" H 2250 6750 50  0001 C CNN
	1    2250 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6350 3300 6350
Wire Wire Line
	3300 6350 3300 4550
Wire Wire Line
	3300 4550 4000 4550
Connection ~ 2500 6350
$Comp
L Memory_RAM:CY62256-70PC U2
U 1 1 60B4FA46
P 7150 3950
F 0 "U2" H 7400 4950 50  0000 C CNN
F 1 "6264" H 7400 4850 50  0000 C CNN
F 2 "Package_SO:SOP-28-330" H 7150 3850 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Lyontek-Inc-LY6264SL-70LLI_C261872.pdf" H 7150 3850 50  0001 C CNN
F 4 "C261872" H 7150 3950 50  0001 C CNN "LCSC"
	1    7150 3950
	1    0    0    -1  
$EndComp
Text GLabel 6650 3250 0    50   Input ~ 0
ABUS0
Text GLabel 6650 3350 0    50   Input ~ 0
ABUS1
Text GLabel 6650 3450 0    50   Input ~ 0
ABUS2
Text GLabel 6650 3550 0    50   Input ~ 0
ABUS3
Text GLabel 6650 3650 0    50   Input ~ 0
ABUS4
Text GLabel 6650 3750 0    50   Input ~ 0
ABUS5
Text GLabel 6650 3850 0    50   Input ~ 0
ABUS6
Text GLabel 6650 3950 0    50   Input ~ 0
ABUS7
Text GLabel 6650 4050 0    50   Input ~ 0
ABUS8
Text GLabel 6650 4150 0    50   Input ~ 0
ABUS9
Text GLabel 6650 4250 0    50   Input ~ 0
ABUS10
Text GLabel 6650 4350 0    50   Input ~ 0
ABUS11
$Comp
L power:GND #PWR0505
U 1 1 60B4FA58
P 7150 4850
F 0 "#PWR0505" H 7150 4600 50  0001 C CNN
F 1 "GND" H 7155 4677 50  0000 C CNN
F 2 "" H 7150 4850 50  0001 C CNN
F 3 "" H 7150 4850 50  0001 C CNN
	1    7150 4850
	1    0    0    -1  
$EndComp
Text Label 7750 4150 0    50   ~ 0
~RAM_CE
Wire Wire Line
	7750 4150 7650 4150
Wire Wire Line
	7750 4450 7650 4450
$Comp
L Device:R R?
U 1 1 60B4FA6C
P 8250 3750
AR Path="/608D9BDD/608D9C42/608D9C9B/60B4FA6C" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B4FA6C" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B4FA6C" Ref="R?"  Part="1" 
AR Path="/609A143E/60B4FA6C" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B4FA6C" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B4FA6C" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B4FA6C" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B4FA6C" Ref="R283"  Part="1" 
AR Path="/60AE7F64/60B4FA6C" Ref="R?"  Part="1" 
F 0 "R283" V 8043 3750 50  0000 C CNN
F 1 "100k" V 8134 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8180 3750 50  0001 C CNN
F 3 "~" H 8250 3750 50  0001 C CNN
F 4 "C25803" H 8250 3750 50  0001 C CNN "LCSC"
	1    8250 3750
	0    1    1    0   
$EndComp
Text GLabel 7650 3750 2    50   Input ~ 0
DBUS11
Text GLabel 7650 3650 2    50   Input ~ 0
DBUS10
Text GLabel 7650 3550 2    50   Input ~ 0
DBUS9
Text GLabel 7650 3450 2    50   Input ~ 0
DBUS8
Text GLabel 7650 3350 2    50   Input ~ 0
DBUS7
Text GLabel 7650 3250 2    50   Input ~ 0
DBUS6
Wire Wire Line
	7650 3850 8050 3850
Wire Wire Line
	8050 3850 8050 3750
Wire Wire Line
	8050 3750 8100 3750
$Comp
L Device:R R?
U 1 1 60B4FA7B
P 8250 4050
AR Path="/608D9BDD/608D9C42/608D9C9B/60B4FA7B" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B4FA7B" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B4FA7B" Ref="R?"  Part="1" 
AR Path="/609A143E/60B4FA7B" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B4FA7B" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B4FA7B" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B4FA7B" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B4FA7B" Ref="R285"  Part="1" 
AR Path="/60AE7F64/60B4FA7B" Ref="R?"  Part="1" 
F 0 "R285" V 8043 4050 50  0000 C CNN
F 1 "100k" V 8134 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8180 4050 50  0001 C CNN
F 3 "~" H 8250 4050 50  0001 C CNN
F 4 "C25803" H 8250 4050 50  0001 C CNN "LCSC"
	1    8250 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 4050 8050 4050
Wire Wire Line
	8050 4050 8050 3950
Wire Wire Line
	8050 3950 7650 3950
$Comp
L power:GND #PWR0498
U 1 1 60B4FA84
P 8400 3750
F 0 "#PWR0498" H 8400 3500 50  0001 C CNN
F 1 "GND" V 8405 3622 50  0000 R CNN
F 2 "" H 8400 3750 50  0001 C CNN
F 3 "" H 8400 3750 50  0001 C CNN
	1    8400 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0501
U 1 1 60B4FA8A
P 8400 4050
F 0 "#PWR0501" H 8400 3800 50  0001 C CNN
F 1 "GND" V 8405 3922 50  0000 R CNN
F 2 "" H 8400 4050 50  0001 C CNN
F 3 "" H 8400 4050 50  0001 C CNN
	1    8400 4050
	0    -1   -1   0   
$EndComp
Text Label 7750 4350 0    50   ~ 0
~RAM_OE
Wire Wire Line
	7750 4350 7650 4350
Text Label 6300 4450 2    50   ~ 0
BANK
Wire Wire Line
	6300 4450 6650 4450
$Comp
L power:GND #PWR0503
U 1 1 60B4FA94
P 6650 4650
F 0 "#PWR0503" H 6650 4400 50  0001 C CNN
F 1 "GND" V 6655 4522 50  0000 R CNN
F 2 "" H 6650 4650 50  0001 C CNN
F 3 "" H 6650 4650 50  0001 C CNN
	1    6650 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 3050 7150 2900
Wire Wire Line
	7150 2900 5150 2900
Connection ~ 4500 2900
Wire Wire Line
	4500 2900 4500 3000
Wire Wire Line
	3300 6350 6050 6350
Wire Wire Line
	6050 6350 6050 4550
Wire Wire Line
	6050 4550 6650 4550
Connection ~ 3300 6350
$Comp
L Device:Battery BT1
U 1 1 60B59BC1
P 5650 2200
F 0 "BT1" H 5758 2246 50  0000 L CNN
F 1 "Battery" H 5758 2155 50  0000 L CNN
F 2 "Batteries:BATTCOM_20MM_PTH" V 5650 2260 50  0001 C CNN
F 3 "~" V 5650 2260 50  0001 C CNN
	1    5650 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0492
U 1 1 60B5C6A2
P 5650 2400
F 0 "#PWR0492" H 5650 2150 50  0001 C CNN
F 1 "GND" H 5655 2227 50  0000 C CNN
F 2 "" H 5650 2400 50  0001 C CNN
F 3 "" H 5650 2400 50  0001 C CNN
	1    5650 2400
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT43W-V D39
U 1 1 60B5CBB2
P 5150 2550
F 0 "D39" V 5196 2470 50  0000 R CNN
F 1 "BAT43W" V 5105 2470 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 5150 2375 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 5150 2550 50  0001 C CNN
F 4 "C19167" H 5150 2550 50  0001 C CNN "LCSC"
	1    5150 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 2700 5150 2900
Connection ~ 5150 2900
Wire Wire Line
	5150 2900 4500 2900
Wire Wire Line
	5650 2000 5650 1900
Wire Wire Line
	5650 1900 5150 1900
Wire Wire Line
	5150 1900 5150 2400
$Comp
L Device:C C?
U 1 1 60B62515
P 8950 3050
AR Path="/60A0BC91/60B62515" Ref="C?"  Part="1" 
AR Path="/60A44A82/60B62515" Ref="C12"  Part="1" 
F 0 "C12" H 8835 3004 50  0000 R CNN
F 1 "0.1u" H 8835 3095 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8988 2900 50  0001 C CNN
F 3 "~" H 8950 3050 50  0001 C CNN
F 4 "C49678" H 8950 3050 50  0001 C CNN "LCSC"
	1    8950 3050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0494
U 1 1 60B63670
P 8950 3200
F 0 "#PWR0494" H 8950 2950 50  0001 C CNN
F 1 "GND" H 8955 3027 50  0000 C CNN
F 2 "" H 8950 3200 50  0001 C CNN
F 3 "" H 8950 3200 50  0001 C CNN
	1    8950 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60B65BFC
P 9350 3050
AR Path="/60A0BC91/60B65BFC" Ref="C?"  Part="1" 
AR Path="/60A44A82/60B65BFC" Ref="C13"  Part="1" 
F 0 "C13" H 9235 3004 50  0000 R CNN
F 1 "0.1u" H 9235 3095 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9388 2900 50  0001 C CNN
F 3 "~" H 9350 3050 50  0001 C CNN
F 4 "C49678" H 9350 3050 50  0001 C CNN "LCSC"
	1    9350 3050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0495
U 1 1 60B65C02
P 9350 3200
F 0 "#PWR0495" H 9350 2950 50  0001 C CNN
F 1 "GND" H 9355 3027 50  0000 C CNN
F 2 "" H 9350 3200 50  0001 C CNN
F 3 "" H 9350 3200 50  0001 C CNN
	1    9350 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60B6709C
P 9750 3050
AR Path="/60A0BC91/60B6709C" Ref="C?"  Part="1" 
AR Path="/60A44A82/60B6709C" Ref="C14"  Part="1" 
F 0 "C14" H 9635 3004 50  0000 R CNN
F 1 "1u" H 9635 3095 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9788 2900 50  0001 C CNN
F 3 "~" H 9750 3050 50  0001 C CNN
F 4 "C28323" H 9750 3050 50  0001 C CNN "LCSC"
	1    9750 3050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0496
U 1 1 60B670A2
P 9750 3200
F 0 "#PWR0496" H 9750 2950 50  0001 C CNN
F 1 "GND" H 9755 3027 50  0000 C CNN
F 2 "" H 9750 3200 50  0001 C CNN
F 3 "" H 9750 3200 50  0001 C CNN
	1    9750 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2900 7150 2650
Wire Wire Line
	7150 2650 8950 2650
Wire Wire Line
	8950 2650 8950 2900
Connection ~ 7150 2900
Wire Wire Line
	8950 2650 9350 2650
Wire Wire Line
	9750 2650 9750 2900
Connection ~ 8950 2650
Wire Wire Line
	9350 2900 9350 2650
Connection ~ 9350 2650
Wire Wire Line
	9350 2650 9750 2650
$Comp
L Switch:SW_SPST SW?
U 1 1 60B6D584
P 8900 5550
AR Path="/60A0BC91/60B6D584" Ref="SW?"  Part="1" 
AR Path="/60A44A82/60B6D584" Ref="SW2"  Part="1" 
F 0 "SW2" V 8946 5462 50  0000 R CNN
F 1 "Bank" V 8855 5462 50  0000 R CNN
F 2 "Button_Switch_SMD:TA-3524S-A2" H 8900 5550 50  0001 C CNN
F 3 "~" H 8900 5550 50  0001 C CNN
F 4 "C514017" H 8900 5550 50  0001 C CNN "LCSC"
	1    8900 5550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0507
U 1 1 60B70479
P 8900 5750
F 0 "#PWR0507" H 8900 5500 50  0001 C CNN
F 1 "GND" H 8905 5577 50  0000 C CNN
F 2 "" H 8900 5750 50  0001 C CNN
F 3 "" H 8900 5750 50  0001 C CNN
	1    8900 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B7091D
P 8900 5050
AR Path="/608D9BDD/608D9C42/608D9C9B/60B7091D" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B7091D" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B7091D" Ref="R?"  Part="1" 
AR Path="/609A143E/60B7091D" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B7091D" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B7091D" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B7091D" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B7091D" Ref="R286"  Part="1" 
AR Path="/60AE7F64/60B7091D" Ref="R?"  Part="1" 
F 0 "R286" H 8830 5004 50  0000 R CNN
F 1 "100k" H 8830 5095 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8830 5050 50  0001 C CNN
F 3 "~" H 8900 5050 50  0001 C CNN
F 4 "C25803" H 8900 5050 50  0001 C CNN "LCSC"
	1    8900 5050
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR0506
U 1 1 60B70EF1
P 8900 4900
F 0 "#PWR0506" H 8900 4750 50  0001 C CNN
F 1 "VCC" H 8915 5073 50  0000 C CNN
F 2 "" H 8900 4900 50  0001 C CNN
F 3 "" H 8900 4900 50  0001 C CNN
	1    8900 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5200 8900 5250
Text Label 9100 5250 0    50   ~ 0
BANK
Wire Wire Line
	9100 5250 8900 5250
Connection ~ 8900 5250
Wire Wire Line
	8900 5250 8900 5350
$Comp
L power:PWR_FLAG #FLG01
U 1 1 60A77330
P 4000 2400
F 0 "#FLG01" H 4000 2475 50  0001 C CNN
F 1 "PWR_FLAG" H 4000 2573 50  0000 C CNN
F 2 "" H 4000 2400 50  0001 C CNN
F 3 "~" H 4000 2400 50  0001 C CNN
	1    4000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2400 4000 2800
Wire Wire Line
	4000 2800 4500 2800
Connection ~ 4500 2800
Wire Wire Line
	4500 2800 4500 2900
$Comp
L power:GND #PWR?
U 1 1 60B5601B
P 2300 2550
AR Path="/608D9BDD/608D9C42/608D9C9B/60B5601B" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B5601B" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/60B5601B" Ref="#PWR?"  Part="1" 
AR Path="/609A143E/60B5601B" Ref="#PWR?"  Part="1" 
AR Path="/609A36A9/60B5601B" Ref="#PWR?"  Part="1" 
AR Path="/609E7D64/60B5601B" Ref="#PWR?"  Part="1" 
AR Path="/60A0BC91/60B5601B" Ref="#PWR?"  Part="1" 
AR Path="/60A44A82/60B5601B" Ref="#PWR0493"  Part="1" 
AR Path="/60AE7F64/60B5601B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0493" H 2300 2300 50  0001 C CNN
F 1 "GND" H 2305 2377 50  0000 C CNN
F 2 "" H 2300 2550 50  0001 C CNN
F 3 "" H 2300 2550 50  0001 C CNN
	1    2300 2550
	1    0    0    -1  
$EndComp
Text GLabel 2000 2350 0    50   Input ~ 0
~STATE_EXEC
$Comp
L Device:R R?
U 1 1 60B56508
P 2300 1850
AR Path="/608D9BDD/608D9C42/608D9C9B/60B56508" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60B56508" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60B56508" Ref="R?"  Part="1" 
AR Path="/609A143E/60B56508" Ref="R?"  Part="1" 
AR Path="/609A36A9/60B56508" Ref="R?"  Part="1" 
AR Path="/609E7D64/60B56508" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60B56508" Ref="R?"  Part="1" 
AR Path="/60A44A82/60B56508" Ref="R280"  Part="1" 
AR Path="/60AE7F64/60B56508" Ref="R?"  Part="1" 
F 0 "R280" H 2370 1896 50  0000 L CNN
F 1 "10k" H 2370 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2230 1850 50  0001 C CNN
F 3 "~" H 2300 1850 50  0001 C CNN
F 4 "C25804" H 2300 1850 50  0001 C CNN "LCSC"
	1    2300 1850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0490
U 1 1 60B56B4C
P 2300 1700
F 0 "#PWR0490" H 2300 1550 50  0001 C CNN
F 1 "VCC" H 2315 1873 50  0000 C CNN
F 2 "" H 2300 1700 50  0001 C CNN
F 3 "" H 2300 1700 50  0001 C CNN
	1    2300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2000 2300 2100
Text Label 2450 2100 0    50   ~ 0
~RAM_OE
Wire Wire Line
	2450 2100 2300 2100
Connection ~ 2300 2100
Wire Wire Line
	2300 2100 2300 2150
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 60AD26F2
P 2200 2350
AR Path="/60C3DB0A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/6098A2F9/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609A143E/6098A2F9/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D71FD/6098A2F9/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7793/6098A2F9/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/6098A2F9/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F3245/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F3245/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F3245/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F3245/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F3245/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F3245/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F3245/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60918A2D/6091B28C/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60947309/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609A143E/60918A2D/6091B28C/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609A143E/60947309/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60918A2D/6091B28C/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60947309/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7793/60918A2D/6091B28C/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7793/60947309/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60918A2D/6091B28C/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60947309/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17D8/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F1887/609B97FF/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17D8/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F1887/609B97FF/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17D8/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F1887/609B97FF/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17D8/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F1887/609B97FF/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17D8/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F1887/609B97FF/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17D8/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F1887/609B97FF/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/608D9C9B/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17D8/6095340A/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F1887/609B97FF/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60AD26F2" Ref="Q?"  Part="1" 
AR Path="/60A44A82/60AD26F2" Ref="Q635"  Part="1" 
F 0 "Q635" H 2404 2396 50  0000 L CNN
F 1 "2SK3018" H 2404 2305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2400 2275 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/1809211354_Guangdong-Hottech-2SK3018_C181084.pdf" H 2200 2350 50  0001 L CNN
F 4 "C181084" H 2200 2350 50  0001 C CNN "LCSC"
	1    2200 2350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 60AD68AB
P 2200 3750
AR Path="/60C3DB0A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/6098A2F9/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609A143E/6098A2F9/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D71FD/6098A2F9/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7793/6098A2F9/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/6098A2F9/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F3245/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F3245/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F3245/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F3245/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F3245/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F3245/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F3245/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60918A2D/6091B28C/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60947309/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609A143E/60918A2D/6091B28C/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609A143E/60947309/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60918A2D/6091B28C/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60947309/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7793/60918A2D/6091B28C/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7793/60947309/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60918A2D/6091B28C/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60947309/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17D8/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F1887/609B97FF/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17D8/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F1887/609B97FF/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17D8/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F1887/609B97FF/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17D8/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F1887/609B97FF/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17D8/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F1887/609B97FF/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17D8/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F1887/609B97FF/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/608D9C9B/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17D8/6095340A/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F1887/609B97FF/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60AD68AB" Ref="Q?"  Part="1" 
AR Path="/60A44A82/60AD68AB" Ref="Q636"  Part="1" 
F 0 "Q636" H 2404 3796 50  0000 L CNN
F 1 "2SK3018" H 2404 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2400 3675 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/1809211354_Guangdong-Hottech-2SK3018_C181084.pdf" H 2200 3750 50  0001 L CNN
F 4 "C181084" H 2200 3750 50  0001 C CNN "LCSC"
	1    2200 3750
	1    0    0    -1  
$EndComp
Text GLabel 5100 4450 2    50   Input ~ 0
~WRM
Text GLabel 7750 4450 2    50   Input ~ 0
~WRM
Text Notes 2700 6700 0    50   ~ 0
At power up, rise time is:\n0.69 * 100000 * 100 * 10^-9\n= 6.9ms
$EndSCHEMATC
