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
P 7900 1650
AR Path="/60AF834B" Ref="R2"  Part="1" 
AR Path="/5F7519D0/60AF834B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF834B" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF834B" Ref="R?"  Part="1" 
F 0 "R2" V 7693 1650 50  0000 C CNN
F 1 "47k" V 7784 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7830 1650 50  0001 C CNN
F 3 "~" H 7900 1650 50  0001 C CNN
	1    7900 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 60AF8351
P 7450 1400
AR Path="/60AF8351" Ref="R1"  Part="1" 
AR Path="/5F7519D0/60AF8351" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8351" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8351" Ref="R?"  Part="1" 
F 0 "R1" V 7243 1400 50  0000 C CNN
F 1 "150" V 7334 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7380 1400 50  0001 C CNN
F 3 "~" H 7450 1400 50  0001 C CNN
	1    7450 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	8000 1400 7650 1400
Wire Wire Line
	7750 1650 7650 1650
Wire Wire Line
	7650 1650 7650 1400
Connection ~ 7650 1400
Wire Wire Line
	7650 1400 7600 1400
$Comp
L power:GND #PWR01
U 1 1 60AF835C
P 8300 1750
AR Path="/60AF835C" Ref="#PWR01"  Part="1" 
AR Path="/5F7519D0/60AF835C" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF835C" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF835C" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 8300 1500 50  0001 C CNN
F 1 "GND" H 8305 1577 50  0000 C CNN
F 2 "" H 8300 1750 50  0001 C CNN
F 3 "" H 8300 1750 50  0001 C CNN
	1    8300 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1750 8300 1650
Wire Wire Line
	8050 1650 8300 1650
Connection ~ 8300 1650
Wire Wire Line
	8300 1650 8300 1600
Text HLabel 7150 1400 0    50   Input ~ 0
LID_HEATER
Wire Wire Line
	7150 1400 7300 1400
$Comp
L Device:Q_NMOS_GSD Q1
U 1 1 60AF8368
P 8200 1400
AR Path="/60AF8368" Ref="Q1"  Part="1" 
AR Path="/5F7519D0/60AF8368" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8368" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8368" Ref="Q?"  Part="1" 
F 0 "Q1" H 8404 1446 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 8404 1355 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 8400 1500 50  0001 C CNN
F 3 "~" H 8200 1400 50  0001 C CNN
	1    8200 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 60AF83E3
P 5250 4700
AR Path="/60AF83E3" Ref="R4"  Part="1" 
AR Path="/5F7519D0/60AF83E3" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E3" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E3" Ref="R?"  Part="1" 
F 0 "R4" V 5043 4700 50  0000 C CNN
F 1 "47k" V 5134 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5180 4700 50  0001 C CNN
F 3 "~" H 5250 4700 50  0001 C CNN
	1    5250 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 60AF83E9
P 4800 4450
AR Path="/60AF83E9" Ref="R3"  Part="1" 
AR Path="/5F7519D0/60AF83E9" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E9" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E9" Ref="R?"  Part="1" 
F 0 "R3" V 4593 4450 50  0000 C CNN
F 1 "150" V 4684 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4730 4450 50  0001 C CNN
F 3 "~" H 4800 4450 50  0001 C CNN
	1    4800 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 4450 5000 4450
Wire Wire Line
	5100 4700 5000 4700
Wire Wire Line
	5000 4700 5000 4450
Connection ~ 5000 4450
Wire Wire Line
	5000 4450 4950 4450
$Comp
L power:GND #PWR03
U 1 1 60AF83F4
P 5650 4800
AR Path="/60AF83F4" Ref="#PWR03"  Part="1" 
AR Path="/5F7519D0/60AF83F4" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF83F4" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF83F4" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 5650 4550 50  0001 C CNN
F 1 "GND" H 5655 4627 50  0000 C CNN
F 2 "" H 5650 4800 50  0001 C CNN
F 3 "" H 5650 4800 50  0001 C CNN
	1    5650 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4800 5650 4700
Wire Wire Line
	5400 4700 5650 4700
Connection ~ 5650 4700
Wire Wire Line
	5650 4700 5650 4650
