EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
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
	2000 1450 2150 1450
Wire Wire Line
	2000 2250 2150 2250
Text GLabel 2000 2650 0    50   Input ~ 0
GND
Wire Wire Line
	2000 2650 2150 2650
Text GLabel 2000 3350 0    50   Input ~ 0
GND
Wire Wire Line
	2000 3350 2150 3350
Text GLabel 3700 1650 2    50   Input ~ 0
GND
Text GLabel 3700 2850 2    50   Input ~ 0
GND
Text GLabel 3700 2350 2    50   Input ~ 0
GND
Text GLabel 3700 3050 2    50   Input ~ 0
GND
Wire Wire Line
	3700 3050 3550 3050
Wire Wire Line
	3700 2350 3550 2350
Wire Wire Line
	3700 2050 3550 2050
Wire Wire Line
	3550 1650 3700 1650
Text HLabel 2000 2050 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	2000 2050 2150 2050
Text GLabel 2000 1750 0    50   Input ~ 0
GPIO7
Text GLabel 2000 2550 0    50   Input ~ 0
SPI_SCLK
Text GLabel 2000 2350 0    50   Input ~ 0
SPI_MOSI
Text GLabel 3700 2150 2    50   Input ~ 0
PD_MUX_GPIO2?
Text GLabel 2000 1650 0    50   Input ~ 0
I2C_SCL
Text GLabel 2000 1550 0    50   Input ~ 0
I2C_SDA
Text GLabel 2000 2150 0    50   Input ~ 0
LED_LAT
Text GLabel 2000 2450 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	2000 2350 2150 2350
Wire Wire Line
	2000 2450 2150 2450
Wire Wire Line
	2150 2550 2000 2550
Wire Wire Line
	2000 1550 2150 1550
Wire Wire Line
	2150 1650 2000 1650
Wire Wire Line
	2000 1750 2150 1750
Wire Wire Line
	2150 2850 2000 2850
Wire Wire Line
	3700 3150 3550 3150
Text HLabel 2000 3050 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	2000 3050 2150 3050
Wire Wire Line
	3700 2150 3550 2150
Wire Wire Line
	2150 2150 2000 2150
Wire Wire Line
	3700 2850 3550 2850
Text HLabel 3700 2550 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	3700 2450 3550 2450
Text GLabel 3700 2950 2    50   Input ~ 0
PD_REF_PWM
Wire Wire Line
	3700 2950 3550 2950
Wire Wire Line
	2000 3250 2150 3250
Text HLabel 2000 3150 0    50   Input ~ 0
LID_HEATER2
Text HLabel 2000 1950 0    50   Input ~ 0
WELL_HEATER2
Text GLabel 2000 1850 0    50   Input ~ 0
GND
Wire Wire Line
	2000 1850 2150 1850
Wire Wire Line
	2000 1950 2150 1950
Text GLabel 3700 2050 2    50   Input ~ 0
GND
NoConn ~ 2000 2750
Wire Wire Line
	2150 2750 2000 2750
NoConn ~ 3700 2750
Wire Wire Line
	3700 2750 3550 2750
Wire Wire Line
	2000 3150 2150 3150
Wire Wire Line
	3700 2250 3550 2250
Text GLabel 3700 1750 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 3700 1850 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 3700 1950 2    50   Input ~ 0
PD_MUX_GPIO3?
Wire Wire Line
	3700 1750 3550 1750
Wire Wire Line
	3550 1850 3700 1850
Wire Wire Line
	3700 1950 3550 1950
Text GLabel 3700 2450 2    50   Input ~ 0
PD_MUX_GPIO1
Wire Wire Line
	3700 2550 3550 2550
Wire Wire Line
	3550 3250 3700 3250
Wire Wire Line
	3550 3350 3700 3350
Wire Wire Line
	4850 2900 4700 2900
Wire Wire Line
	4300 2700 4300 2650
Connection ~ 4300 2650
Wire Wire Line
	4800 2700 4800 2650
Connection ~ 4800 2650
$Sheet
S 9100 4750 850  250 
U 5F7093B5
F0 "SheetPower" 50
F1 "filePower.sch" 50
$EndSheet
Wire Wire Line
	2150 2950 2000 2950
Text GLabel 3700 3150 2    50   Input ~ 0
THERM_AIR
Text GLabel 3700 3250 2    50   Input ~ 0
THERM_LID1
Text GLabel 3700 3350 2    50   Input ~ 0
THERM_LID2
Text GLabel 3700 2250 2    50   Input ~ 0
SPI_SWITCH
Wire Wire Line
	3550 1450 3650 1450
