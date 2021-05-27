EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 600  7700 0    50   ~ 0
Use AGND and DGND  https://www.zuken.co.jp/club_Z/z/product/BD/019/pro_130221_1.html?fbclid=IwAR0Fud5uWcRWMC9uykssyA-G8J9CSF2g4TS7U_EDWa5E4txVfpM9rxRD7ok
$Sheet
S 700  6550 1300 900 
U 60AC8F91
F0 "Power" 50
F1 "filePower.sch" 50
$EndSheet
Text GLabel 10150 3550 0    50   Input ~ 0
GND
Text GLabel 10150 4050 0    50   Input ~ 0
MUX_S3
Text GLabel 10150 4150 0    50   Input ~ 0
MUX_S2
Text GLabel 10150 4350 0    50   Input ~ 0
MUX_S0
Text GLabel 10150 4250 0    50   Input ~ 0
MUX_S1
Text GLabel 10150 4450 0    50   Input ~ 0
MUX_SELECT
Text GLabel 10150 4550 0    50   Input ~ 0
PD_REF_PWM
Text GLabel 10150 4650 0    50   Input ~ 0
ADC_DRDY
Text GLabel 10150 4750 0    50   Input ~ 0
I2C_SCL
Text GLabel 10150 4850 0    50   Input ~ 0
I2C_SDA
$Comp
L Ninja-qPCR:Conn_02x05 BODY?
U 1 1 60AF81F3
P 10200 900
AR Path="/5F58C19F/60AF81F3" Ref="BODY?"  Part="1" 
AR Path="/60AF81F3" Ref="BODY?"  Part="1" 
AR Path="/5F708CA1/60AF81F3" Ref="BODY?"  Part="1" 
AR Path="/60AEA148/60AF81F3" Ref="BODY?"  Part="1" 
AR Path="/60AC8F63/60AF81F3" Ref="BODY?"  Part="1" 
F 0 "BODY?" H 10519 511 50  0000 L CNN
F 1 "Conn_02x05" H 10519 420 50  0000 L CNN
F 2 "Ninja-qPCR:Con_2x05" H 10000 1000 50  0001 C CNN
F 3 "" H 10000 1000 50  0001 C CNN
	1    10200 900 
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_02x05 LID_2X?
U 1 1 60AF81F9
P 10200 2100
AR Path="/5F58C19F/60AF81F9" Ref="LID_2X?"  Part="1" 
AR Path="/60AF81F9" Ref="LID_2X?"  Part="1" 
AR Path="/5F708CA1/60AF81F9" Ref="LID_2X?"  Part="1" 
AR Path="/60AEA148/60AF81F9" Ref="LID_2X?"  Part="1" 
AR Path="/60AC8F63/60AF81F9" Ref="LID_2X?"  Part="1" 
F 0 "LID_2X?" H 10519 1711 50  0000 L CNN
F 1 "Conn_02x05" H 10519 1620 50  0000 L CNN
F 2 "Ninja-qPCR:Con_2x05" H 10000 2200 50  0001 C CNN
F 3 "" H 10000 2200 50  0001 C CNN
	1    10200 2100
	1    0    0    -1  
$EndComp
Text GLabel 9850 1000 0    50   Input ~ 0
BODY_HEATER1B
Text GLabel 9850 1100 0    50   Input ~ 0
THERM_WELL
Text GLabel 9850 1200 0    50   Input ~ 0
FAN_BLACK_GND1
Text GLabel 9850 1500 0    50   Input ~ 0
FAN_BLACK_GND2
Text GLabel 9850 1600 0    50   Input ~ 0
THERM_EXT3
Text GLabel 9850 1800 0    50   Input ~ 0
BODY_HEATER2B
Wire Wire Line
	10000 900  9850 900 
Wire Wire Line
	9850 1000 10000 1000
Wire Wire Line
	10000 1100 9850 1100
Wire Wire Line
	9850 1200 10000 1200
Wire Wire Line
	10000 1300 9850 1300
Wire Wire Line
	9850 1400 10000 1400
Wire Wire Line
	10000 1500 9850 1500
Wire Wire Line
	9850 1600 10000 1600