Wire Wire Line
	4500 4450 4650 4450
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 60AF8400
P 5550 4450
AR Path="/60AF8400" Ref="Q2"  Part="1" 
AR Path="/5F7519D0/60AF8400" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8400" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8400" Ref="Q?"  Part="1" 
F 0 "Q2" H 5754 4496 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5754 4405 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5750 4550 50  0001 C CNN
F 3 "~" H 5550 4450 50  0001 C CNN
	1    5550 4450
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
S 2150 6550 1150 900 
U 60B81B0D
F0 "SheetSupercap" 50
F1 "fileSupercap.sch" 50
$EndSheet
$Comp
L Connector:Screw_Terminal_01x02 HLID?
U 1 1 60BAF2C5
P 8500 1000
AR Path="/60B6F672/60BAF2C5" Ref="HLID?"  Part="1" 
AR Path="/60BAF2C5" Ref="HLID1"  Part="1" 
F 0 "HLID1" H 8700 1000 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 9000 900 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 8500 1000 50  0001 C CNN
F 3 "~" H 8500 1000 50  0001 C CNN
	1    8500 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1000 8300 1000
Text GLabel 8050 1000 0    50   Input ~ 0
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
	8300 1100 8300 1200
Text HLabel 4500 4450 0    50   Input ~ 0
FAN
Text HLabel 1550 2850 0    50   Input ~ 0
FAN
Wire Wire Line
	5750 4150 5650 4150
Text GLabel 5500 4050 0    50   Input ~ 0
12V
$Comp
L Connector:Screw_Terminal_01x02 FAN?
U 1 1 60B74175
P 5950 4050
AR Path="/60B6F217/60B74175" Ref="FAN?"  Part="1" 
AR Path="/60B74175" Ref="FAN1"  Part="1" 
F 0 "FAN1" H 5868 4267 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5868 4176 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 5950 4050 50  0001 C CNN
F 3 "~" H 5950 4050 50  0001 C CNN
	1    5950 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3650 8300 3650
Text GLabel 8200 3550 0    50   Input ~ 0
12V
$Comp
L Connector:Screw_Terminal_01x02 HWELL?
U 1 1 60B7416F
P 8650 4800
AR Path="/60B6F217/60B7416F" Ref="HWELL?"  Part="1" 
AR Path="/60B7416F" Ref="HWELL2"  Part="1" 
F 0 "HWELL2" H 8568 5017 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 8568 4926 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 8650 4800 50  0001 C CNN
F 3 "~" H 8650 4800 50  0001 C CNN
	1    8650 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 HWELL?
U 1 1 60B74169
P 8650 3550
AR Path="/60B6F217/60B74169" Ref="HWELL?"  Part="1" 
AR Path="/60B74169" Ref="HWELL1"  Part="1" 
F 0 "HWELL1" H 8568 3767 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 8568 3676 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 8650 3550 50  0001 C CNN
F 3 "~" H 8650 3550 50  0001 C CNN
	1    8650 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q4
U 1 1 60AF8390
P 8200 3950
AR Path="/60AF8390" Ref="Q4"  Part="1" 
AR Path="/5F7519D0/60AF8390" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8390" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8390" Ref="Q?"  Part="1" 
F 0 "Q4" H 8404 3996 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 8404 3905 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 8400 4050 50  0001 C CNN
F 3 "~" H 8200 3950 50  0001 C CNN
	1    8200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3950 7300 3950
Text HLabel 7150 3950 0    50   Input ~ 0
WELL_HEATER
Wire Wire Line
	8300 4200 8300 4150
Connection ~ 8300 4200
Wire Wire Line
	8050 4200 8300 4200
Wire Wire Line
	8300 4300 8300 4200
$Comp
L power:GND #PWR06
U 1 1 60AF8383
P 8300 4300
AR Path="/60AF8383" Ref="#PWR06"  Part="1" 
AR Path="/5F7519D0/60AF8383" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF8383" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF8383" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 8300 4050 50  0001 C CNN
F 1 "GND" H 8305 4127 50  0000 C CNN
F 2 "" H 8300 4300 50  0001 C CNN
F 3 "" H 8300 4300 50  0001 C CNN
	1    8300 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3950 7600 3950
Connection ~ 7650 3950
Wire Wire Line
	7650 4200 7650 3950
Wire Wire Line
	7750 4200 7650 4200
