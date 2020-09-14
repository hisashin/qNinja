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
Text GLabel 1750 4350 2    50   Input ~ 0
THERM_MUX_S0
Text GLabel 1750 4450 2    50   Input ~ 0
THERM_MUX_S1
Text GLabel 1750 4550 2    50   Input ~ 0
THERM_MUX_S2
Text GLabel 1750 4650 2    50   Input ~ 0
THERM_MUX_S3
Text GLabel 1750 4750 2    50   Input ~ 0
3V3
Text GLabel 1750 4850 2    50   Input ~ 0
GND
Text GLabel 1750 4950 2    50   Input ~ 0
THERM_GND
Text GLabel 1750 5050 2    50   Input ~ 0
THERM_OUT
Wire Wire Line
	1750 4350 1550 4350
Wire Wire Line
	1550 4450 1750 4450
Wire Wire Line
	1550 4550 1750 4550
Wire Wire Line
	1750 4650 1550 4650
Wire Wire Line
	1550 4750 1750 4750
Wire Wire Line
	1750 4850 1550 4850
Wire Wire Line
	1550 4950 1750 4950
Wire Wire Line
	1750 5050 1550 5050
$Comp
L Connector:Conn_01x08_Male J_LID_MAIN_THERM1
U 1 1 5F47D87C
P 1350 4650
F 0 "J_LID_MAIN_THERM1" H 1458 5131 50  0000 C CNN
F 1 "Conn_01x08_Male" H 1458 5040 50  0000 C CNN
F 2 "" H 1350 4650 50  0001 C CNN
F 3 "~" H 1350 4650 50  0001 C CNN
	1    1350 4650
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J1
U 1 1 5F48A982
P 2850 2050
F 0 "J1" H 2850 3265 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 2850 3174 50  0000 C CNN
F 2 "Ninja-qPCR:Raspberry_Pi_3A+_Socketed_THT_FaceDown_MountingHoles" H 2400 1000 50  0001 C CNN
F 3 "" H 2400 1000 50  0001 C CNN
	1    2850 2050
	1    0    0    -1  
$EndComp
Text GLabel 2000 1100 0    50   Input ~ 0
3V3
Text GLabel 2000 1900 0    50   Input ~ 0
3V3
Wire Wire Line
	2000 1100 2150 1100
Wire Wire Line
	2000 1900 2150 1900
Text GLabel 2000 2300 0    50   Input ~ 0
GND
Wire Wire Line
	2000 2300 2150 2300
Text GLabel 2000 3000 0    50   Input ~ 0
GND
Wire Wire Line
	2000 3000 2150 3000
Text GLabel 3700 1300 2    50   Input ~ 0
GND
Text GLabel 3700 2500 2    50   Input ~ 0
GND
Text GLabel 3700 2000 2    50   Input ~ 0
GND
Text GLabel 3700 2700 2    50   Input ~ 0
GND
Wire Wire Line
	3700 2700 3550 2700
Wire Wire Line
	3700 2000 3550 2000
Wire Wire Line
	3700 1700 3550 1700
Wire Wire Line
	3550 1300 3700 1300
Text HLabel 2000 1700 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	2000 1700 2150 1700
Text GLabel 3700 2800 2    50   Input ~ 0
THERM_MUX_S0
Text GLabel 2000 2500 0    50   Input ~ 0
THERM_MUX_S1
Text GLabel 2000 2600 0    50   Input ~ 0
THERM_MUX_S2
Text GLabel 2000 1400 0    50   Input ~ 0
THERM_MUX_S3
Text GLabel 2000 2200 0    50   Input ~ 0
SPI_SCLK
Text GLabel 2000 2000 0    50   Input ~ 0
SPI_MOSI
Text GLabel 3700 1800 2    50   Input ~ 0
PD_MUX_SYNC
Text GLabel 2000 1300 0    50   Input ~ 0
I2C_SCL
Text GLabel 2000 1200 0    50   Input ~ 0
I2C_SDA
Text GLabel 2000 1800 0    50   Input ~ 0
LED_LAT
Text GLabel 2000 2100 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	2000 2000 2150 2000
Wire Wire Line
	2000 2100 2150 2100
