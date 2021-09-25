EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 91 108
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 4450 3050 0    50   Input ~ 0
I2C_SDA
$Comp
L Diode:BAT43W-V D?
U 1 1 60BCB145
P 4600 2750
AR Path="/60A44A82/60BCB145" Ref="D?"  Part="1" 
AR Path="/609C40CC/60BCB145" Ref="D?"  Part="1" 
AR Path="/60B6F292/60BCB145" Ref="D48"  Part="1" 
F 0 "D48" V 4554 2830 50  0000 L CNN
F 1 "BAT43W" V 4645 2830 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 4600 2575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 4600 2750 50  0001 C CNN
F 4 "C19167" H 4600 2750 50  0001 C CNN "LCSC"
	1    4600 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BCE4A2
P 4850 2200
AR Path="/608D9BDD/608D9C42/608D9C9B/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/609A143E/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/609A36A9/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/609E7D64/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/60A44A82/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/60AE7F64/60BCE4A2" Ref="R?"  Part="1" 
AR Path="/60B6F292/60BCE4A2" Ref="R362"  Part="1" 
F 0 "R362" H 4920 2246 50  0000 L CNN
F 1 "10k" H 4920 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4780 2200 50  0001 C CNN
F 3 "~" H 4850 2200 50  0001 C CNN
F 4 "C25804" H 4850 2200 50  0001 C CNN "LCSC"
	1    4850 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60BD043A
P 4850 2050
AR Path="/60A44A82/60BD043A" Ref="#PWR?"  Part="1" 
AR Path="/60B6F292/60BD043A" Ref="#PWR0715"  Part="1" 
F 0 "#PWR0715" H 4850 1900 50  0001 C CNN
F 1 "VCC" H 4865 2223 50  0000 C CNN
F 2 "" H 4850 2050 50  0001 C CNN
F 3 "" H 4850 2050 50  0001 C CNN
	1    4850 2050
	1    0    0    -1  
$EndComp
Text GLabel 5650 2250 2    50   Input ~ 0
DBUS9
Text GLabel 5250 2650 0    50   Input ~ 0
IO_RD
$Comp
L power:GND #PWR?
U 1 1 60C589EB
P 5550 3250
AR Path="/608D9BDD/608D9C42/608D9C9B/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/609A143E/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/609A36A9/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/609E7D64/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/60A0BC91/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/60A44A82/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/60AE7F64/60C589EB" Ref="#PWR?"  Part="1" 
AR Path="/60B6F292/60C589EB" Ref="#PWR0716"  Part="1" 
F 0 "#PWR0716" H 5550 3000 50  0001 C CNN
F 1 "GND" H 5555 3077 50  0000 C CNN
F 2 "" H 5550 3250 50  0001 C CNN
F 3 "" H 5550 3250 50  0001 C CNN
	1    5550 3250
	1    0    0    -1  
$EndComp
Text GLabel 4400 4500 0    50   Input ~ 0
I2C_SCL
$Comp
L Diode:BAT43W-V D?
U 1 1 60C8B7CD
P 4550 4100
AR Path="/60A44A82/60C8B7CD" Ref="D?"  Part="1" 
AR Path="/609C40CC/60C8B7CD" Ref="D?"  Part="1" 
AR Path="/60B6F292/60C8B7CD" Ref="D49"  Part="1" 
F 0 "D49" V 4504 4180 50  0000 L CNN
F 1 "BAT43W" V 4595 4180 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 4550 3925 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 4550 4100 50  0001 C CNN
F 4 "C19167" H 4550 4100 50  0001 C CNN "LCSC"
	1    4550 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60C8B7D3
P 4800 3850
AR Path="/608D9BDD/608D9C42/608D9C9B/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/608D9BDD/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/609A143E/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/609A36A9/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/609E7D64/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/60A0BC91/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/60A44A82/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/60AE7F64/60C8B7D3" Ref="R?"  Part="1" 
AR Path="/60B6F292/60C8B7D3" Ref="R363"  Part="1" 
F 0 "R363" H 4870 3896 50  0000 L CNN
F 1 "10k" H 4870 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4730 3850 50  0001 C CNN
F 3 "~" H 4800 3850 50  0001 C CNN
F 4 "C25804" H 4800 3850 50  0001 C CNN "LCSC"
	1    4800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4100 4800 4000