$Comp
L Device:R R8
U 1 1 60AF8378
P 7450 3950
AR Path="/60AF8378" Ref="R8"  Part="1" 
AR Path="/5F7519D0/60AF8378" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8378" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8378" Ref="R?"  Part="1" 
F 0 "R8" V 7243 3950 50  0000 C CNN
F 1 "150" V 7334 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7380 3950 50  0001 C CNN
F 3 "~" H 7450 3950 50  0001 C CNN
	1    7450 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 60AF8372
P 7900 4200
AR Path="/60AF8372" Ref="R9"  Part="1" 
AR Path="/5F7519D0/60AF8372" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8372" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8372" Ref="R?"  Part="1" 
F 0 "R9" V 7693 4200 50  0000 C CNN
F 1 "47k" V 7784 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7830 4200 50  0001 C CNN
F 3 "~" H 7900 4200 50  0001 C CNN
	1    7900 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 4050 5750 4050
Wire Wire Line
	5650 4150 5650 4250
Text GLabel 1150 4900 0    50   Input ~ 0
I2C_SDA
Text GLabel 1150 5000 0    50   Input ~ 0
I2C_SCL
Text GLabel 1150 5100 0    50   Input ~ 0
GND
$Comp
L power:GND #PWR02
U 1 1 60B8E5B3
P 2150 5450
AR Path="/60B8E5B3" Ref="#PWR02"  Part="1" 
AR Path="/5F7519D0/60B8E5B3" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B8E5B3" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60B8E5B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 2150 5200 50  0001 C CNN
F 1 "GND" H 2155 5277 50  0000 C CNN
F 2 "" H 2150 5450 50  0001 C CNN
F 3 "" H 2150 5450 50  0001 C CNN
	1    2150 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4700 2150 4700
Wire Wire Line
	2150 4700 2150 4800
Wire Wire Line
	2050 5000 2150 5000
Wire Wire Line
	2050 4900 2150 4900
Connection ~ 2150 4900
Wire Wire Line
	2150 4900 2150 5000
Wire Wire Line
	2050 4800 2150 4800
Connection ~ 2150 4800
Wire Wire Line
	2150 4800 2150 4900
Text GLabel 1150 4700 0    50   Input ~ 0
5V_UPS
Wire Wire Line
	1150 4700 1300 4700
Wire Wire Line
	1300 4900 1150 4900
Wire Wire Line
	1300 5000 1150 5000
Wire Wire Line
	1300 5100 1150 5100
NoConn ~ 1200 4800
Wire Wire Line
	1200 4800 1300 4800
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
Text GLabel 4800 1650 0    50   Input ~ 0
DOPEN
Text GLabel 4500 3100 0    50   Input ~ 0
DLOCK
$Comp
L Connector:Conn_01x02_Male LCD1_POWER1
U 1 1 60B95481
P 1500 5800
F 0 "LCD1_POWER1" H 1472 5774 50  0000 R CNN
F 1 "Conn_01x02_Male" H 1472 5683 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1500 5800 50  0001 C CNN
F 3 "~" H 1500 5800 50  0001 C CNN
	1    1500 5800
	-1   0    0    -1  
$EndComp
Text GLabel 1200 5800 0    50   Input ~ 0
5V_UPS
Text GLabel 1200 5900 0    50   Input ~ 0
GND
Wire Wire Line
	1300 5800 1200 5800
Wire Wire Line
	1300 5900 1200 5900
Connection ~ 2150 5000
$Comp
L Ninja-qPCR:RPI_LCD_TOUCH_7INCH LCD1
U 1 1 60BA74A3
P 1300 4700
F 0 "LCD1" H 1675 4925 50  0000 C CNN
F 1 "RPI_LCD_TOUCH_7INCH" H 1675 4834 50  0000 C CNN
F 2 "Ninja-qPCR:RPI_LCD_TOUCH_7INCH" H 1300 4700 50  0001 C CNN
F 3 "" H 1300 4700 50  0001 C CNN
	1    1300 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5000 2150 5100
Wire Wire Line
	2050 5400 2150 5400
Connection ~ 2150 5400
Wire Wire Line
	2150 5400 2150 5450
Wire Wire Line
	2050 5300 2150 5300
