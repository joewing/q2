EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
U 1 1 5E565376
P 2700 3950
AR Path="/5E49A150/5E565376" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5E565376" Ref="Q11"  Part="1" 
F 0 "Q11" H 2906 3996 50  0000 L CNN
F 1 "2N7002" H 2906 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2900 3875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2700 3950 50  0001 L CNN
	1    2700 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E56537D
P 2800 4550
AR Path="/5E49A150/5E56537D" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5E56537D" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2800 4300 50  0001 C CNN
F 1 "GND" H 2805 4377 50  0000 C CNN
F 2 "" H 2800 4550 50  0001 C CNN
F 3 "" H 2800 4550 50  0001 C CNN
	1    2800 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E565385
P 2800 1650
AR Path="/5E49A150/5E565385" Ref="R?"  Part="1" 
AR Path="/5E56259C/5E565385" Ref="R1"  Part="1" 
F 0 "R1" H 2870 1696 50  0000 L CNN
F 1 "R" H 2870 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2730 1650 50  0001 C CNN
F 3 "~" H 2800 1650 50  0001 C CNN
	1    2800 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E56538C
P 2800 1500
AR Path="/5E49A150/5E56538C" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5E56538C" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 2800 1350 50  0001 C CNN
F 1 "VCC" H 2817 1673 50  0000 C CNN
F 2 "" H 2800 1500 50  0001 C CNN
F 3 "" H 2800 1500 50  0001 C CNN
	1    2800 1500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E598778
P 2700 3350
AR Path="/5E49A150/5E598778" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5E598778" Ref="Q8"  Part="1" 
F 0 "Q8" H 2906 3396 50  0000 L CNN
F 1 "2N7002" H 2906 3305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2900 3275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2700 3350 50  0001 L CNN
	1    2700 3350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E599E78
P 2700 2700
AR Path="/5E49A150/5E599E78" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5E599E78" Ref="Q3"  Part="1" 
F 0 "Q3" H 2906 2746 50  0000 L CNN
F 1 "2N7002" H 2906 2655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2900 2625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2700 2700 50  0001 L CNN
	1    2700 2700
	1    0    0    -1  
$EndComp
Text GLabel 2500 3950 0    50   Input ~ 0
~S2
Text GLabel 2500 3350 0    50   Input ~ 0
~S1
Text GLabel 2500 2700 0    50   Input ~ 0
~S0
Wire Wire Line
	2800 2900 2800 3050
Wire Wire Line
	2800 3550 2800 3650
Text GLabel 3150 1800 1    50   Input ~ 0
~STATE_FETCH
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E59E25F
P 3650 2700
AR Path="/5E49A150/5E59E25F" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5E59E25F" Ref="Q4"  Part="1" 
F 0 "Q4" H 3856 2746 50  0000 L CNN
F 1 "2N7002" H 3856 2655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3850 2625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3650 2700 50  0001 L CNN
	1    3650 2700
	1    0    0    -1  
$EndComp
Text GLabel 3450 2700 0    50   Input ~ 0
S0
Wire Wire Line
	2800 3050 3750 3050
Wire Wire Line
	3750 3050 3750 2900
Connection ~ 2800 3050
Wire Wire Line
	2800 3050 2800 3150
$Comp
L Device:R R?
U 1 1 5E5A308F
P 3750 1650
AR Path="/5E49A150/5E5A308F" Ref="R?"  Part="1" 
AR Path="/5E56259C/5E5A308F" Ref="R2"  Part="1" 
F 0 "R2" H 3820 1696 50  0000 L CNN
F 1 "R" H 3820 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3680 1650 50  0001 C CNN
F 3 "~" H 3750 1650 50  0001 C CNN
	1    3750 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E5A3095
P 3750 1500
AR Path="/5E49A150/5E5A3095" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5E5A3095" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 3750 1350 50  0001 C CNN
F 1 "VCC" H 3767 1673 50  0000 C CNN
F 2 "" H 3750 1500 50  0001 C CNN
F 3 "" H 3750 1500 50  0001 C CNN
	1    3750 1500
	1    0    0    -1  
