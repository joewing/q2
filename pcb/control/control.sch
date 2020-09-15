EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
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
S 1700 2800 1700 1400
U 5E56259C
F0 "Decoder" 50
F1 "decode.sch" 50
$EndSheet
$Sheet
S 4400 2850 1950 1400
U 5E5E8038
F0 "Control Logic" 50
F1 "logic.sch" 50
$EndSheet
$Comp
L power:GND #PWR03
U 1 1 5EA29150
P 8650 4550
F 0 "#PWR03" H 8650 4300 50  0001 C CNN
F 1 "GND" H 8655 4377 50  0000 C CNN
F 2 "" H 8650 4550 50  0001 C CNN
F 3 "" H 8650 4550 50  0001 C CNN
	1    8650 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5EA2942F
P 9150 4550
F 0 "#PWR04" H 9150 4300 50  0001 C CNN
F 1 "GND" H 9155 4377 50  0000 C CNN
F 2 "" H 9150 4550 50  0001 C CNN
F 3 "" H 9150 4550 50  0001 C CNN
	1    9150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5EA2BC06
P 8650 1450
F 0 "#PWR01" H 8650 1300 50  0001 C CNN
F 1 "VCC" H 8667 1623 50  0000 C CNN
F 2 "" H 8650 1450 50  0001 C CNN
F 3 "" H 8650 1450 50  0001 C CNN
	1    8650 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 5EA2C0BE
P 9150 1450
F 0 "#PWR02" H 9150 1300 50  0001 C CNN
F 1 "VCC" H 9167 1623 50  0000 C CNN
F 2 "" H 9150 1450 50  0001 C CNN
F 3 "" H 9150 1450 50  0001 C CNN
	1    9150 1450
	0    1    1    0   
$EndComp
Text GLabel 8650 4250 0    50   Input ~ 0
RDP_ABUS
Text GLabel 8650 2250 0    50   Input ~ 0
RDX_ABUS
Text GLabel 8650 1750 0    50   Input ~ 0
XHIN_P
Text GLabel 8650 1850 0    50   Input ~ 0
XHIN_DBUS
Text GLabel 8650 2150 0    50   Input ~ 0
WRX
Text GLabel 8650 2550 0    50   Input ~ 0
WRA
Text GLabel 8650 2450 0    50   Input ~ 0
RDA_DBUS
Text Notes 3300 1200 0    50   ~ 0
Binary ripple counter\nfor state bits 0-3\nS0 is connected to WRS1\n(etc) on the backplane
Text GLabel 8650 1950 0    50   Input ~ 0
XHIN_ZERO
Text GLabel 8650 2050 0    50   Input ~ 0
XHIN_SHIFT
Text GLabel 8650 3250 0    50   Input ~ 0
XLIN_SHIFT
Text GLabel 9150 2750 2    50   Input ~ 0
WRO
Text GLabel 8200 4350 0    50   Input ~ 0
~WRP
Text GLabel 9150 1650 2    50   Input ~ 0
OP5
Text GLabel 9150 1850 2    50   Input ~ 0
OP4
Text GLabel 9150 2050 2    50   Input ~ 0
OP3
Text GLabel 9150 2250 2    50   Input ~ 0
OP2
Text GLabel 9150 2450 2    50   Input ~ 0
OP1
Text GLabel 9150 3350 2    50   Input ~ 0
DBUS6
Text GLabel 8650 3650 0    50   Input ~ 0
RDM
Text GLabel 8650 3550 0    50   Input ~ 0
WRM
Text GLabel 8650 3350 0    50   Input ~ 0
XLIN_DBUS
Text GLabel 9150 3150 2    50   Input ~ 0
WRF
Text GLabel 9150 4450 2    50   Input ~ 0
S0
Text GLabel 9150 4250 2    50   Input ~ 0
S1
Text GLabel 9400 4350 2    50   Input ~ 0
~S0
Text GLabel 9400 4150 2    50   Input ~ 0
~S1
Text GLabel 9350 3950 2    50   Input ~ 0
~S2
Text GLabel 9350 3750 2    50   Input ~ 0
~S3
Wire Wire Line
	9150 3950 9350 3950
Wire Wire Line
	9350 3750 9150 3750
Text GLabel 9400 1750 2    50   Input ~ 0
~OP4
Text GLabel 9550 1550 2    50   Input ~ 0
~OP5
Wire Wire Line
	9400 1750 9150 1750
Text GLabel 9150 3050 2    50   Input ~ 0
FOUT
Text GLabel 8650 3850 0    50   Input ~ 0
INCP_DB
Text GLabel 8650 3050 0    50   Input ~ 0
~DEP_SW
Text Notes 9500 1200 0    50   ~ 0
Upper-Left\n(high bits)
Text Notes 7900 1250 0    50   ~ 0
Lower-Left\n(high bits)
Wire Wire Line
	9150 4150 9400 4150
Wire Wire Line
	9150 4350 9400 4350
Text GLabel 8650 4450 0    50   Input ~ 0
INCP_CLK
Wire Wire Line
	9150 1550 9550 1550
Text GLabel 9450 2950 2    50   Input ~ 0
~F
Text GLabel 8650 4050 0    50   Input ~ 0
WS
Text GLabel 8650 3950 0    50   Input ~ 0
RUN
Text GLabel 8650 1550 0    50   Input ~ 0
~ALU_COUT
Text Notes 950  1850 0    50   ~ 0
State FF Assignments:\n - S0 - Clock divider (CDIV)\n - S1 - S0\n - S2 - S1\n - S3 - S2\n - S4 - S3\n - S5 - F\n - S6 - OP0\n - S7 - OP1\n - S8 - OP2\n - S9 - OP3\n - S10 - OP4\n - S11 - OP5
Wire Wire Line
	8200 4350 8650 4350
Wire Wire Line
	9450 2950 9150 2950
$Comp
L Connector_Generic:Conn_02x32_Odd_Even J1
U 1 1 5F75FE77
P 8850 3050
F 0 "J1" H 8900 1225 50  0000 C CNN
F 1 "Conn_02x32_Odd_Even" H 8900 1316 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x32_P2.54mm_Horizontal" H 8850 3050 50  0001 C CNN
F 3 "~" H 8850 3050 50  0001 C CNN
	1    8850 3050
	1    0    0    1   
$EndComp
NoConn ~ 9150 2150
NoConn ~ 9150 2350
NoConn ~ 9150 2550
NoConn ~ 9150 2650
NoConn ~ 9150 2850
NoConn ~ 9150 4050
NoConn ~ 9150 3850
NoConn ~ 8650 1650
NoConn ~ 8650 2350
NoConn ~ 8650 2650
NoConn ~ 8650 2750
NoConn ~ 8650 2950
NoConn ~ 8650 3150
NoConn ~ 9150 3250
NoConn ~ 9150 3450
NoConn ~ 9150 3550
NoConn ~ 9150 3650
NoConn ~ 8650 3750
NoConn ~ 8650 4150
Text GLabel 9400 1950 2    50   Input ~ 0
~OP3
Wire Wire Line
	9400 1950 9150 1950
NoConn ~ 8650 3450
Text GLabel 8650 2850 0    50   Input ~ 0
~X0
$EndSCHEMATC