Connection ~ 2150 5300
Wire Wire Line
	2150 5300 2150 5400
Wire Wire Line
	2050 5200 2150 5200
Connection ~ 2150 5200
Wire Wire Line
	2150 5200 2150 5300
Wire Wire Line
	2050 5100 2150 5100
Connection ~ 2150 5100
Wire Wire Line
	2150 5100 2150 5200
$Comp
L Device:R R7
U 1 1 60BB1885
P 5250 3350
AR Path="/60BB1885" Ref="R7"  Part="1" 
AR Path="/5F7519D0/60BB1885" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60BB1885" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60BB1885" Ref="R?"  Part="1" 
F 0 "R7" V 5043 3350 50  0000 C CNN
F 1 "47k" V 5134 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5180 3350 50  0001 C CNN
F 3 "~" H 5250 3350 50  0001 C CNN
	1    5250 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 60BB188B
P 4800 3100
AR Path="/60BB188B" Ref="R5"  Part="1" 
AR Path="/5F7519D0/60BB188B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60BB188B" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60BB188B" Ref="R?"  Part="1" 
F 0 "R5" V 4593 3100 50  0000 C CNN
F 1 "150" V 4684 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4730 3100 50  0001 C CNN
F 3 "~" H 4800 3100 50  0001 C CNN
	1    4800 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 3100 5000 3100
Wire Wire Line
	5100 3350 5000 3350
Wire Wire Line
	5000 3350 5000 3100
Connection ~ 5000 3100
Wire Wire Line
	5000 3100 4950 3100
$Comp
L power:GND #PWR05
U 1 1 60BB1896
P 5650 3450
AR Path="/60BB1896" Ref="#PWR05"  Part="1" 
AR Path="/5F7519D0/60BB1896" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB1896" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60BB1896" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 5650 3200 50  0001 C CNN
F 1 "GND" H 5655 3277 50  0000 C CNN
F 2 "" H 5650 3450 50  0001 C CNN
F 3 "" H 5650 3450 50  0001 C CNN
	1    5650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3450 5650 3350
Wire Wire Line
	5400 3350 5650 3350
Connection ~ 5650 3350
Wire Wire Line
	5650 3350 5650 3300
$Comp
L Device:Q_NMOS_GSD Q3
U 1 1 60BB18A0
P 5550 3100
AR Path="/60BB18A0" Ref="Q3"  Part="1" 
AR Path="/5F7519D0/60BB18A0" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60BB18A0" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60BB18A0" Ref="Q?"  Part="1" 
F 0 "Q3" H 5754 3146 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5754 3055 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5750 3200 50  0001 C CNN
F 3 "~" H 5550 3100 50  0001 C CNN
	1    5550 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2800 5650 2800
Text GLabel 5500 2700 0    50   Input ~ 0
12V
Wire Wire Line
	5500 2700 5750 2700
Wire Wire Line
	5650 2800 5650 2900
Wire Wire Line
	4800 1650 5200 1650
$Comp
L Device:R R6
U 1 1 60BFB670
P 5450 1450
AR Path="/60BFB670" Ref="R6"  Part="1" 
AR Path="/5F7519D0/60BFB670" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60BFB670" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60BFB670" Ref="R?"  Part="1" 
F 0 "R6" V 5243 1450 50  0000 C CNN
F 1 "47k" V 5334 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5380 1450 50  0001 C CNN
F 3 "~" H 5450 1450 50  0001 C CNN
	1    5450 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 1450 5200 1450
Wire Wire Line
	5200 1450 5200 1650
Text GLabel 5700 1450 2    50   Input ~ 0
3V3D
Wire Wire Line
	5700 1450 5600 1450
$Comp
L Switch:SW_Reed SW1
U 1 1 60C1DBCD
P 5500 1900
F 0 "SW1" H 5500 2122 50  0000 C CNN
F 1 "SW_Reed" H 5500 2031 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5500 1900 50  0001 C CNN
F 3 "~" H 5500 1900 50  0001 C CNN
	1    5500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1650 5200 1900
Wire Wire Line
	5200 1900 5300 1900
