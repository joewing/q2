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
Wire Wire Line
	5350 4150 5350 4400
Wire Wire Line
	5900 4700 6200 4700
Wire Wire Line
	5750 4250 6500 4250
Wire Wire Line
	4950 4250 5750 4250
Connection ~ 5750 4250
Wire Wire Line
	5750 4000 5750 4250
Wire Wire Line
	5950 4000 5750 4000
Wire Wire Line
	6500 4150 6500 4250
$Comp
L power:VCC #PWR?
U 1 1 5FA7FB2F
P 5350 3850
AR Path="/5E49A150/5FA7FB2F" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5FA7FB2F" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5FA7FB2F" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB2F" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FB2F" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FB2F" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 5350 3700 50  0001 C CNN
F 1 "VCC" H 5367 4023 50  0000 C CNN
F 2 "" H 5350 3850 50  0001 C CNN
F 3 "" H 5350 3850 50  0001 C CNN
	1    5350 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FA7FB35
P 5350 4000
AR Path="/5E49A150/5FA7FB35" Ref="R?"  Part="1" 
AR Path="/5E56259C/5FA7FB35" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5FA7FB35" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB35" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FB35" Ref="R?"  Part="1" 
AR Path="/5FA7FB35" Ref="R9"  Part="1" 
F 0 "R9" H 5420 4046 50  0000 L CNN
F 1 "R" H 5420 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 4000 50  0001 C CNN
F 3 "~" H 5350 4000 50  0001 C CNN
	1    5350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FA7FB3B
P 6500 3850
AR Path="/5E49A150/5FA7FB3B" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5FA7FB3B" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5FA7FB3B" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB3B" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FB3B" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FB3B" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 6500 3700 50  0001 C CNN
F 1 "VCC" H 6517 4023 50  0000 C CNN
F 2 "" H 6500 3850 50  0001 C CNN
F 3 "" H 6500 3850 50  0001 C CNN
	1    6500 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FA7FB41
P 6500 4000
AR Path="/5E49A150/5FA7FB41" Ref="R?"  Part="1" 
AR Path="/5E56259C/5FA7FB41" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5FA7FB41" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB41" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FB41" Ref="R?"  Part="1" 
AR Path="/5FA7FB41" Ref="R10"  Part="1" 
F 0 "R10" H 6570 4046 50  0000 L CNN
F 1 "R" H 6570 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6430 4000 50  0001 C CNN
F 3 "~" H 6500 4000 50  0001 C CNN
	1    6500 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4400 5900 4700
Wire Wire Line
	5350 4400 5900 4400
Connection ~ 5350 4400
Wire Wire Line
	5350 4500 5350 4400
Connection ~ 6500 4250
Wire Wire Line
	6500 4250 6500 4500
Wire Wire Line
	4950 4700 4950 4250
Wire Wire Line
	5050 4700 4950 4700
$Comp
L power:GND #PWR?
U 1 1 5FA7FB4F
P 6500 5300
AR Path="/5E49A150/5FA7FB4F" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5FA7FB4F" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5FA7FB4F" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB4F" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FB4F" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FB4F" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 6500 5050 50  0001 C CNN
F 1 "GND" H 6505 5127 50  0000 C CNN
F 2 "" H 6500 5300 50  0001 C CNN
F 3 "" H 6500 5300 50  0001 C CNN
	1    6500 5300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FB55
P 6400 5100
AR Path="/5E49A150/5FA7FB55" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5FA7FB55" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5FA7FB55" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB55" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FB55" Ref="Q?"  Part="1" 
AR Path="/5FA7FB55" Ref="Q15"  Part="1" 
F 0 "Q15" H 6606 5146 50  0000 L CNN
F 1 "2N7002" H 6606 5055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6600 5025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6400 5100 50  0001 L CNN
	1    6400 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA7FB5B
P 5350 5300
AR Path="/5E49A150/5FA7FB5B" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5FA7FB5B" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5FA7FB5B" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB5B" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FB5B" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FB5B" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 5350 5050 50  0001 C CNN
F 1 "GND" H 5355 5127 50  0000 C CNN
F 2 "" H 5350 5300 50  0001 C CNN
F 3 "" H 5350 5300 50  0001 C CNN
	1    5350 5300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FB61
P 5250 5100
AR Path="/5E49A150/5FA7FB61" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5FA7FB61" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5FA7FB61" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB61" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FB61" Ref="Q?"  Part="1" 
AR Path="/5FA7FB61" Ref="Q14"  Part="1" 
F 0 "Q14" H 5456 5146 50  0000 L CNN
F 1 "2N7002" H 5456 5055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5450 5025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5250 5100 50  0001 L CNN
	1    5250 5100
	1    0    0    -1  