Wire Wire Line
	2150 2200 2000 2200
Wire Wire Line
	2000 1200 2150 1200
Wire Wire Line
	2150 1300 2000 1300
Wire Wire Line
	2000 1400 2150 1400
Wire Wire Line
	2150 2500 2000 2500
Wire Wire Line
	3700 2800 3550 2800
Text HLabel 2000 2700 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	2000 2700 2150 2700
Wire Wire Line
	3700 1800 3550 1800
Wire Wire Line
	2150 1800 2000 1800
Wire Wire Line
	3700 2500 3550 2500
Text HLabel 3700 2100 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	3700 2100 3550 2100
Text GLabel 3700 2600 2    50   Input ~ 0
LED_PWM
Wire Wire Line
	3700 2600 3550 2600
Text GLabel 2000 2900 0    50   Input ~ 0
FAN_PWM
Wire Wire Line
	2000 2900 2150 2900
Text HLabel 2000 2800 0    50   Input ~ 0
LID_HEATER2
Text HLabel 2000 1600 0    50   Input ~ 0
WELL_HEATER2
Text GLabel 2000 1500 0    50   Input ~ 0
GND
Wire Wire Line
	2000 1500 2150 1500
Wire Wire Line
	2000 1600 2150 1600
Text GLabel 3700 1700 2    50   Input ~ 0
GND
NoConn ~ 3700 1100
NoConn ~ 3700 1200
Wire Wire Line
	3700 1100 3550 1100
Wire Wire Line
	3550 1200 3700 1200
NoConn ~ 2000 2400
Wire Wire Line
	2150 2400 2000 2400
NoConn ~ 3700 2400
Wire Wire Line
	3700 2400 3550 2400
Wire Wire Line
	2000 2800 2150 2800
Text GLabel 3700 1900 2    50   Input ~ 0
SPI_MOSI_SWITCH
Wire Wire Line
	3700 1900 3550 1900
Text GLabel 3700 1400 2    50   Input ~ 0
GPIO15
Text GLabel 3700 1500 2    50   Input ~ 0
GPIO16
Text GLabel 3700 1600 2    50   Input ~ 0
GPIO1
Wire Wire Line
	3700 1400 3550 1400
Wire Wire Line
	3550 1500 3700 1500
Wire Wire Line
	3700 1600 3550 1600
Text GLabel 3200 4350 2    50   Input ~ 0
GPIO15
Text GLabel 3200 4450 2    50   Input ~ 0
GPIO16
Text GLabel 3200 4550 2    50   Input ~ 0
GPIO1
Text GLabel 3700 2200 2    50   Input ~ 0
GPIO10
Wire Wire Line
	3700 2200 3550 2200
Text GLabel 3200 4650 2    50   Input ~ 0
GPIO10
Text GLabel 3700 2900 2    50   Input ~ 0
GPIO28
Text GLabel 3700 3000 2    50   Input ~ 0
GPIO29
Wire Wire Line
	3550 2900 3700 2900
Wire Wire Line
	3550 3000 3700 3000
Text GLabel 3200 4750 2    50   Input ~ 0
GPIO28
Text GLabel 3200 4850 2    50   Input ~ 0
GPIO29
Text GLabel 3200 4950 2    50   Input ~ 0
3V3
Text GLabel 3200 5050 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x08_Male J_EXTRA1
U 1 1 5F5386EE
P 2800 4650
F 0 "J_EXTRA1" H 2908 5131 50  0000 C CNN
F 1 "Conn_01x08_Male" H 2908 5040 50  0000 C CNN
F 2 "" H 2800 4650 50  0001 C CNN
F 3 "~" H 2800 4650 50  0001 C CNN
	1    2800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4350 3200 4350
Wire Wire Line
	3200 4450 3000 4450
Wire Wire Line
	3000 4550 3200 4550
Wire Wire Line
	3200 4650 3000 4650
Wire Wire Line
	3000 4750 3200 4750
Wire Wire Line
	3200 4850 3000 4850