$Comp
L power:VCC #PWR?
U 1 1 60C8B7DE
P 4800 3700
AR Path="/60A44A82/60C8B7DE" Ref="#PWR?"  Part="1" 
AR Path="/60B6F292/60C8B7DE" Ref="#PWR0717"  Part="1" 
F 0 "#PWR0717" H 4800 3550 50  0001 C CNN
F 1 "VCC" H 4815 3873 50  0000 C CNN
F 2 "" H 4800 3700 50  0001 C CNN
F 3 "" H 4800 3700 50  0001 C CNN
	1    4800 3700
	1    0    0    -1  
$EndComp
Text GLabel 7400 4050 0    50   Input ~ 0
I2C_SCL
Text GLabel 7400 3850 0    50   Input ~ 0
I2C_SDA
Text GLabel 4400 4100 0    50   Input ~ 0
I2C_SCL_OUT
Text GLabel 4450 2750 0    50   Input ~ 0
I2C_SDA_OUT
Wire Wire Line
	4450 3050 4850 3050
Connection ~ 4850 3050
Wire Wire Line
	4750 2750 4850 2750
Wire Wire Line
	4850 2750 4850 3050
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 60DA0697
P 5450 3050
AR Path="/60C3DB0A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/6098A2F9/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609A143E/6098A2F9/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D71FD/6098A2F9/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7793/6098A2F9/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/6098A2F9/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F3245/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F3245/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F3245/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F3245/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F3245/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F3245/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F3245/60DA0697" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60918A2D/6091B28C/60DA0697" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60947309/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609A143E/60918A2D/6091B28C/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609A143E/60947309/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60918A2D/6091B28C/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60947309/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7793/60918A2D/6091B28C/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7793/60947309/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60918A2D/6091B28C/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60947309/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17D8/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F1887/609B97FF/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17D8/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F1887/609B97FF/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17D8/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F1887/609B97FF/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17D8/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F1887/609B97FF/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17D8/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F1887/609B97FF/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17D8/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F1887/609B97FF/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/608D9C9B/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17D8/6095340A/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F1887/609B97FF/60DA0697" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/60DA0697" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/60DA0697" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60A44A82/60DA0697" Ref="Q?"  Part="1" 
AR Path="/60B6F292/60DA0697" Ref="Q834"  Part="1" 
F 0 "Q834" H 5654 3096 50  0000 L CNN
F 1 "2SK3018" H 5654 3005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5650 2975 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/1809211354_Guangdong-Hottech-2SK3018_C181084.pdf" H 5450 3050 50  0001 L CNN
F 4 "C181084" H 5450 3050 50  0001 C CNN "LCSC"
	1    5450 3050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 60DA7238
P 5450 2650
AR Path="/60C3DB0A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/6098A2F9/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609A143E/6098A2F9/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D71FD/6098A2F9/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7793/6098A2F9/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/6098A2F9/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F3245/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F3245/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F3245/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F3245/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F3245/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F3245/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F3245/60DA7238" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60918A2D/6091B28C/60DA7238" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60947309/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609A143E/60918A2D/6091B28C/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609A143E/60947309/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60918A2D/6091B28C/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60947309/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7793/60918A2D/6091B28C/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7793/60947309/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60918A2D/6091B28C/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60947309/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17D8/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F1887/609B97FF/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17D8/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F1887/609B97FF/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17D8/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F1887/609B97FF/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17D8/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F1887/609B97FF/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17D8/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F1887/609B97FF/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17D8/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F1887/609B97FF/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/608D9C9B/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17D8/6095340A/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F1887/609B97FF/60DA7238" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/60DA7238" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/60DA7238" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60A44A82/60DA7238" Ref="Q?"  Part="1" 
AR Path="/60B6F292/60DA7238" Ref="Q833"  Part="1" 
F 0 "Q833" H 5654 2696 50  0000 L CNN
F 1 "2SK3018" H 5654 2605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5650 2575 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/1809211354_Guangdong-Hottech-2SK3018_C181084.pdf" H 5450 2650 50  0001 L CNN
F 4 "C181084" H 5450 2650 50  0001 C CNN "LCSC"
	1    5450 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3050 5250 3050