Wire Wire Line
	10000 1700 9850 1700
Wire Wire Line
	9850 1800 10000 1800
Text GLabel 9850 2200 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 9850 3000 0    50   Input ~ 0
LID_HEATER2B
Text GLabel 9850 2300 0    50   Input ~ 0
THERM_AIR
Text GLabel 9850 2400 0    50   Input ~ 0
THERM_EXT1
Text GLabel 9850 2500 0    50   Input ~ 0
THERM_LID1
Text GLabel 9850 2600 0    50   Input ~ 0
GNDA
Text GLabel 9850 2700 0    50   Input ~ 0
THERM_LID2
Text GLabel 9850 2800 0    50   Input ~ 0
THERM_EXT2
Wire Wire Line
	10000 2100 9850 2100
Wire Wire Line
	9850 2200 10000 2200
Wire Wire Line
	10000 2300 9850 2300
Wire Wire Line
	9850 2400 10000 2400
Wire Wire Line
	10000 2500 9850 2500
Wire Wire Line
	9850 2600 10000 2600
Wire Wire Line
	10000 2700 9850 2700
Wire Wire Line
	9850 2800 10000 2800
Wire Wire Line
	10000 2900 9850 2900
Wire Wire Line
	9850 3000 10000 3000
Wire Wire Line
	7750 2900 7600 2900
Wire Wire Line
	7750 2800 7600 2800
Wire Wire Line
	7750 2700 7600 2700
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 60AF822B
P 7400 2800
F 0 "J?" H 7508 3081 50  0000 C CNN
F 1 "Conn_01x03_Male" H 7508 2990 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7400 2800 50  0001 C CNN
F 3 "~" H 7400 2800 50  0001 C CNN
	1    7400 2800
	1    0    0    -1  
$EndComp
Text GLabel 7750 2800 2    50   Input ~ 0
THERM_EXT2
Text GLabel 7750 2700 2    50   Input ~ 0
THERM_EXT1
Text GLabel 7750 2900 2    50   Input ~ 0
THERM_EXT3
Text GLabel 7850 3500 2    50   Input ~ 0
GPIO25
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 60AF8288
P 7400 3500
F 0 "J?" H 7508 3681 50  0000 C CNN
F 1 "Conn_01x01_Male" H 7508 3590 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 7400 3500 50  0001 C CNN
F 3 "~" H 7400 3500 50  0001 C CNN
	1    7400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3500 7600 3500
Text GLabel 9850 900  0    50   Input ~ 0
12V
Text GLabel 9850 1300 0    50   Input ~ 0
12V
Text GLabel 9850 1700 0    50   Input ~ 0
12V
Text GLabel 9850 2100 0    50   Input ~ 0
12V
Text GLabel 9850 2900 0    50   Input ~ 0
12V
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J?
U 1 1 60AF82D8
P 2050 1750
AR Path="/60AF82D8" Ref="J?"  Part="1" 
AR Path="/60AEA148/60AF82D8" Ref="J?"  Part="1" 
AR Path="/60AC8F63/60AF82D8" Ref="J?"  Part="1" 
F 0 "J?" H 2050 2965 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 2050 2874 50  0000 C CNN
F 2 "Ninja-qPCR:Raspberry_Pi_3A+_Socketed_THT_FaceDown_MountingHoles" H 1600 700 50  0001 C CNN
F 3 "" H 1600 700 50  0001 C CNN
	1    2050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 800  1350 800 
Wire Wire Line
	1200 1600 1350 1600
Text GLabel 1200 2000 0    50   Input ~ 0
GND
Wire Wire Line
	1200 2000 1350 2000
Text GLabel 1200 2700 0    50   Input ~ 0
GND
Wire Wire Line
	1200 2700 1350 2700
Text GLabel 2900 1000 2    50   Input ~ 0
GND
Text GLabel 2900 2200 2    50   Input ~ 0
GND
Text GLabel 2900 1700 2    50   Input ~ 0
GND
Text GLabel 2900 2400 2    50   Input ~ 0
GND
Wire Wire Line
	2900 2400 2750 2400
