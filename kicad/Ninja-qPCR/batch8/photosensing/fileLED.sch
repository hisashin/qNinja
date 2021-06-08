EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
	2350 2950 2200 2950
Wire Wire Line
	2350 2650 2200 2650
Wire Wire Line
	2350 2550 2200 2550
Wire Wire Line
	2350 2450 2200 2450
Wire Wire Line
	2350 2350 2200 2350
Wire Wire Line
	2350 2150 2200 2150
Wire Wire Line
	2350 2050 2200 2050
Text GLabel 2200 2450 0    50   Input ~ 0
GNDD
Text HLabel 2200 2550 0    50   Input ~ 0
LED_IREF
Text GLabel 2200 2350 0    50   Input ~ 0
3V3D
Text GLabel 2200 2050 0    50   Input ~ 0
3V3D
Text GLabel 2200 2150 0    50   Input ~ 0
I2C_SCL
Text GLabel 2200 2650 0    50   Input ~ 0
I2C_SDA
Text GLabel 2200 2950 0    50   Input ~ 0
3V3D
Wire Wire Line
	4100 2350 3950 2350
Text GLabel 4100 2350 2    50   Input ~ 0
GNDD
$Comp
L Ninja-qPCR:MCP4551T-502E_MS U8
U 1 1 60AF8D29
P 2350 2050
F 0 "U8" H 3150 2437 60  0000 C CNN
F 1 "MCP4551T-502E_MS" H 3150 2331 60  0000 C CNN
F 2 "Ninja-qPCR:MCP4551T-502E&slash_MS" H 3150 2290 60  0001 C CNN
F 3 "" H 2350 2050 60  0000 C CNN
	1    2350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4250 2400 4250
Wire Wire Line
	3050 4450 2400 4450
Wire Wire Line
	3400 4700 3200 4700
Wire Wire Line
	1550 4450 1600 4450
Connection ~ 1550 4450
Wire Wire Line
	1550 4950 1550 4450
Wire Wire Line
	3050 4950 1550 4950
Wire Wire Line
	1450 4450 1550 4450
Wire Wire Line
	1450 4250 1600 4250
$Comp
L Jumper:Jumper_3_Open JP3
U 1 1 60AF8D39
P 3050 4700
F 0 "JP3" V 3096 4787 50  0000 L CNN
F 1 "Jumper_3_Open" V 3005 4787 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P2.0mm_Open_TrianglePad1.0x1.5mm" H 3050 4700 50  0001 C CNN
F 3 "~" H 3050 4700 50  0001 C CNN
	1    3050 4700
	0    -1   -1   0   
$EndComp
Text GLabel 1450 4250 0    50   Input ~ 0
3V3D
NoConn ~ 2600 4250
Text GLabel 2500 4650 2    50   Input ~ 0
GNDD
$Comp
L Ninja-qPCR:SN74LVC1G04DBVR U7
U 1 1 60AF8D47
P 2000 4450
F 0 "U7" H 2000 4917 50  0000 C CNN
F 1 "SN74LVC1G04DBVR" H 2000 4826 50  0000 C CNN
F 2 "Ninja-qPCR:SN74LVC1G04DBVR" H 2000 4450 50  0001 L BNN
F 3 "IPC-7351B" H 2000 4450 50  0001 L BNN
F 4 "1.45mm" H 2000 4450 50  0001 L BNN "Field4"
F 5 "AD" H 2000 4450 50  0001 L BNN "Field5"
F 6 "Texas Instruments" H 2000 4450 50  0001 L BNN "Field6"
	1    2000 4450
	1    0    0    -1  
$EndComp
Text GLabel 1550 5800 0    50   Input ~ 0
3V3D
Text GLabel 1550 6250 0    50   Input ~ 0
GNDD
Text GLabel 2550 6250 0    50   Input ~ 0
GNDD
Text GLabel 2550 5800 0    50   Input ~ 0
VCC_LED
$Comp
L Device:C C22
U 1 1 60AF8D51
P 1700 6050
F 0 "C22" H 1815 6096 50  0000 L CNN
F 1 "0.1uF?" H 1815 6005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1738 5900 50  0001 C CNN
F 3 "~" H 1700 6050 50  0001 C CNN
	1    1700 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 60AF8D57
P 2700 6050
F 0 "C23" H 2815 6096 50  0000 L CNN
F 1 "0.1uF?" H 2815 6005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2738 5900 50  0001 C CNN
F 3 "~" H 2700 6050 50  0001 C CNN
	1    2700 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6250 1700 6250
Wire Wire Line
	1700 6250 1700 6200