Wire Wire Line
	4850 2750 4850 2350
Connection ~ 4850 2750
Wire Wire Line
	5650 2250 5550 2250
Wire Wire Line
	5550 2250 5550 2450
Wire Wire Line
	4700 4100 4800 4100
Connection ~ 4800 4100
$Comp
L power:GND #PWR?
U 1 1 610ED952
P 6950 4150
AR Path="/608D9BDD/608D9C42/608D9C9B/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/608D9C42/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/609A143E/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/609A36A9/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/609E7D64/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/60A0BC91/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/60A44A82/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/60AE7F64/610ED952" Ref="#PWR?"  Part="1" 
AR Path="/60B6F292/610ED952" Ref="#PWR0718"  Part="1" 
F 0 "#PWR0718" H 6950 3900 50  0001 C CNN
F 1 "GND" H 6955 3977 50  0000 C CNN
F 2 "" H 6950 4150 50  0001 C CNN
F 3 "" H 6950 4150 50  0001 C CNN
	1    6950 4150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 610EE188
P 6800 3450
AR Path="/60A44A82/610EE188" Ref="#PWR?"  Part="1" 
AR Path="/60B6F292/610EE188" Ref="#PWR0719"  Part="1" 
F 0 "#PWR0719" H 6800 3300 50  0001 C CNN
F 1 "VCC" H 6815 3623 50  0000 C CNN
F 2 "" H 6800 3450 50  0001 C CNN
F 3 "" H 6800 3450 50  0001 C CNN
	1    6800 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4500 4800 4500
Wire Wire Line
	4800 4500 4800 4100
Text GLabel 5600 3700 2    50   Input ~ 0
DBUS10
Text GLabel 5200 4100 0    50   Input ~ 0
IO_RD
$Comp
L power:GND #PWR?
U 1 1 61109031
P 5500 4700
AR Path="/608D9BDD/608D9C42/608D9C9B/61109031" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/608D9C42/61109031" Ref="#PWR?"  Part="1" 
AR Path="/608D9BDD/61109031" Ref="#PWR?"  Part="1" 
AR Path="/609A143E/61109031" Ref="#PWR?"  Part="1" 
AR Path="/609A36A9/61109031" Ref="#PWR?"  Part="1" 
AR Path="/609E7D64/61109031" Ref="#PWR?"  Part="1" 
AR Path="/60A0BC91/61109031" Ref="#PWR?"  Part="1" 
AR Path="/60A44A82/61109031" Ref="#PWR?"  Part="1" 
AR Path="/60AE7F64/61109031" Ref="#PWR?"  Part="1" 
AR Path="/60B6F292/61109031" Ref="#PWR0884"  Part="1" 
F 0 "#PWR0884" H 5500 4450 50  0001 C CNN
F 1 "GND" H 5505 4527 50  0000 C CNN
F 2 "" H 5500 4700 50  0001 C CNN
F 3 "" H 5500 4700 50  0001 C CNN
	1    5500 4700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 61109038
