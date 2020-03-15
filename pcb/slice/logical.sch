EESchema Schematic File Version 4
LIBS:slice-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
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
U 1 1 5EE7E7FA
P 2200 2100
AR Path="/5EE7E7FA" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE7E7FA" Ref="Q31"  Part="1" 
F 0 "Q31" H 2406 2146 50  0000 L CNN
F 1 "2N7002" H 2406 2055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2400 2025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2200 2100 50  0001 L CNN
	1    2200 2100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE7E800
P 3150 2100
AR Path="/5EE7E800" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE7E800" Ref="Q32"  Part="1" 
F 0 "Q32" H 3356 2146 50  0000 L CNN
F 1 "2N7002" H 3356 2055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3350 2025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3150 2100 50  0001 L CNN
	1    3150 2100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE7E80C
P 4000 1800
AR Path="/5EE7E80C" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE7E80C" Ref="Q29"  Part="1" 
F 0 "Q29" H 4206 1846 50  0000 L CNN
F 1 "2N7002" H 4206 1755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4200 1725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4000 1800 50  0001 L CNN
	1    4000 1800
	1    0    0    -1  
$EndComp
Text GLabel 4500 1350 2    50   Input ~ 0
FOUT
Text GLabel 2950 2100 0    50   Input ~ 0
FIN
Text GLabel 2000 2100 0    50   Input ~ 0
ALU_OUT
$Comp
L power:GND #PWR?
U 1 1 5EE7E827
P 3250 2300
AR Path="/5EE7E827" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EE7E827" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 3250 2050 50  0001 C CNN
F 1 "GND" H 3255 2127 50  0000 C CNN
F 2 "" H 3250 2300 50  0001 C CNN
F 3 "" H 3250 2300 50  0001 C CNN
	1    3250 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE7E82D
P 3250 1550
AR Path="/5EE7E82D" Ref="R?"  Part="1" 
AR Path="/5EE53669/5EE7E82D" Ref="R14"  Part="1" 
F 0 "R14" H 3320 1596 50  0000 L CNN
F 1 "R" H 3320 1505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3180 1550 50  0001 C CNN
F 3 "~" H 3250 1550 50  0001 C CNN
	1    3250 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EE7E833
P 3250 1400
AR Path="/5EE7E833" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EE7E833" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 3250 1250 50  0001 C CNN
F 1 "VCC" H 3267 1573 50  0000 C CNN
F 2 "" H 3250 1400 50  0001 C CNN
F 3 "" H 3250 1400 50  0001 C CNN
	1    3250 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1600 4100 1350
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE7E845
P 1450 3100
AR Path="/5EE7E845" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE7E845" Ref="Q35"  Part="1" 
F 0 "Q35" H 1656 3146 50  0000 L CNN
F 1 "2N7002" H 1656 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1650 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 1450 3100 50  0001 L CNN
	1    1450 3100
	1    0    0    -1  
$EndComp
Text GLabel 1250 3100 0    50   Input ~ 0
LD
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE7E84C
P 2400 3100
AR Path="/5EE7E84C" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE7E84C" Ref="Q36"  Part="1" 
F 0 "Q36" H 2606 3146 50  0000 L CNN
F 1 "2N7002" H 2606 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2600 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2400 3100 50  0001 L CNN
	1    2400 3100
	1    0    0    -1  
$EndComp
Text GLabel 2200 3100 0    50   Input ~ 0
NOT
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE7E853
P 3300 3100
AR Path="/5EE7E853" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE7E853" Ref="Q37"  Part="1" 
F 0 "Q37" H 3506 3146 50  0000 L CNN
F 1 "2N7002" H 3506 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3500 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3300 3100 50  0001 L CNN
	1    3300 3100
	1    0    0    -1  
$EndComp
Text GLabel 3100 3100 0    50   Input ~ 0
AND
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE7E85A
P 4250 3100
AR Path="/5EE7E85A" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE7E85A" Ref="Q38"  Part="1" 
F 0 "Q38" H 4456 3146 50  0000 L CNN
F 1 "2N7002" H 4456 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4450 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4250 3100 50  0001 L CNN
	1    4250 3100
	1    0    0    -1  
$EndComp
Text GLabel 4050 3100 0    50   Input ~ 0
OR
$Comp
L power:GND #PWR?
U 1 1 5EE7E861
P 1550 3300
AR Path="/5EE7E861" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EE7E861" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 1550 3050 50  0001 C CNN
F 1 "GND" H 1555 3127 50  0000 C CNN
F 2 "" H 1550 3300 50  0001 C CNN
F 3 "" H 1550 3300 50  0001 C CNN
	1    1550 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2900 1550 2650
