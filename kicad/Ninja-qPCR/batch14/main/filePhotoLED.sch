EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 10
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
	4100 2350 4000 2350
Text GLabel 4100 2350 2    50   Input ~ 0
GNDD
$Comp
L Ninja-qPCR:MCP4551T-104 U6
U 1 1 60AF8D29
P 2350 2050
F 0 "U6" H 3150 2437 60  0000 C CNN
F 1 "MCP4551T-503E/MS" H 3150 2331 60  0000 C CNN
F 2 "Ninja-qPCR:MCP4551T-104E&slash_MF" H 3150 2290 60  0001 C CNN
F 3 "" H 2350 2050 60  0000 C CNN
	1    2350 2050
	1    0    0    -1  
$EndComp
Text GLabel 1550 5800 0    50   Input ~ 0
3V3D
Text GLabel 1550 6250 0    50   Input ~ 0
GNDD
Text GLabel 2550 6250 0    50   Input ~ 0
GNDL
Text GLabel 2550 5800 0    50   Input ~ 0
VCC_LED
$Comp
L Device:C C10
U 1 1 60AF8D51
P 1700 6050
F 0 "C10" H 1815 6096 50  0000 L CNN
F 1 "0.1uF" H 1815 6005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1738 5900 50  0001 C CNN
F 3 "~" H 1700 6050 50  0001 C CNN
	1    1700 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 60AF8D57
P 2700 6050
F 0 "C11" H 2815 6096 50  0000 L CNN
F 1 "0.1uF" H 2815 6005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2738 5900 50  0001 C CNN
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
Text GLabel 5850 1550 0    50   Input ~ 0
I2C_SCL
Text GLabel 5850 1450 0    50   Input ~ 0
I2C_SDA
Text GLabel 7000 2750 2    50   Input ~ 0
N_LED_OUT1
Text GLabel 7000 2650 2    50   Input ~ 0
N_LED_OUT2
Text GLabel 7000 2550 2    50   Input ~ 0
N_LED_OUT3
Text GLabel 7000 2450 2    50   Input ~ 0
N_LED_OUT4
Text GLabel 7000 2050 2    50   Input ~ 0
N_LED_OUT5
Text GLabel 7000 2150 2    50   Input ~ 0
N_LED_OUT6
Text GLabel 7000 2250 2    50   Input ~ 0
N_LED_OUT7
Text GLabel 7000 1750 2    50   Input ~ 0
S_LED_OUT2
Text GLabel 7000 1850 2    50   Input ~ 0
S_LED_OUT3
Text HLabel 5850 1950 0    50   Input ~ 0
LED_IREF
Text GLabel 5850 2450 0    50   Input ~ 0
GNDD
Text GLabel 5850 1250 0    50   Input ~ 0
3V3D
$Comp
L Ninja-qPCR:PCA9955B U7
U 1 1 60C002FE
P 6150 1250
F 0 "U7" H 6450 1475 50  0000 C CNN
F 1 "PCA9955B" H 6450 1384 50  0000 C CNN
F 2 "Ninja-qPCR:PCA9955B" H 6150 1050 50  0001 C CNN
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
	5850 1950 6050 1950
$Comp
L Device:R R16
U 1 1 60C38304
P 5150 1750
F 0 "R16" V 4943 1750 50  0000 C CNN
F 1 "47k" V 5034 1750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5080 1750 50  0001 C CNN
F 3 "~" H 5150 1750 50  0001 C CNN
	1    5150 1750
	0    1    1    0   
$EndComp
Text GLabel 4800 1750 0    50   Input ~ 0
3V3D
Wire Wire Line
	5000 1750 4800 1750
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
Wire Wire Line
	5300 1750 6050 1750
Text GLabel 7000 1250 2    50   Input ~ 0
S_LED_OUT8
Text GLabel 7000 1350 2    50   Input ~ 0
S_LED_OUT7
Text GLabel 7000 1450 2    50   Input ~ 0
S_LED_OUT6
Text GLabel 7000 1550 2    50   Input ~ 0
S_LED_OUT5
Text GLabel 7000 2350 2    50   Input ~ 0
N_LED_OUT8
Text GLabel 7000 1950 2    50   Input ~ 0
S_LED_OUT4
Text GLabel 2550 6600 0    50   Input ~ 0
GNDL
Text GLabel 2800 6600 2    50   Input ~ 0
GNDD
Wire Wire Line
	2550 6600 2800 6600
Text GLabel 5850 1650 0    50   Input ~ 0
PD_REF_PWM
Wire Wire Line
	3950 2250 4000 2250
Wire Wire Line
	4000 2250 4000 2350
Connection ~ 4000 2350
Wire Wire Line
	4000 2350 3950 2350
Text GLabel 7000 1650 2    50   Input ~ 0
S_LED_OUT1
$EndSCHEMATC