Wire Wire Line
	3000 4950 3200 4950
Wire Wire Line
	3200 5050 3000 5050
Wire Wire Line
	3700 3550 3500 3550
NoConn ~ 3700 3550
Wire Wire Line
	2050 3450 1900 3450
Wire Wire Line
	2050 3550 1900 3550
Wire Wire Line
	2050 3650 1900 3650
Wire Wire Line
	2050 3750 1900 3750
Wire Wire Line
	2050 3850 1900 3850
Wire Wire Line
	2050 3950 1900 3950
Wire Wire Line
	3700 3450 3500 3450
Wire Wire Line
	3700 3650 3500 3650
Wire Wire Line
	3700 3750 3500 3750
Wire Wire Line
	3700 3850 3500 3850
Wire Wire Line
	3700 3950 3500 3950
Text GLabel 3700 3450 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 3700 3750 2    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 3700 3850 2    50   Input ~ 0
LED_SPI_MISO
Text GLabel 3700 3950 2    50   Input ~ 0
LED_SPI_SCLK
Text GLabel 3700 3650 2    50   Input ~ 0
PD_MUX_SPI_SCLK
Text GLabel 1900 3850 0    50   Input ~ 0
SPI_SCLK
Text GLabel 1900 3750 0    50   Input ~ 0
SPI_MISO
Text GLabel 1900 3650 0    50   Input ~ 0
SPI_MOSI
Text GLabel 1900 3950 0    50   Input ~ 0
GND
Text GLabel 1900 3550 0    50   Input ~ 0
SPI_MOSI_SWITCH
Text GLabel 1900 3450 0    50   Input ~ 0
3V3
$Comp
L Ninja-qPCR:SPI_SWITCHER U1
U 1 1 5F529806
P 2750 3350
F 0 "U1" H 2775 3475 50  0000 C CNN
F 1 "SPI_SWITCHER" H 2775 3384 50  0000 C CNN
F 2 "Ninja-qPCR:SPI_SWITCHER" H 2750 3350 50  0001 C CNN
F 3 "" H 2750 3350 50  0001 C CNN
	1    2750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2300 4200 2300
Connection ~ 4150 2300
Wire Wire Line
	4150 2550 4150 2300
Wire Wire Line
	4300 2550 4150 2550
Wire Wire Line
	4750 2550 4600 2550
Wire Wire Line
	4750 2300 4700 2300
Text GLabel 4750 2300 2    50   Input ~ 0
GND
Text GLabel 4750 2550 2    50   Input ~ 0
3V3
$Comp
L Device:R R10
U 1 1 5F494E15
P 4450 2550
F 0 "R10" H 4380 2504 50  0000 R CNN
F 1 "10k" H 4380 2595 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4380 2550 50  0001 C CNN
F 3 "~" H 4450 2550 50  0001 C CNN
	1    4450 2550
	0    -1   1    0   
$EndComp
Wire Wire Line
	3550 2300 4150 2300
$Comp
L Ninja-qPCR:TACTILE_4 SW1
U 1 1 5F5F3483
P 4450 2300
F 0 "SW1" H 4450 2585 50  0000 C CNN
F 1 "TACTILE_4" H 4450 2494 50  0000 C CNN
F 2 "Ninja-qPCR:TACTILE_4" H 4450 2500 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 4450 2500 50  0001 C CNN
	1    4450 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2350 4200 2350
Wire Wire Line
	4200 2350 4200 2300
Connection ~ 4200 2300
Wire Wire Line
	4200 2300 4250 2300
Wire Wire Line
	4650 2350 4700 2350
Wire Wire Line
	4700 2350 4700 2300
Connection ~ 4700 2300
Wire Wire Line
	4700 2300 4650 2300
$Sheet
S 5550 850  850  250 
U 5F708CA1
F0 "SheetCon" 50
F1 "fileConnector.sch" 50
$EndSheet
$Sheet
S 5550 1300 850  250 
U 5F7093B5
F0 "SheetPower" 50
F1 "filePower.sch" 50
$EndSheet
$EndSCHEMATC
