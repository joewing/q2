EESchema Schematic File Version 4
LIBS:control-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 14
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1700 1400 1800 1400
U 5E49A150
F0 "State" 50
F1 "state.sch" 50
$EndSheet
$Sheet
S 1700 3450 1700 1400
U 5E56259C
F0 "Decoder" 50
F1 "decode.sch" 50
$EndSheet
$Sheet
S 4150 3500 1850 1300
U 5E56A2DD
F0 "Opcode Latch" 50
F1 "opcode.sch" 50
$EndSheet
$Sheet
S 4150 1400 1950 1400
U 5E5E8038
F0 "Control Logic" 50
F1 "logic.sch" 50
$EndSheet
$Comp
L Connector_Generic:Conn_01x20 J2
U 1 1 5EA280DC
P 9000 2450
F 0 "J2" H 9150 2300 50  0000 C CNN
F 1 "Bottom" H 9200 2400 50  0000 C CNN
F 2 "Connector_Harwin:Harwin_M20-89020xx_1x20_P2.54mm_Horizontal" H 9000 2450 50  0001 C CNN
F 3 "~" H 9000 2450 50  0001 C CNN
	1    9000 2450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5EA29150
P 8100 3350
F 0 "#PWR03" H 8100 3100 50  0001 C CNN
F 1 "GND" H 8105 3177 50  0000 C CNN
F 2 "" H 8100 3350 50  0001 C CNN
F 3 "" H 8100 3350 50  0001 C CNN
	1    8100 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5EA2942F
P 9200 3350
F 0 "#PWR04" H 9200 3100 50  0001 C CNN
F 1 "GND" H 9205 3177 50  0000 C CNN
F 2 "" H 9200 3350 50  0001 C CNN
F 3 "" H 9200 3350 50  0001 C CNN
	1    9200 3350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5EA2BC06
P 8100 1450
F 0 "#PWR01" H 8100 1300 50  0001 C CNN
F 1 "VCC" H 8117 1623 50  0000 C CNN
F 2 "" H 8100 1450 50  0001 C CNN
F 3 "" H 8100 1450 50  0001 C CNN
	1    8100 1450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 5EA2C0BE
P 9200 1450
F 0 "#PWR02" H 9200 1300 50  0001 C CNN
F 1 "VCC" H 9217 1623 50  0000 C CNN
F 2 "" H 9200 1450 50  0001 C CNN
F 3 "" H 9200 1450 50  0001 C CNN
	1    9200 1450
	1    0    0    -1  
$EndComp
Text GLabel 9200 1550 2    50   Input ~ 0
DBUS15_IN
Text GLabel 9200 1650 2    50   Input ~ 0
DBUS14_IN
Text GLabel 9200 1750 2    50   Input ~ 0
DBUS13_IN
Text GLabel 9200 1850 2    50   Input ~ 0
DBUS12_IN
Text GLabel 9200 1950 2    50   Input ~ 0
DBUS11_IN
Text GLabel 9200 2050 2    50   Input ~ 0
DBUS10_IN
Text GLabel 9200 2150 2    50   Input ~ 0
DBUS9_IN
Text GLabel 8100 1550 0    50   Input ~ 0
RDP_ABUS_OUT
Text GLabel 8100 1650 0    50   Input ~ 0
RDX_ABUS_OUT
Text GLabel 8100 1750 0    50   Input ~ 0
XHIN_ABUS_OUT
Text GLabel 8100 1850 0    50   Input ~ 0
XHIN_DBUS_OUT
Text GLabel 8100 1950 0    50   Input ~ 0
WRX_OUT
Text GLabel 8100 2050 0    50   Input ~ 0
WRA_OUT
Text GLabel 8100 2150 0    50   Input ~ 0
RDA_DBUS_OUT
Text GLabel 8100 2250 0    50   Input ~ 0
PIN_NEXT_OUT
Text GLabel 8100 2350 0    50   Input ~ 0
PIN_X_OUT
Text GLabel 9700 2250 2    50   Input ~ 0
~RAM_OE_IO
Text GLabel 9200 2350 2    50   Input ~ 0
~RAM_WE_IO
Text GLabel 7600 2450 0    50   Input ~ 0
~WRN_IO
Text GLabel 8100 3150 0    50   Input ~ 0
CLK1_IN
Text GLabel 8100 3050 0    50   Input ~ 0
CLK2_IN
Text GLabel 8100 3250 0    50   Input ~ 0
RST_IN
Text GLabel 9200 2550 2    50   Input ~ 0
LD_OUT
Text GLabel 9200 2650 2    50   Input ~ 0
NOT_OUT
Text GLabel 9200 2750 2    50   Input ~ 0
AND_OUT
Text GLabel 9200 2850 2    50   Input ~ 0
OR_OUT
Text GLabel 9200 2950 2    50   Input ~ 0
XOR_OUT
Text GLabel 9200 3050 2    50   Input ~ 0
ADD_OUT
Text GLabel 9200 3150 2    50   Input ~ 0
SUB_OUT
Text GLabel 9200 3250 2    50   Input ~ 0
SHR_OUT
$Comp
L Device:R R?
U 1 1 5EA6641B
P 9500 4600
AR Path="/5E49A150/5EA6641B" Ref="R?"  Part="1" 
AR Path="/5E56259C/5EA6641B" Ref="R?"  Part="1" 
AR Path="/5E5E8038/5EA6641B" Ref="R?"  Part="1" 
AR Path="/5EA6641B" Ref="R1"  Part="1" 
F 0 "R1" H 9570 4646 50  0000 L CNN
F 1 "R" H 9570 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9430 4600 50  0001 C CNN
F 3 "~" H 9500 4600 50  0001 C CNN
	1    9500 4600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EA66421