Wire Wire Line
	3550 1550 3650 1550
Wire Wire Line
	3650 1550 3650 1450
Connection ~ 3650 1450
Wire Wire Line
	3650 1450 3700 1450
Wire Wire Line
	6950 3550 6800 3550
Wire Wire Line
	6950 3450 6800 3450
Wire Wire Line
	6950 3350 6800 3350
Text GLabel 6950 3450 2    50   Input ~ 0
THERM_EXT2
Text GLabel 6950 3350 2    50   Input ~ 0
THERM_EXT1
Text GLabel 6950 3550 2    50   Input ~ 0
THERM_EXT3
Wire Wire Line
	6750 2100 6750 1800
Connection ~ 6750 2100
Wire Wire Line
	6850 2100 6750 2100
Wire Wire Line
	6750 2400 6750 2100
Connection ~ 6750 2400
Wire Wire Line
	6850 2400 6750 2400
Wire Wire Line
	6750 2700 6750 2400
Connection ~ 6750 2700
Wire Wire Line
	6850 2700 6750 2700
Wire Wire Line
	6750 1800 6750 1500
Connection ~ 6750 1800
Wire Wire Line
	6850 1800 6750 1800
Wire Wire Line
	6750 1500 6750 1200
Connection ~ 6750 1500
Wire Wire Line
	6850 1500 6750 1500
Wire Wire Line
	6750 1200 6850 1200
Connection ~ 6750 1200
Wire Wire Line
	6750 3000 6750 2700
Wire Wire Line
	6850 3000 6750 3000
Wire Wire Line
	7150 3000 7300 3000
Wire Wire Line
	7150 2700 7300 2700
Wire Wire Line
	7150 2400 7300 2400
Wire Wire Line
	7150 2100 7300 2100
Wire Wire Line
	7150 1800 7300 1800
Wire Wire Line
	7150 1500 7300 1500
Text GLabel 7300 2700 2    50   Input ~ 0
THERM_EXT2
Text GLabel 7300 2400 2    50   Input ~ 0
THERM_EXT1
Text GLabel 7300 2100 2    50   Input ~ 0
THERM_LID2
Text GLabel 7300 1800 2    50   Input ~ 0
THERM_LID1
Text GLabel 7300 1500 2    50   Input ~ 0
THERM_AIR
Text GLabel 7300 3000 2    50   Input ~ 0
THERM_EXT3
Wire Wire Line
	7150 1200 7300 1200
Wire Wire Line
	6700 1200 6750 1200
Text GLabel 7300 1200 2    50   Input ~ 0
THERM_WELL
Text GLabel 7050 3900 2    50   Input ~ 0
GPIO7
Wire Wire Line
	7050 3900 6800 3900
NoConn ~ 2000 2250
Wire Wire Line
	2700 4550 2350 4550
Wire Wire Line
	2450 4800 2350 4800
Wire Wire Line
	2350 4800 2350 4550
Connection ~ 2350 4550
Wire Wire Line
	2350 4550 2300 4550
Wire Wire Line
	3000 4900 3000 4800
Wire Wire Line
	2750 4800 3000 4800
Connection ~ 3000 4800
Wire Wire Line
	3000 4800 3000 4750
Text HLabel 1850 4550 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	1850 4550 2000 4550
Wire Wire Line
	3000 4200 3000 4350
Text GLabel 5400 5400 0    50   Input ~ 0
BODY_HEATER2B
Text GLabel 2850 4200 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 2850 5350 0    50   Input ~ 0
LID_HEATER2B
Wire Wire Line
	5200 4550 4850 4550
Wire Wire Line
	4950 4800 4850 4800
Wire Wire Line
	4850 4800 4850 4550
Connection ~ 4850 4550
Wire Wire Line
	4850 4550 4800 4550
Wire Wire Line
	5500 4900 5500 4800
Wire Wire Line
	5250 4800 5500 4800
Connection ~ 5500 4800
Wire Wire Line
	5500 4800 5500 4750
Text HLabel 4350 4550 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	4350 4550 4500 4550
Text GLabel 5400 4200 0    50   Input ~ 0
BODY_HEATER1B
Wire Wire Line
	5400 4200 5500 4200
Wire Wire Line
	5500 4200 5500 4350
