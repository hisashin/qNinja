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
Text GLabel 6400 4550 2    50   Input ~ 0
GND
Text GLabel 6400 4650 2    50   Input ~ 0
+10V
Text GLabel 6400 4750 2    50   Input ~ 0
-10V
Text GLabel 7300 5150 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 7300 5250 2    50   Input ~ 0
PD_MUX_SPI_SCLK
Text GLabel 7300 5350 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 7300 5450 2    50   Input ~ 0
PD_MUX_SYNC
Text GLabel 7300 5550 2    50   Input ~ 0
VCC
Wire Wire Line
	6400 4550 6200 4550
Wire Wire Line
	6200 4650 6400 4650
Wire Wire Line
	6400 4750 6200 4750
Wire Wire Line
	6200 4850 6400 4850
Wire Wire Line
	6400 4950 6200 4950
Wire Wire Line
	6200 5050 6400 5050
Wire Wire Line
	6400 5150 6200 5150
Wire Wire Line
	6200 5250 6400 5250
Text GLabel 7300 5650 2    50   Input ~ 0
PHOTO_OUT
Wire Wire Line
	6400 5350 6200 5350
$Comp
L Ninja-qPCR:Conn_02x05 U?
U 1 1 5F72F37C
P 3500 2800
AR Path="/5F72F37C" Ref="U?"  Part="1" 
AR Path="/5F708CA1/5F72F37C" Ref="U?"  Part="1" 
F 0 "U?" H 3538 3025 50  0000 C CNN
F 1 "Conn_02x05" H 3538 2934 50  0000 C CNN
F 2 "Ninja-qPCR:Con_2x05" H 3300 2900 50  0001 C CNN
F 3 "" H 3300 2900 50  0001 C CNN
	1    3500 2800
	-1   0    0    -1  
$EndComp
Text GLabel 3950 2800 2    50   Input ~ 0
VCC_LED
Text GLabel 3950 2900 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 3950 3000 2    50   Input ~ 0
GND
Text GLabel 3950 3100 2    50   Input ~ 0
LED_PWM
Text GLabel 3950 3200 2    50   Input ~ 0
LED_LAT
Text GLabel 3950 3300 2    50   Input ~ 0
LED_SPI_SCLK
Text GLabel 3950 3400 2    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 3950 3500 2    50   Input ~ 0
LED_SPI_MISO
Text GLabel 3950 3600 2    50   Input ~ 0
I2C_SCL
Text GLabel 3950 3700 2    50   Input ~ 0
I2C_SDA
Wire Wire Line
	3950 3700 3700 3700
Wire Wire Line
	3950 3600 3700 3600
Wire Wire Line
	3950 3500 3700 3500
Wire Wire Line
	3950 3400 3700 3400
Wire Wire Line
	3950 3300 3700 3300
Wire Wire Line
	3950 3200 3700 3200
Wire Wire Line
	3950 3100 3700 3100
Wire Wire Line
	3950 3000 3700 3000
Wire Wire Line
	3950 2900 3700 2900
Wire Wire Line
	3950 2800 3700 2800
Text GLabel 6400 4850 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 6400 4950 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 6400 5050 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 6400 5250 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 6400 5150 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 6400 5350 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 6400 5450 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 6400 5550 2    50   Input ~ 0
ADC_DRDY
Text GLabel 6400 5650 2    50   Input ~ 0
I2C_SCL
Text GLabel 6400 5750 2    50   Input ~ 0
I2C_SDA
Wire Wire Line
	6200 5450 6400 5450
Wire Wire Line
	6200 5550 6400 5550
Wire Wire Line
	6200 5650 6400 5650
Wire Wire Line
	6200 5750 6400 5750
Text GLabel 6400 5850 2    50   Input ~ 0
THERM_AIR
Text GLabel 6400 5950 2    50   Input ~ 0
THERM_WELL
$Comp
L Connector:Conn_01x15_Male J?
U 1 1 5F72F3A6
P 6000 5250
AR Path="/5F72F3A6" Ref="J?"  Part="1" 
AR Path="/5F708CA1/5F72F3A6" Ref="J?"  Part="1" 
F 0 "J?" H 6108 6131 50  0000 C CNN
F 1 "Conn_01x15_Male" H 6108 6040 50  0000 C CNN
F 2 "" H 6000 5250 50  0001 C CNN
F 3 "~" H 6000 5250 50  0001 C CNN
	1    6000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5850 6200 5850
Wire Wire Line
	6400 5950 6200 5950
Text GLabel 5350 1550 0    50   Input ~ 0
VCC_THERM
$Comp
L Device:R R?
U 1 1 5F72F3AF
P 5650 1550
AR Path="/5F58C19F/5F72F3AF" Ref="R?"  Part="1" 
AR Path="/5F72F3AF" Ref="R?"  Part="1" 
AR Path="/5F708CA1/5F72F3AF" Ref="R?"  Part="1" 
F 0 "R?" V 5443 1550 50  0000 C CNN
F 1 "R" V 5534 1550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5580 1550 50  0001 C CNN
F 3 "~" H 5650 1550 50  0001 C CNN
	1    5650 1550
	0    1    1    0   