$EndComp
Text GLabel 5950 4000 2    50   Input ~ 0
RUN
Text GLabel 5050 5100 0    50   Input ~ 0
~STOP_SW
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FB69
P 6400 4700
AR Path="/5E49A150/5FA7FB69" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5FA7FB69" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5FA7FB69" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB69" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FB69" Ref="Q?"  Part="1" 
AR Path="/5FA7FB69" Ref="Q13"  Part="1" 
F 0 "Q13" H 6606 4746 50  0000 L CNN
F 1 "2N7002" H 6606 4655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6600 4625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6400 4700 50  0001 L CNN
	1    6400 4700
	1    0    0    -1  
$EndComp
Text GLabel 6200 5100 0    50   Input ~ 0
~START_SW
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FB70
P 5250 4700
AR Path="/5E49A150/5FA7FB70" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5FA7FB70" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5FA7FB70" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB70" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FB70" Ref="Q?"  Part="1" 
AR Path="/5FA7FB70" Ref="Q12"  Part="1" 
F 0 "Q12" H 5456 4746 50  0000 L CNN
F 1 "2N7002" H 5456 4655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5450 4625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5250 4700 50  0001 L CNN
	1    5250 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FA7FB76
P 4400 2750
AR Path="/5EE0CB27/5FA7FB76" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB76" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FB76" Ref="R?"  Part="1" 
AR Path="/5FA7FB76" Ref="R8"  Part="1" 
F 0 "R8" H 4470 2796 50  0000 L CNN
F 1 "R" H 4470 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4330 2750 50  0001 C CNN
F 3 "~" H 4400 2750 50  0001 C CNN
	1    4400 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 2500 5100 2600
Wire Wire Line
	5850 2500 5850 2850
Wire Wire Line
	5100 2500 5850 2500
Connection ~ 5100 2500
Wire Wire Line
	5100 2450 5100 2500
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FB9F
P 6050 2850
AR Path="/5EE0CB27/5FA7FB9F" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FB9F" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FB9F" Ref="Q?"  Part="1" 
AR Path="/5FA7FB9F" Ref="Q6"  Part="1" 
F 0 "Q6" H 6256 2896 50  0000 L CNN
F 1 "2N7002" H 6256 2805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6250 2775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6050 2850 50  0001 L CNN
	1    6050 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA7FBA5
P 6150 3050
AR Path="/5EE0CB27/5FA7FBA5" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBA5" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FBA5" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FBA5" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 6150 2800 50  0001 C CNN
F 1 "GND" H 6155 2877 50  0000 C CNN
F 2 "" H 6150 3050 50  0001 C CNN
F 3 "" H 6150 3050 50  0001 C CNN
	1    6150 3050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FA7FBAB
P 6150 2200
AR Path="/5EE0CB27/5FA7FBAB" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBAB" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FBAB" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FBAB" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 6150 2050 50  0001 C CNN
F 1 "VCC" H 6167 2373 50  0000 C CNN
F 2 "" H 6150 2200 50  0001 C CNN
F 3 "" H 6150 2200 50  0001 C CNN
	1    6150 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FA7FBB1
P 6150 2350
AR Path="/5EE0CB27/5FA7FBB1" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBB1" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FBB1" Ref="R?"  Part="1" 
AR Path="/5FA7FBB1" Ref="R4"  Part="1" 
F 0 "R4" H 6220 2396 50  0000 L CNN
F 1 "R" H 6220 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6080 2350 50  0001 C CNN
F 3 "~" H 6150 2350 50  0001 C CNN
	1    6150 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2600 6150 2600
Wire Wire Line
	6150 2500 6150 2600
Connection ~ 6150 2600
Wire Wire Line
	6150 2600 6150 2650
Text GLabel 6400 2600 2    50   Input ~ 0
CLK
Text GLabel 8850 2600 2    50   Input ~ 0
WS
Text GLabel 8850 1200 2    50   Input ~ 0
SC
Text GLabel 8350 1650 0    50   Input ~ 0
~CDIV
Wire Wire Line
	8850 2600 8650 2600
Connection ~ 8650 2600
Wire Wire Line
	8650 2600 8650 2850
Wire Wire Line
	7450 2800 7450 2600
Wire Wire Line
	7900 2600 8650 2600
Wire Wire Line
	7450 2600 7900 2600
Connection ~ 7900 2600
$Comp
L Device:R R?
U 1 1 5FA7FBC6
P 7900 2450
AR Path="/5EE0CB27/5FA7FBC6" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBC6" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FBC6" Ref="R?"  Part="1" 
AR Path="/5FA7FBC6" Ref="R6"  Part="1" 
F 0 "R6" H 7970 2496 50  0000 L CNN
F 1 "R" H 7970 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 2450 50  0001 C CNN
F 3 "~" H 7900 2450 50  0001 C CNN
	1    7900 2450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FA7FBCC
P 7900 2300
AR Path="/5EE0CB27/5FA7FBCC" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBCC" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FBCC" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FBCC" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 7900 2150 50  0001 C CNN
F 1 "VCC" H 7917 2473 50  0000 C CNN
F 2 "" H 7900 2300 50  0001 C CNN
F 3 "" H 7900 2300 50  0001 C CNN
	1    7900 2300
	1    0    0    -1  