$EndComp
Text GLabel 4100 1800 1    50   Input ~ 0
~STATE_LOAD
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E5A65FF
P 4600 2700
AR Path="/5E49A150/5E5A65FF" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5E5A65FF" Ref="Q5"  Part="1" 
F 0 "Q5" H 4806 2746 50  0000 L CNN
F 1 "2N7002" H 4806 2655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4800 2625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4600 2700 50  0001 L CNN
	1    4600 2700
	1    0    0    -1  
$EndComp
Text GLabel 4400 2700 0    50   Input ~ 0
~S0
Wire Wire Line
	4700 3050 4700 3000
$Comp
L Device:R R?
U 1 1 5E5A6607
P 4700 1650
AR Path="/5E49A150/5E5A6607" Ref="R?"  Part="1" 
AR Path="/5E56259C/5E5A6607" Ref="R3"  Part="1" 
F 0 "R3" H 4770 1696 50  0000 L CNN
F 1 "R" H 4770 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4630 1650 50  0001 C CNN
F 3 "~" H 4700 1650 50  0001 C CNN
	1    4700 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E5A660D
P 4700 1500
AR Path="/5E49A150/5E5A660D" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5E5A660D" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 4700 1350 50  0001 C CNN
F 1 "VCC" H 4717 1673 50  0000 C CNN
F 2 "" H 4700 1500 50  0001 C CNN
F 3 "" H 4700 1500 50  0001 C CNN
	1    4700 1500
	1    0    0    -1  
$EndComp
Text GLabel 5050 1800 1    50   Input ~ 0
~STATE_DEREF
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E5A67B0
P 4600 3250
AR Path="/5E49A150/5E5A67B0" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5E5A67B0" Ref="Q7"  Part="1" 
F 0 "Q7" H 4806 3296 50  0000 L CNN
F 1 "2N7002" H 4806 3205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4800 3175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4600 3250 50  0001 L CNN
	1    4600 3250
	1    0    0    -1  
$EndComp
Text GLabel 4400 3250 0    50   Input ~ 0
S1
Wire Wire Line
	2800 3650 4700 3650
Wire Wire Line
	4700 3650 4700 3450
Connection ~ 2800 3650
Wire Wire Line
	2800 3650 2800 3750
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5E5AC69B
P 5550 2700
AR Path="/5E49A150/5E5AC69B" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5E5AC69B" Ref="Q6"  Part="1" 
F 0 "Q6" H 5756 2746 50  0000 L CNN
F 1 "2N7002" H 5756 2655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5750 2625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5550 2700 50  0001 L CNN
	1    5550 2700
	1    0    0    -1  
$EndComp
Text GLabel 5350 2700 0    50   Input ~ 0
S0
$Comp
L Device:R R?
U 1 1 5E5AC6A2
P 5650 1650
AR Path="/5E49A150/5E5AC6A2" Ref="R?"  Part="1" 
AR Path="/5E56259C/5E5AC6A2" Ref="R4"  Part="1" 
F 0 "R4" H 5720 1696 50  0000 L CNN
F 1 "R" H 5720 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5580 1650 50  0001 C CNN
F 3 "~" H 5650 1650 50  0001 C CNN
	1    5650 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E5AC6A8
P 5650 1500
AR Path="/5E49A150/5E5AC6A8" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5E5AC6A8" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 5650 1350 50  0001 C CNN
F 1 "VCC" H 5667 1673 50  0000 C CNN
F 2 "" H 5650 1500 50  0001 C CNN
F 3 "" H 5650 1500 50  0001 C CNN
	1    5650 1500
	1    0    0    -1  
$EndComp
Text GLabel 6050 1800 1    50   Input ~ 0
~STATE_EXEC
Connection ~ 5650 2300
Wire Wire Line
	5650 2300 5650 2500
