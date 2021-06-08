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
S 700  6550 1300 900 
U 60AC8F91
F0 "Power" 50
F1 "filePower.sch" 50
$EndSheet
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J1
U 1 1 60AF82D8
P 2400 2400
AR Path="/60AF82D8" Ref="J1"  Part="1" 
AR Path="/60AEA148/60AF82D8" Ref="J?"  Part="1" 
AR Path="/60AC8F63/60AF82D8" Ref="J?"  Part="1" 
F 0 "J1" H 2400 3615 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 2400 3524 50  0000 C CNN
F 2 "Ninja-qPCR:Raspberry_Pi_3A+_3B+_4B_Zero_FaceDown" H 1950 1350 50  0001 C CNN
F 3 "" H 1950 1350 50  0001 C CNN
	1    2400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1450 1700 1450
Wire Wire Line
	1550 2250 1700 2250
Text GLabel 1550 2650 0    50   Input ~ 0
GND
Wire Wire Line
	1550 2650 1700 2650
Text GLabel 1550 3350 0    50   Input ~ 0
GND
Wire Wire Line
	1550 3350 1700 3350
Text GLabel 3250 1650 2    50   Input ~ 0
GND
Text GLabel 3250 2850 2    50   Input ~ 0
GND
Text GLabel 3250 2350 2    50   Input ~ 0
GND
Text GLabel 3250 3050 2    50   Input ~ 0
GND
Wire Wire Line
	3250 3050 3100 3050
Wire Wire Line
	3250 2350 3100 2350
Wire Wire Line
	3250 2050 3100 2050
Wire Wire Line
	3100 1650 3250 1650
Text HLabel 1550 2050 0    50   Input ~ 0
LID_HEATER
Wire Wire Line
	1550 2050 1700 2050
Text GLabel 1550 1650 0    50   Input ~ 0
I2C_SCL
Text GLabel 1550 1550 0    50   Input ~ 0
I2C_SDA
Wire Wire Line
	1550 1550 1700 1550
Wire Wire Line
	1700 1650 1550 1650
Wire Wire Line
	1550 1750 1700 1750
Wire Wire Line
	1700 2850 1550 2850
Text HLabel 1550 3050 0    50   Input ~ 0
WELL_HEATER
Wire Wire Line
	1550 3050 1700 3050
Wire Wire Line
	3250 2150 3100 2150
Wire Wire Line
	1700 2150 1550 2150
Wire Wire Line
	3250 2850 3100 2850
Text HLabel 3250 2550 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	3250 2450 3100 2450
Wire Wire Line
	3250 2950 3100 2950
Wire Wire Line
	1550 3250 1700 3250
Text GLabel 1550 1850 0    50   Input ~ 0
GND
Wire Wire Line
	1550 1850 1700 1850
Wire Wire Line
	1550 1950 1700 1950
Text GLabel 3250 2050 2    50   Input ~ 0
GND
Wire Wire Line
	3250 2750 3100 2750
Wire Wire Line
	1550 3150 1700 3150
Wire Wire Line
	3250 2250 3100 2250
Text GLabel 3250 1750 2    50   Input ~ 0
MUX_S3
Text GLabel 3250 1850 2    50   Input ~ 0
MUX_S2
Wire Wire Line
	3250 1750 3100 1750
Wire Wire Line
	3100 1850 3250 1850
Wire Wire Line
	3250 1950 3100 1950
Text GLabel 3250 2450 2    50   Input ~ 0
MUX_SELECT
Wire Wire Line
	3250 2550 3100 2550
Wire Wire Line
	1700 2950 1550 2950
Text GLabel 3250 2250 2    50   Input ~ 0
SPI_SWITCH
Wire Wire Line
	3100 1450 3200 1450
Wire Wire Line
	3100 1550 3200 1550
Wire Wire Line
	3200 1550 3200 1450
Connection ~ 3200 1450
Wire Wire Line
	3200 1450 3250 1450
