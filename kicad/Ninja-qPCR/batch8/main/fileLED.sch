EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L Ninja-qPCR:TLC59281DBQR U10
U 1 1 60AF8C8F
P 5750 2050
F 0 "U10" H 6650 2437 60  0000 C CNN
F 1 "TLC59281DBQR" H 6650 2331 60  0000 C CNN
F 2 "Ninja-qPCR:TLC59281DBQR" H 6650 2290 60  0001 C CNN
F 3 "" H 5750 2050 60  0000 C CNN
	1    5750 2050
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:TLC59281DBQR U10
U 2 1 60AF8C95
P 6600 4500
F 0 "U10" H 7156 4887 60  0000 C CNN
F 1 "TLC59281DBQR" H 7156 4781 60  0000 C CNN
F 2 "Ninja-qPCR:TLC59281DBQR" H 7500 4740 60  0001 C CNN
F 3 "" H 6600 4500 60  0000 C CNN
	2    6600 4500
	1    0    0    -1  
$EndComp
Text GLabel 7750 2050 2    50   Input ~ 0
N_LED_OUT1
Text GLabel 7750 2150 2    50   Input ~ 0
N_LED_OUT2
Text GLabel 7750 2250 2    50   Input ~ 0
N_LED_OUT3
Text GLabel 7750 2350 2    50   Input ~ 0
N_LED_OUT4
Text GLabel 7750 2450 2    50   Input ~ 0
N_LED_OUT5
Text GLabel 7750 2550 2    50   Input ~ 0
N_LED_OUT6
Text GLabel 7750 2650 2    50   Input ~ 0
N_LED_OUT7
Text GLabel 7750 2750 2    50   Input ~ 0
N_LED_OUT8
Text GLabel 7750 2850 2    50   Input ~ 0
S_LED_OUT1
Text GLabel 7750 2950 2    50   Input ~ 0
S_LED_OUT2
Text GLabel 7750 3050 2    50   Input ~ 0
S_LED_OUT3
Text GLabel 7750 3150 2    50   Input ~ 0
S_LED_OUT4
Text GLabel 7750 3250 2    50   Input ~ 0
S_LED_OUT5
Text GLabel 7750 3350 2    50   Input ~ 0
S_LED_OUT6
Text GLabel 7750 3450 2    50   Input ~ 0
S_LED_OUT7
Text GLabel 7750 3550 2    50   Input ~ 0
S_LED_OUT8
Text GLabel 7750 3650 2    50   Input ~ 0
SPI_MISO
Text GLabel 5550 2150 0    50   Input ~ 0
LED_LAT
Text GLabel 5550 2050 0    50   Input ~ 0
LED_BLANK
Wire Wire Line
	5750 2050 5550 2050
Wire Wire Line
	5750 2150 5550 2150
Wire Wire Line
	5750 2250 5550 2250
Wire Wire Line
	5750 2350 5550 2350
Wire Wire Line
	5750 2550 5550 2550
Wire Wire Line
	7550 2050 7750 2050
Wire Wire Line
	7550 2150 7750 2150
Wire Wire Line
	7550 2250 7750 2250
Wire Wire Line
	7550 2350 7750 2350
Wire Wire Line
	7550 2450 7750 2450
Wire Wire Line
	7550 2550 7750 2550
Wire Wire Line
	7550 2650 7750 2650
Wire Wire Line
	7550 2750 7750 2750
Wire Wire Line
	7550 2850 7750 2850
Wire Wire Line
	7550 2950 7750 2950
Wire Wire Line
	7550 3050 7750 3050
Wire Wire Line
	7550 3150 7750 3150
Wire Wire Line
	7550 3250 7750 3250
Wire Wire Line
	7550 3350 7750 3350
Wire Wire Line
	7550 3450 7750 3450
Wire Wire Line
	7550 3550 7750 3550
Wire Wire Line
	7550 3650 7750 3650
Text GLabel 6250 4500 0    50   Input ~ 0
GND
Text GLabel 6250 5000 0    50   Input ~ 0
VCC_LOGIC
Wire Wire Line
	6250 5000 6600 5000
Wire Wire Line
	6250 4500 6600 4500
Wire Wire Line
	9550 2850 9350 2850
Wire Wire Line
	9550 2750 9350 2750
Wire Wire Line
	9550 2650 9350 2650
Wire Wire Line
	9550 2550 9350 2550
Wire Wire Line
	9550 2450 9350 2450