$EndComp
Text GLabel 5950 1550 2    50   Input ~ 0
THERM_WELL
Wire Wire Line
	5350 1550 5400 1550
Wire Wire Line
	5800 1550 5950 1550
Text GLabel 5950 3350 2    50   Input ~ 0
THERM_EXT3
Text GLabel 5950 1850 2    50   Input ~ 0
THERM_AIR
Text GLabel 5950 2150 2    50   Input ~ 0
THERM_LID1
Text GLabel 5950 2450 2    50   Input ~ 0
THERM_LID2
Text GLabel 5950 2750 2    50   Input ~ 0
THERM_EXT1
Text GLabel 5950 3050 2    50   Input ~ 0
THERM_EXT2
$Comp
L Device:R R?
U 1 1 5F72F3BE
P 5650 1850
AR Path="/5F58C19F/5F72F3BE" Ref="R?"  Part="1" 
AR Path="/5F72F3BE" Ref="R?"  Part="1" 
AR Path="/5F708CA1/5F72F3BE" Ref="R?"  Part="1" 
F 0 "R?" V 5443 1850 50  0000 C CNN
F 1 "R" V 5534 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5580 1850 50  0001 C CNN
F 3 "~" H 5650 1850 50  0001 C CNN
	1    5650 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F72F3C4
P 5650 2150
AR Path="/5F58C19F/5F72F3C4" Ref="R?"  Part="1" 
AR Path="/5F72F3C4" Ref="R?"  Part="1" 
AR Path="/5F708CA1/5F72F3C4" Ref="R?"  Part="1" 
F 0 "R?" V 5443 2150 50  0000 C CNN
F 1 "R" V 5534 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5580 2150 50  0001 C CNN
F 3 "~" H 5650 2150 50  0001 C CNN
	1    5650 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F72F3CA
P 5650 2450
AR Path="/5F58C19F/5F72F3CA" Ref="R?"  Part="1" 
AR Path="/5F72F3CA" Ref="R?"  Part="1" 
AR Path="/5F708CA1/5F72F3CA" Ref="R?"  Part="1" 
F 0 "R?" V 5443 2450 50  0000 C CNN
F 1 "R" V 5534 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5580 2450 50  0001 C CNN
F 3 "~" H 5650 2450 50  0001 C CNN
	1    5650 2450
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F72F3D0
P 5650 2750
AR Path="/5F58C19F/5F72F3D0" Ref="R?"  Part="1" 
AR Path="/5F72F3D0" Ref="R?"  Part="1" 
AR Path="/5F708CA1/5F72F3D0" Ref="R?"  Part="1" 
F 0 "R?" V 5443 2750 50  0000 C CNN
F 1 "R" V 5534 2750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5580 2750 50  0001 C CNN
F 3 "~" H 5650 2750 50  0001 C CNN
	1    5650 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F72F3D6
P 5650 3050
AR Path="/5F58C19F/5F72F3D6" Ref="R?"  Part="1" 
AR Path="/5F72F3D6" Ref="R?"  Part="1" 
AR Path="/5F708CA1/5F72F3D6" Ref="R?"  Part="1" 
F 0 "R?" V 5443 3050 50  0000 C CNN
F 1 "R" V 5534 3050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5580 3050 50  0001 C CNN
F 3 "~" H 5650 3050 50  0001 C CNN
	1    5650 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F72F3DC
P 5650 3350
AR Path="/5F58C19F/5F72F3DC" Ref="R?"  Part="1" 
AR Path="/5F72F3DC" Ref="R?"  Part="1" 
AR Path="/5F708CA1/5F72F3DC" Ref="R?"  Part="1" 
F 0 "R?" V 5443 3350 50  0000 C CNN
F 1 "R" V 5534 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5580 3350 50  0001 C CNN
F 3 "~" H 5650 3350 50  0001 C CNN
	1    5650 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 1850 5950 1850
Wire Wire Line
	5800 2150 5950 2150
Wire Wire Line
	5800 2450 5950 2450
Wire Wire Line
	5800 2750 5950 2750
Wire Wire Line
	5800 3050 5950 3050
Wire Wire Line
	5800 3350 5950 3350
Wire Wire Line
	5500 3350 5400 3350
Wire Wire Line
	5400 3350 5400 3050
Connection ~ 5400 1550
Wire Wire Line
	5400 1550 5500 1550
Wire Wire Line
	5500 1850 5400 1850
Connection ~ 5400 1850
Wire Wire Line
	5400 1850 5400 1550
Wire Wire Line
	5500 2150 5400 2150
Connection ~ 5400 2150
Wire Wire Line
	5400 2150 5400 1850
Wire Wire Line
	5500 3050 5400 3050
Connection ~ 5400 3050
Wire Wire Line
	5400 3050 5400 2750