Wire Wire Line
	3000 4200 2850 4200
Wire Wire Line
	2700 5700 2350 5700
Wire Wire Line
	2450 5950 2350 5950
Wire Wire Line
	2350 5950 2350 5700
Connection ~ 2350 5700
Wire Wire Line
	2350 5700 2300 5700
Wire Wire Line
	3000 6050 3000 5950
Wire Wire Line
	2750 5950 3000 5950
Connection ~ 3000 5950
Wire Wire Line
	3000 5950 3000 5900
Text HLabel 1850 5700 0    50   Input ~ 0
LID_HEATER2
Wire Wire Line
	1850 5700 2000 5700
Wire Wire Line
	3000 5350 3000 5500
Wire Wire Line
	3000 5350 2850 5350
Wire Wire Line
	5200 5750 4850 5750
Wire Wire Line
	4950 6000 4850 6000
Wire Wire Line
	4850 6000 4850 5750
Connection ~ 4850 5750
Wire Wire Line
	4850 5750 4800 5750
Wire Wire Line
	5500 6100 5500 6000
Wire Wire Line
	5250 6000 5500 6000
Connection ~ 5500 6000
Wire Wire Line
	5500 6000 5500 5950
Text HLabel 4350 5750 0    50   Input ~ 0
WELL_HEATER2
Wire Wire Line
	4350 5750 4500 5750
Wire Wire Line
	5400 5400 5500 5400
Wire Wire Line
	5500 5400 5500 5550
Wire Wire Line
	2700 6850 2350 6850
Wire Wire Line
	2450 7100 2350 7100
Wire Wire Line
	2350 7100 2350 6850
Connection ~ 2350 6850
Wire Wire Line
	2350 6850 2300 6850
Wire Wire Line
	3000 7200 3000 7100
Wire Wire Line
	2750 7100 3000 7100
Connection ~ 3000 7100
Wire Wire Line
	3000 7100 3000 7050
Text HLabel 1850 6850 0    50   Input ~ 0
FAN1
Wire Wire Line
	1850 6850 2000 6850
Wire Wire Line
	2900 6500 3000 6500
Wire Wire Line
	3000 6500 3000 6650
Text GLabel 2900 6500 0    50   Input ~ 0
FAN_BLACK_GND1
Wire Wire Line
	5200 6850 4850 6850
Wire Wire Line
	4950 7100 4850 7100
Wire Wire Line
	4850 7100 4850 6850
Connection ~ 4850 6850
Wire Wire Line
	4850 6850 4800 6850
Wire Wire Line
	5500 7200 5500 7100
Wire Wire Line
	5250 7100 5500 7100
Connection ~ 5500 7100
Wire Wire Line
	5500 7100 5500 7050
Text HLabel 4350 6850 0    50   Input ~ 0
FAN2
Wire Wire Line
	4350 6850 4500 6850
Wire Wire Line
	5400 6500 5500 6500
Wire Wire Line
	5500 6500 5500 6650
Text GLabel 5400 6500 0    50   Input ~ 0
FAN_BLACK_GND2
Text HLabel 2000 2850 0    50   Input ~ 0
FAN1
Text HLabel 2000 2950 0    50   Input ~ 0
FAN2
Text HLabel 2000 1450 0    50   Input ~ 0
3V3_RASP
Text HLabel 7000 5650 0    50   Input ~ 0
3V3_RASP
Text HLabel 7000 6250 0    50   Input ~ 0
3V3_RASP
Text HLabel 7850 5550 2    50   Input ~ 0
VCC_LOGIC_LED
Text HLabel 7850 6150 2    50   Input ~ 0
VCC_LOGIC_PHOTO
Wire Wire Line
	7650 5450 7750 5450
Wire Wire Line
	7750 5450 7750 5550
Wire Wire Line
	7750 5650 7650 5650
Wire Wire Line
	7650 5550 7750 5550
Connection ~ 7750 5550
Wire Wire Line
	7750 5550 7750 5650
Wire Wire Line
	7850 5550 7750 5550
Wire Wire Line
	7650 6050 7750 6050
Wire Wire Line
	7750 6050 7750 6150
Wire Wire Line
	7750 6250 7650 6250
Wire Wire Line
	7650 6150 7750 6150
Connection ~ 7750 6150
Wire Wire Line
	7750 6150 7750 6250
Wire Wire Line
	7750 6150 7850 6150