$EndComp
Text GLabel 7150 3000 0    50   Input ~ 0
CLK
$Comp
L power:GND #PWR?
U 1 1 5FA7FBD3
P 8650 3250
AR Path="/5EE0CB27/5FA7FBD3" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBD3" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FBD3" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FBD3" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 8650 3000 50  0001 C CNN
F 1 "GND" H 8655 3077 50  0000 C CNN
F 2 "" H 8650 3250 50  0001 C CNN
F 3 "" H 8650 3250 50  0001 C CNN
	1    8650 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA7FBD9
P 7450 3200
AR Path="/5EE0CB27/5FA7FBD9" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBD9" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FBD9" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FBD9" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 7450 2950 50  0001 C CNN
F 1 "GND" H 7455 3027 50  0000 C CNN
F 2 "" H 7450 3200 50  0001 C CNN
F 3 "" H 7450 3200 50  0001 C CNN
	1    7450 3200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FBDF
P 8550 3050
AR Path="/5EE0CB27/5FA7FBDF" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBDF" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FBDF" Ref="Q?"  Part="1" 
AR Path="/5FA7FBDF" Ref="Q9"  Part="1" 
F 0 "Q9" H 8756 3096 50  0000 L CNN
F 1 "2N7002" H 8756 3005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8750 2975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8550 3050 50  0001 L CNN
	1    8550 3050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FBE5
P 7350 3000
AR Path="/5EE0CB27/5FA7FBE5" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBE5" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FBE5" Ref="Q?"  Part="1" 
AR Path="/5FA7FBE5" Ref="Q8"  Part="1" 
F 0 "Q8" H 7556 3046 50  0000 L CNN
F 1 "2N7002" H 7556 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7550 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7350 3000 50  0001 L CNN
	1    7350 3000
	1    0    0    -1  
$EndComp
Text GLabel 8350 3050 0    50   Input ~ 0
CDIV
Wire Wire Line
	8850 1200 8650 1200
Connection ~ 8650 1200
Wire Wire Line
	8650 1200 8650 1450
Wire Wire Line
	7450 1400 7450 1200
Wire Wire Line
	7900 1200 8650 1200
Wire Wire Line
	7450 1200 7900 1200
Connection ~ 7900 1200
$Comp
L Device:R R?
U 1 1 5FA7FBF6
P 7900 1050
AR Path="/5EE0CB27/5FA7FBF6" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBF6" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FBF6" Ref="R?"  Part="1" 
AR Path="/5FA7FBF6" Ref="R1"  Part="1" 
F 0 "R1" H 7970 1096 50  0000 L CNN
F 1 "R" H 7970 1005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 1050 50  0001 C CNN
F 3 "~" H 7900 1050 50  0001 C CNN
	1    7900 1050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FA7FBFC
P 7900 900
AR Path="/5EE0CB27/5FA7FBFC" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FBFC" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FBFC" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FBFC" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 7900 750 50  0001 C CNN
F 1 "VCC" H 7917 1073 50  0000 C CNN
F 2 "" H 7900 900 50  0001 C CNN
F 3 "" H 7900 900 50  0001 C CNN
	1    7900 900 
	1    0    0    -1  
$EndComp
Text GLabel 7150 1600 0    50   Input ~ 0
CLK
$Comp
L power:GND #PWR?
U 1 1 5FA7FC03
P 8650 1850
AR Path="/5EE0CB27/5FA7FC03" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC03" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC03" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC03" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 8650 1600 50  0001 C CNN
F 1 "GND" H 8655 1677 50  0000 C CNN
F 2 "" H 8650 1850 50  0001 C CNN
F 3 "" H 8650 1850 50  0001 C CNN
	1    8650 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA7FC09
P 7450 1800
AR Path="/5EE0CB27/5FA7FC09" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC09" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC09" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC09" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 7450 1550 50  0001 C CNN
F 1 "GND" H 7455 1627 50  0000 C CNN
F 2 "" H 7450 1800 50  0001 C CNN
F 3 "" H 7450 1800 50  0001 C CNN
	1    7450 1800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FC0F
P 8550 1650
AR Path="/5EE0CB27/5FA7FC0F" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC0F" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FC0F" Ref="Q?"  Part="1" 
AR Path="/5FA7FC0F" Ref="Q2"  Part="1" 
F 0 "Q2" H 8756 1696 50  0000 L CNN
F 1 "2N7002" H 8756 1605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8750 1575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8550 1650 50  0001 L CNN
	1    8550 1650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FC15
P 7350 1600
AR Path="/5EE0CB27/5FA7FC15" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC15" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FC15" Ref="Q?"  Part="1" 
AR Path="/5FA7FC15" Ref="Q1"  Part="1" 
F 0 "Q1" H 7556 1646 50  0000 L CNN
F 1 "2N7002" H 7556 1555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7550 1525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7350 1600 50  0001 L CNN
	1    7350 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA7FC1B