Wire Wire Line
	2900 1700 2750 1700
Wire Wire Line
	2900 1400 2750 1400
Wire Wire Line
	2750 1000 2900 1000
Text HLabel 1200 1400 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	1200 1400 1350 1400
Text GLabel 1200 1900 0    50   Input ~ 0
SPI_SCLK
Text GLabel 1200 1700 0    50   Input ~ 0
SPI_MOSI
Text GLabel 1200 1000 0    50   Input ~ 0
I2C_SCL
Text GLabel 1200 900  0    50   Input ~ 0
I2C_SDA
Text GLabel 1200 1500 0    50   Input ~ 0
LED_LAT
Text GLabel 1200 1800 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	1200 1700 1350 1700
Wire Wire Line
	1200 1800 1350 1800
Wire Wire Line
	1350 1900 1200 1900
Wire Wire Line
	1200 900  1350 900 
Wire Wire Line
	1350 1000 1200 1000
Wire Wire Line
	1200 1100 1350 1100
Wire Wire Line
	1350 2200 1200 2200
Wire Wire Line
	2900 2500 2750 2500
Text HLabel 1200 2400 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	1200 2400 1350 2400
Wire Wire Line
	2900 1500 2750 1500
Wire Wire Line
	1350 1500 1200 1500
Wire Wire Line
	2900 2200 2750 2200
Text HLabel 2900 1900 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	2900 1800 2750 1800
Wire Wire Line
	2900 2300 2750 2300
Text GLabel 1200 2600 0    50   Input ~ 0
GPIO25
Wire Wire Line
	1200 2600 1350 2600
Text HLabel 1200 2500 0    50   Input ~ 0
LID_HEATER2
Text HLabel 1200 1300 0    50   Input ~ 0
WELL_HEATER2
Text GLabel 1200 1200 0    50   Input ~ 0
GND
Wire Wire Line
	1200 1200 1350 1200
Wire Wire Line
	1200 1300 1350 1300
Text GLabel 2900 1400 2    50   Input ~ 0
GND
NoConn ~ 1200 2100
Wire Wire Line
	1350 2100 1200 2100
NoConn ~ 2900 2100
Wire Wire Line
	2900 2100 2750 2100
Wire Wire Line
	1200 2500 1350 2500
Wire Wire Line
	2900 1600 2750 1600
Text GLabel 2900 1100 2    50   Input ~ 0
MUX_S3
Text GLabel 2900 1200 2    50   Input ~ 0
MUX_S2
Wire Wire Line
	2900 1100 2750 1100
Wire Wire Line
	2750 1200 2900 1200
Wire Wire Line
	2900 1300 2750 1300
Text GLabel 2900 1800 2    50   Input ~ 0
MUX_SELECT
Wire Wire Line
	2900 1900 2750 1900
Wire Wire Line
	2750 2600 2900 2600
Wire Wire Line
	4050 2250 3900 2250
Wire Wire Line
	4050 2000 4000 2000
Text GLabel 4050 2000 2    50   Input ~ 0
GND
$Comp
L Device:R R?
U 1 1 60AF8322
P 3750 2250
AR Path="/60AF8322" Ref="R?"  Part="1" 
AR Path="/60AEA148/60AF8322" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8322" Ref="R?"  Part="1" 
F 0 "R?" H 3680 2204 50  0000 R CNN
F 1 "10k" H 3680 2295 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3680 2250 50  0001 C CNN
F 3 "~" H 3750 2250 50  0001 C CNN
	1    3750 2250
	0    -1   1    0   
$EndComp
Wire Wire Line
	3500 2050 3500 2000
Connection ~ 3500 2000
Wire Wire Line
	4000 2050 4000 2000
Connection ~ 4000 2000
Wire Wire Line
	1350 2300 1200 2300
Text GLabel 2900 1600 2    50   Input ~ 0
SPI_SWITCH
Wire Wire Line
	2750 800  2850 800 
Wire Wire Line
	2750 900  2850 900 
Wire Wire Line
	2850 900  2850 800 
Connection ~ 2850 800 
Wire Wire Line
	2850 800  2900 800 