Wire Wire Line
	7150 6050 7000 6050
Wire Wire Line
	7150 6150 7000 6150
Wire Wire Line
	7150 6250 7000 6250
Wire Wire Line
	7150 5650 7000 5650
Wire Wire Line
	7150 5550 7000 5550
Wire Wire Line
	7150 5450 7000 5450
Text HLabel 6700 1200 0    50   Input ~ 0
VCC_THERM
Text HLabel 7850 5000 2    50   Input ~ 0
VCC_THERM
Wire Wire Line
	7650 4900 7750 4900
Wire Wire Line
	7750 4900 7750 5000
Wire Wire Line
	7750 5100 7650 5100
Wire Wire Line
	7650 5000 7750 5000
Connection ~ 7750 5000
Wire Wire Line
	7750 5000 7750 5100
Wire Wire Line
	7850 5000 7750 5000
Text HLabel 7000 5100 0    50   Input ~ 0
3V3_RASP
Wire Wire Line
	7150 5100 7000 5100
Wire Wire Line
	7150 5000 7000 5000
Wire Wire Line
	7150 4900 7000 4900
Text HLabel 4850 2900 2    50   Input ~ 0
3V3_RASP
Text GLabel 3700 1450 2    50   Input ~ 0
5V
Text GLabel 7000 4900 0    50   Input ~ 0
3V3_SENSE
Text GLabel 7000 5000 0    50   Input ~ 0
3V3_REG
Text GLabel 7000 5450 0    50   Input ~ 0
3V3_SENSE
Text GLabel 7000 5550 0    50   Input ~ 0
3V3_REG
Text GLabel 7000 6050 0    50   Input ~ 0
3V3_SENSE
Text GLabel 7000 6150 0    50   Input ~ 0
3V3_REG
Wire Wire Line
	4250 2900 4400 2900
Wire Wire Line
	3550 2650 4250 2650
Wire Wire Line
	4250 2650 4300 2650
Connection ~ 4250 2650
Wire Wire Line
	4250 2900 4250 2650
Wire Wire Line
	4700 2650 4800 2650
Wire Wire Line
	4700 2700 4800 2700
Wire Wire Line
	4300 2650 4400 2650
Wire Wire Line
	4300 2700 4400 2700
Text GLabel 9600 2800 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 9600 3250 2    50   Input ~ 0
SPI_SCLK
Text GLabel 9600 2900 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 9600 3350 2    50   Input ~ 0
PD_MUX_GPIO3
Wire Wire Line
	9600 3350 9350 3350
Wire Wire Line
	9600 3250 9350 3250
Wire Wire Line
	9600 2900 9350 2900
Wire Wire Line
	9600 2800 9350 2800
Text GLabel 9600 3000 2    50   Input ~ 0
PD_MUX_GPIO2?
Text GLabel 9600 3450 2    50   Input ~ 0
PD_MUX_GPIO3?
Wire Wire Line
	9600 3000 9350 3000
Wire Wire Line
	9600 3450 9350 3450
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 602B5E42
P 9150 3350
AR Path="/602B5E42" Ref="J?"  Part="1" 
AR Path="/5FA5D98E/602B5E42" Ref="J?"  Part="1" 
F 0 "J?" H 9258 3631 50  0000 C CNN
F 1 "Conn_01x03_Male" H 9258 3540 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 9150 3350 50  0001 C CNN
F 3 "~" H 9150 3350 50  0001 C CNN
	1    9150 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 602B5E3C
P 9150 2900
AR Path="/602B5E3C" Ref="J?"  Part="1" 
AR Path="/5FA5D98E/602B5E3C" Ref="J?"  Part="1" 
F 0 "J?" H 9258 3181 50  0000 C CNN
F 1 "Conn_01x03_Male" H 9258 3090 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 9150 2900 50  0001 C CNN
F 3 "~" H 9150 2900 50  0001 C CNN
	1    9150 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J5
U 1 1 5FDB8CAC
P 7350 5000
F 0 "J5" H 7400 5317 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7400 5226 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7350 5000 50  0001 C CNN
F 3 "~" H 7350 5000 50  0001 C CNN
	1    7350 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J7
U 1 1 5FC0C671
P 7350 6150
F 0 "J7" H 7400 6467 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7400 6376 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7350 6150 50  0001 C CNN
F 3 "~" H 7350 6150 50  0001 C CNN
	1    7350 6150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J6