Wire Wire Line
	1700 5900 1700 5800
Wire Wire Line
	1700 5800 1550 5800
Wire Wire Line
	2550 6250 2700 6250
Wire Wire Line
	2700 6250 2700 6200
Wire Wire Line
	2550 5800 2700 5800
Wire Wire Line
	2700 5800 2700 5900
Text GLabel 1450 4450 0    50   Input ~ 0
PD_REF_PWM
Text HLabel 3400 4700 2    50   Input ~ 0
LED_BLANK
$Comp
L Connector:Conn_01x10_Male J?
U 1 1 60BF3ECD
P 9750 1650
F 0 "J?" H 9722 1624 50  0000 R CNN
F 1 "Conn_01x10_Male" H 9722 1533 50  0000 R CNN
F 2 "" H 9750 1650 50  0001 C CNN
F 3 "~" H 9750 1650 50  0001 C CNN
	1    9750 1650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J?
U 1 1 60BFD371
P 9750 2850
F 0 "J?" H 9722 2824 50  0000 R CNN
F 1 "Conn_01x10_Male" H 9722 2733 50  0000 R CNN
F 2 "" H 9750 2850 50  0001 C CNN
F 3 "~" H 9750 2850 50  0001 C CNN
	1    9750 2850
	-1   0    0    -1  
$EndComp
Text GLabel 9250 1450 0    50   Input ~ 0
N_LED_OUT1
Text GLabel 9250 1550 0    50   Input ~ 0
N_LED_OUT2
Text GLabel 9250 1650 0    50   Input ~ 0
N_LED_OUT3
Text GLabel 9250 1750 0    50   Input ~ 0
N_LED_OUT4
Text GLabel 9250 1850 0    50   Input ~ 0
N_LED_OUT5
Text GLabel 9250 1950 0    50   Input ~ 0
N_LED_OUT6
Text GLabel 9250 2050 0    50   Input ~ 0
N_LED_OUT7
Text GLabel 9250 2150 0    50   Input ~ 0
N_LED_OUT8
Text GLabel 9250 2650 0    50   Input ~ 0
S_LED_OUT1
Text GLabel 9250 2750 0    50   Input ~ 0
S_LED_OUT2
Text GLabel 9250 2850 0    50   Input ~ 0
S_LED_OUT3
Text GLabel 9250 2950 0    50   Input ~ 0
S_LED_OUT4
Text GLabel 9250 3050 0    50   Input ~ 0
S_LED_OUT5
Text GLabel 9250 3150 0    50   Input ~ 0
S_LED_OUT6
Text GLabel 9250 3250 0    50   Input ~ 0
S_LED_OUT7
Text GLabel 9250 3350 0    50   Input ~ 0
S_LED_OUT8
Wire Wire Line
	9250 2650 9550 2650
Wire Wire Line
	9550 2750 9250 2750
Wire Wire Line
	9250 2850 9550 2850
Wire Wire Line
	9550 2950 9250 2950
Wire Wire Line
	9550 3050 9250 3050
Wire Wire Line
	9550 3150 9250 3150
Wire Wire Line
	9550 3250 9250 3250
Wire Wire Line
	9550 3350 9250 3350
Wire Wire Line
	9550 2150 9250 2150
Wire Wire Line
	9550 2050 9250 2050
Wire Wire Line
	9550 1950 9250 1950
Wire Wire Line
	9550 1850 9250 1850
Wire Wire Line
	9550 1750 9250 1750
Wire Wire Line
	9550 1650 9250 1650
Wire Wire Line
	9550 1550 9250 1550
Wire Wire Line
	9550 1450 9250 1450
Text GLabel 9250 1350 0    50   Input ~ 0
VCC_LED
Text GLabel 9250 2550 0    50   Input ~ 0
VCC_LED
Text GLabel 9250 2450 0    50   Input ~ 0
GNDD
Text GLabel 9250 1250 0    50   Input ~ 0
GNDD
Wire Wire Line
	9250 1250 9550 1250
Wire Wire Line
	9250 1350 9550 1350
Wire Wire Line
	9250 2450 9550 2450
Wire Wire Line
	9250 2550 9550 2550
Wire Wire Line
	2500 4650 2400 4650