Connection ~ 5200 1650
$Comp
L power:GND #PWR?
U 1 1 60C41FB6
P 5850 1950
AR Path="/60AC9047/60C41FB6" Ref="#PWR?"  Part="1" 
AR Path="/60C41FB6" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 5850 1700 50  0001 C CNN
F 1 "GND" H 5855 1777 50  0000 C CNN
F 2 "" H 5850 1950 50  0001 C CNN
F 3 "" H 5850 1950 50  0001 C CNN
	1    5850 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1900 5850 1900
Wire Wire Line
	5850 1900 5850 1950
$Comp
L Connector:Conn_01x02_Male LOCK1
U 1 1 60C90AC0
P 5950 2700
F 0 "LOCK1" H 5922 2674 50  0000 R CNN
F 1 "Conn_01x02_Male" H 5922 2583 50  0000 R CNN
F 2 "Connectors_Molex:Molex_KK-6410-02_02x2.54mm_Straight" H 5950 2700 50  0001 C CNN
F 3 "~" H 5950 2700 50  0001 C CNN
	1    5950 2700
	-1   0    0    -1  
$EndComp
Text GLabel 1550 1950 0    50   Input ~ 0
VIN_SENSE
Text GLabel 10000 5150 0    50   Input ~ 0
VCC_LED
Wire Wire Line
	10000 5150 10150 5150
Text GLabel 6100 7200 2    50   Input ~ 0
VCC_LED
Text GLabel 5800 7200 0    50   Input ~ 0
5V_UPS
Wire Wire Line
	5800 7200 6100 7200
Wire Wire Line
	10000 5850 10150 5850
Text GLabel 10000 6150 0    50   Input ~ 0
THERM_R_SWITCH
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 60C0C8E3
P 4300 6550
F 0 "J2" H 4272 6574 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 6483 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 6550 50  0001 C CNN
F 3 "~" H 4300 6550 50  0001 C CNN
	1    4300 6550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 60C0F3FB
P 4300 6650
F 0 "J5" H 4272 6674 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 6583 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 6650 50  0001 C CNN
F 3 "~" H 4300 6650 50  0001 C CNN
	1    4300 6650
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
Text HLabel 3900 6550 0    50   Input ~ 0
GPIO3
Text HLabel 3900 6650 0    50   Input ~ 0
GPIO12
Text HLabel 3900 6750 0    50   Input ~ 0
GPIO13
Text HLabel 3900 6850 0    50   Input ~ 0
GPIO14
Text HLabel 3900 6950 0    50   Input ~ 0
GPIO22
Text HLabel 3900 7050 0    50   Input ~ 0
GPIO25
Text HLabel 3900 7150 0    50   Input ~ 0
GPIO26
Text HLabel 3900 7250 0    50   Input ~ 0
GPIO28
Text HLabel 3900 7350 0    50   Input ~ 0
GPIO29
$Comp
L Connector:Conn_01x01_Male J6
U 1 1 60C484F3
P 4300 6750
F 0 "J6" H 4272 6774 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 6683 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 6750 50  0001 C CNN
F 3 "~" H 4300 6750 50  0001 C CNN
	1    4300 6750
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 60C484FD
P 4300 6850
F 0 "J7" H 4272 6874 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 6783 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 6850 50  0001 C CNN
F 3 "~" H 4300 6850 50  0001 C CNN
	1    4300 6850
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 60C48507
P 4300 6950
F 0 "J8" H 4272 6974 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 6883 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 6950 50  0001 C CNN
F 3 "~" H 4300 6950 50  0001 C CNN
	1    4300 6950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 60C48511
P 4300 7050
F 0 "J9" H 4272 7074 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 6983 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 7050 50  0001 C CNN
F 3 "~" H 4300 7050 50  0001 C CNN
	1    4300 7050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J10
U 1 1 60C51A1E
P 4300 7150
F 0 "J10" H 4272 7174 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 7083 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 7150 50  0001 C CNN
F 3 "~" H 4300 7150 50  0001 C CNN
	1    4300 7150
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 60C51A28
P 4300 7250
F 0 "J11" H 4272 7274 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 7183 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 7250 50  0001 C CNN
F 3 "~" H 4300 7250 50  0001 C CNN
	1    4300 7250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J12