P 5100 3000
AR Path="/5EE0CB27/5FA7FC1B" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC1B" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC1B" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC1B" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 5100 2750 50  0001 C CNN
F 1 "GND" H 5105 2827 50  0000 C CNN
F 2 "" H 5100 3000 50  0001 C CNN
F 3 "" H 5100 3000 50  0001 C CNN
	1    5100 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2200 4800 2800
Wire Wire Line
	3000 2450 3050 2450
Connection ~ 3000 2450
Wire Wire Line
	3000 2200 3000 2450
Wire Wire Line
	2850 2200 3000 2200
Text GLabel 2850 2200 0    50   Input ~ 0
FAST_IN
Wire Wire Line
	4200 1400 4200 1600
Text GLabel 4200 1100 1    50   Input ~ 0
FAST_OUT
Wire Wire Line
	2300 1600 4200 1600
Wire Wire Line
	2300 2450 2300 1600
Connection ~ 4200 1600
Wire Wire Line
	4200 1600 4200 2200
Wire Wire Line
	2400 3000 2850 3000
Text Notes 5150 1750 0    50   ~ 0
CLK high when not running.
$Comp
L Device:R R?
U 1 1 5FA7FC2F
P 2450 2450
AR Path="/5EE0CB27/5FA7FC2F" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC2F" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FC2F" Ref="R?"  Part="1" 
AR Path="/5FA7FC2F" Ref="R5"  Part="1" 
F 0 "R5" H 2520 2496 50  0000 L CNN
F 1 "R" H 2520 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2380 2450 50  0001 C CNN
F 3 "~" H 2450 2450 50  0001 C CNN
	1    2450 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 2200 4800 2200
Wire Wire Line
	4200 2200 4050 2200
Connection ~ 4200 2200
Wire Wire Line
	3350 2200 3350 2250
Wire Wire Line
	4050 2200 4050 2450
Connection ~ 4050 2200
Wire Wire Line
	3350 2200 4050 2200
Connection ~ 3350 2200
Wire Wire Line
	3350 2150 3350 2200
$Comp
L power:GND #PWR?
U 1 1 5FA7FC3E
P 2400 3300
AR Path="/5EE0CB27/5FA7FC3E" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC3E" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC3E" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC3E" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 2400 3050 50  0001 C CNN
F 1 "GND" H 2405 3127 50  0000 C CNN
F 2 "" H 2400 3300 50  0001 C CNN
F 3 "" H 2400 3300 50  0001 C CNN
	1    2400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FA7FC44
P 2400 3150
AR Path="/5EE0CB27/5FA7FC44" Ref="C?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC44" Ref="C?"  Part="1" 
AR Path="/5FA415E1/5FA7FC44" Ref="C?"  Part="1" 
AR Path="/5FA7FC44" Ref="C1"  Part="1" 
F 0 "C1" V 2148 3150 50  0000 C CNN
F 1 "C" V 2239 3150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2438 3000 50  0001 C CNN
F 3 "~" H 2400 3150 50  0001 C CNN
	1    2400 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 2450 2850 2450
Wire Wire Line
	2850 2450 3000 2450
Connection ~ 2850 2450
Wire Wire Line
	2850 3000 2850 2450
Connection ~ 2850 3000
Wire Wire Line
	3050 3000 2850 3000
Wire Wire Line
	3350 2750 3350 2800
Wire Wire Line
	3850 2750 3350 2750
$Comp
L power:VCC #PWR?
U 1 1 5FA7FC52
P 4550 2750
AR Path="/5EE0CB27/5FA7FC52" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC52" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC52" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC52" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 4550 2600 50  0001 C CNN
F 1 "VCC" H 4567 2923 50  0000 C CNN
F 2 "" H 4550 2750 50  0001 C CNN
F 3 "" H 4550 2750 50  0001 C CNN
	1    4550 2750
	1    0    0    -1  
$EndComp
Connection ~ 3350 2750
Wire Wire Line
	3350 2650 3350 2750
$Comp
L power:VCC #PWR?
U 1 1 5FA7FC5A
P 3350 1850
AR Path="/5EE0CB27/5FA7FC5A" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC5A" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC5A" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC5A" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 3350 1700 50  0001 C CNN
F 1 "VCC" H 3367 2023 50  0000 C CNN
F 2 "" H 3350 1850 50  0001 C CNN
F 3 "" H 3350 1850 50  0001 C CNN
	1    3350 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FA7FC60
P 3350 2000
AR Path="/5EE0CB27/5FA7FC60" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC60" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FC60" Ref="R?"  Part="1" 
AR Path="/5FA7FC60" Ref="R2"  Part="1" 
F 0 "R2" H 3420 2046 50  0000 L CNN
F 1 "R" H 3420 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3280 2000 50  0001 C CNN
F 3 "~" H 3350 2000 50  0001 C CNN
	1    3350 2000
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FC66
P 4050 2650
AR Path="/5EE0CB27/5FA7FC66" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC66" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FC66" Ref="Q?"  Part="1" 
AR Path="/5FA7FC66" Ref="Q4"  Part="1" 
F 0 "Q4" H 4256 2696 50  0000 L CNN
F 1 "2N7002" H 4256 2605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4250 2575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4050 2650 50  0001 L CNN
	1    4050 2650
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FC6C
P 3250 2450
AR Path="/5EE0CB27/5FA7FC6C" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC6C" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FC6C" Ref="Q?"  Part="1" 
AR Path="/5FA7FC6C" Ref="Q3"  Part="1" 
F 0 "Q3" H 3456 2496 50  0000 L CNN
F 1 "2N7002" H 3456 2405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3450 2375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3250 2450 50  0001 L CNN
	1    3250 2450
	1    0    0    -1  