Text GLabel 5850 1550 0    50   Input ~ 0
I2C_SCL
Text GLabel 5850 1450 0    50   Input ~ 0
I2C_SDA
Text GLabel 7000 1250 2    50   Input ~ 0
N_LED_OUT1
Text GLabel 7000 1350 2    50   Input ~ 0
N_LED_OUT2
Text GLabel 7000 1450 2    50   Input ~ 0
N_LED_OUT3
Text GLabel 7000 1550 2    50   Input ~ 0
N_LED_OUT4
Text GLabel 7000 1650 2    50   Input ~ 0
N_LED_OUT5
Text GLabel 7000 1750 2    50   Input ~ 0
N_LED_OUT6
Text GLabel 7000 1850 2    50   Input ~ 0
N_LED_OUT7
Text GLabel 7000 1950 2    50   Input ~ 0
N_LED_OUT8
Text GLabel 7000 2050 2    50   Input ~ 0
S_LED_OUT1
Text GLabel 7000 2150 2    50   Input ~ 0
S_LED_OUT2
Text GLabel 7000 2250 2    50   Input ~ 0
S_LED_OUT3
Text GLabel 7000 2350 2    50   Input ~ 0
S_LED_OUT4
Text GLabel 7000 2450 2    50   Input ~ 0
S_LED_OUT5
Text GLabel 7000 2550 2    50   Input ~ 0
S_LED_OUT6
Text GLabel 7000 2650 2    50   Input ~ 0
S_LED_OUT7
Text GLabel 7000 2750 2    50   Input ~ 0
S_LED_OUT8
Text HLabel 5850 1650 0    50   Input ~ 0
LED_BLANK
Text HLabel 5850 1950 0    50   Input ~ 0
LED_IREF
Text GLabel 5850 2450 0    50   Input ~ 0
GNDD
Text GLabel 5850 1250 0    50   Input ~ 0
3V3D
$Comp
L Ninja-qPCR:PCA9955B U?
U 1 1 60C002FE
P 6150 1250
F 0 "U?" H 6450 1475 50  0000 C CNN
F 1 "PCA9955B" H 6450 1384 50  0000 C CNN
F 2 "" H 6150 1050 50  0001 C CNN
F 3 "" H 6150 1050 50  0001 C CNN
	1    6150 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1250 6850 1250
Wire Wire Line
	7000 1350 6850 1350
Wire Wire Line
	7000 1450 6850 1450
Wire Wire Line
	7000 1550 6850 1550
Wire Wire Line
	7000 1650 6850 1650
Wire Wire Line
	7000 1750 6850 1750
Wire Wire Line
	7000 1850 6850 1850
Wire Wire Line
	7000 1950 6850 1950
Wire Wire Line
	7000 2050 6850 2050
Wire Wire Line
	7000 2150 6850 2150
Wire Wire Line
	7000 2250 6850 2250
Wire Wire Line
	7000 2350 6850 2350
Wire Wire Line
	7000 2450 6850 2450
Wire Wire Line
	7000 2550 6850 2550
Wire Wire Line
	7000 2650 6850 2650
Wire Wire Line
	7000 2750 6850 2750
Wire Wire Line
	5850 2450 5950 2450
Wire Wire Line
	5950 2450 5950 2550
Wire Wire Line
	5950 2550 6050 2550
Connection ~ 5950 2450
Wire Wire Line
	5950 2450 6050 2450
Wire Wire Line
	5950 2550 5950 2650
Wire Wire Line
	5950 2650 6050 2650
Connection ~ 5950 2550
Wire Wire Line
	5950 2650 5950 2750
Wire Wire Line
	5950 2750 6050 2750
Connection ~ 5950 2650
Wire Wire Line
	5850 1250 6050 1250
Wire Wire Line
	5850 1450 6050 1450
Wire Wire Line
	5850 1550 6050 1550
Wire Wire Line
	5850 1650 6050 1650
Wire Wire Line
	5850 1750 6050 1750
Wire Wire Line
	5850 1950 6050 1950
$Comp
L Device:R R?
U 1 1 60C38304
P 5700 1750
F 0 "R?" V 5493 1750 50  0000 C CNN
F 1 "R" V 5584 1750 50  0000 C CNN
F 2 "" V 5630 1750 50  0001 C CNN
F 3 "~" H 5700 1750 50  0001 C CNN
	1    5700 1750
	0    1    1    0   
$EndComp
Text GLabel 5350 1750 0    50   Input ~ 0
3V3D
Wire Wire Line
	5550 1750 5350 1750
Wire Wire Line
	6050 2250 5950 2250
Wire Wire Line
	5950 2250 5950 2450
Text GLabel 5950 2050 0    50   Input ~ 0
3V3D
Wire Wire Line
	5950 2050 6050 2050
Wire Wire Line
	6050 2150 5950 2150
Wire Wire Line
	5950 2150 5950 2250
Connection ~ 5950 2250
$EndSCHEMATC