Wire Wire Line
	4700 3000 5650 3000
Wire Wire Line
	5650 3000 5650 2900
Connection ~ 4700 3000
Wire Wire Line
	4700 3000 4700 2900
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EECC920
P 2700 4350
AR Path="/5E49A150/5EECC920" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5EECC920" Ref="Q14"  Part="1" 
F 0 "Q14" H 2906 4396 50  0000 L CNN
F 1 "2N7002" H 2906 4305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2900 4275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2700 4350 50  0001 L CNN
	1    2700 4350
	1    0    0    -1  
$EndComp
Text GLabel 2500 4350 0    50   Input ~ 0
~S3
Wire Wire Line
	2800 2350 3150 2350
Connection ~ 2800 2350
Wire Wire Line
	2800 2350 2800 2500
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EEF4B46
P 3650 2300
AR Path="/5E49A150/5EEF4B46" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5EEF4B46" Ref="Q1"  Part="1" 
F 0 "Q1" H 3856 2346 50  0000 L CNN
F 1 "2N7002" H 3856 2255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3850 2225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3650 2300 50  0001 L CNN
	1    3650 2300
	1    0    0    -1  
$EndComp
Text GLabel 3450 2300 0    50   Input ~ 0
~OP5
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EEFB1D7
P 4600 2300
AR Path="/5E49A150/5EEFB1D7" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5EEFB1D7" Ref="Q2"  Part="1" 
F 0 "Q2" H 4806 2346 50  0000 L CNN
F 1 "2N7002" H 4806 2255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4800 2225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4600 2300 50  0001 L CNN
	1    4600 2300
	1    0    0    -1  
$EndComp
Text GLabel 4400 2300 0    50   Input ~ 0
OP2
Wire Wire Line
	2800 1800 2800 2350
Wire Wire Line
	3150 1800 3150 2350
Wire Wire Line
	3750 1800 3750 2000
Wire Wire Line
	3750 2000 4100 2000
Wire Wire Line
	4100 2000 4100 1800
Connection ~ 3750 2000
Wire Wire Line
	3750 2000 3750 2100
Wire Wire Line
	4700 1800 4700 1950
Wire Wire Line
	4700 1950 5050 1950
Wire Wire Line
	5050 1950 5050 1800
Connection ~ 4700 1950
Wire Wire Line
	4700 1950 4700 2100
Wire Wire Line
	5650 1800 5650 2300
Wire Wire Line
	6050 2300 6050 1800
Wire Wire Line
	5650 2300 6050 2300
$Comp
L power:VCC #PWR?
U 1 1 5F2893C8
P 6100 3150
AR Path="/5E49A150/5F2893C8" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F2893C8" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 6100 3000 50  0001 C CNN
F 1 "VCC" H 6117 3323 50  0000 C CNN
F 2 "" H 6100 3150 50  0001 C CNN
F 3 "" H 6100 3150 50  0001 C CNN
	1    6100 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F2893C2
P 6100 3300
AR Path="/5E49A150/5F2893C2" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F2893C2" Ref="R7"  Part="1" 
F 0 "R7" H 6170 3346 50  0000 L CNN
F 1 "R" H 6170 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6030 3300 50  0001 C CNN
F 3 "~" H 6100 3300 50  0001 C CNN
	1    6100 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3650 6100 3650
Connection ~ 4700 3650
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2C416B
P 6650 3650
AR Path="/5E49A150/5F2C416B" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F2C416B" Ref="Q9"  Part="1" 
F 0 "Q9" H 6856 3696 50  0000 L CNN
F 1 "2N7002" H 6856 3605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6850 3575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6650 3650 50  0001 L CNN
	1    6650 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5F2CEDC1
P 6750 2800
AR Path="/5E49A150/5F2CEDC1" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F2CEDC1" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 6750 2650 50  0001 C CNN
F 1 "VCC" H 6767 2973 50  0000 C CNN
F 2 "" H 6750 2800 50  0001 C CNN
F 3 "" H 6750 2800 50  0001 C CNN
	1    6750 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F2CEDC7
