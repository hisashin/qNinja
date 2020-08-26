EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Ninja-qPCR:MCP4551T-502E_MS U?
U 1 1 5F45FB9E
P 3050 3500
F 0 "U?" H 3850 3887 60  0000 C CNN
F 1 "MCP4551T-502E_MS" H 3850 3781 60  0000 C CNN
F 2 "MSOP8_MC_MCH" H 3850 3740 60  0001 C CNN
F 3 "" H 3050 3500 60  0000 C CNN
	1    3050 3500
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:TLC59281DBQR U?
U 1 1 5F4603C2
P 6150 3350
F 0 "U?" H 7050 3737 60  0000 C CNN
F 1 "TLC59281DBQR" H 7050 3631 60  0000 C CNN
F 2 "DBQ24_TEX" H 7050 3590 60  0001 C CNN
F 3 "" H 6150 3350 60  0000 C CNN
	1    6150 3350
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:TLC59281DBQR U?
U 2 1 5F463C0E
P 7000 5800
F 0 "U?" H 7556 6187 60  0000 C CNN
F 1 "TLC59281DBQR" H 7556 6081 60  0000 C CNN
F 2 "DBQ24_TEX" H 7900 6040 60  0001 C CNN
F 3 "" H 7000 5800 60  0000 C CNN
	2    7000 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5F46A4C1
P 1700 3650
F 0 "J?" H 1672 3674 50  0000 R CNN
F 1 "Conn_01x05_Male" H 1672 3583 50  0000 R CNN
F 2 "" H 1700 3650 50  0001 C CNN
F 3 "~" H 1700 3650 50  0001 C CNN
	1    1700 3650
	-1   0    0    -1  
$EndComp
Text GLabel 8150 3350 2    50   Input ~ 0
N_LED_OUT1
Text GLabel 8150 3450 2    50   Input ~ 0
N_LED_OUT2
Text GLabel 8150 3550 2    50   Input ~ 0
N_LED_OUT3
Text GLabel 8150 3650 2    50   Input ~ 0
N_LED_OUT4
Text GLabel 8150 3750 2    50   Input ~ 0
N_LED_OUT5
Text GLabel 8150 3850 2    50   Input ~ 0
N_LED_OUT6
Text GLabel 8150 3950 2    50   Input ~ 0
N_LED_OUT7
Text GLabel 8150 4050 2    50   Input ~ 0
N_LED_OUT8
Text GLabel 8150 4150 2    50   Input ~ 0
S_LED_OUT1
Text GLabel 8150 4250 2    50   Input ~ 0
S_LED_OUT2
Text GLabel 8150 4350 2    50   Input ~ 0
S_LED_OUT3
Text GLabel 8150 4450 2    50   Input ~ 0
S_LED_OUT4
Text GLabel 8150 4550 2    50   Input ~ 0
S_LED_OUT5
Text GLabel 8150 4650 2    50   Input ~ 0
S_LED_OUT6
Text GLabel 8150 4750 2    50   Input ~ 0
S_LED_OUT7
Text GLabel 8150 4850 2    50   Input ~ 0
S_LED_OUT8
Text GLabel 8150 4950 2    50   Input ~ 0
RPI_SPI_MISO
Text GLabel 5950 3650 0    50   Input ~ 0
RPI_SPI_MOSI
Text GLabel 5950 3550 0    50   Input ~ 0
RPI_SPI_SCLK
Text GLabel 5950 3450 0    50   Input ~ 0
LED_LAT
Text GLabel 5950 3350 0    50   Input ~ 0
LED_BLANK
Text GLabel 5950 3850 0    50   Input ~ 0
LED_IREF
Wire Wire Line
	6150 3350 5950 3350
Wire Wire Line
	6150 3450 5950 3450
Wire Wire Line
	6150 3550 5950 3550
Wire Wire Line
	6150 3650 5950 3650
Wire Wire Line
	6150 3850 5950 3850
Wire Wire Line
	7950 3350 8150 3350
Wire Wire Line
	7950 3450 8150 3450
Wire Wire Line
	7950 3550 8150 3550
Wire Wire Line
	7950 3650 8150 3650
Wire Wire Line
	7950 3750 8150 3750
Wire Wire Line
	7950 3850 8150 3850
Wire Wire Line
	7950 3950 8150 3950
Wire Wire Line
	7950 4050 8150 4050
Wire Wire Line
	7950 4150 8150 4150
Wire Wire Line
	7950 4250 8150 4250
Wire Wire Line
	7950 4350 8150 4350
Wire Wire Line
	7950 4450 8150 4450
Wire Wire Line
	7950 4550 8150 4550
Wire Wire Line
	7950 4650 8150 4650
Wire Wire Line
	7950 4750 8150 4750
Wire Wire Line
	7950 4850 8150 4850
Wire Wire Line
	7950 4950 8150 4950
Text GLabel 6650 5800 0    50   Input ~ 0
GND
Text GLabel 6650 6300 0    50   Input ~ 0
VCC
Wire Wire Line
	6650 6300 7000 6300
Wire Wire Line
	6650 5800 7000 5800
Text GLabel 4800 3800 2    50   Input ~ 0
GND
Wire Wire Line
	4800 3800 4650 3800
Text GLabel 2800 4400 0    50   Input ~ 0
VCC
Text GLabel 2800 4100 0    50   Input ~ 0
RPI_I2C_SDA
Text GLabel 2800 3600 0    50   Input ~ 0
RPI_I2C_SCL
Text GLabel 2800 3500 0    50   Input ~ 0
VCC
Wire Wire Line
	2800 3500 3050 3500
Wire Wire Line
	3050 3600 2800 3600
Wire Wire Line
	2800 4100 3050 4100