$EndComp
Text GLabel 3050 3400 0    50   Input ~ 0
RUN
$Comp
L power:GND #PWR?
U 1 1 5FA7FC73
P 3350 3600
AR Path="/5EE0CB27/5FA7FC73" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC73" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC73" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC73" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 3350 3350 50  0001 C CNN
F 1 "GND" H 3355 3427 50  0000 C CNN
F 2 "" H 3350 3600 50  0001 C CNN
F 3 "" H 3350 3600 50  0001 C CNN
	1    3350 3600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FC79
P 3250 3400
AR Path="/5EE0CB27/5FA7FC79" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC79" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FC79" Ref="Q?"  Part="1" 
AR Path="/5FA7FC79" Ref="Q11"  Part="1" 
F 0 "Q11" H 3456 3446 50  0000 L CNN
F 1 "2N7002" H 3456 3355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3450 3325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3250 3400 50  0001 L CNN
	1    3250 3400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FC7F
P 3250 3000
AR Path="/5EE0CB27/5FA7FC7F" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC7F" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FC7F" Ref="Q?"  Part="1" 
AR Path="/5FA7FC7F" Ref="Q7"  Part="1" 
F 0 "Q7" H 3456 3046 50  0000 L CNN
F 1 "2N7002" H 3456 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3450 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3250 3000 50  0001 L CNN
	1    3250 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FA7FC85
P 5100 2300
AR Path="/5EE0CB27/5FA7FC85" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC85" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FA7FC85" Ref="R?"  Part="1" 
AR Path="/5FA7FC85" Ref="R3"  Part="1" 
F 0 "R3" H 5170 2346 50  0000 L CNN
F 1 "R" H 5170 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5030 2300 50  0001 C CNN
F 3 "~" H 5100 2300 50  0001 C CNN
	1    5100 2300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FA7FC8B
P 5100 2150
AR Path="/5EE0CB27/5FA7FC8B" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC8B" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA7FC8B" Ref="#PWR?"  Part="1" 
AR Path="/5FA7FC8B" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 5100 2000 50  0001 C CNN
F 1 "VCC" H 5117 2323 50  0000 C CNN
F 2 "" H 5100 2150 50  0001 C CNN
F 3 "" H 5100 2150 50  0001 C CNN
	1    5100 2150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5FA7FC91
P 5000 2800
AR Path="/5EE0CB27/5FA7FC91" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5FA7FC91" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5FA7FC91" Ref="Q?"  Part="1" 
AR Path="/5FA7FC91" Ref="Q5"  Part="1" 
F 0 "Q5" H 5206 2846 50  0000 L CNN
F 1 "2N7002" H 5206 2755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5200 2725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5000 2800 50  0001 L CNN
	1    5000 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J1
U 1 1 5FA827D6
P 9650 4750
F 0 "J1" H 9700 5267 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 9700 5176 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Horizontal" H 9650 4750 50  0001 C CNN
F 3 "~" H 9650 4750 50  0001 C CNN
	1    9650 4750
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FA835D9
P 9850 4450
AR Path="/5EE0CB27/5FA835D9" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA835D9" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA835D9" Ref="#PWR?"  Part="1" 
AR Path="/5FA835D9" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 9850 4300 50  0001 C CNN
F 1 "VCC" H 9867 4623 50  0000 C CNN
F 2 "" H 9850 4450 50  0001 C CNN
F 3 "" H 9850 4450 50  0001 C CNN
	1    9850 4450
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FA84519
P 9350 4450
AR Path="/5EE0CB27/5FA84519" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA84519" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA84519" Ref="#PWR?"  Part="1" 
AR Path="/5FA84519" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 9350 4300 50  0001 C CNN
F 1 "VCC" H 9367 4623 50  0000 C CNN
F 2 "" H 9350 4450 50  0001 C CNN
F 3 "" H 9350 4450 50  0001 C CNN
	1    9350 4450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA84D1C
P 9350 5150
AR Path="/5EE0CB27/5FA84D1C" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA84D1C" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA84D1C" Ref="#PWR?"  Part="1" 
AR Path="/5FA84D1C" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 9350 4900 50  0001 C CNN
F 1 "GND" H 9355 4977 50  0000 C CNN
F 2 "" H 9350 5150 50  0001 C CNN
F 3 "" H 9350 5150 50  0001 C CNN
	1    9350 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA85390