P 9500 4450
AR Path="/5E49A150/5EA66421" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5EA66421" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5EA66421" Ref="#PWR?"  Part="1" 
AR Path="/5EA66421" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 9500 4300 50  0001 C CNN
F 1 "VCC" H 9517 4623 50  0000 C CNN
F 2 "" H 9500 4450 50  0001 C CNN
F 3 "" H 9500 4450 50  0001 C CNN
	1    9500 4450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EA66427
P 9400 5050
AR Path="/5E49A150/5EA66427" Ref="Q?"  Part="1" 
AR Path="/5E56259C/5EA66427" Ref="Q?"  Part="1" 
AR Path="/5E5E8038/5EA66427" Ref="Q?"  Part="1" 
AR Path="/5EA66427" Ref="Q1"  Part="1" 
F 0 "Q1" H 9606 5096 50  0000 L CNN
F 1 "2N7002" H 9606 5005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9600 4975 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 9400 5050 50  0001 L CNN
	1    9400 5050
	1    0    0    -1  
$EndComp
Text GLabel 9200 5050 0    50   Input ~ 0
CLK1_IN
Text GLabel 9650 4800 2    50   Input ~ 0
~CLK1
Wire Wire Line
	9500 4750 9500 4800
Wire Wire Line
	9650 4800 9500 4800
Connection ~ 9500 4800
Wire Wire Line
	9500 4800 9500 4850
$Comp
L power:GND #PWR?
U 1 1 5EA66433
P 9500 5250
AR Path="/5E49A150/5EA66433" Ref="#PWR?"  Part="1" 
AR Path="/5E56259C/5EA66433" Ref="#PWR?"  Part="1" 
AR Path="/5E5E8038/5EA66433" Ref="#PWR?"  Part="1" 
AR Path="/5EA66433" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 9500 5000 50  0001 C CNN
F 1 "GND" H 9505 5077 50  0000 C CNN
F 2 "" H 9500 5250 50  0001 C CNN
F 3 "" H 9500 5250 50  0001 C CNN
	1    9500 5250
	1    0    0    -1  
$EndComp
$Sheet
S 1700 5450 1700 1400
U 5EA84B0F
F0 "Flag" 50
F1 "flag.sch" 50
$EndSheet
NoConn ~ 8100 2950
NoConn ~ 8100 2650
$Comp
L Connector_Generic:Conn_01x20 J1
U 1 1 5EA26949
P 8300 2350
F 0 "J1" H 8380 2342 50  0000 L CNN
F 1 "Top" H 8380 2251 50  0000 L CNN
F 2 "Connector_Harwin:Harwin_M20-89020xx_1x20_P2.54mm_Horizontal" H 8300 2350 50  0001 C CNN
F 3 "~" H 8300 2350 50  0001 C CNN
	1    8300 2350
	1    0    0    -1  
$EndComp
Text GLabel 9700 2450 2    50   Input ~ 0
FIN
Text GLabel 8100 2750 0    50   Input ~ 0
HALT_OUT
NoConn ~ 8100 2850
NoConn ~ 8100 2550
Wire Wire Line
	7600 2450 8100 2450
Wire Wire Line
	9200 2250 9700 2250
Wire Wire Line
	9700 2450 9200 2450
$EndSCHEMATC