Wire Wire Line
	3050 4400 2800 4400
Text GLabel 2800 4000 0    50   Input ~ 0
LED_IREF
Text GLabel 2800 3800 0    50   Input ~ 0
VCC
Wire Wire Line
	2800 3800 3050 3800
Wire Wire Line
	3050 4000 2800 4000
Wire Wire Line
	9950 4150 9750 4150
Wire Wire Line
	9950 4050 9750 4050
Wire Wire Line
	9950 3950 9750 3950
Wire Wire Line
	9950 3850 9750 3850
Wire Wire Line
	9950 3750 9750 3750
Wire Wire Line
	9950 3650 9750 3650
Wire Wire Line
	9950 3550 9750 3550
Wire Wire Line
	9950 3450 9750 3450
Wire Wire Line
	9950 3350 9750 3350
Text GLabel 9750 4150 0    50   Input ~ 0
N_LED_OUT2
Text GLabel 9750 4050 0    50   Input ~ 0
N_LED_OUT1
Text GLabel 9750 3950 0    50   Input ~ 0
N_LED_OUT4
Text GLabel 9750 3850 0    50   Input ~ 0
N_LED_OUT3
Text GLabel 9750 3750 0    50   Input ~ 0
N_LED_OUT7
Text GLabel 9750 3650 0    50   Input ~ 0
N_LED_OUT8
Text GLabel 9750 3550 0    50   Input ~ 0
N_LED_OUT6
Text GLabel 9750 3450 0    50   Input ~ 0
VCC
Text GLabel 9750 3350 0    50   Input ~ 0
GND
Wire Wire Line
	9950 3250 9750 3250
Text GLabel 9750 3250 0    50   Input ~ 0
N_LED_OUT5
$Comp
L Ninja-qPCR:Conn_02x05 N_CONN
U 1 1 5F4662F5
P 10150 3250
F 0 "N_CONN" H 10469 2861 50  0000 L CNN
F 1 "Conn_02x05" H 10469 2770 50  0000 L CNN
F 2 "" H 9950 3350 50  0001 C CNN
F 3 "" H 9950 3350 50  0001 C CNN
	1    10150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 5550 9750 5550
Wire Wire Line
	9950 5450 9750 5450
Wire Wire Line
	9950 5350 9750 5350
Wire Wire Line
	9950 5250 9750 5250
Wire Wire Line
	9950 5150 9750 5150
Wire Wire Line
	9950 5050 9750 5050
Wire Wire Line
	9950 4950 9750 4950
Wire Wire Line
	9950 4850 9750 4850
Wire Wire Line
	9950 4750 9750 4750
Text GLabel 9750 5550 0    50   Input ~ 0
S_LED_OUT2
Text GLabel 9750 5450 0    50   Input ~ 0
S_LED_OUT1
Text GLabel 9750 5350 0    50   Input ~ 0
S_LED_OUT4
Text GLabel 9750 5250 0    50   Input ~ 0
S_LED_OUT3
Text GLabel 9750 5150 0    50   Input ~ 0
S_LED_OUT7
Text GLabel 9750 5050 0    50   Input ~ 0
S_LED_OUT8
Text GLabel 9750 4950 0    50   Input ~ 0
S_LED_OUT6
Text GLabel 9750 4850 0    50   Input ~ 0
VCC
Text GLabel 9750 4750 0    50   Input ~ 0
GND
Wire Wire Line
	9950 4650 9750 4650
Text GLabel 9750 4650 0    50   Input ~ 0
S_LED_OUT5
$Comp
L Ninja-qPCR:Conn_02x05 S_CONN
U 1 1 5F48CD23
P 10150 4650
F 0 "S_CONN" H 10469 4261 50  0000 L CNN
F 1 "Conn_02x05" H 10469 4170 50  0000 L CNN
F 2 "" H 9950 4750 50  0001 C CNN
F 3 "" H 9950 4750 50  0001 C CNN
	1    10150 4650
	1    0    0    -1  
$EndComp
Text GLabel 1300 3450 0    50   Input ~ 0
GND
Text GLabel 1300 3550 0    50   Input ~ 0
VCC
Text GLabel 1300 3650 0    50   Input ~ 0
RPI_I2C_SCL
Text GLabel 1300 3750 0    50   Input ~ 0
RPI_I2C_SDA
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5F48F29A
P 1700 4400
F 0 "J?" H 1672 4424 50  0000 R CNN
F 1 "Conn_01x05_Male" H 1672 4333 50  0000 R CNN
F 2 "" H 1700 4400 50  0001 C CNN
F 3 "~" H 1700 4400 50  0001 C CNN
	1    1700 4400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1500 3450 1300 3450
Wire Wire Line
	1300 3550 1500 3550
Wire Wire Line
	1500 3650 1300 3650
Wire Wire Line
	1300 3750 1500 3750
Text GLabel 1300 4400 0    50   Input ~ 0
RPI_SPI_SCLK
Text GLabel 1300 4500 0    50   Input ~ 0
RPI_SPI_MOSI
Text GLabel 1300 4600 0    50   Input ~ 0
RPI_SPI_MISO
Wire Wire Line
	1300 4600 1500 4600
Wire Wire Line
	1500 4500 1300 4500
Wire Wire Line
	1300 4400 1500 4400
NoConn ~ 2800 3900
Wire Wire Line
	2800 3900 3050 3900
Text GLabel 1300 4200 0    50   Input ~ 0
LED_BLANK
Text GLabel 1300 4300 0    50   Input ~ 0
LED_LAT
Wire Wire Line
	1300 4300 1500 4300
Wire Wire Line
	1500 4200 1300 4200
$EndSCHEMATC