P 9850 5150
AR Path="/5EE0CB27/5FA85390" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FA85390" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FA85390" Ref="#PWR?"  Part="1" 
AR Path="/5FA85390" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 9850 4900 50  0001 C CNN
F 1 "GND" H 9855 4977 50  0000 C CNN
F 2 "" H 9850 5150 50  0001 C CNN
F 3 "" H 9850 5150 50  0001 C CNN
	1    9850 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FAAD385
P 2450 4400
AR Path="/5EE0CB27/5FAAD385" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FAAD385" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FAAD385" Ref="R?"  Part="1" 
AR Path="/5FAAD385" Ref="R12"  Part="1" 
F 0 "R12" H 2520 4446 50  0000 L CNN
F 1 "R" H 2520 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2380 4400 50  0001 C CNN
F 3 "~" H 2450 4400 50  0001 C CNN
	1    2450 4400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FAAD38B
P 2450 4250
AR Path="/5EE0CB27/5FAAD38B" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FAAD38B" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FAAD38B" Ref="#PWR?"  Part="1" 
AR Path="/5FAAD38B" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2450 4100 50  0001 C CNN
F 1 "VCC" H 2467 4423 50  0000 C CNN
F 2 "" H 2450 4250 50  0001 C CNN
F 3 "" H 2450 4250 50  0001 C CNN
	1    2450 4250
	1    0    0    -1  
$EndComp
Text GLabel 2000 4750 3    50   Input ~ 0
~START_SW
$Comp
L Device:R R?
U 1 1 5FAAEB08
P 2000 4600
AR Path="/5EE0CB27/5FAAEB08" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5FAAEB08" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5FAAEB08" Ref="R?"  Part="1" 
AR Path="/5FAAEB08" Ref="R13"  Part="1" 
F 0 "R13" H 2070 4646 50  0000 L CNN
F 1 "R" H 2070 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1930 4600 50  0001 C CNN
F 3 "~" H 2000 4600 50  0001 C CNN
	1    2000 4600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FAAEB0E
P 2000 4450
AR Path="/5EE0CB27/5FAAEB0E" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5FAAEB0E" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5FAAEB0E" Ref="#PWR?"  Part="1" 
AR Path="/5FAAEB0E" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 2000 4300 50  0001 C CNN
F 1 "VCC" H 2017 4623 50  0000 C CNN
F 2 "" H 2000 4450 50  0001 C CNN
F 3 "" H 2000 4450 50  0001 C CNN
	1    2000 4450
	1    0    0    -1  
$EndComp
Text GLabel 9850 4750 2    50   Input ~ 0
SC
Text GLabel 9850 4550 2    50   Input ~ 0
WS
Text GLabel 9850 5050 2    50   Input ~ 0
CLK
Text GLabel 9350 4550 0    50   Input ~ 0
RUN
Text GLabel 8950 4650 0    50   Input ~ 0
~START_SW
Text GLabel 9350 4750 0    50   Input ~ 0
~STOP_SW
Text GLabel 8900 4850 0    50   Input ~ 0
~INCP_SW
Text GLabel 9850 4650 2    50   Input ~ 0
INCP_DB
Wire Wire Line
	8950 4650 9350 4650
Wire Wire Line
	8900 4850 9350 4850
$Comp
L Device:R R?
U 1 1 5F5771A3
P 1700 4600
AR Path="/5EE0CB27/5F5771A3" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5F5771A3" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5F5771A3" Ref="R?"  Part="1" 
AR Path="/5F5771A3" Ref="R11"  Part="1" 
F 0 "R11" H 1770 4646 50  0000 L CNN
F 1 "R" H 1770 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 4600 50  0001 C CNN
F 3 "~" H 1700 4600 50  0001 C CNN
	1    1700 4600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F5771A9
P 1700 4450
AR Path="/5EE0CB27/5F5771A9" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F5771A9" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F5771A9" Ref="#PWR?"  Part="1" 
AR Path="/5F5771A9" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 1700 4300 50  0001 C CNN
F 1 "VCC" H 1717 4623 50  0000 C CNN
F 2 "" H 1700 4450 50  0001 C CNN
F 3 "" H 1700 4450 50  0001 C CNN
	1    1700 4450
	1    0    0    -1  
$EndComp
Text GLabel 1700 4750 3    50   Input ~ 0
~INCP_SW
Text GLabel 9850 4950 2    50   Input ~ 0
CDIV
Text GLabel 10250 4850 2    50   Input ~ 0
~CDIV
Wire Wire Line
	10250 4850 9850 4850
Text GLabel 9350 4950 0    50   Input ~ 0
FAST_OUT
Text GLabel 9350 5050 0    50   Input ~ 0
FAST_IN
$Comp
L Device:R R?
U 1 1 5F57B5C5
P 4200 1250
AR Path="/5EE0CB27/5F57B5C5" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5F57B5C5" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5F57B5C5" Ref="R?"  Part="1" 
AR Path="/5F57B5C5" Ref="R7"  Part="1" 
F 0 "R7" H 4270 1296 50  0000 L CNN
F 1 "R" H 4270 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4130 1250 50  0001 C CNN
F 3 "~" H 4200 1250 50  0001 C CNN
	1    4200 1250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F58D869