P 5400 4500
AR Path="/60C3DB0A/61109038" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/6098A2F9/61109038" Ref="Q?"  Part="1" 
AR Path="/609A143E/6098A2F9/61109038" Ref="Q?"  Part="1" 
AR Path="/609D71FD/6098A2F9/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7793/6098A2F9/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/6098A2F9/61109038" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F3245/61109038" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F3245/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F3245/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F3245/61109038" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F3245/61109038" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F3245/61109038" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F3245/61109038" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60918A2D/6091B28C/61109038" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60947309/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609A143E/60918A2D/6091B28C/61109038" Ref="Q?"  Part="1" 
AR Path="/609A143E/60947309/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60918A2D/6091B28C/61109038" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60947309/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7793/60918A2D/6091B28C/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7793/60947309/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60918A2D/6091B28C/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60947309/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17D8/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F1887/609B97FF/61109038" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17D8/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F1887/609B97FF/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17D8/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F1887/609B97FF/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17D8/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F1887/609B97FF/61109038" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17D8/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F1887/609B97FF/61109038" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17D8/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F1887/609B97FF/61109038" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/608D9C9B/61109038" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17D8/6095340A/61109038" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F1887/609B97FF/61109038" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/61109038" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/61109038" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/61109038" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/61109038" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/61109038" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/61109038" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/61109038" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/61109038" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/61109038" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/61109038" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/61109038" Ref="Q?"  Part="1" 
AR Path="/60A44A82/61109038" Ref="Q?"  Part="1" 
AR Path="/60B6F292/61109038" Ref="Q989"  Part="1" 
F 0 "Q989" H 5604 4546 50  0000 L CNN
F 1 "2SK3018" H 5604 4455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5600 4425 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/1809211354_Guangdong-Hottech-2SK3018_C181084.pdf" H 5400 4500 50  0001 L CNN
F 4 "C181084" H 5400 4500 50  0001 C CNN "LCSC"
	1    5400 4500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 6110903F
P 5400 4100
AR Path="/60C3DB0A/6110903F" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/6098A2F9/6110903F" Ref="Q?"  Part="1" 
AR Path="/609A143E/6098A2F9/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D71FD/6098A2F9/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7793/6098A2F9/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/6098A2F9/6110903F" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F3245/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F3245/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F3245/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F3245/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F3245/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F3245/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F3245/6110903F" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60918A2D/6091B28C/6110903F" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/60947309/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609A143E/60918A2D/6091B28C/6110903F" Ref="Q?"  Part="1" 
AR Path="/609A143E/60947309/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60918A2D/6091B28C/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D71FD/60947309/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7793/60918A2D/6091B28C/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7793/60947309/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60918A2D/6091B28C/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/60947309/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17D8/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F1887/609B97FF/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17D8/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F1887/609B97FF/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17D8/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F1887/609B97FF/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17D8/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F1887/609B97FF/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17D8/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F1887/609B97FF/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17D8/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F1887/609B97FF/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/608D9C9B/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17D8/6095340A/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F1887/609B97FF/6110903F" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/608D9C42/6110903F" Ref="Q?"  Part="1" 
AR Path="/609A143E/608D9C42/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D71FD/608D9C42/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7793/608D9C42/6110903F" Ref="Q?"  Part="1" 
AR Path="/609D7D1E/608D9C42/6110903F" Ref="Q?"  Part="1" 
AR Path="/609EDBE1/609F17CE/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FBC79/609F17CE/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC502/609F17CE/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FCA98/609F17CE/6110903F" Ref="Q?"  Part="1" 
AR Path="/609FC03E/609F17CE/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D38EA9/609F17CE/6110903F" Ref="Q?"  Part="1" 
AR Path="/60D3B051/609F17CE/6110903F" Ref="Q?"  Part="1" 
AR Path="/608D9BDD/6110903F" Ref="Q?"  Part="1" 
AR Path="/60A44A82/6110903F" Ref="Q?"  Part="1" 
AR Path="/60B6F292/6110903F" Ref="Q988"  Part="1" 
F 0 "Q988" H 5604 4146 50  0000 L CNN
F 1 "2SK3018" H 5604 4055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5600 4025 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/1809211354_Guangdong-Hottech-2SK3018_C181084.pdf" H 5400 4100 50  0001 L CNN
F 4 "C181084" H 5400 4100 50  0001 C CNN "LCSC"
	1    5400 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4500 5200 4500
Wire Wire Line
	5600 3700 5500 3700
Wire Wire Line
	5500 3700 5500 3900
Connection ~ 4800 4500
Wire Wire Line
	6800 3450 6800 3750
Wire Wire Line
	7400 3750 6800 3750
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 610F831C
P 7600 3850
F 0 "J3" H 7680 3842 50  0000 L CNN
F 1 "I2C" H 7680 3751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Horizontal" H 7600 3850 50  0001 C CNN
F 3 "~" H 7600 3850 50  0001 C CNN
	1    7600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3950 6950 3950
Wire Wire Line
	6950 4150 6950 3950
$EndSCHEMATC