Text HLabel 1550 1450 0    50   Input ~ 0
3V3_RASP
Text GLabel 3250 1450 2    50   Input ~ 0
5V_UPS
$Comp
L Device:R R2
U 1 1 60AF834B
P 1950 6050
AR Path="/60AF834B" Ref="R2"  Part="1" 
AR Path="/5F7519D0/60AF834B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF834B" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF834B" Ref="R?"  Part="1" 
F 0 "R2" V 1743 6050 50  0000 C CNN
F 1 "10k" V 1834 6050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1880 6050 50  0001 C CNN
F 3 "~" H 1950 6050 50  0001 C CNN
	1    1950 6050
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 60AF8351
P 1500 5800
AR Path="/60AF8351" Ref="R1"  Part="1" 
AR Path="/5F7519D0/60AF8351" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8351" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8351" Ref="R?"  Part="1" 
F 0 "R1" V 1293 5800 50  0000 C CNN
F 1 "1k" V 1384 5800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1430 5800 50  0001 C CNN
F 3 "~" H 1500 5800 50  0001 C CNN
	1    1500 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 5800 1700 5800
Wire Wire Line
	1800 6050 1700 6050
Wire Wire Line
	1700 6050 1700 5800
Connection ~ 1700 5800
Wire Wire Line
	1700 5800 1650 5800
$Comp
L power:GND #PWR01
U 1 1 60AF835C
P 2350 6150
AR Path="/60AF835C" Ref="#PWR01"  Part="1" 
AR Path="/5F7519D0/60AF835C" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF835C" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF835C" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 2350 5900 50  0001 C CNN
F 1 "GND" H 2355 5977 50  0000 C CNN
F 2 "" H 2350 6150 50  0001 C CNN
F 3 "" H 2350 6150 50  0001 C CNN
	1    2350 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6150 2350 6050
Wire Wire Line
	2100 6050 2350 6050
Connection ~ 2350 6050
Wire Wire Line
	2350 6050 2350 6000
Text HLabel 1200 5800 0    50   Input ~ 0
LID_HEATER
Wire Wire Line
	1200 5800 1350 5800
$Comp
L Device:Q_NMOS_GSD Q1
U 1 1 60AF8368
P 2250 5800
AR Path="/60AF8368" Ref="Q1"  Part="1" 
AR Path="/5F7519D0/60AF8368" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8368" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8368" Ref="Q?"  Part="1" 
F 0 "Q1" H 2454 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2454 5755 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2450 5900 50  0001 C CNN
F 3 "~" H 2250 5800 50  0001 C CNN
	1    2250 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 60AF83E3
P 4000 6050
AR Path="/60AF83E3" Ref="R4"  Part="1" 
AR Path="/5F7519D0/60AF83E3" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E3" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E3" Ref="R?"  Part="1" 
F 0 "R4" V 3793 6050 50  0000 C CNN
F 1 "10k" V 3884 6050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3930 6050 50  0001 C CNN
F 3 "~" H 4000 6050 50  0001 C CNN
	1    4000 6050
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 60AF83E9
P 3550 5800
AR Path="/60AF83E9" Ref="R3"  Part="1" 
AR Path="/5F7519D0/60AF83E9" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E9" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E9" Ref="R?"  Part="1" 
F 0 "R3" V 3343 5800 50  0000 C CNN
F 1 "1k" V 3434 5800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3480 5800 50  0001 C CNN
F 3 "~" H 3550 5800 50  0001 C CNN
	1    3550 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 5800 3750 5800
Wire Wire Line
	3850 6050 3750 6050
Wire Wire Line
	3750 6050 3750 5800
Connection ~ 3750 5800
Wire Wire Line
	3750 5800 3700 5800
$Comp
L power:GND #PWR03
U 1 1 60AF83F4
P 4400 6150
AR Path="/60AF83F4" Ref="#PWR03"  Part="1" 
AR Path="/5F7519D0/60AF83F4" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF83F4" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF83F4" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 4400 5900 50  0001 C CNN
F 1 "GND" H 4405 5977 50  0000 C CNN
F 2 "" H 4400 6150 50  0001 C CNN
F 3 "" H 4400 6150 50  0001 C CNN
	1    4400 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 6150 4400 6050
Wire Wire Line
	4150 6050 4400 6050
Connection ~ 4400 6050
Wire Wire Line
	4400 6050 4400 6000
Wire Wire Line
	3250 5800 3400 5800
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 60AF8400
P 4300 5800
AR Path="/60AF8400" Ref="Q2"  Part="1" 
AR Path="/5F7519D0/60AF8400" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8400" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8400" Ref="Q?"  Part="1" 
F 0 "Q2" H 4504 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4504 5755 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 4500 5900 50  0001 C CNN
F 3 "~" H 4300 5800 50  0001 C CNN
	1    4300 5800
	1    0    0    -1  