Wire Wire Line
	1550 2650 2500 2650
Wire Wire Line
	2500 2650 2500 2900
Wire Wire Line
	3400 2650 3400 2900
Connection ~ 2500 2650
Wire Wire Line
	4350 2650 4350 2900
Connection ~ 3400 2650
$Comp
L power:GND #PWR?
U 1 1 5EE7E86F
P 2500 3300
AR Path="/5EE7E86F" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EE7E86F" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 2500 3050 50  0001 C CNN
F 1 "GND" H 2505 3127 50  0000 C CNN
F 2 "" H 2500 3300 50  0001 C CNN
F 3 "" H 2500 3300 50  0001 C CNN
	1    2500 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE7E875
P 3400 3300
AR Path="/5EE7E875" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EE7E875" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 3400 3050 50  0001 C CNN
F 1 "GND" H 3405 3127 50  0000 C CNN
F 2 "" H 3400 3300 50  0001 C CNN
F 3 "" H 3400 3300 50  0001 C CNN
	1    3400 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE7E87B
P 4350 3300
AR Path="/5EE7E87B" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EE7E87B" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 4350 3050 50  0001 C CNN
F 1 "GND" H 4355 3127 50  0000 C CNN
F 2 "" H 4350 3300 50  0001 C CNN
F 3 "" H 4350 3300 50  0001 C CNN
	1    4350 3300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE97748
P 6600 1850
AR Path="/5EE97748" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE97748" Ref="Q30"  Part="1" 
F 0 "Q30" H 6806 1896 50  0000 L CNN
F 1 "2N7002" H 6806 1805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6800 1775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6600 1850 50  0001 L CNN
	1    6600 1850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE9774E
P 6600 1450
AR Path="/5EE9774E" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EE9774E" Ref="Q28"  Part="1" 
F 0 "Q28" H 6806 1496 50  0000 L CNN
F 1 "2N7002" H 6806 1405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6800 1375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6600 1450 50  0001 L CNN
	1    6600 1450
	1    0    0    -1  
$EndComp
Text GLabel 6400 1850 0    50   Input ~ 0
LD
$Comp
L power:GND #PWR?
U 1 1 5EE97755
P 6700 2050
AR Path="/5EE97755" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EE97755" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 6700 1800 50  0001 C CNN
F 1 "GND" H 6705 1877 50  0000 C CNN
F 2 "" H 6700 2050 50  0001 C CNN
F 3 "" H 6700 2050 50  0001 C CNN
	1    6700 2050
	1    0    0    -1  
$EndComp
Text GLabel 6800 1050 2    50   Input ~ 0
ALU_OUT
Wire Wire Line
	6700 1250 6700 1050
Wire Wire Line
	6700 1050 6800 1050
Text GLabel 6400 1450 0    50   Input ~ 0
~X
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED17DE
P 1900 5200
AR Path="/5EED17DE" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED17DE" Ref="Q46"  Part="1" 
F 0 "Q46" H 2106 5246 50  0000 L CNN
F 1 "2N7002" H 2106 5155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2100 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 1900 5200 50  0001 L CNN
	1    1900 5200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED17E4
P 2800 5200
AR Path="/5EED17E4" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED17E4" Ref="Q47"  Part="1" 
F 0 "Q47" H 3006 5246 50  0000 L CNN
F 1 "2N7002" H 3006 5155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3000 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2800 5200 50  0001 L CNN
	1    2800 5200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED180B
P 6500 3550
AR Path="/5EED180B" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED180B" Ref="Q43"  Part="1" 
F 0 "Q43" H 6706 3596 50  0000 L CNN
F 1 "2N7002" H 6706 3505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6700 3475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6500 3550 50  0001 L CNN
	1    6500 3550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED1811
P 6500 3150
AR Path="/5EED1811" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED1811" Ref="Q40"  Part="1" 
F 0 "Q40" H 6706 3196 50  0000 L CNN
F 1 "2N7002" H 6706 3105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6700 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6500 3150 50  0001 L CNN
	1    6500 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EED1817
P 6600 3750
AR Path="/5EED1817" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EED1817" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 6600 3500 50  0001 C CNN
F 1 "GND" H 6605 3577 50  0000 C CNN
F 2 "" H 6600 3750 50  0001 C CNN
F 3 "" H 6600 3750 50  0001 C CNN
	1    6600 3750
	1    0    0    -1  