U 1 1 5FBFD18F
P 7350 5550
F 0 "J6" H 7400 5867 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7400 5776 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7350 5550 50  0001 C CNN
F 3 "~" H 7350 5550 50  0001 C CNN
	1    7350 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q6
U 1 1 5FA920EF
P 5400 6850
AR Path="/5FA920EF" Ref="Q6"  Part="1" 
AR Path="/5F7519D0/5FA920EF" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/5FA920EF" Ref="Q?"  Part="1" 
F 0 "Q6" H 5604 6896 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5604 6805 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5600 6950 50  0001 C CNN
F 3 "~" H 5400 6850 50  0001 C CNN
	1    5400 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5FA920E3
P 5500 7200
AR Path="/5FA920E3" Ref="#PWR06"  Part="1" 
AR Path="/5F7519D0/5FA920E3" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5FA920E3" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 5500 6950 50  0001 C CNN
F 1 "GND" H 5505 7027 50  0000 C CNN
F 2 "" H 5500 7200 50  0001 C CNN
F 3 "" H 5500 7200 50  0001 C CNN
	1    5500 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5FA920D8
P 4650 6850
AR Path="/5FA920D8" Ref="R10"  Part="1" 
AR Path="/5F7519D0/5FA920D8" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA920D8" Ref="R?"  Part="1" 
F 0 "R10" V 4443 6850 50  0000 C CNN
F 1 "1k" V 4534 6850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4580 6850 50  0001 C CNN
F 3 "~" H 4650 6850 50  0001 C CNN
	1    4650 6850
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5FA920D2
P 5100 7100
AR Path="/5FA920D2" Ref="R13"  Part="1" 
AR Path="/5F7519D0/5FA920D2" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA920D2" Ref="R?"  Part="1" 
F 0 "R13" V 4893 7100 50  0000 C CNN
F 1 "10k" V 4984 7100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5030 7100 50  0001 C CNN
F 3 "~" H 5100 7100 50  0001 C CNN
	1    5100 7100
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q3
U 1 1 5FA920C6
P 2900 6850
AR Path="/5FA920C6" Ref="Q3"  Part="1" 
AR Path="/5F7519D0/5FA920C6" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/5FA920C6" Ref="Q?"  Part="1" 
F 0 "Q3" H 3104 6896 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 3104 6805 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 3100 6950 50  0001 C CNN
F 3 "~" H 2900 6850 50  0001 C CNN
	1    2900 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5FA920BA
P 3000 7200
AR Path="/5FA920BA" Ref="#PWR03"  Part="1" 
AR Path="/5F7519D0/5FA920BA" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5FA920BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 3000 6950 50  0001 C CNN
F 1 "GND" H 3005 7027 50  0000 C CNN
F 2 "" H 3000 7200 50  0001 C CNN
F 3 "" H 3000 7200 50  0001 C CNN
	1    3000 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5FA920AF
P 2150 6850
AR Path="/5FA920AF" Ref="R3"  Part="1" 
AR Path="/5F7519D0/5FA920AF" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA920AF" Ref="R?"  Part="1" 
F 0 "R3" V 1943 6850 50  0000 C CNN
F 1 "1k" V 2034 6850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2080 6850 50  0001 C CNN
F 3 "~" H 2150 6850 50  0001 C CNN
	1    2150 6850
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5FA920A9
P 2600 7100
AR Path="/5FA920A9" Ref="R6"  Part="1" 
AR Path="/5F7519D0/5FA920A9" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA920A9" Ref="R?"  Part="1" 
F 0 "R6" V 2393 7100 50  0000 C CNN
F 1 "10k" V 2484 7100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2530 7100 50  0001 C CNN
F 3 "~" H 2600 7100 50  0001 C CNN
	1    2600 7100
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q5
U 1 1 5FA9209F
P 5400 5750
AR Path="/5FA9209F" Ref="Q5"  Part="1" 
AR Path="/5F7519D0/5FA9209F" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/5FA9209F" Ref="Q?"  Part="1" 
F 0 "Q5" H 5604 5796 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5604 5705 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5600 5850 50  0001 C CNN
F 3 "~" H 5400 5750 50  0001 C CNN
	1    5400 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5FA92093
P 5500 6100
AR Path="/5FA92093" Ref="#PWR05"  Part="1" 
AR Path="/5F7519D0/5FA92093" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5FA92093" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 5500 5850 50  0001 C CNN
F 1 "GND" H 5505 5927 50  0000 C CNN
F 2 "" H 5500 6100 50  0001 C CNN
F 3 "" H 5500 6100 50  0001 C CNN
	1    5500 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5FA92088