Wire Wire Line
	9550 2350 9350 2350
Wire Wire Line
	9550 2250 9350 2250
Wire Wire Line
	9550 2150 9350 2150
Wire Wire Line
	9550 2050 9350 2050
Text GLabel 9350 2850 0    50   Input ~ 0
N_LED_OUT2
Text GLabel 9350 2750 0    50   Input ~ 0
N_LED_OUT1
Text GLabel 9350 2650 0    50   Input ~ 0
N_LED_OUT4
Text GLabel 9350 2550 0    50   Input ~ 0
N_LED_OUT3
Text GLabel 9350 2450 0    50   Input ~ 0
N_LED_OUT7
Text GLabel 9350 2350 0    50   Input ~ 0
N_LED_OUT8
Text GLabel 9350 2250 0    50   Input ~ 0
N_LED_OUT6
Text GLabel 9350 2150 0    50   Input ~ 0
VCC_LED
Text GLabel 9350 2050 0    50   Input ~ 0
GND
Wire Wire Line
	9550 1950 9350 1950
Text GLabel 9350 1950 0    50   Input ~ 0
N_LED_OUT5
$Comp
L Ninja-qPCR:Conn_02x05 LEDN1
U 1 1 60AF8CDE
P 9750 1950
F 0 "LEDN1" H 10069 1561 50  0000 L CNN
F 1 "Conn_02x05" H 10069 1470 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 9550 2050 50  0001 C CNN
F 3 "" H 9550 2050 50  0001 C CNN
	1    9750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 4250 9350 4250
Wire Wire Line
	9550 4150 9350 4150
Wire Wire Line
	9550 4050 9350 4050
Wire Wire Line
	9550 3950 9350 3950
Wire Wire Line
	9550 3850 9350 3850
Wire Wire Line
	9550 3750 9350 3750
Wire Wire Line
	9550 3650 9350 3650
Wire Wire Line
	9550 3550 9350 3550
Wire Wire Line
	9550 3450 9350 3450
Text GLabel 9350 4250 0    50   Input ~ 0
S_LED_OUT2
Text GLabel 9350 4150 0    50   Input ~ 0
S_LED_OUT1
Text GLabel 9350 4050 0    50   Input ~ 0
S_LED_OUT4
Text GLabel 9350 3950 0    50   Input ~ 0
S_LED_OUT3
Text GLabel 9350 3850 0    50   Input ~ 0
S_LED_OUT7
Text GLabel 9350 3750 0    50   Input ~ 0
S_LED_OUT8
Text GLabel 9350 3650 0    50   Input ~ 0
S_LED_OUT6
Text GLabel 9350 3550 0    50   Input ~ 0
VCC_LED
Text GLabel 9350 3450 0    50   Input ~ 0
GND
Wire Wire Line
	9550 3350 9350 3350
Text GLabel 9350 3350 0    50   Input ~ 0
S_LED_OUT5
$Comp
L Ninja-qPCR:Conn_02x05 LEDS1
U 1 1 60AF8CF8
P 9750 3350
F 0 "LEDS1" H 10069 2961 50  0000 L CNN
F 1 "Conn_02x05" H 10069 2870 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 9550 3450 50  0001 C CNN
F 3 "" H 9550 3450 50  0001 C CNN
	1    9750 3350
	1    0    0    -1  
$EndComp
Text GLabel 2200 5750 2    50   Input ~ 0
VCC_LOGIC
Text HLabel 5550 2550 0    50   Input ~ 0
LED_IREF
Text GLabel 2200 5850 2    50   Input ~ 0
VCC_LED
Wire Wire Line
	2650 3100 2500 3100
Wire Wire Line
	2650 2800 2500 2800
Wire Wire Line
	2650 2700 2500 2700
Wire Wire Line
	2650 2600 2500 2600
Wire Wire Line
	2650 2500 2500 2500
Wire Wire Line
	2650 2300 2500 2300
Wire Wire Line
	2650 2200 2500 2200
Text GLabel 2500 2600 0    50   Input ~ 0
GND
Text HLabel 2500 2700 0    50   Input ~ 0
LED_IREF
Text GLabel 2500 2500 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2500 2200 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2500 2300 0    50   Input ~ 0
I2C_SCL
Text GLabel 2500 2800 0    50   Input ~ 0
I2C_SDA
Text GLabel 2500 3100 0    50   Input ~ 0
VCC_LOGIC
Wire Wire Line
	4400 2500 4250 2500