Text HLabel 1200 2200 0    50   Input ~ 0
FAN1
Text HLabel 1200 2300 0    50   Input ~ 0
FAN2
Text HLabel 1200 800  0    50   Input ~ 0
3V3_RASP
Text HLabel 4050 2250 2    50   Input ~ 0
3V3_RASP
Text GLabel 2900 800  2    50   Input ~ 0
5V
Wire Wire Line
	3450 2250 3600 2250
Wire Wire Line
	2750 2000 3450 2000
Wire Wire Line
	3450 2000 3500 2000
Connection ~ 3450 2000
Wire Wire Line
	3450 2250 3450 2000
$Comp
L Ninja-qPCR:TACTILE_4 SW?
U 1 1 60AF8341
P 3750 2000
AR Path="/60AF8341" Ref="SW?"  Part="1" 
AR Path="/60AEA148/60AF8341" Ref="SW?"  Part="1" 
AR Path="/60AC8F63/60AF8341" Ref="SW?"  Part="1" 
F 0 "SW?" H 3944 2073 50  0000 L CNN
F 1 "TACTILE_4" H 3944 1982 50  0000 L CNN
F 2 "Ninja-qPCR:SW_TH_Tactile_Omron_B3F-10xx" H 3750 2200 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 3750 2200 50  0001 C CNN
	1    3750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2000 4000 2000
Wire Wire Line
	3900 2050 4000 2050
Wire Wire Line
	3500 2000 3600 2000
Wire Wire Line
	3500 2050 3600 2050
$Comp
L Device:R R?
U 1 1 60AF834B
P 1950 3650
AR Path="/60AF834B" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF834B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF834B" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF834B" Ref="R?"  Part="1" 
F 0 "R?" V 1743 3650 50  0000 C CNN
F 1 "10k" V 1834 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1880 3650 50  0001 C CNN
F 3 "~" H 1950 3650 50  0001 C CNN
	1    1950 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60AF8351
P 1500 3400
AR Path="/60AF8351" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF8351" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8351" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8351" Ref="R?"  Part="1" 
F 0 "R?" V 1293 3400 50  0000 C CNN
F 1 "1k" V 1384 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1430 3400 50  0001 C CNN
F 3 "~" H 1500 3400 50  0001 C CNN
	1    1500 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 3400 1700 3400
Wire Wire Line
	1800 3650 1700 3650
Wire Wire Line
	1700 3650 1700 3400
Connection ~ 1700 3400
Wire Wire Line
	1700 3400 1650 3400
$Comp
L power:GND #PWR?
U 1 1 60AF835C
P 2350 3750
AR Path="/60AF835C" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60AF835C" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF835C" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF835C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 3500 50  0001 C CNN
F 1 "GND" H 2355 3577 50  0000 C CNN
F 2 "" H 2350 3750 50  0001 C CNN
F 3 "" H 2350 3750 50  0001 C CNN
	1    2350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3750 2350 3650
Wire Wire Line
	2100 3650 2350 3650
Connection ~ 2350 3650
Wire Wire Line
	2350 3650 2350 3600
Text HLabel 1200 3400 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	1200 3400 1350 3400
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60AF8368
P 2250 3400
AR Path="/60AF8368" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60AF8368" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8368" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8368" Ref="Q?"  Part="1" 
F 0 "Q?" H 2454 3446 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2454 3355 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2450 3500 50  0001 C CNN
F 3 "~" H 2250 3400 50  0001 C CNN
	1    2250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3050 2350 3200
Text GLabel 4750 4250 0    50   Input ~ 0
BODY_HEATER2B
Text GLabel 2200 3050 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 2200 4200 0    50   Input ~ 0
LID_HEATER2B
$Comp
L Device:R R?
U 1 1 60AF8372
P 4450 3650
AR Path="/60AF8372" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF8372" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8372" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8372" Ref="R?"  Part="1" 
F 0 "R?" V 4243 3650 50  0000 C CNN
F 1 "10k" V 4334 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4380 3650 50  0001 C CNN
F 3 "~" H 4450 3650 50  0001 C CNN
	1    4450 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60AF8378