P 4650 5750
AR Path="/5FA92088" Ref="R9"  Part="1" 
AR Path="/5F7519D0/5FA92088" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA92088" Ref="R?"  Part="1" 
F 0 "R9" V 4443 5750 50  0000 C CNN
F 1 "1k" V 4534 5750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4580 5750 50  0001 C CNN
F 3 "~" H 4650 5750 50  0001 C CNN
	1    4650 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5FA92082
P 5100 6000
AR Path="/5FA92082" Ref="R12"  Part="1" 
AR Path="/5F7519D0/5FA92082" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA92082" Ref="R?"  Part="1" 
F 0 "R12" V 4893 6000 50  0000 C CNN
F 1 "10k" V 4984 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5030 6000 50  0001 C CNN
F 3 "~" H 5100 6000 50  0001 C CNN
	1    5100 6000
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 5FA92078
P 2900 5700
AR Path="/5FA92078" Ref="Q2"  Part="1" 
AR Path="/5F7519D0/5FA92078" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/5FA92078" Ref="Q?"  Part="1" 
F 0 "Q2" H 3104 5746 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 3104 5655 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 3100 5800 50  0001 C CNN
F 3 "~" H 2900 5700 50  0001 C CNN
	1    2900 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FA9206C
P 3000 6050
AR Path="/5FA9206C" Ref="#PWR02"  Part="1" 
AR Path="/5F7519D0/5FA9206C" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5FA9206C" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 3000 5800 50  0001 C CNN
F 1 "GND" H 3005 5877 50  0000 C CNN
F 2 "" H 3000 6050 50  0001 C CNN
F 3 "" H 3000 6050 50  0001 C CNN
	1    3000 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FA92061
P 2150 5700
AR Path="/5FA92061" Ref="R2"  Part="1" 
AR Path="/5F7519D0/5FA92061" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA92061" Ref="R?"  Part="1" 
F 0 "R2" V 1943 5700 50  0000 C CNN
F 1 "1k" V 2034 5700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2080 5700 50  0001 C CNN
F 3 "~" H 2150 5700 50  0001 C CNN
	1    2150 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5FA9205B
P 2600 5950
AR Path="/5FA9205B" Ref="R5"  Part="1" 
AR Path="/5F7519D0/5FA9205B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA9205B" Ref="R?"  Part="1" 
F 0 "R5" V 2393 5950 50  0000 C CNN
F 1 "10k" V 2484 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2530 5950 50  0001 C CNN
F 3 "~" H 2600 5950 50  0001 C CNN
	1    2600 5950
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q4
U 1 1 5FA9204F
P 5400 4550
AR Path="/5FA9204F" Ref="Q4"  Part="1" 
AR Path="/5F7519D0/5FA9204F" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/5FA9204F" Ref="Q?"  Part="1" 
F 0 "Q4" H 5604 4596 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5604 4505 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5600 4650 50  0001 C CNN
F 3 "~" H 5400 4550 50  0001 C CNN
	1    5400 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5FA92041
P 5500 4900
AR Path="/5FA92041" Ref="#PWR04"  Part="1" 
AR Path="/5F7519D0/5FA92041" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5FA92041" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 5500 4650 50  0001 C CNN
F 1 "GND" H 5505 4727 50  0000 C CNN
F 2 "" H 5500 4900 50  0001 C CNN
F 3 "" H 5500 4900 50  0001 C CNN
	1    5500 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5FA92036
P 4650 4550
AR Path="/5FA92036" Ref="R8"  Part="1" 
AR Path="/5F7519D0/5FA92036" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA92036" Ref="R?"  Part="1" 
F 0 "R8" V 4443 4550 50  0000 C CNN
F 1 "1k" V 4534 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4580 4550 50  0001 C CNN
F 3 "~" H 4650 4550 50  0001 C CNN
	1    4650 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5FA92030