$EndComp
Text GLabel 1550 1750 0    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 3250 2650 2    50   Input ~ 0
THERM_R_SWITCH
Text Notes 1150 1400 0    50   ~ 0
Max 50mA
Text GLabel 3250 2150 2    50   Input ~ 0
MUX_S0
Text GLabel 3250 1950 2    50   Input ~ 0
MUX_S1
Text HLabel 1550 2250 0    50   Input ~ 0
3V3_RASP
$Sheet
S 4900 6550 1150 900 
U 60B81B0D
F0 "SheetSupercap" 50
F1 "fileSupercap.sch" 50
$EndSheet
$Comp
L Connector:Screw_Terminal_01x02 HLID?
U 1 1 60BAF2C5
P 2550 5400
AR Path="/60B6F672/60BAF2C5" Ref="HLID?"  Part="1" 
AR Path="/60BAF2C5" Ref="HLID1"  Part="1" 
F 0 "HLID1" H 2750 5400 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3050 5300 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 2550 5400 50  0001 C CNN
F 3 "~" H 2550 5400 50  0001 C CNN
	1    2550 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5400 2350 5400
Text GLabel 2100 5400 0    50   Input ~ 0
12V
Text GLabel 10000 5050 0    50   Input ~ 0
3V3D
Wire Wire Line
	10150 6250 10000 6250
Wire Wire Line
	10150 6150 10000 6150
Wire Wire Line
	10150 6050 10000 6050
Wire Wire Line
	10150 5950 10000 5950
Wire Wire Line
	10150 5750 10000 5750
Wire Wire Line
	10150 5650 10000 5650
Wire Wire Line
	10150 5550 10000 5550
Wire Wire Line
	10150 5450 10000 5450
Wire Wire Line
	10150 5350 10000 5350
Wire Wire Line
	10150 5250 10000 5250
Wire Wire Line
	10150 5050 10000 5050
Wire Wire Line
	10150 4950 10000 4950
Text GLabel 10000 6250 0    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 10000 5250 0    50   Input ~ 0
3V3A
Text GLabel 10000 6050 0    50   Input ~ 0
I2C_SDA
Text GLabel 10000 5950 0    50   Input ~ 0
I2C_SCL
Text GLabel 10000 5850 0    50   Input ~ 0
ADC_DRDY
Text GLabel 10000 5750 0    50   Input ~ 0
MUX_SELECT
Text GLabel 10000 5550 0    50   Input ~ 0
MUX_S1
Text GLabel 10000 5650 0    50   Input ~ 0
MUX_S0
Text GLabel 10000 5450 0    50   Input ~ 0
MUX_S2
Text GLabel 10000 5350 0    50   Input ~ 0
MUX_S3
Text GLabel 10000 4950 0    50   Input ~ 0
GND
Text Notes 9550 6500 0    50   ~ 0
To Photosensing Board
Wire Wire Line
	2350 5500 2350 5600
Text HLabel 3250 5800 0    50   Input ~ 0
FAN
Text HLabel 1550 2850 0    50   Input ~ 0
FAN
Wire Wire Line
	4500 5500 4400 5500
Text GLabel 4250 5400 0    50   Input ~ 0
12V
$Comp
L Connector:Screw_Terminal_01x02 FAN?
U 1 1 60B74175
P 4700 5400
AR Path="/60B6F217/60B74175" Ref="FAN?"  Part="1" 
AR Path="/60B74175" Ref="FAN1"  Part="1" 
F 0 "FAN1" H 4618 5617 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4618 5526 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 4700 5400 50  0001 C CNN
F 3 "~" H 4700 5400 50  0001 C CNN
	1    4700 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4950 7000 4950
Connection ~ 6900 4950
Wire Wire Line
	6900 5400 6900 4950
Wire Wire Line
	7000 5400 6900 5400
Connection ~ 6850 5500
Wire Wire Line
	6850 5050 6850 5500
Wire Wire Line
	7000 5050 6850 5050
Wire Wire Line
	6850 5500 6850 5600
Wire Wire Line
	7000 5500 6850 5500
Wire Wire Line
	6750 4950 6900 4950