P 4400 6350
AR Path="/5EE0CB27/5F58D869" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5F58D869" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5F58D869" Ref="R?"  Part="1" 
AR Path="/5F58D869" Ref="R16"  Part="1" 
F 0 "R16" H 4470 6396 50  0000 L CNN
F 1 "R" H 4470 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4330 6350 50  0001 C CNN
F 3 "~" H 4400 6350 50  0001 C CNN
	1    4400 6350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F58D877
P 2450 6050
AR Path="/5EE0CB27/5F58D877" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5F58D877" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5F58D877" Ref="R?"  Part="1" 
AR Path="/5F58D877" Ref="R15"  Part="1" 
F 0 "R15" H 2520 6096 50  0000 L CNN
F 1 "R" H 2520 6005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2380 6050 50  0001 C CNN
F 3 "~" H 2450 6050 50  0001 C CNN
	1    2450 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 5800 3350 5850
Wire Wire Line
	4050 5800 4050 6050
Connection ~ 4050 5800
Wire Wire Line
	3350 5800 4050 5800
Connection ~ 3350 5800
Wire Wire Line
	3350 5750 3350 5800
Wire Wire Line
	2600 6050 2850 6050
Connection ~ 2850 6050
Wire Wire Line
	2850 6600 2850 6050
Wire Wire Line
	3050 6600 2850 6600
Wire Wire Line
	3350 6350 3350 6400
Wire Wire Line
	3850 6350 3350 6350
$Comp
L power:VCC #PWR?
U 1 1 5F58D894
P 4550 6350
AR Path="/5EE0CB27/5F58D894" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F58D894" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F58D894" Ref="#PWR?"  Part="1" 
AR Path="/5F58D894" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 4550 6200 50  0001 C CNN
F 1 "VCC" H 4567 6523 50  0000 C CNN
F 2 "" H 4550 6350 50  0001 C CNN
F 3 "" H 4550 6350 50  0001 C CNN
	1    4550 6350
	1    0    0    -1  
$EndComp
Connection ~ 3350 6350
Wire Wire Line
	3350 6250 3350 6350
$Comp
L Device:R R?
U 1 1 5F58D89C
P 3350 5600
AR Path="/5EE0CB27/5F58D89C" Ref="R?"  Part="1" 
AR Path="/5EE1C63A/5F58D89C" Ref="R?"  Part="1" 
AR Path="/5FA415E1/5F58D89C" Ref="R?"  Part="1" 
AR Path="/5F58D89C" Ref="R14"  Part="1" 
F 0 "R14" H 3420 5646 50  0000 L CNN
F 1 "R" H 3420 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3280 5600 50  0001 C CNN
F 3 "~" H 3350 5600 50  0001 C CNN
	1    3350 5600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F58D8A2
P 4050 6250
AR Path="/5EE0CB27/5F58D8A2" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5F58D8A2" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5F58D8A2" Ref="Q?"  Part="1" 
AR Path="/5F58D8A2" Ref="Q16"  Part="1" 
F 0 "Q16" H 4256 6296 50  0000 L CNN
F 1 "2N7002" H 4256 6205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4250 6175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4050 6250 50  0001 L CNN
	1    4050 6250
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F58D8A8
P 3250 6050
AR Path="/5EE0CB27/5F58D8A8" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5F58D8A8" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5F58D8A8" Ref="Q?"  Part="1" 
AR Path="/5F58D8A8" Ref="Q10"  Part="1" 
F 0 "Q10" H 3456 6096 50  0000 L CNN
F 1 "2N7002" H 3456 6005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3450 5975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3250 6050 50  0001 L CNN
	1    3250 6050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F58D8AE
P 3250 6600
AR Path="/5EE0CB27/5F58D8AE" Ref="Q?"  Part="1" 
AR Path="/5EE1C63A/5F58D8AE" Ref="Q?"  Part="1" 
AR Path="/5FA415E1/5F58D8AE" Ref="Q?"  Part="1" 
AR Path="/5F58D8AE" Ref="Q17"  Part="1" 
F 0 "Q17" H 3456 6646 50  0000 L CNN
F 1 "2N7002" H 3456 6555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3450 6525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3250 6600 50  0001 L CNN
	1    3250 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5800 4800 5800
Wire Wire Line
	2850 6050 3050 6050
$Comp
L power:GND #PWR?
U 1 1 5F58FBB1
P 3350 6800
AR Path="/5EE0CB27/5F58FBB1" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F58FBB1" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F58FBB1" Ref="#PWR?"  Part="1" 
AR Path="/5F58FBB1" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 3350 6550 50  0001 C CNN
F 1 "GND" H 3355 6627 50  0000 C CNN
F 2 "" H 3350 6800 50  0001 C CNN
F 3 "" H 3350 6800 50  0001 C CNN
	1    3350 6800
	1    0    0    -1  