P 6750 2950
AR Path="/5E49A150/5F2CEDC7" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F2CEDC7" Ref="R5"  Part="1" 
F 0 "R5" H 6820 2996 50  0000 L CNN
F 1 "R" H 6820 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6680 2950 50  0001 C CNN
F 3 "~" H 6750 2950 50  0001 C CNN
	1    6750 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3100 6750 3300
Text GLabel 7150 3100 1    50   Input ~ 0
~STATE_ALU
$Comp
L power:GND #PWR?
U 1 1 5F2D0991
P 6750 4400
AR Path="/5E49A150/5F2D0991" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F2D0991" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 6750 4150 50  0001 C CNN
F 1 "GND" H 6755 4227 50  0000 C CNN
F 2 "" H 6750 4400 50  0001 C CNN
F 3 "" H 6750 4400 50  0001 C CNN
	1    6750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3300 7150 3300
Wire Wire Line
	7150 3300 7150 3100
Connection ~ 6750 3300
Wire Wire Line
	6750 3300 6750 3450
Wire Wire Line
	7900 3350 7900 3450
Connection ~ 7900 3350
Wire Wire Line
	7900 3350 8050 3350
Wire Wire Line
	7900 3250 7900 3350
$Comp
L power:GND #PWR?
U 1 1 5F277194
P 7900 3850
AR Path="/5E49A150/5F277194" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F277194" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 7900 3600 50  0001 C CNN
F 1 "GND" H 7905 3677 50  0000 C CNN
F 2 "" H 7900 3850 50  0001 C CNN
F 3 "" H 7900 3850 50  0001 C CNN
	1    7900 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EF41295
P 7900 2950
AR Path="/5E49A150/5EF41295" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5EF41295" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 7900 2800 50  0001 C CNN
F 1 "VCC" H 7917 3123 50  0000 C CNN
F 2 "" H 7900 2950 50  0001 C CNN
F 3 "" H 7900 2950 50  0001 C CNN
	1    7900 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EF4128F
P 7900 3100
AR Path="/5E49A150/5EF4128F" Ref="R?"  Part="1" 
AR Path="/5E56259C/5EF4128F" Ref="R6"  Part="1" 
F 0 "R6" H 7970 3146 50  0000 L CNN
F 1 "R" H 7970 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 3100 50  0001 C CNN
F 3 "~" H 7900 3100 50  0001 C CNN
	1    7900 3100
	1    0    0    -1  
$EndComp
Text GLabel 8050 3350 2    50   Input ~ 0
STATE_ALU
Text GLabel 6450 4200 0    50   Input ~ 0
~OP5
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF3C949
P 6650 4200
AR Path="/5E49A150/5EF3C949" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5EF3C949" Ref="Q13"  Part="1" 
F 0 "Q13" H 6856 4246 50  0000 L CNN
F 1 "2N7002" H 6856 4155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6850 4125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6650 4200 50  0001 L CNN
	1    6650 4200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF22A97
P 7800 3650
AR Path="/5E49A150/5EF22A97" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5EF22A97" Ref="Q10"  Part="1" 
F 0 "Q10" H 8006 3696 50  0000 L CNN
F 1 "2N7002" H 8006 3605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8000 3575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 7800 3650 50  0001 L CNN
	1    7800 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F84B085
P 8650 5450
AR Path="/5E49A150/5F84B085" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F84B085" Ref="#PWR017"  Part="1" 
AR Path="/5E5E8038/5F84B085" Ref="#PWR?"  Part="1" 
F 0 "#PWR017" H 8650 5200 50  0001 C CNN
F 1 "GND" H 8655 5277 50  0000 C CNN
F 2 "" H 8650 5450 50  0001 C CNN
F 3 "" H 8650 5450 50  0001 C CNN
	1    8650 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4900 8650 5050