P 4000 3400
AR Path="/60AF8378" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF8378" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8378" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8378" Ref="R?"  Part="1" 
F 0 "R?" V 3793 3400 50  0000 C CNN
F 1 "1k" V 3884 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3930 3400 50  0001 C CNN
F 3 "~" H 4000 3400 50  0001 C CNN
	1    4000 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 3400 4200 3400
Wire Wire Line
	4300 3650 4200 3650
Wire Wire Line
	4200 3650 4200 3400
Connection ~ 4200 3400
Wire Wire Line
	4200 3400 4150 3400
$Comp
L power:GND #PWR?
U 1 1 60AF8383
P 4850 3750
AR Path="/60AF8383" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60AF8383" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF8383" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF8383" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4850 3500 50  0001 C CNN
F 1 "GND" H 4855 3577 50  0000 C CNN
F 2 "" H 4850 3750 50  0001 C CNN
F 3 "" H 4850 3750 50  0001 C CNN
	1    4850 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3750 4850 3650
Wire Wire Line
	4600 3650 4850 3650
Connection ~ 4850 3650
Wire Wire Line
	4850 3650 4850 3600
Text HLabel 3700 3400 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	3700 3400 3850 3400
Text GLabel 4750 3050 0    50   Input ~ 0
BODY_HEATER1B
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60AF8390
P 4750 3400
AR Path="/60AF8390" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60AF8390" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8390" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8390" Ref="Q?"  Part="1" 
F 0 "Q?" H 4954 3446 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4954 3355 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 4950 3500 50  0001 C CNN
F 3 "~" H 4750 3400 50  0001 C CNN
	1    4750 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3050 4850 3050
Wire Wire Line
	4850 3050 4850 3200
Wire Wire Line
	2350 3050 2200 3050
$Comp
L Device:R R?
U 1 1 60AF8399
P 1950 4800
AR Path="/60AF8399" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF8399" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8399" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8399" Ref="R?"  Part="1" 
F 0 "R?" V 1743 4800 50  0000 C CNN
F 1 "10k" V 1834 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1880 4800 50  0001 C CNN
F 3 "~" H 1950 4800 50  0001 C CNN
	1    1950 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60AF839F
P 1500 4550
AR Path="/60AF839F" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF839F" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF839F" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF839F" Ref="R?"  Part="1" 
F 0 "R?" V 1293 4550 50  0000 C CNN
F 1 "1k" V 1384 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1430 4550 50  0001 C CNN
F 3 "~" H 1500 4550 50  0001 C CNN
	1    1500 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 4550 1700 4550
Wire Wire Line
	1800 4800 1700 4800
Wire Wire Line
	1700 4800 1700 4550
Connection ~ 1700 4550
Wire Wire Line
	1700 4550 1650 4550
$Comp
L power:GND #PWR?
U 1 1 60AF83AA
P 2350 4900
AR Path="/60AF83AA" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60AF83AA" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF83AA" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF83AA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 4650 50  0001 C CNN
F 1 "GND" H 2355 4727 50  0000 C CNN
F 2 "" H 2350 4900 50  0001 C CNN
F 3 "" H 2350 4900 50  0001 C CNN
	1    2350 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4900 2350 4800
Wire Wire Line
	2100 4800 2350 4800
Connection ~ 2350 4800
Wire Wire Line
	2350 4800 2350 4750
Text HLabel 1200 4550 0    50   Input ~ 0
LID_HEATER2
Wire Wire Line
	1200 4550 1350 4550
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60AF83B6
P 2250 4550
AR Path="/60AF83B6" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60AF83B6" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF83B6" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF83B6" Ref="Q?"  Part="1" 
F 0 "Q?" H 2454 4596 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2454 4505 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2450 4650 50  0001 C CNN
F 3 "~" H 2250 4550 50  0001 C CNN
	1    2250 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4200 2350 4350
Wire Wire Line
	2350 4200 2200 4200
$Comp
L Device:R R?
U 1 1 60AF83BE
P 4450 4850
AR Path="/60AF83BE" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF83BE" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83BE" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83BE" Ref="R?"  Part="1" 
F 0 "R?" V 4243 4850 50  0000 C CNN
F 1 "10k" V 4334 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4380 4850 50  0001 C CNN
F 3 "~" H 4450 4850 50  0001 C CNN
	1    4450 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60AF83C4
