EESchema Schematic File Version 4
LIBS:slice-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
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
U 1 1 5EF42C6A
P 3600 2700
AR Path="/5EF42C6A" Ref="Q?"  Part="1" 
AR Path="/5EF31D02/5EF42C6A" Ref="Q53"  Part="1" 
F 0 "Q53" H 3806 2746 50  0000 L CNN
F 1 "2N7002" H 3806 2655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3800 2625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3600 2700 50  0001 L CNN
	1    3600 2700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF42C70
P 4250 2450
AR Path="/5EF42C70" Ref="Q?"  Part="1" 
AR Path="/5EF31D02/5EF42C70" Ref="Q51"  Part="1" 
F 0 "Q51" H 4456 2496 50  0000 L CNN
F 1 "2N7002" H 4456 2405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4450 2375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4250 2450 50  0001 L CNN
	1    4250 2450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF42C76
P 4250 2850
AR Path="/5EF42C76" Ref="Q?"  Part="1" 
AR Path="/5EF31D02/5EF42C76" Ref="Q54"  Part="1" 
F 0 "Q54" H 4456 2896 50  0000 L CNN
F 1 "2N7002" H 4456 2805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4450 2775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4250 2850 50  0001 L CNN
	1    4250 2850
	1    0    0    -1  
$EndComp
Text GLabel 4050 2850 0    50   Input ~ 0
ROR
$Comp
L power:GND #PWR?
U 1 1 5EF42C7D
P 4350 3050
AR Path="/5EF42C7D" Ref="#PWR?"  Part="1" 
AR Path="/5EF31D02/5EF42C7D" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 4350 2800 50  0001 C CNN
F 1 "GND" H 4355 2877 50  0000 C CNN
F 2 "" H 4350 3050 50  0001 C CNN
F 3 "" H 4350 3050 50  0001 C CNN
	1    4350 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF42C83
P 3700 2900
AR Path="/5EF42C83" Ref="#PWR?"  Part="1" 
AR Path="/5EF31D02/5EF42C83" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 3700 2650 50  0001 C CNN
F 1 "GND" H 3705 2727 50  0000 C CNN
F 2 "" H 3700 2900 50  0001 C CNN
F 3 "" H 3700 2900 50  0001 C CNN
	1    3700 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2500 3700 2450
$Comp
L Device:R R?
U 1 1 5EF42C8A
P 3700 2150
AR Path="/5EF42C8A" Ref="R?"  Part="1" 
AR Path="/5EF31D02/5EF42C8A" Ref="R15"  Part="1" 
F 0 "R15" H 3770 2196 50  0000 L CNN
F 1 "R" H 3770 2105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3630 2150 50  0001 C CNN
F 3 "~" H 3700 2150 50  0001 C CNN
	1    3700 2150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EF42C90
P 3700 2000
AR Path="/5EF42C90" Ref="#PWR?"  Part="1" 
AR Path="/5EF31D02/5EF42C90" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 3700 1850 50  0001 C CNN
F 1 "VCC" H 3717 2173 50  0000 C CNN
F 2 "" H 3700 2000 50  0001 C CNN
F 3 "" H 3700 2000 50  0001 C CNN
	1    3700 2000
	1    0    0    -1  
$EndComp
Text GLabel 4450 2050 2    50   Input ~ 0
ALU_OUT
Text GLabel 3400 2700 0    50   Input ~ 0
Xn
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF42C98
P 5600 2450
AR Path="/5EF42C98" Ref="Q?"  Part="1" 
AR Path="/5EF31D02/5EF42C98" Ref="Q52"  Part="1" 
F 0 "Q52" H 5806 2496 50  0000 L CNN
F 1 "2N7002" H 5806 2405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5800 2375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5600 2450 50  0001 L CNN
	1    5600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2450 4050 2450
Connection ~ 3700 2450
Wire Wire Line
	3700 2450 3700 2300
Text GLabel 5400 2450 0    50   Input ~ 0
~X
Text GLabel 5850 2100 2    50   Input ~ 0
FOUT
Wire Wire Line
	5700 2250 5700 2100
Wire Wire Line
	5700 2100 5850 2100
Wire Wire Line
	4350 2250 4350 2050
Wire Wire Line
	4350 2050 4450 2050
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF9766D
P 5600 2850
AR Path="/5EF9766D" Ref="Q?"  Part="1" 
AR Path="/5EF31D02/5EF9766D" Ref="Q55"  Part="1" 
F 0 "Q55" H 5806 2896 50  0000 L CNN
F 1 "2N7002" H 5806 2805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5800 2775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5600 2850 50  0001 L CNN
	1    5600 2850
	1    0    0    -1  
$EndComp
Text GLabel 5400 2850 0    50   Input ~ 0
ROR
$Comp
L power:GND #PWR?
U 1 1 5EF97674
P 5700 3050
AR Path="/5EF97674" Ref="#PWR?"  Part="1" 
AR Path="/5EF31D02/5EF97674" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 5700 2800 50  0001 C CNN
F 1 "GND" H 5705 2877 50  0000 C CNN
F 2 "" H 5700 3050 50  0001 C CNN
F 3 "" H 5700 3050 50  0001 C CNN
	1    5700 3050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