Connection ~ 8650 4900
Wire Wire Line
	8650 4900 8900 4900
Wire Wire Line
	8650 4650 8650 4900
$Comp
L power:VCC #PWR?
U 1 1 5F84B08F
P 8650 4350
AR Path="/5E49A150/5F84B08F" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F84B08F" Ref="#PWR013"  Part="1" 
AR Path="/5E5E8038/5F84B08F" Ref="#PWR?"  Part="1" 
F 0 "#PWR013" H 8650 4200 50  0001 C CNN
F 1 "VCC" H 8667 4523 50  0000 C CNN
F 2 "" H 8650 4350 50  0001 C CNN
F 3 "" H 8650 4350 50  0001 C CNN
	1    8650 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F84B095
P 8650 4500
AR Path="/5E49A150/5F84B095" Ref="R?"  Part="1" 
AR Path="/5E56259C/5F84B095" Ref="R8"  Part="1" 
AR Path="/5E5E8038/5F84B095" Ref="R?"  Part="1" 
F 0 "R8" H 8720 4546 50  0000 L CNN
F 1 "R" H 8720 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8580 4500 50  0001 C CNN
F 3 "~" H 8650 4500 50  0001 C CNN
	1    8650 4500
	1    0    0    -1  
$EndComp
Text GLabel 8900 4900 2    50   Input ~ 0
STATE_FETCH
Text GLabel 8350 5250 0    50   Input ~ 0
~STATE_FETCH
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F84B09D
P 8550 5250
AR Path="/5E49A150/5F84B09D" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F84B09D" Ref="Q16"  Part="1" 
AR Path="/5E5E8038/5F84B09D" Ref="Q?"  Part="1" 
F 0 "Q16" H 8756 5296 50  0000 L CNN
F 1 "2N7002" H 8756 5205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8750 5175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8550 5250 50  0001 L CNN
	1    8550 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3450 6100 3650
Connection ~ 6100 3650
Wire Wire Line
	6100 3650 6450 3650
Wire Wire Line
	7450 3650 7600 3650
Wire Wire Line
	7150 3300 7450 3300
Wire Wire Line
	7450 3300 7450 3650
Connection ~ 7150 3300
$Comp
L power:GND #PWR?
U 1 1 5F6A8EC0
P 5800 4800
AR Path="/5E49A150/5F6A8EC0" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5F6A8EC0" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 5800 4550 50  0001 C CNN
F 1 "GND" H 5805 4627 50  0000 C CNN
F 2 "" H 5800 4800 50  0001 C CNN
F 3 "" H 5800 4800 50  0001 C CNN
	1    5800 4800
	1    0    0    -1  
$EndComp
Text GLabel 5500 4200 0    50   Input ~ 0
~OP3
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F6A8EC7
P 5700 4200
AR Path="/5E49A150/5F6A8EC7" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F6A8EC7" Ref="Q12"  Part="1" 
F 0 "Q12" H 5906 4246 50  0000 L CNN
F 1 "2N7002" H 5906 4155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5900 4125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5700 4200 50  0001 L CNN
	1    5700 4200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F6B0297
P 5700 4600
AR Path="/5E49A150/5F6B0297" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5F6B0297" Ref="Q15"  Part="1" 
F 0 "Q15" H 5906 4646 50  0000 L CNN
F 1 "2N7002" H 5906 4555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5900 4525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5700 4600 50  0001 L CNN
	1    5700 4600
	1    0    0    -1  
$EndComp
Text GLabel 5500 4600 0    50   Input ~ 0
~OP4
Wire Wire Line
	6750 3850 6750 3900
Wire Wire Line
	6750 3900 5800 3900
Wire Wire Line
	5800 3900 5800 4000
Connection ~ 6750 3900
Wire Wire Line
	6750 3900 6750 4000
Text Notes 6100 4850 0    50   ~ 0
ALU instruction (0xx) or LEA (100)
$EndSCHEMATC