Wire Wire Line
	5500 2750 5400 2750
Connection ~ 5400 2750
Wire Wire Line
	5400 2750 5400 2450
Wire Wire Line
	5500 2450 5400 2450
Connection ~ 5400 2450
Wire Wire Line
	5400 2450 5400 2150
Text GLabel 3550 5450 2    50   Input ~ 0
THERM_EXT3
Text GLabel 3550 5250 2    50   Input ~ 0
THERM_EXT1
Text GLabel 3550 5050 2    50   Input ~ 0
THERM_LID1
Text GLabel 3550 5150 2    50   Input ~ 0
THERM_LID2
Text GLabel 3550 5350 2    50   Input ~ 0
THERM_EXT2
$Comp
L Ninja-qPCR:Conn_02x05 BODY?
U 1 1 5F72F400
P 7700 1500
AR Path="/5F58C19F/5F72F400" Ref="BODY?"  Part="1" 
AR Path="/5F72F400" Ref="BODY?"  Part="1" 
AR Path="/5F708CA1/5F72F400" Ref="BODY?"  Part="1" 
F 0 "BODY?" H 8019 1111 50  0000 L CNN
F 1 "Conn_02x05" H 8019 1020 50  0000 L CNN
F 2 "Ninja-qPCR:Con_2x05" H 7500 1600 50  0001 C CNN
F 3 "" H 7500 1600 50  0001 C CNN
	1    7700 1500
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_02x05 LID_2X?
U 1 1 5F72F406
P 7700 2700
AR Path="/5F58C19F/5F72F406" Ref="LID_2X?"  Part="1" 
AR Path="/5F72F406" Ref="LID_2X?"  Part="1" 
AR Path="/5F708CA1/5F72F406" Ref="LID_2X?"  Part="1" 
F 0 "LID_2X?" H 8019 2311 50  0000 L CNN
F 1 "Conn_02x05" H 8019 2220 50  0000 L CNN
F 2 "Ninja-qPCR:Con_2x05" H 7500 2800 50  0001 C CNN
F 3 "" H 7500 2800 50  0001 C CNN
	1    7700 2700
	1    0    0    -1  
$EndComp
Text GLabel 7350 1500 0    50   Input ~ 0
BODY_HEATER1A
Text GLabel 7350 1600 0    50   Input ~ 0
BODY_HEATER1B
Text GLabel 7350 1700 0    50   Input ~ 0
THERM_WELL
Text GLabel 7350 1800 0    50   Input ~ 0
FAN_BLACK_GND1
Text GLabel 7350 1900 0    50   Input ~ 0
FAN_RED_VCC
Text GLabel 7350 2000 0    50   Input ~ 0
GND
Text GLabel 7350 2100 0    50   Input ~ 0
FAN_BLACK_GND2
Text GLabel 7350 2200 0    50   Input ~ 0
THERM_EXT3
Text GLabel 7350 2300 0    50   Input ~ 0
BODY_HEATER2A
Text GLabel 7350 2400 0    50   Input ~ 0
BODY_HEATER2B
Wire Wire Line
	7500 1500 7350 1500
Wire Wire Line
	7350 1600 7500 1600
Wire Wire Line
	7500 1700 7350 1700
Wire Wire Line
	7350 1800 7500 1800
Wire Wire Line
	7500 1900 7350 1900
Wire Wire Line
	7350 2000 7500 2000
Wire Wire Line
	7500 2100 7350 2100
Wire Wire Line
	7350 2200 7500 2200
Wire Wire Line
	7500 2300 7350 2300
Wire Wire Line
	7350 2400 7500 2400
Text GLabel 7350 2700 0    50   Input ~ 0
LID_HEATER1A
Text GLabel 7350 2800 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 7350 3500 0    50   Input ~ 0
LID_HEATER2A
Text GLabel 7350 3600 0    50   Input ~ 0
LID_HEATER2B
Text GLabel 7350 2900 0    50   Input ~ 0
THERM_AIR
Text GLabel 7350 3000 0    50   Input ~ 0
THERM_EXT1
Text GLabel 7350 3100 0    50   Input ~ 0
THERM_LID1
Text GLabel 7350 3200 0    50   Input ~ 0
GND
Text GLabel 7350 3300 0    50   Input ~ 0
THERM_LID2
Text GLabel 7350 3400 0    50   Input ~ 0
THERM_EXT2
Wire Wire Line
	7500 2700 7350 2700
Wire Wire Line
	7350 2800 7500 2800
Wire Wire Line
	7500 2900 7350 2900
Wire Wire Line
	7350 3000 7500 3000
Wire Wire Line
	7500 3100 7350 3100
Wire Wire Line
	7350 3200 7500 3200
Wire Wire Line
	7500 3300 7350 3300
Wire Wire Line
	7350 3400 7500 3400
Wire Wire Line
	7500 3500 7350 3500
Wire Wire Line
	7350 3600 7500 3600
$EndSCHEMATC