U 1 1 60C51A32
P 4300 7350
F 0 "J12" H 4272 7374 50  0000 R CNN
F 1 "Conn_01x01_Male" H 4272 7283 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4300 7350 50  0001 C CNN
F 3 "~" H 4300 7350 50  0001 C CNN
	1    4300 7350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4100 7350 3900 7350
Wire Wire Line
	4100 7250 3900 7250
Wire Wire Line
	4100 7150 3900 7150
Wire Wire Line
	4100 7050 3900 7050
Wire Wire Line
	4100 6950 3900 6950
Wire Wire Line
	4100 6850 3900 6850
Wire Wire Line
	4100 6750 3900 6750
Wire Wire Line
	4100 6650 3900 6650
Wire Wire Line
	4100 6550 3900 6550
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
Wire Wire Line
	8200 3550 8450 3550
Wire Wire Line
	8300 3650 8300 3750
$Comp
L Device:Q_NMOS_GSD Q6
U 1 1 60C83453
P 8200 5200
AR Path="/60C83453" Ref="Q6"  Part="1" 
AR Path="/5F7519D0/60C83453" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60C83453" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60C83453" Ref="Q?"  Part="1" 
F 0 "Q6" H 8404 5246 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 8404 5155 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 8400 5300 50  0001 C CNN
F 3 "~" H 8200 5200 50  0001 C CNN
	1    8200 5200
	1    0    0    -1  
$EndComp
Text GLabel 8200 4800 0    50   Input ~ 0
12V
Wire Wire Line
	8450 4800 8200 4800
Wire Wire Line
	8450 4900 8300 4900
Wire Wire Line
	8300 4900 8300 5000
$Comp
L power:GND #PWR0101
U 1 1 60C93D40
P 8300 5550
AR Path="/60C93D40" Ref="#PWR0101"  Part="1" 
AR Path="/5F7519D0/60C93D40" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60C93D40" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60C93D40" Ref="#PWR?"  Part="1" 
F 0 "#PWR0101" H 8300 5300 50  0001 C CNN
F 1 "GND" H 8305 5377 50  0000 C CNN
F 2 "" H 8300 5550 50  0001 C CNN
F 3 "" H 8300 5550 50  0001 C CNN
	1    8300 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5400 8300 5550
Wire Wire Line
	8000 3950 7650 3950
Wire Wire Line
	8000 5200 7650 5200
Wire Wire Line
	7650 5200 7650 4200
Connection ~ 7650 4200
$Comp
L Device:Q_NMOS_GSD Q5
U 1 1 60C6755B
P 8200 2600
AR Path="/60C6755B" Ref="Q5"  Part="1" 
AR Path="/5F7519D0/60C6755B" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60C6755B" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60C6755B" Ref="Q?"  Part="1" 
F 0 "Q5" H 8404 2646 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 8404 2555 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 8400 2700 50  0001 C CNN
F 3 "~" H 8200 2600 50  0001 C CNN
	1    8200 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 HLID?
U 1 1 60C68329
P 8500 2050
AR Path="/60B6F672/60C68329" Ref="HLID?"  Part="1" 
AR Path="/60C68329" Ref="HLID2"  Part="1" 
F 0 "HLID2" H 8700 2050 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 9000 1950 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 8500 2050 50  0001 C CNN
F 3 "~" H 8500 2050 50  0001 C CNN
	1    8500 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60C69E05
P 8300 3000
AR Path="/60C69E05" Ref="#PWR0102"  Part="1" 
AR Path="/5F7519D0/60C69E05" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60C69E05" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60C69E05" Ref="#PWR?"  Part="1" 
F 0 "#PWR0102" H 8300 2750 50  0001 C CNN
F 1 "GND" H 8305 2827 50  0000 C CNN
F 2 "" H 8300 3000 50  0001 C CNN
F 3 "" H 8300 3000 50  0001 C CNN
	1    8300 3000
	1    0    0    -1  
$EndComp
Text GLabel 8050 2050 0    50   Input ~ 0
12V
Wire Wire Line
	8300 2050 8050 2050
Wire Wire Line
	8300 2150 8300 2400
Wire Wire Line
	8000 2600 7650 2600
Wire Wire Line
	7650 2600 7650 1650
Connection ~ 7650 1650
Wire Wire Line
	8300 3000 8300 2800
Wire Wire Line
	4650 3100 4500 3100
$EndSCHEMATC