Text GLabel 6750 4950 0    50   Input ~ 0
12V
$Comp
L Connector:Screw_Terminal_01x02 HWELL?
U 1 1 60B7416F
P 7200 5400
AR Path="/60B6F217/60B7416F" Ref="HWELL?"  Part="1" 
AR Path="/60B7416F" Ref="HWELL2"  Part="1" 
F 0 "HWELL2" H 7118 5617 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 7118 5526 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 7200 5400 50  0001 C CNN
F 3 "~" H 7200 5400 50  0001 C CNN
	1    7200 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 HWELL?
U 1 1 60B74169
P 7200 4950
AR Path="/60B6F217/60B74169" Ref="HWELL?"  Part="1" 
AR Path="/60B74169" Ref="HWELL1"  Part="1" 
F 0 "HWELL1" H 7118 5167 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 7118 5076 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 7200 4950 50  0001 C CNN
F 3 "~" H 7200 4950 50  0001 C CNN
	1    7200 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q4
U 1 1 60AF8390
P 6750 5800
AR Path="/60AF8390" Ref="Q4"  Part="1" 
AR Path="/5F7519D0/60AF8390" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8390" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8390" Ref="Q?"  Part="1" 
F 0 "Q4" H 6954 5846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 6954 5755 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 6950 5900 50  0001 C CNN
F 3 "~" H 6750 5800 50  0001 C CNN
	1    6750 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5800 5850 5800
Text HLabel 5700 5800 0    50   Input ~ 0
WELL_HEATER
Wire Wire Line
	6850 6050 6850 6000
Connection ~ 6850 6050
Wire Wire Line
	6600 6050 6850 6050
Wire Wire Line
	6850 6150 6850 6050
$Comp
L power:GND #PWR06
U 1 1 60AF8383
P 6850 6150
AR Path="/60AF8383" Ref="#PWR06"  Part="1" 
AR Path="/5F7519D0/60AF8383" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF8383" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF8383" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 6850 5900 50  0001 C CNN
F 1 "GND" H 6855 5977 50  0000 C CNN
F 2 "" H 6850 6150 50  0001 C CNN
F 3 "" H 6850 6150 50  0001 C CNN
	1    6850 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5800 6150 5800
Connection ~ 6200 5800
Wire Wire Line
	6200 6050 6200 5800
Wire Wire Line
	6300 6050 6200 6050
Wire Wire Line
	6550 5800 6200 5800
$Comp
L Device:R R8
U 1 1 60AF8378
P 6000 5800
AR Path="/60AF8378" Ref="R8"  Part="1" 
AR Path="/5F7519D0/60AF8378" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8378" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8378" Ref="R?"  Part="1" 
F 0 "R8" V 5793 5800 50  0000 C CNN
F 1 "1k" V 5884 5800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5930 5800 50  0001 C CNN
F 3 "~" H 6000 5800 50  0001 C CNN
	1    6000 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 60AF8372
P 6450 6050
AR Path="/60AF8372" Ref="R9"  Part="1" 
AR Path="/5F7519D0/60AF8372" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8372" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8372" Ref="R?"  Part="1" 
F 0 "R9" V 6243 6050 50  0000 C CNN
F 1 "10k" V 6334 6050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6380 6050 50  0001 C CNN
F 3 "~" H 6450 6050 50  0001 C CNN
	1    6450 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 5400 4500 5400
Wire Wire Line
	4400 5500 4400 5600
Text GLabel 1650 4150 0    50   Input ~ 0
I2C_SDA
Text GLabel 1650 4250 0    50   Input ~ 0
I2C_SCL
Text GLabel 1650 4350 0    50   Input ~ 0
GND
$Comp
L power:GND #PWR02
U 1 1 60B8E5B3
P 2650 4700
AR Path="/60B8E5B3" Ref="#PWR02"  Part="1" 
AR Path="/5F7519D0/60B8E5B3" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B8E5B3" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60B8E5B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 2650 4450 50  0001 C CNN
F 1 "GND" H 2655 4527 50  0000 C CNN
F 2 "" H 2650 4700 50  0001 C CNN
F 3 "" H 2650 4700 50  0001 C CNN
	1    2650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3950 2650 3950
Wire Wire Line
	2650 3950 2650 4050
Wire Wire Line
	2550 4250 2650 4250
Wire Wire Line
	2550 4150 2650 4150
Connection ~ 2650 4150
Wire Wire Line
	2650 4150 2650 4250
Wire Wire Line
	2550 4050 2650 4050
Connection ~ 2650 4050
Wire Wire Line
	2650 4050 2650 4150