P 4000 4600
AR Path="/60AF83C4" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF83C4" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83C4" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83C4" Ref="R?"  Part="1" 
F 0 "R?" V 3793 4600 50  0000 C CNN
F 1 "1k" V 3884 4600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3930 4600 50  0001 C CNN
F 3 "~" H 4000 4600 50  0001 C CNN
	1    4000 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 4600 4200 4600
Wire Wire Line
	4300 4850 4200 4850
Wire Wire Line
	4200 4850 4200 4600
Connection ~ 4200 4600
Wire Wire Line
	4200 4600 4150 4600
$Comp
L power:GND #PWR?
U 1 1 60AF83CF
P 4850 4950
AR Path="/60AF83CF" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60AF83CF" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF83CF" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF83CF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4850 4700 50  0001 C CNN
F 1 "GND" H 4855 4777 50  0000 C CNN
F 2 "" H 4850 4950 50  0001 C CNN
F 3 "" H 4850 4950 50  0001 C CNN
	1    4850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4950 4850 4850
Wire Wire Line
	4600 4850 4850 4850
Connection ~ 4850 4850
Wire Wire Line
	4850 4850 4850 4800
Text HLabel 3700 4600 0    50   Input ~ 0
WELL_HEATER2
Wire Wire Line
	3700 4600 3850 4600
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60AF83DB
P 4750 4600
AR Path="/60AF83DB" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60AF83DB" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF83DB" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF83DB" Ref="Q?"  Part="1" 
F 0 "Q?" H 4954 4646 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4954 4555 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 4950 4700 50  0001 C CNN
F 3 "~" H 4750 4600 50  0001 C CNN
	1    4750 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4250 4850 4250
Wire Wire Line
	4850 4250 4850 4400
$Comp
L Device:R R?
U 1 1 60AF83E3
P 1950 5950
AR Path="/60AF83E3" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF83E3" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E3" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E3" Ref="R?"  Part="1" 
F 0 "R?" V 1743 5950 50  0000 C CNN
F 1 "10k" V 1834 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1880 5950 50  0001 C CNN
F 3 "~" H 1950 5950 50  0001 C CNN
	1    1950 5950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60AF83E9
P 1500 5700
AR Path="/60AF83E9" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF83E9" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E9" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E9" Ref="R?"  Part="1" 
F 0 "R?" V 1293 5700 50  0000 C CNN
F 1 "1k" V 1384 5700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1430 5700 50  0001 C CNN
F 3 "~" H 1500 5700 50  0001 C CNN
	1    1500 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 5700 1700 5700
Wire Wire Line
	1800 5950 1700 5950
Wire Wire Line
	1700 5950 1700 5700
Connection ~ 1700 5700
Wire Wire Line
	1700 5700 1650 5700
$Comp
L power:GND #PWR?
U 1 1 60AF83F4
P 2350 6050
AR Path="/60AF83F4" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60AF83F4" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF83F4" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF83F4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 5800 50  0001 C CNN
F 1 "GND" H 2355 5877 50  0000 C CNN
F 2 "" H 2350 6050 50  0001 C CNN
F 3 "" H 2350 6050 50  0001 C CNN
	1    2350 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6050 2350 5950
Wire Wire Line
	2100 5950 2350 5950
Connection ~ 2350 5950
Wire Wire Line
	2350 5950 2350 5900
Text HLabel 1200 5700 0    50   Input ~ 0
FAN1
Wire Wire Line
	1200 5700 1350 5700
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60AF8400
P 2250 5700
AR Path="/60AF8400" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60AF8400" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8400" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8400" Ref="Q?"  Part="1" 
F 0 "Q?" H 2454 5746 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2454 5655 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2450 5800 50  0001 C CNN
F 3 "~" H 2250 5700 50  0001 C CNN
	1    2250 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5350 2350 5350
Wire Wire Line
	2350 5350 2350 5500