P 5100 4800
AR Path="/5FA92030" Ref="R11"  Part="1" 
AR Path="/5F7519D0/5FA92030" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA92030" Ref="R?"  Part="1" 
F 0 "R11" V 4893 4800 50  0000 C CNN
F 1 "10k" V 4984 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5030 4800 50  0001 C CNN
F 3 "~" H 5100 4800 50  0001 C CNN
	1    5100 4800
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q1
U 1 1 5FA92022
P 2900 4550
AR Path="/5FA92022" Ref="Q1"  Part="1" 
AR Path="/5F7519D0/5FA92022" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/5FA92022" Ref="Q?"  Part="1" 
F 0 "Q1" H 3104 4596 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 3104 4505 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 3100 4650 50  0001 C CNN
F 3 "~" H 2900 4550 50  0001 C CNN
	1    2900 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5FA92016
P 3000 4900
AR Path="/5FA92016" Ref="#PWR01"  Part="1" 
AR Path="/5F7519D0/5FA92016" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5FA92016" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 3000 4650 50  0001 C CNN
F 1 "GND" H 3005 4727 50  0000 C CNN
F 2 "" H 3000 4900 50  0001 C CNN
F 3 "" H 3000 4900 50  0001 C CNN
	1    3000 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FA9200B
P 2150 4550
AR Path="/5FA9200B" Ref="R1"  Part="1" 
AR Path="/5F7519D0/5FA9200B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA9200B" Ref="R?"  Part="1" 
F 0 "R1" V 1943 4550 50  0000 C CNN
F 1 "1k" V 2034 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2080 4550 50  0001 C CNN
F 3 "~" H 2150 4550 50  0001 C CNN
	1    2150 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5FA92005
P 2600 4800
AR Path="/5FA92005" Ref="R4"  Part="1" 
AR Path="/5F7519D0/5FA92005" Ref="R?"  Part="1" 
AR Path="/5F7093B5/5FA92005" Ref="R?"  Part="1" 
F 0 "R4" V 2393 4800 50  0000 C CNN
F 1 "10k" V 2484 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2530 4800 50  0001 C CNN
F 3 "~" H 2600 4800 50  0001 C CNN
	1    2600 4800
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5F91FDBE
P 6600 3900
F 0 "J3" H 6708 4081 50  0000 C CNN
F 1 "Conn_01x01_Male" H 6708 3990 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 6600 3900 50  0001 C CNN
F 3 "~" H 6600 3900 50  0001 C CNN
	1    6600 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F7E3B46
P 7000 1200
AR Path="/5F58C19F/5F7E3B46" Ref="R?"  Part="1" 
AR Path="/5F7E3B46" Ref="R14"  Part="1" 
AR Path="/5F708CA1/5F7E3B46" Ref="R?"  Part="1" 
F 0 "R14" V 6793 1200 50  0000 C CNN
F 1 "15kHP" V 6884 1200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 1200 50  0001 C CNN
F 3 "~" H 7000 1200 50  0001 C CNN
	1    7000 1200
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F7E3B55
P 7000 1500
AR Path="/5F58C19F/5F7E3B55" Ref="R?"  Part="1" 
AR Path="/5F7E3B55" Ref="R15"  Part="1" 
AR Path="/5F708CA1/5F7E3B55" Ref="R?"  Part="1" 
F 0 "R15" V 6793 1500 50  0000 C CNN
F 1 "15kHP" V 6884 1500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 1500 50  0001 C CNN
F 3 "~" H 7000 1500 50  0001 C CNN
	1    7000 1500
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F7E3B5B
P 7000 1800
AR Path="/5F58C19F/5F7E3B5B" Ref="R?"  Part="1" 
AR Path="/5F7E3B5B" Ref="R16"  Part="1" 
AR Path="/5F708CA1/5F7E3B5B" Ref="R?"  Part="1" 
F 0 "R16" V 6793 1800 50  0000 C CNN
F 1 "4.99kHP" V 6884 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 1800 50  0001 C CNN
F 3 "~" H 7000 1800 50  0001 C CNN
	1    7000 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F7E3B61
P 7000 2100
AR Path="/5F58C19F/5F7E3B61" Ref="R?"  Part="1" 
AR Path="/5F7E3B61" Ref="R17"  Part="1" 
AR Path="/5F708CA1/5F7E3B61" Ref="R?"  Part="1" 
F 0 "R17" V 6793 2100 50  0000 C CNN
F 1 "4.99kHP" V 6884 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 2100 50  0001 C CNN
F 3 "~" H 7000 2100 50  0001 C CNN
	1    7000 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F7E3B67