Text GLabel 1650 3950 0    50   Input ~ 0
5V_UPS
Wire Wire Line
	1650 3950 1800 3950
Wire Wire Line
	1800 4150 1650 4150
Wire Wire Line
	1800 4250 1650 4250
Wire Wire Line
	1800 4350 1650 4350
NoConn ~ 1700 4050
Wire Wire Line
	1700 4050 1800 4050
Wire Wire Line
	3050 2650 3100 2650
Connection ~ 3100 2650
Wire Wire Line
	3100 2650 3250 2650
Text GLabel 1550 3150 0    50   Input ~ 0
DOPEN
Text GLabel 3250 3150 2    50   Input ~ 0
DLOCK
Wire Wire Line
	3250 3150 3100 3150
Wire Wire Line
	3250 3250 3100 3250
Wire Wire Line
	3250 3350 3100 3350
Text GLabel 5200 1750 0    50   Input ~ 0
DOPEN
Text GLabel 5100 3000 0    50   Input ~ 0
DLOCK
$Comp
L Connector:Conn_01x02_Male LCD1_POWER1
U 1 1 60B95481
P 1450 5100
F 0 "LCD1_POWER1" H 1422 5074 50  0000 R CNN
F 1 "Conn_01x02_Male" H 1422 4983 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1450 5100 50  0001 C CNN
F 3 "~" H 1450 5100 50  0001 C CNN
	1    1450 5100
	-1   0    0    -1  
$EndComp
Text GLabel 1150 5100 0    50   Input ~ 0
5V_UPS
Text GLabel 1150 5200 0    50   Input ~ 0
GND
Wire Wire Line
	1250 5100 1150 5100
Wire Wire Line
	1250 5200 1150 5200
Connection ~ 2650 4250
$Comp
L Ninja-qPCR:RPI_LCD_TOUCH_7INCH LCD1
U 1 1 60BA74A3
P 1800 3950
F 0 "LCD1" H 2175 4175 50  0000 C CNN
F 1 "RPI_LCD_TOUCH_7INCH" H 2175 4084 50  0000 C CNN
F 2 "Ninja-qPCR:RPI_LCD_TOUCH_7INCH" H 1800 3950 50  0001 C CNN
F 3 "" H 1800 3950 50  0001 C CNN
	1    1800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4250 2650 4350
Wire Wire Line
	2550 4650 2650 4650
Connection ~ 2650 4650
Wire Wire Line
	2650 4650 2650 4700
Wire Wire Line
	2550 4550 2650 4550
Connection ~ 2650 4550
Wire Wire Line
	2650 4550 2650 4650
Wire Wire Line
	2550 4450 2650 4450
Connection ~ 2650 4450
Wire Wire Line
	2650 4450 2650 4550
Wire Wire Line
	2550 4350 2650 4350
Connection ~ 2650 4350
Wire Wire Line
	2650 4350 2650 4450
$Comp
L Device:R R7
U 1 1 60BB1885
P 5900 3250
AR Path="/60BB1885" Ref="R7"  Part="1" 
AR Path="/5F7519D0/60BB1885" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60BB1885" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60BB1885" Ref="R?"  Part="1" 
F 0 "R7" V 5693 3250 50  0000 C CNN
F 1 "10k" V 5784 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5830 3250 50  0001 C CNN
F 3 "~" H 5900 3250 50  0001 C CNN
	1    5900 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 60BB188B
P 5450 3000
AR Path="/60BB188B" Ref="R5"  Part="1" 
AR Path="/5F7519D0/60BB188B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60BB188B" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60BB188B" Ref="R?"  Part="1" 
F 0 "R5" V 5243 3000 50  0000 C CNN
F 1 "1k" V 5334 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5380 3000 50  0001 C CNN
F 3 "~" H 5450 3000 50  0001 C CNN
	1    5450 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 3000 5650 3000
Wire Wire Line
	5750 3250 5650 3250
Wire Wire Line
	5650 3250 5650 3000
Connection ~ 5650 3000
Wire Wire Line
	5650 3000 5600 3000
$Comp
L power:GND #PWR05
U 1 1 60BB1896
P 6300 3350
AR Path="/60BB1896" Ref="#PWR05"  Part="1" 
AR Path="/5F7519D0/60BB1896" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB1896" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60BB1896" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 6300 3100 50  0001 C CNN
F 1 "GND" H 6305 3177 50  0000 C CNN
F 2 "" H 6300 3350 50  0001 C CNN
F 3 "" H 6300 3350 50  0001 C CNN
	1    6300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3350 6300 3250