Text GLabel 2250 5350 0    50   Input ~ 0
FAN_BLACK_GND1
$Comp
L Device:R R?
U 1 1 60AF8409
P 4450 5950
AR Path="/60AF8409" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF8409" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF8409" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF8409" Ref="R?"  Part="1" 
F 0 "R?" V 4243 5950 50  0000 C CNN
F 1 "10k" V 4334 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4380 5950 50  0001 C CNN
F 3 "~" H 4450 5950 50  0001 C CNN
	1    4450 5950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60AF840F
P 4000 5700
AR Path="/60AF840F" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60AF840F" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF840F" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF840F" Ref="R?"  Part="1" 
F 0 "R?" V 3793 5700 50  0000 C CNN
F 1 "1k" V 3884 5700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3930 5700 50  0001 C CNN
F 3 "~" H 4000 5700 50  0001 C CNN
	1    4000 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 5700 4200 5700
Wire Wire Line
	4300 5950 4200 5950
Wire Wire Line
	4200 5950 4200 5700
Connection ~ 4200 5700
Wire Wire Line
	4200 5700 4150 5700
$Comp
L power:GND #PWR?
U 1 1 60AF841A
P 4850 6050
AR Path="/60AF841A" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60AF841A" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60AF841A" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60AF841A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4850 5800 50  0001 C CNN
F 1 "GND" H 4855 5877 50  0000 C CNN
F 2 "" H 4850 6050 50  0001 C CNN
F 3 "" H 4850 6050 50  0001 C CNN
	1    4850 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 6050 4850 5950
Wire Wire Line
	4600 5950 4850 5950
Connection ~ 4850 5950
Wire Wire Line
	4850 5950 4850 5900
Text HLabel 3700 5700 0    50   Input ~ 0
FAN2
Wire Wire Line
	3700 5700 3850 5700
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60AF8426
P 4750 5700
AR Path="/60AF8426" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60AF8426" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8426" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8426" Ref="Q?"  Part="1" 
F 0 "Q?" H 4954 5746 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4954 5655 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 4950 5800 50  0001 C CNN
F 3 "~" H 4750 5700 50  0001 C CNN
	1    4750 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5350 4850 5350
Wire Wire Line
	4850 5350 4850 5500
Text GLabel 4750 5350 0    50   Input ~ 0
FAN_BLACK_GND2
$Sheet
S 3550 6550 1200 900 
U 60B09AA3
F0 "Thermistors" 50
F1 "fileThermistors.sch" 50
$EndSheet
Text GLabel 10150 4950 0    50   Input ~ 0
THERM_MUX_OUT
$Sheet
S 2150 6550 1250 900 
U 60AFF976
F0 "LED" 50
F1 "fileLED.sch" 50
$EndSheet
NoConn ~ 2900 2300
NoConn ~ 2900 2500
NoConn ~ 2900 2600
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 60BCEC9B
P 7750 4350
F 0 "JP?" H 7750 4585 50  0000 C CNN
F 1 "Jumper_2_Open" H 7750 4494 50  0000 C CNN
F 2 "" H 7750 4350 50  0001 C CNN
F 3 "~" H 7750 4350 50  0001 C CNN
	1    7750 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4350 8100 4350
Text Notes 9700 5550 0    50   ~ 0
To Photosensing Board
$Comp
L power:GND #PWR?
U 1 1 60B11158
P 7400 4450
AR Path="/60B11158" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60B11158" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B11158" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60B11158" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7400 4200 50  0001 C CNN
F 1 "GND" H 7405 4277 50  0000 C CNN
F 2 "" H 7400 4450 50  0001 C CNN
F 3 "" H 7400 4450 50  0001 C CNN
	1    7400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4350 7400 4350
Wire Wire Line
	7400 4350 7400 4450
$Comp
L power:GNDA #PWR?
U 1 1 60B20DBD
P 8100 4450
F 0 "#PWR?" H 8100 4200 50  0001 C CNN
F 1 "GNDA" H 8105 4277 50  0000 C CNN
F 2 "" H 8100 4450 50  0001 C CNN
F 3 "" H 8100 4450 50  0001 C CNN
	1    8100 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4450 8100 4350