Text GLabel 4400 2500 2    50   Input ~ 0
GND
$Comp
L Ninja-qPCR:MCP4551T-502E_MS U9
U 1 1 60AF8D29
P 2650 2200
F 0 "U9" H 3450 2587 60  0000 C CNN
F 1 "MCP4551T-502E_MS" H 3450 2481 60  0000 C CNN
F 2 "Ninja-qPCR:MCP4551T-502E&slash_MS" H 3450 2440 60  0001 C CNN
F 3 "" H 2650 2200 60  0000 C CNN
	1    2650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4800 2900 4800
Wire Wire Line
	2900 4400 2700 4400
Wire Wire Line
	3350 4600 2700 4600
Wire Wire Line
	3700 4850 3500 4850
Wire Wire Line
	1850 4600 1900 4600
Connection ~ 1850 4600
Wire Wire Line
	1850 5100 1850 4600
Wire Wire Line
	3350 5100 1850 5100
Wire Wire Line
	1750 4600 1850 4600
Wire Wire Line
	1750 4400 1900 4400
$Comp
L Jumper:Jumper_3_Open JP3
U 1 1 60AF8D39
P 3350 4850
F 0 "JP3" V 3396 4937 50  0000 L CNN
F 1 "Jumper_3_Open" V 3305 4937 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P2.0mm_Open_TrianglePad1.0x1.5mm" H 3350 4850 50  0001 C CNN
F 3 "~" H 3350 4850 50  0001 C CNN
	1    3350 4850
	0    -1   -1   0   
$EndComp
Text GLabel 1750 4400 0    50   Input ~ 0
VCC_LOGIC
NoConn ~ 2900 4400
Text GLabel 2900 4800 2    50   Input ~ 0
GND
Text GLabel 3700 4850 2    50   Input ~ 0
LED_BLANK
$Comp
L Ninja-qPCR:SN74LVC1G04DBVR U8
U 1 1 60AF8D47
P 2300 4600
F 0 "U8" H 2300 5067 50  0000 C CNN
F 1 "SN74LVC1G04DBVR" H 2300 4976 50  0000 C CNN
F 2 "Ninja-qPCR:SN74LVC1G04DBVR" H 2300 4600 50  0001 L BNN
F 3 "IPC-7351B" H 2300 4600 50  0001 L BNN
F 4 "1.45mm" H 2300 4600 50  0001 L BNN "Field4"
F 5 "AD" H 2300 4600 50  0001 L BNN "Field5"
F 6 "Texas Instruments" H 2300 4600 50  0001 L BNN "Field6"
	1    2300 4600
	1    0    0    -1  
$EndComp
Text GLabel 3800 3600 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 3800 4050 0    50   Input ~ 0
GND
Text GLabel 4800 4050 0    50   Input ~ 0
GND
Text GLabel 4800 3600 0    50   Input ~ 0
VCC_LED
$Comp
L Device:C C22
U 1 1 60AF8D51
P 3950 3850
F 0 "C22" H 4065 3896 50  0000 L CNN
F 1 "0.1uF?" H 4065 3805 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3988 3700 50  0001 C CNN
F 3 "~" H 3950 3850 50  0001 C CNN
	1    3950 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 60AF8D57
P 4950 3850
F 0 "C23" H 5065 3896 50  0000 L CNN
F 1 "0.1uF?" H 5065 3805 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4988 3700 50  0001 C CNN
F 3 "~" H 4950 3850 50  0001 C CNN
	1    4950 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4050 3950 4050
Wire Wire Line
	3950 4050 3950 4000
Wire Wire Line
	3950 3700 3950 3600
Wire Wire Line
	3950 3600 3800 3600
Wire Wire Line
	4800 4050 4950 4050
Wire Wire Line
	4950 4050 4950 4000
Wire Wire Line
	4800 3600 4950 3600
Wire Wire Line
	4950 3600 4950 3700
Text GLabel 1750 4600 0    50   Input ~ 0
PD_REF_PWM
Wire Wire Line
	1950 5750 2200 5750
Wire Wire Line
	1950 5850 2200 5850
Text GLabel 1950 5850 0    50   Input ~ 0
5V_UPS
Text GLabel 5550 2350 0    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 5550 2250 0    50   Input ~ 0
SPI_SCLK
Text GLabel 1950 5750 0    50   Input ~ 0
3V3D
$EndSCHEMATC