Wire Wire Line
	6050 3250 6300 3250
Connection ~ 6300 3250
Wire Wire Line
	6300 3250 6300 3200
$Comp
L Device:Q_NMOS_GSD Q3
U 1 1 60BB18A0
P 6200 3000
AR Path="/60BB18A0" Ref="Q3"  Part="1" 
AR Path="/5F7519D0/60BB18A0" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60BB18A0" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60BB18A0" Ref="Q?"  Part="1" 
F 0 "Q3" H 6404 3046 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 6404 2955 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 6400 3100 50  0001 C CNN
F 3 "~" H 6200 3000 50  0001 C CNN
	1    6200 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2700 6300 2700
Text GLabel 6150 2600 0    50   Input ~ 0
12V
Wire Wire Line
	6150 2600 6400 2600
Wire Wire Line
	6300 2700 6300 2800
Wire Wire Line
	5100 3000 5300 3000
Wire Wire Line
	5200 1750 5600 1750
$Comp
L Device:R R6
U 1 1 60BFB670
P 5850 1550
AR Path="/60BFB670" Ref="R6"  Part="1" 
AR Path="/5F7519D0/60BFB670" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60BFB670" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60BFB670" Ref="R?"  Part="1" 
F 0 "R6" V 5643 1550 50  0000 C CNN
F 1 "47k" V 5734 1550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5780 1550 50  0001 C CNN
F 3 "~" H 5850 1550 50  0001 C CNN
	1    5850 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 1550 5600 1550
Wire Wire Line
	5600 1550 5600 1750
Text GLabel 6100 1550 2    50   Input ~ 0
3V3D
Wire Wire Line
	6100 1550 6000 1550
$Comp
L Switch:SW_Reed SW1
U 1 1 60C1DBCD
P 5900 2000
F 0 "SW1" H 5900 2222 50  0000 C CNN
F 1 "SW_Reed" H 5900 2131 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5900 2000 50  0001 C CNN
F 3 "~" H 5900 2000 50  0001 C CNN
	1    5900 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1750 5600 2000
Wire Wire Line
	5600 2000 5700 2000
Connection ~ 5600 1750
$Comp
L power:GND #PWR?
U 1 1 60C41FB6
P 6250 2050
AR Path="/60AC9047/60C41FB6" Ref="#PWR?"  Part="1" 
AR Path="/60C41FB6" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 6250 1800 50  0001 C CNN
F 1 "GND" H 6255 1877 50  0000 C CNN
F 2 "" H 6250 2050 50  0001 C CNN
F 3 "" H 6250 2050 50  0001 C CNN
	1    6250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2000 6250 2000
Wire Wire Line
	6250 2000 6250 2050
$Comp
L Connector:Conn_01x02_Male LOCK1
U 1 1 60C90AC0
P 6600 2600
F 0 "LOCK1" H 6572 2574 50  0000 R CNN
F 1 "Conn_01x02_Male" H 6572 2483 50  0000 R CNN
F 2 "Connectors_Molex:Molex_KK-6410-02_02x2.54mm_Straight" H 6600 2600 50  0001 C CNN
F 3 "~" H 6600 2600 50  0001 C CNN
	1    6600 2600
	-1   0    0    -1  
$EndComp
Text GLabel 1550 1950 0    50   Input ~ 0
VIN_SENSE
Text GLabel 10000 5150 0    50   Input ~ 0
VCC_LED
Wire Wire Line
	10000 5150 10150 5150
Text GLabel 9000 5050 2    50   Input ~ 0
VCC_LED
Text GLabel 8700 5050 0    50   Input ~ 0
5V_UPS
Wire Wire Line
	8700 5050 9000 5050
Wire Wire Line
	10000 5850 10150 5850
Text GLabel 10000 6150 0    50   Input ~ 0
THERM_R_SWITCH
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 60C0C8E3
P 4000 3900
F 0 "J2" H 3972 3924 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 3833 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 3900 50  0001 C CNN
F 3 "~" H 4000 3900 50  0001 C CNN
	1    4000 3900
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 60C0F3FB
P 4000 4000
F 0 "J5" H 3972 4024 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 3933 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4000 50  0001 C CNN
F 3 "~" H 4000 4000 50  0001 C CNN
	1    4000 4000
	-1   0    0    -1  