$EndComp
Text GLabel 6750 2800 2    50   Input ~ 0
ALU_OUT
Text GLabel 6300 3550 0    50   Input ~ 0
NOT
Text GLabel 6300 3150 0    50   Input ~ 0
X
Wire Wire Line
	6600 2950 6600 2800
Wire Wire Line
	6600 2800 6750 2800
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED1822
P 5700 5850
AR Path="/5EED1822" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED1822" Ref="Q50"  Part="1" 
F 0 "Q50" H 5906 5896 50  0000 L CNN
F 1 "2N7002" H 5906 5805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5900 5775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5700 5850 50  0001 L CNN
	1    5700 5850
	1    0    0    -1  
$EndComp
Text GLabel 5500 5850 0    50   Input ~ 0
OR
$Comp
L power:GND #PWR?
U 1 1 5EED182F
P 5800 6050
AR Path="/5EED182F" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EED182F" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 5800 5800 50  0001 C CNN
F 1 "GND" H 5805 5877 50  0000 C CNN
F 2 "" H 5800 6050 50  0001 C CNN
F 3 "" H 5800 6050 50  0001 C CNN
	1    5800 6050
	1    0    0    -1  
$EndComp
Text GLabel 5900 4650 2    50   Input ~ 0
ALU_OUT
Wire Wire Line
	5800 4850 5800 4650
Wire Wire Line
	5800 4650 5900 4650
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED1839
P 5700 5050
AR Path="/5EED1839" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED1839" Ref="Q45"  Part="1" 
F 0 "Q45" H 5906 5096 50  0000 L CNN
F 1 "2N7002" H 5906 5005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5900 4975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5700 5050 50  0001 L CNN
	1    5700 5050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED183F
P 5700 5450
AR Path="/5EED183F" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED183F" Ref="Q48"  Part="1" 
F 0 "Q48" H 5906 5496 50  0000 L CNN
F 1 "2N7002" H 5906 5405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5900 5375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5700 5450 50  0001 L CNN
	1    5700 5450
	1    0    0    -1  
$EndComp
Text GLabel 5500 5450 0    50   Input ~ 0
~A
Text GLabel 5500 5050 0    50   Input ~ 0
~X
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF03FE1
P 8450 2750
AR Path="/5EF03FE1" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EF03FE1" Ref="Q33"  Part="1" 
F 0 "Q33" H 8656 2796 50  0000 L CNN
F 1 "2N7002" H 8656 2705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8650 2675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8450 2750 50  0001 L CNN
	1    8450 2750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF0501F
P 8450 3150
AR Path="/5EF0501F" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EF0501F" Ref="Q41"  Part="1" 
F 0 "Q41" H 8656 3196 50  0000 L CNN
F 1 "2N7002" H 8656 3105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8650 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8450 3150 50  0001 L CNN
	1    8450 3150
	1    0    0    -1  
$EndComp
Text GLabel 8250 2750 0    50   Input ~ 0
X
Text GLabel 8250 3150 0    50   Input ~ 0
A
$Comp
L power:GND #PWR?
U 1 1 5EF07CA0
P 8900 3850
AR Path="/5EF07CA0" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EF07CA0" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 8900 3600 50  0001 C CNN
F 1 "GND" H 8905 3677 50  0000 C CNN
F 2 "" H 8900 3850 50  0001 C CNN
F 3 "" H 8900 3850 50  0001 C CNN
	1    8900 3850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF09259
P 8800 3650
AR Path="/5EF09259" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EF09259" Ref="Q44"  Part="1" 
F 0 "Q44" H 9006 3696 50  0000 L CNN
F 1 "2N7002" H 9006 3605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9000 3575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8800 3650 50  0001 L CNN
	1    8800 3650
	1    0    0    -1  
$EndComp
Text GLabel 8600 3650 0    50   Input ~ 0
XOR
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF1BA9E
P 9500 2750
AR Path="/5EF1BA9E" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EF1BA9E" Ref="Q34"  Part="1" 
F 0 "Q34" H 9706 2796 50  0000 L CNN
F 1 "2N7002" H 9706 2705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9700 2675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9500 2750 50  0001 L CNN
	1    9500 2750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EF1BAA4
P 9500 3150
AR Path="/5EF1BAA4" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EF1BAA4" Ref="Q42"  Part="1" 
F 0 "Q42" H 9706 3196 50  0000 L CNN
F 1 "2N7002" H 9706 3105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9700 3075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9500 3150 50  0001 L CNN
	1    9500 3150
	1    0    0    -1  