Text GLabel 10150 3850 0    50   Input ~ 0
GNDA
Text GLabel 10150 3950 0    50   Input ~ 0
3V3A
Text GLabel 10150 3750 0    50   Input ~ 0
-1V
Text GLabel 10150 5050 0    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 1200 1100 0    50   Input ~ 0
AMP_GAIN_SW
$Comp
L Connector:Conn_01x16_Male J?
U 1 1 60B0637E
P 10500 4250
F 0 "J?" H 10472 4224 50  0000 R CNN
F 1 "Conn_01x16_Male" H 10472 4133 50  0000 R CNN
F 2 "" H 10500 4250 50  0001 C CNN
F 3 "~" H 10500 4250 50  0001 C CNN
	1    10500 4250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10300 3550 10150 3550
Wire Wire Line
	10300 3650 10150 3650
Wire Wire Line
	10300 3750 10150 3750
Wire Wire Line
	10300 3850 10150 3850
Wire Wire Line
	10300 3950 10150 3950
Wire Wire Line
	10300 4050 10150 4050
Wire Wire Line
	10300 4150 10150 4150
Wire Wire Line
	10300 4250 10150 4250
Wire Wire Line
	10300 4350 10150 4350
Wire Wire Line
	10300 4450 10150 4450
Wire Wire Line
	10300 4550 10150 4550
Wire Wire Line
	10300 4650 10150 4650
Wire Wire Line
	10300 4750 10150 4750
Wire Wire Line
	10300 4850 10150 4850
Wire Wire Line
	10300 4950 10150 4950
Wire Wire Line
	10300 5050 10150 5050
Text GLabel 9850 1400 0    50   Input ~ 0
GNDA
Text Notes 5500 700  0    50   ~ 0
IN=High : COM <-> NO\nIN=Low : COM <-> NC
Text GLabel 5250 1400 0    50   Input ~ 0
SPI_SWITCH
$Comp
L power:GND #PWR?
U 1 1 60B17BA2
P 6650 1800
AR Path="/60AC9047/60B17BA2" Ref="#PWR?"  Part="1" 
AR Path="/60B17BA2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6650 1550 50  0001 C CNN
F 1 "GND" H 6655 1627 50  0000 C CNN
F 2 "" H 6650 1800 50  0001 C CNN
F 3 "" H 6650 1800 50  0001 C CNN
	1    6650 1800
	1    0    0    -1  
$EndComp
Text GLabel 5250 1600 0    50   Input ~ 0
SPI_MOSI
Text GLabel 6600 1600 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 6600 1400 2    50   Input ~ 0
LED_SPI_MOSI
Wire Wire Line
	5300 1200 5250 1200
Wire Wire Line
	5250 1400 5300 1400
Wire Wire Line
	5300 1600 5250 1600
Wire Wire Line
	6600 1400 6500 1400
Wire Wire Line
	6600 1600 6500 1600
$Comp
L Ninja-qPCR:TS5A9411DCKR U?
U 1 1 60B17B92
P 5900 1500
AR Path="/60AC9047/60B17B92" Ref="U?"  Part="1" 
AR Path="/60B17B92" Ref="U?"  Part="1" 
F 0 "U?" H 5900 2188 60  0000 C CNN
F 1 "TS5A9411DCKR" H 5900 2082 60  0000 C CNN
F 2 "DCK0006A_N" H 5900 1440 60  0001 C CNN
F 3 "" H 5900 1500 60  0000 C CNN
	1    5900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1800 6500 1800
Text GLabel 2900 2700 2    50   Input ~ 0
THERM_R_SWITCH
Wire Wire Line
	2900 2700 2750 2700
Text Notes 800  750  0    50   ~ 0
Max 50mA
Text GLabel 10150 3650 0    50   Input ~ 0
3V3D
Text GLabel 5250 1200 0    50   Input ~ 0
3V3D
Text GLabel 2900 1500 2    50   Input ~ 0
MUX_S0
Text GLabel 2900 1300 2    50   Input ~ 0
MUX_S1
Text HLabel 1200 1600 0    50   Input ~ 0
3V3_RASP
$EndSCHEMATC