$EndComp
Text HLabel 1550 2150 0    50   Input ~ 0
GPIO3
Text HLabel 1550 2350 0    50   Input ~ 0
GPIO12
Text HLabel 1550 2450 0    50   Input ~ 0
GPIO13
Text HLabel 1550 2550 0    50   Input ~ 0
GPIO14
Text HLabel 1550 2950 0    50   Input ~ 0
GPIO22
Text HLabel 1550 3250 0    50   Input ~ 0
GPIO25
Text HLabel 3250 2950 2    50   Input ~ 0
GPIO26
Text HLabel 3250 3250 2    50   Input ~ 0
GPIO28
Text HLabel 3250 3350 2    50   Input ~ 0
GPIO29
Wire Wire Line
	1550 2750 1700 2750
Wire Wire Line
	1700 2350 1550 2350
Wire Wire Line
	1700 2450 1550 2450
Wire Wire Line
	1700 2550 1550 2550
Text HLabel 3600 3900 0    50   Input ~ 0
GPIO3
Text HLabel 3600 4000 0    50   Input ~ 0
GPIO12
Text HLabel 3600 4100 0    50   Input ~ 0
GPIO13
Text HLabel 3600 4200 0    50   Input ~ 0
GPIO14
Text HLabel 3600 4300 0    50   Input ~ 0
GPIO22
Text HLabel 3600 4400 0    50   Input ~ 0
GPIO25
Text HLabel 3600 4500 0    50   Input ~ 0
GPIO26
Text HLabel 3600 4600 0    50   Input ~ 0
GPIO28
Text HLabel 3600 4700 0    50   Input ~ 0
GPIO29
$Comp
L Connector:Conn_01x01_Male J6
U 1 1 60C484F3
P 4000 4100
F 0 "J6" H 3972 4124 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 4033 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4100 50  0001 C CNN
F 3 "~" H 4000 4100 50  0001 C CNN
	1    4000 4100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 60C484FD
P 4000 4200
F 0 "J7" H 3972 4224 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 4133 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4200 50  0001 C CNN
F 3 "~" H 4000 4200 50  0001 C CNN
	1    4000 4200
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 60C48507
P 4000 4300
F 0 "J8" H 3972 4324 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 4233 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4300 50  0001 C CNN
F 3 "~" H 4000 4300 50  0001 C CNN
	1    4000 4300
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 60C48511
P 4000 4400
F 0 "J9" H 3972 4424 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 4333 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4400 50  0001 C CNN
F 3 "~" H 4000 4400 50  0001 C CNN
	1    4000 4400
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J10
U 1 1 60C51A1E
P 4000 4500
F 0 "J10" H 3972 4524 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 4433 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4500 50  0001 C CNN
F 3 "~" H 4000 4500 50  0001 C CNN
	1    4000 4500
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 60C51A28
P 4000 4600
F 0 "J11" H 3972 4624 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 4533 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4600 50  0001 C CNN
F 3 "~" H 4000 4600 50  0001 C CNN
	1    4000 4600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J12
U 1 1 60C51A32
P 4000 4700
F 0 "J12" H 3972 4724 50  0000 R CNN
F 1 "Conn_01x01_Male" H 3972 4633 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4000 4700 50  0001 C CNN
F 3 "~" H 4000 4700 50  0001 C CNN
	1    4000 4700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 4700 3600 4700
Wire Wire Line
	3800 4600 3600 4600
Wire Wire Line
	3800 4500 3600 4500
Wire Wire Line
	3800 4400 3600 4400
Wire Wire Line
	3800 4300 3600 4300
Wire Wire Line
	3800 4200 3600 4200
Wire Wire Line
	3800 4100 3600 4100
Wire Wire Line
	3800 4000 3600 4000
Wire Wire Line
	3800 3900 3600 3900
$Comp
L Connector:Conn_01x14_Male J13
U 1 1 60D2AE85
P 10350 5550
F 0 "J13" H 10322 5524 50  0000 R CNN
F 1 "Conn_01x14_Male" H 10322 5433 50  0000 R CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x14_Pitch2.54mm" H 10350 5550 50  0001 C CNN
F 3 "~" H 10350 5550 50  0001 C CNN
	1    10350 5550
	-1   0    0    -1  
$EndComp
NoConn ~ 3250 2750
NoConn ~ 1550 2750
$EndSCHEMATC