$EndComp
Text GLabel 9300 2750 0    50   Input ~ 0
~X
Text GLabel 9300 3150 0    50   Input ~ 0
~A
Wire Wire Line
	8550 3350 8550 3450
Wire Wire Line
	8550 3450 8900 3450
Wire Wire Line
	8900 3450 9600 3450
Wire Wire Line
	9600 3450 9600 3350
Connection ~ 8900 3450
Wire Wire Line
	8550 2550 8550 2300
Wire Wire Line
	8550 2300 9600 2300
Wire Wire Line
	9600 2300 9600 2550
Text GLabel 9850 2300 2    50   Input ~ 0
ALU_OUT
Wire Wire Line
	9600 2300 9850 2300
Connection ~ 9600 2300
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2018FE
P 5150 3100
AR Path="/5F2018FE" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5F2018FE" Ref="Q39"  Part="1" 
F 0 "Q39" H 5356 3146 50  0000 L CNN
F 1 "2N7002" H 5356 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5350 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 5150 3100 50  0001 L CNN
	1    5150 3100
	1    0    0    -1  
$EndComp
Text GLabel 4950 3100 0    50   Input ~ 0
XOR
$Comp
L power:GND #PWR?
U 1 1 5F203309
P 5250 3300
AR Path="/5F203309" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5F203309" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 5250 3050 50  0001 C CNN
F 1 "GND" H 5255 3127 50  0000 C CNN
F 2 "" H 5250 3300 50  0001 C CNN
F 3 "" H 5250 3300 50  0001 C CNN
	1    5250 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2650 5250 2650
Wire Wire Line
	5250 2650 5250 2900
Connection ~ 4350 2650
Text GLabel 3150 4800 2    50   Input ~ 0
ALU_OUT
Text GLabel 1700 5200 0    50   Input ~ 0
~A
Text GLabel 2600 5200 0    50   Input ~ 0
~X
$Comp
L power:GND #PWR?
U 1 1 5EED17EA
P 2500 6000
AR Path="/5EED17EA" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5EED17EA" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 2500 5750 50  0001 C CNN
F 1 "GND" H 2505 5827 50  0000 C CNN
F 2 "" H 2500 6000 50  0001 C CNN
F 3 "" H 2500 6000 50  0001 C CNN
	1    2500 6000
	1    0    0    -1  
$EndComp
Text GLabel 2200 5800 0    50   Input ~ 0
AND
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EED17D1
P 2400 5800
AR Path="/5EED17D1" Ref="Q?"  Part="1" 
AR Path="/5EE53669/5EED17D1" Ref="Q49"  Part="1" 
F 0 "Q49" H 2606 5846 50  0000 L CNN
F 1 "2N7002" H 2606 5755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2600 5725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2400 5800 50  0001 L CNN
	1    2400 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1700 3250 1800
Wire Wire Line
	3250 1800 3800 1800
Connection ~ 3250 1800
Wire Wire Line
	3250 1800 3250 1900
Wire Wire Line
	4100 2000 4100 2650
Wire Wire Line
	2000 5400 2000 5600
Wire Wire Line
	2000 5600 2500 5600
Wire Wire Line
	2500 5600 2900 5600
Wire Wire Line
	2900 5600 2900 5400
Connection ~ 2500 5600
Wire Wire Line
	2900 5000 2900 4800
Wire Wire Line
	2900 4800 3150 4800
Wire Wire Line
	2000 5000 2000 4800
Wire Wire Line
	2000 4800 2900 4800
Connection ~ 2900 4800
Text Notes 2500 3650 0    50   ~ 0
For logical operations, F means "non-zero".
Wire Wire Line
	3400 2650 4100 2650
Wire Wire Line
	4100 1350 4500 1350
Connection ~ 4100 2650
Wire Wire Line
	4100 2650 4350 2650
Wire Wire Line
	2500 2650 3400 2650
$Comp
L power:GND #PWR?
U 1 1 5E570C4C
P 2300 2300
AR Path="/5E570C4C" Ref="#PWR?"  Part="1" 
AR Path="/5EE53669/5E570C4C" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 2300 2050 50  0001 C CNN
F 1 "GND" H 2305 2127 50  0000 C CNN
F 2 "" H 2300 2300 50  0001 C CNN
F 3 "" H 2300 2300 50  0001 C CNN
	1    2300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1900 2300 1800
Wire Wire Line
	2300 1800 3250 1800
$EndSCHEMATC