P 7000 2400
AR Path="/5F58C19F/5F7E3B67" Ref="R?"  Part="1" 
AR Path="/5F7E3B67" Ref="R18"  Part="1" 
AR Path="/5F708CA1/5F7E3B67" Ref="R?"  Part="1" 
F 0 "R18" V 6793 2400 50  0000 C CNN
F 1 "15kHP" V 6884 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 2400 50  0001 C CNN
F 3 "~" H 7000 2400 50  0001 C CNN
	1    7000 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F7E3B6D
P 7000 2700
AR Path="/5F58C19F/5F7E3B6D" Ref="R?"  Part="1" 
AR Path="/5F7E3B6D" Ref="R19"  Part="1" 
AR Path="/5F708CA1/5F7E3B6D" Ref="R?"  Part="1" 
F 0 "R19" V 6793 2700 50  0000 C CNN
F 1 "15kHP" V 6884 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 2700 50  0001 C CNN
F 3 "~" H 7000 2700 50  0001 C CNN
	1    7000 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F7E3B73
P 7000 3000
AR Path="/5F58C19F/5F7E3B73" Ref="R?"  Part="1" 
AR Path="/5F7E3B73" Ref="R20"  Part="1" 
AR Path="/5F708CA1/5F7E3B73" Ref="R?"  Part="1" 
F 0 "R20" V 6793 3000 50  0000 C CNN
F 1 "15kHP" V 6884 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 3000 50  0001 C CNN
F 3 "~" H 7000 3000 50  0001 C CNN
	1    7000 3000
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5F8E207F
P 6600 3450
F 0 "J2" H 6708 3731 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6708 3640 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6600 3450 50  0001 C CNN
F 3 "~" H 6600 3450 50  0001 C CNN
	1    6600 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5F494E15
P 4550 2900
F 0 "R7" H 4480 2854 50  0000 R CNN
F 1 "10k" H 4480 2945 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4480 2900 50  0001 C CNN
F 3 "~" H 4550 2900 50  0001 C CNN
	1    4550 2900
	0    -1   1    0   
$EndComp
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J1
U 1 1 5F48A982
P 2850 2400
F 0 "J1" H 2850 3615 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 2850 3524 50  0000 C CNN
F 2 "Ninja-qPCR:Raspberry_Pi_3A+_Socketed_THT_FaceDown_MountingHoles" H 2400 1350 50  0001 C CNN
F 3 "" H 2400 1350 50  0001 C CNN
	1    2850 2400
	1    0    0    -1  
$EndComp
Text HLabel 9200 2050 0    50   Input ~ 0
3V3_RASP
Text GLabel 9200 2350 0    50   Input ~ 0
GND
Text GLabel 10100 2250 2    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 10100 2150 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 9200 2250 0    50   Input ~ 0
SPI_MOSI
$Sheet
S 9100 5250 850  250 
U 603C63DB
F0 "SheetLEDCtrl" 50
F1 "fileLEDCtrl.sch" 50
$EndSheet
$Sheet
S 9100 5750 850  250 
U 603C6849
F0 "SheetPhotoSensing" 50
F1 "filePhotoSensing.sch" 50
$EndSheet
$Comp
L Ninja-qPCR:SN74LVC1G3157DCKR U?
U 1 1 602E131D
P 9200 2050
F 0 "U?" H 9650 2337 60  0000 C CNN
F 1 "SN74LVC1G3157DCKR" H 9650 2231 60  0000 C CNN
F 2 "DCK0006A_N" H 9650 1450 60  0001 C CNN
F 3 "" H 10100 1750 60  0000 C CNN
	1    9200 2050
	1    0    0    -1  
$EndComp
Text GLabel 9200 2150 0    50   Input ~ 0
SPI_SWITCH
$Sheet
S 9100 4250 850  250 
U 602F5E03
F0 "SheetPowerRasp" 50
F1 "filePowerRasp.sch" 50
$EndSheet
Text GLabel 2000 3250 0    50   Input ~ 0
VIN_SENSE
$Comp
L Ninja-qPCR:TACTILE_4 SW1
U 1 1 5F67E494
P 4550 2650
F 0 "SW1" H 4450 2950 50  0000 L CNN
F 1 "TACTILE_4" H 4450 2850 50  0000 L CNN
F 2 "Ninja-qPCR:SW_TH_Tactile_Omron_B3F-10xx" H 4550 2850 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 4550 2850 50  0001 C CNN
	1    4550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2650 4800 2650
Text GLabel 4850 2650 2    50   Input ~ 0
GND
$EndSCHEMATC