$EndComp
Text GLabel 2300 6050 0    50   Input ~ 0
~INCP_SW
Text GLabel 4800 5800 2    50   Input ~ 0
INCP_DB
Connection ~ 2850 6600
$Comp
L power:GND #PWR?
U 1 1 5F58F51B
P 2400 6900
AR Path="/5EE0CB27/5F58F51B" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F58F51B" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F58F51B" Ref="#PWR?"  Part="1" 
AR Path="/5F58F51B" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 2400 6650 50  0001 C CNN
F 1 "GND" H 2405 6727 50  0000 C CNN
F 2 "" H 2400 6900 50  0001 C CNN
F 3 "" H 2400 6900 50  0001 C CNN
	1    2400 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F58D886
P 2400 6750
AR Path="/5EE0CB27/5F58D886" Ref="C?"  Part="1" 
AR Path="/5EE1C63A/5F58D886" Ref="C?"  Part="1" 
AR Path="/5FA415E1/5F58D886" Ref="C?"  Part="1" 
AR Path="/5F58D886" Ref="C3"  Part="1" 
F 0 "C3" V 2148 6750 50  0000 C CNN
F 1 "C" V 2239 6750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2438 6600 50  0001 C CNN
F 3 "~" H 2400 6750 50  0001 C CNN
	1    2400 6750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 6600 2850 6600
$Comp
L power:GND #PWR?
U 1 1 5F5D99E9
P 10200 2050
AR Path="/5EE0CB27/5F5D99E9" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F5D99E9" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F5D99E9" Ref="#PWR?"  Part="1" 
AR Path="/5F5D99E9" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 10200 1800 50  0001 C CNN
F 1 "GND" H 10205 1877 50  0000 C CNN
F 2 "" H 10200 2050 50  0001 C CNN
F 3 "" H 10200 2050 50  0001 C CNN
	1    10200 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F5D99EF
P 10200 1900
AR Path="/5EE0CB27/5F5D99EF" Ref="C?"  Part="1" 
AR Path="/5EE1C63A/5F5D99EF" Ref="C?"  Part="1" 
AR Path="/5FA415E1/5F5D99EF" Ref="C?"  Part="1" 
AR Path="/5F5D99EF" Ref="C2"  Part="1" 
F 0 "C2" V 9948 1900 50  0000 C CNN
F 1 "C" V 10039 1900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10238 1750 50  0001 C CNN
F 3 "~" H 10200 1900 50  0001 C CNN
	1    10200 1900
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F5DB022
P 10200 1750
AR Path="/5EE0CB27/5F5DB022" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F5DB022" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F5DB022" Ref="#PWR?"  Part="1" 
AR Path="/5F5DB022" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 10200 1600 50  0001 C CNN
F 1 "VCC" H 10217 1923 50  0000 C CNN
F 2 "" H 10200 1750 50  0001 C CNN
F 3 "" H 10200 1750 50  0001 C CNN
	1    10200 1750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F5DCAE2
P 3350 5450
AR Path="/5EE0CB27/5F5DCAE2" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F5DCAE2" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F5DCAE2" Ref="#PWR?"  Part="1" 
AR Path="/5F5DCAE2" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 3350 5300 50  0001 C CNN
F 1 "VCC" H 3367 5623 50  0000 C CNN
F 2 "" H 3350 5450 50  0001 C CNN
F 3 "" H 3350 5450 50  0001 C CNN
	1    3350 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F5E451D
P 2450 4950
AR Path="/5EE0CB27/5F5E451D" Ref="C?"  Part="1" 
AR Path="/5EE1C63A/5F5E451D" Ref="C?"  Part="1" 
AR Path="/5FA415E1/5F5E451D" Ref="C?"  Part="1" 
AR Path="/5F5E451D" Ref="C4"  Part="1" 
F 0 "C4" V 2198 4950 50  0000 C CNN
F 1 "C" V 2289 4950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2488 4800 50  0001 C CNN
F 3 "~" H 2450 4950 50  0001 C CNN
	1    2450 4950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5EB514
P 2450 5100
AR Path="/5E49A150/5F5EB514" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F5EB514" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5F5EB514" Ref="#PWR?"  Part="1" 
AR Path="/5EE1C63A/5F5EB514" Ref="#PWR?"  Part="1" 
AR Path="/5FA415E1/5F5EB514" Ref="#PWR?"  Part="1" 
AR Path="/5F5EB514" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 2450 4850 50  0001 C CNN
F 1 "GND" H 2455 4927 50  0000 C CNN
F 2 "" H 2450 5100 50  0001 C CNN
F 3 "" H 2450 5100 50  0001 C CNN
	1    2450 5100
	1    0    0    -1  
$EndComp
Text GLabel 2600 4700 2    50   Input ~ 0
~STOP_SW
Wire Wire Line
	2450 4700 2600 4700
Wire Wire Line
	2450 4700 2450 4800
Wire Wire Line
	2450 4550 2450 4700
Connection ~ 2450 4700
$EndSCHEMATC
