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
Text Notes 600  7700 0    50   ~ 0
Use AGND and DGND  https://www.zuken.co.jp/club_Z/z/product/BD/019/pro_130221_1.html?fbclid=IwAR0Fud5uWcRWMC9uykssyA-G8J9CSF2g4TS7U_EDWa5E4txVfpM9rxRD7ok
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
F 2 "Ninja-qPCR:Raspberry_Pi_3A+_3B+_4B_FaceDown" H 1950 1350 50  0001 C CNN
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
Text GLabel 1550 2550 0    50   Input ~ 0
SPI_SCLK
Text GLabel 1550 2350 0    50   Input ~ 0
SPI_MOSI
Text GLabel 1550 1650 0    50   Input ~ 0
I2C_SCL
Text GLabel 1550 1550 0    50   Input ~ 0
I2C_SDA
Text GLabel 1550 2150 0    50   Input ~ 0
LED_LAT
Text GLabel 1550 2450 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	1550 2350 1700 2350
Wire Wire Line
	1550 2450 1700 2450
Wire Wire Line
	1700 2550 1550 2550
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
NoConn ~ 1550 2750
Wire Wire Line
	1700 2750 1550 2750
NoConn ~ 3250 2750
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
L Device:R R7
U 1 1 60AF83E3
P 4000 6050
AR Path="/60AF83E3" Ref="R7"  Part="1" 
AR Path="/5F7519D0/60AF83E3" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E3" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E3" Ref="R?"  Part="1" 
F 0 "R7" V 3793 6050 50  0000 C CNN
F 1 "10k" V 3884 6050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3930 6050 50  0001 C CNN
F 3 "~" H 4000 6050 50  0001 C CNN
	1    4000 6050
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 60AF83E9
P 3550 5800
AR Path="/60AF83E9" Ref="R6"  Part="1" 
AR Path="/5F7519D0/60AF83E9" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60AF83E9" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60AF83E9" Ref="R?"  Part="1" 
F 0 "R6" V 3343 5800 50  0000 C CNN
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
$Sheet
S 3550 6550 1200 900 
U 60B09AA3
F0 "Thermistors" 50
F1 "fileThermistors.sch" 50
$EndSheet
$Sheet
S 2150 6550 1250 900 
U 60AFF976
F0 "LED" 50
F1 "fileLED.sch" 50
$EndSheet
NoConn ~ 3250 2950
Text GLabel 1550 1750 0    50   Input ~ 0
AMP_GAIN_SW
Text Notes 5850 1350 0    50   ~ 0
IN=High : COM <-> NO\nIN=Low : COM <-> NC
Text GLabel 5600 2050 0    50   Input ~ 0
SPI_SWITCH
$Comp
L power:GND #PWR?
U 1 1 60B17BA2
P 7000 2450
AR Path="/60AC9047/60B17BA2" Ref="#PWR?"  Part="1" 
AR Path="/60B17BA2" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 7000 2200 50  0001 C CNN
F 1 "GND" H 7005 2277 50  0000 C CNN
F 2 "" H 7000 2450 50  0001 C CNN
F 3 "" H 7000 2450 50  0001 C CNN
	1    7000 2450
	1    0    0    -1  
$EndComp
Text GLabel 5600 2250 0    50   Input ~ 0
SPI_MOSI
Text GLabel 6950 2250 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 6950 2050 2    50   Input ~ 0
LED_SPI_MOSI
Wire Wire Line
	5650 1850 5600 1850
Wire Wire Line
	5600 2050 5650 2050
Wire Wire Line
	5650 2250 5600 2250
Wire Wire Line
	6950 2050 6850 2050
Wire Wire Line
	6950 2250 6850 2250
$Comp
L Ninja-qPCR:TS5A9411DCKR U?
U 1 1 60B17B92
P 6250 2150
AR Path="/60AC9047/60B17B92" Ref="U?"  Part="1" 
AR Path="/60B17B92" Ref="U1"  Part="1" 
F 0 "U1" H 6250 2838 60  0000 C CNN
F 1 "TS5A9411DCKR" H 6250 2732 60  0000 C CNN
F 2 "Ninja-qPCR:TS5A9411DCKR" H 6250 2090 60  0001 C CNN
F 3 "" H 6250 2150 60  0000 C CNN
	1    6250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2450 6850 2450
Text GLabel 3250 2650 2    50   Input ~ 0
THERM_R_SWITCH
Text Notes 1150 1400 0    50   ~ 0
Max 50mA
Text GLabel 5600 1850 0    50   Input ~ 0
3V3D
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
Text GLabel 4100 2100 2    50   Input ~ 0
VIN_SENSE
$Comp
L Ninja-qPCR:I2C_SSD1306_LCD LCD2
U 1 1 60B6CC69
P 9350 1450
F 0 "LCD2" H 9628 1346 50  0000 L CNN
F 1 "I2C_SSD1306_LCD" H 9628 1255 50  0000 L CNN
F 2 "Ninja-qPCR:I2C_SSD1306_LCD" H 9350 1450 50  0001 C CNN
F 3 "" H 9350 1450 50  0001 C CNN
	1    9350 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 60B6DAB2
P 8950 1850
AR Path="/60B6DAB2" Ref="#PWR08"  Part="1" 
AR Path="/5F7519D0/60B6DAB2" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B6DAB2" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60B6DAB2" Ref="#PWR?"  Part="1" 
F 0 "#PWR08" H 8950 1600 50  0001 C CNN
F 1 "GND" H 8955 1677 50  0000 C CNN
F 2 "" H 8950 1850 50  0001 C CNN
F 3 "" H 8950 1850 50  0001 C CNN
	1    8950 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 60B6E1C2
P 8700 1300
AR Path="/60B6E1C2" Ref="R11"  Part="1" 
AR Path="/5F7519D0/60B6E1C2" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B6E1C2" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60B6E1C2" Ref="R?"  Part="1" 
F 0 "R11" V 8493 1300 50  0000 C CNN
F 1 "47k" V 8584 1300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8630 1300 50  0001 C CNN
F 3 "~" H 8700 1300 50  0001 C CNN
	1    8700 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R10
U 1 1 60B6E6FD
P 8400 1300
AR Path="/60B6E6FD" Ref="R10"  Part="1" 
AR Path="/5F7519D0/60B6E6FD" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B6E6FD" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60B6E6FD" Ref="R?"  Part="1" 
F 0 "R10" V 8193 1300 50  0000 C CNN
F 1 "47k" V 8284 1300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8330 1300 50  0001 C CNN
F 3 "~" H 8400 1300 50  0001 C CNN
	1    8400 1300
	-1   0    0    1   
$EndComp
Text GLabel 8250 1650 0    50   Input ~ 0
I2C_SDA
Text GLabel 8250 1550 0    50   Input ~ 0
I2C_SCL
Text GLabel 8950 900  1    50   Input ~ 0
3V3D
Wire Wire Line
	8400 1150 8400 1100
Wire Wire Line
	8400 1100 8700 1100
Connection ~ 8950 1100
Wire Wire Line
	8700 1150 8700 1100
Connection ~ 8700 1100
Wire Wire Line
	8700 1100 8950 1100
Wire Wire Line
	9150 1750 8950 1750
Wire Wire Line
	8950 1750 8950 1850
Wire Wire Line
	9150 1650 8700 1650
Wire Wire Line
	9150 1550 8400 1550
Wire Wire Line
	8400 1450 8400 1550
Connection ~ 8400 1550
Wire Wire Line
	8400 1550 8250 1550
Wire Wire Line
	8700 1450 8700 1650
Connection ~ 8700 1650
Wire Wire Line
	8700 1650 8250 1650
Wire Wire Line
	9150 1450 8950 1450
Wire Wire Line
	8950 1100 8950 1450
Wire Wire Line
	8950 900  8950 1100
$Comp
L power:GNDA #PWR05
U 1 1 60B20DBD
P 6500 7350
F 0 "#PWR05" H 6500 7100 50  0001 C CNN
F 1 "GNDA" H 6505 7177 50  0000 C CNN
F 2 "" H 6500 7350 50  0001 C CNN
F 3 "" H 6500 7350 50  0001 C CNN
	1    6500 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 60B11158
P 6300 7350
AR Path="/60B11158" Ref="#PWR04"  Part="1" 
AR Path="/5F7519D0/60B11158" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B11158" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60B11158" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 6300 7100 50  0001 C CNN
F 1 "GND" H 6305 7177 50  0000 C CNN
F 2 "" H 6300 7350 50  0001 C CNN
F 3 "" H 6300 7350 50  0001 C CNN
	1    6300 7350
	1    0    0    -1  
$EndComp
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
Text GLabel 10000 4950 0    50   Input ~ 0
3V3D
Wire Wire Line
	10150 6350 10000 6350
Wire Wire Line
	10150 6250 10000 6250
Wire Wire Line
	10150 6150 10000 6150
Wire Wire Line
	10150 6050 10000 6050
Wire Wire Line
	10150 5950 10000 5950
Wire Wire Line
	10150 5850 10000 5850
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
	10150 5150 10000 5150
Wire Wire Line
	10150 5050 10000 5050
Wire Wire Line
	10150 4950 10000 4950
Wire Wire Line
	10150 4850 10000 4850
Text GLabel 10000 6350 0    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 10000 5050 0    50   Input ~ 0
-1V
Text GLabel 10000 5250 0    50   Input ~ 0
3V3A
Text GLabel 10000 5150 0    50   Input ~ 0
GNDA
Text GLabel 10000 6250 0    50   Input ~ 0
THERM_MUX_OUT
Text GLabel 10000 6150 0    50   Input ~ 0
I2C_SDA
Text GLabel 10000 6050 0    50   Input ~ 0
I2C_SCL
Text GLabel 10000 5950 0    50   Input ~ 0
ADC_DRDY
Text GLabel 10000 5850 0    50   Input ~ 0
PD_REF_PWM
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
Text GLabel 10000 4850 0    50   Input ~ 0
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
L Device:Q_NMOS_GSD Q3
U 1 1 60AF8390
P 6750 5800
AR Path="/60AF8390" Ref="Q3"  Part="1" 
AR Path="/5F7519D0/60AF8390" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60AF8390" Ref="Q?"  Part="1" 
AR Path="/60AC8F63/60AF8390" Ref="Q?"  Part="1" 
F 0 "Q3" H 6954 5846 50  0000 L CNN
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
Text GLabel 1550 4350 0    50   Input ~ 0
I2C_SDA
Text GLabel 1550 4450 0    50   Input ~ 0
I2C_SCL
Text GLabel 1550 4550 0    50   Input ~ 0
GND
$Comp
L power:GND #PWR02
U 1 1 60B8E5B3
P 2550 4900
AR Path="/60B8E5B3" Ref="#PWR02"  Part="1" 
AR Path="/5F7519D0/60B8E5B3" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B8E5B3" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/60B8E5B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 2550 4650 50  0001 C CNN
F 1 "GND" H 2555 4727 50  0000 C CNN
F 2 "" H 2550 4900 50  0001 C CNN
F 3 "" H 2550 4900 50  0001 C CNN
	1    2550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 4150 2550 4150
Wire Wire Line
	2550 4150 2550 4250
Wire Wire Line
	2450 4450 2550 4450
Wire Wire Line
	2450 4350 2550 4350
Connection ~ 2550 4350
Wire Wire Line
	2550 4350 2550 4450
Wire Wire Line
	2450 4250 2550 4250
Connection ~ 2550 4250
Wire Wire Line
	2550 4250 2550 4350
Text GLabel 1550 4150 0    50   Input ~ 0
5V_UPS
Wire Wire Line
	1550 4150 1700 4150
Wire Wire Line
	1700 4350 1550 4350
Wire Wire Line
	1700 4450 1550 4450
Wire Wire Line
	1700 4550 1550 4550
NoConn ~ 1600 4250
Wire Wire Line
	1600 4250 1700 4250
Wire Wire Line
	3050 2650 3100 2650
Connection ~ 3100 2650
Wire Wire Line
	3100 2650 3250 2650
$Comp
L Ninja-qPCR:TACTILE_4 SW1
U 1 1 60C07DE1
P 3700 3950
F 0 "SW1" H 3894 4023 50  0000 L CNN
F 1 "TACTILE_4" H 3894 3932 50  0000 L CNN
F 2 "Ninja-qPCR:SW_TH_Tactile_Omron_B3F-10xx" H 3700 4150 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 3700 4150 50  0001 C CNN
	1    3700 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60C08B8A
P 3350 3950
AR Path="/60C08B8A" Ref="R3"  Part="1" 
AR Path="/5F7519D0/60C08B8A" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60C08B8A" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60C08B8A" Ref="R?"  Part="1" 
F 0 "R3" V 3143 3950 50  0000 C CNN
F 1 "1k" V 3234 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3280 3950 50  0001 C CNN
F 3 "~" H 3350 3950 50  0001 C CNN
	1    3350 3950
	0    1    1    0   
$EndComp
$Comp
L Ninja-qPCR:TACTILE_4 SW2
U 1 1 60C0A070
P 3700 4300
F 0 "SW2" H 3894 4373 50  0000 L CNN
F 1 "TACTILE_4" H 3894 4282 50  0000 L CNN
F 2 "Ninja-qPCR:SW_TH_Tactile_Omron_B3F-10xx" H 3700 4500 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 3700 4500 50  0001 C CNN
	1    3700 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 60C0A07A
P 3350 4300
AR Path="/60C0A07A" Ref="R4"  Part="1" 
AR Path="/5F7519D0/60C0A07A" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60C0A07A" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60C0A07A" Ref="R?"  Part="1" 
F 0 "R4" V 3143 4300 50  0000 C CNN
F 1 "1k" V 3234 4300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3280 4300 50  0001 C CNN
F 3 "~" H 3350 4300 50  0001 C CNN
	1    3350 4300
	0    1    1    0   
$EndComp
$Comp
L Ninja-qPCR:TACTILE_4 SW3
U 1 1 60C11E93
P 3700 4650
F 0 "SW3" H 3894 4723 50  0000 L CNN
F 1 "TACTILE_4" H 3894 4632 50  0000 L CNN
F 2 "Ninja-qPCR:SW_TH_Tactile_Omron_B3F-10xx" H 3700 4850 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 3700 4850 50  0001 C CNN
	1    3700 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 60C11E9D
P 3350 4650
AR Path="/60C11E9D" Ref="R5"  Part="1" 
AR Path="/5F7519D0/60C11E9D" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60C11E9D" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60C11E9D" Ref="R?"  Part="1" 
F 0 "R5" V 3143 4650 50  0000 C CNN
F 1 "1k" V 3234 4650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3280 4650 50  0001 C CNN
F 3 "~" H 3350 4650 50  0001 C CNN
	1    3350 4650
	0    1    1    0   
$EndComp
Text GLabel 1550 3150 0    50   Input ~ 0
DOPEN
Text GLabel 3250 3150 2    50   Input ~ 0
DLOCK
Text GLabel 1550 3250 0    50   Input ~ 0
TACT1
Text GLabel 3250 3250 2    50   Input ~ 0
TACT2
Text GLabel 3250 3350 2    50   Input ~ 0
TACT3
Wire Wire Line
	3250 3150 3100 3150
Wire Wire Line
	3250 3250 3100 3250
Wire Wire Line
	3250 3350 3100 3350
Text GLabel 4750 3800 0    50   Input ~ 0
DOPEN
Text GLabel 4750 4000 0    50   Input ~ 0
DLOCK
Text GLabel 3150 3950 0    50   Input ~ 0
TACT1
Text GLabel 3150 4300 0    50   Input ~ 0
TACT2
Text GLabel 3150 4650 0    50   Input ~ 0
TACT3
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
Connection ~ 2550 4450
$Comp
L Ninja-qPCR:RPI_LCD_TOUCH_7INCH LCD1
U 1 1 60BA74A3
P 1700 4150
F 0 "LCD1" H 2075 4375 50  0000 C CNN
F 1 "RPI_LCD_TOUCH_7INCH" H 2075 4284 50  0000 C CNN
F 2 "Ninja-qPCR:RPI_LCD_TOUCH_7INCH" H 1700 4150 50  0001 C CNN
F 3 "" H 1700 4150 50  0001 C CNN
	1    1700 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4450 2550 4550
Wire Wire Line
	2450 4850 2550 4850
Connection ~ 2550 4850
Wire Wire Line
	2550 4850 2550 4900
Wire Wire Line
	2450 4750 2550 4750
Connection ~ 2550 4750
Wire Wire Line
	2550 4750 2550 4850
Wire Wire Line
	2450 4650 2550 4650
Connection ~ 2550 4650
Wire Wire Line
	2550 4650 2550 4750
Wire Wire Line
	2450 4550 2550 4550
Connection ~ 2550 4550
Wire Wire Line
	2550 4550 2550 4650
Wire Wire Line
	10150 3350 9950 3350
Wire Wire Line
	10150 3250 9950 3250
Wire Wire Line
	10150 3150 9950 3150
Wire Wire Line
	10150 3050 9950 3050
Wire Wire Line
	10150 2950 9950 2950
Wire Wire Line
	10150 2850 9950 2850
Wire Wire Line
	10150 2750 9950 2750
Wire Wire Line
	10150 2650 9950 2650
Wire Wire Line
	10150 2550 9950 2550
Text GLabel 9950 3350 0    50   Input ~ 0
N_LED_OUT2
Text GLabel 9950 3250 0    50   Input ~ 0
N_LED_OUT1
Text GLabel 9950 3150 0    50   Input ~ 0
N_LED_OUT4
Text GLabel 9950 3050 0    50   Input ~ 0
N_LED_OUT3
Text GLabel 9950 2950 0    50   Input ~ 0
N_LED_OUT7
Text GLabel 9950 2850 0    50   Input ~ 0
N_LED_OUT8
Text GLabel 9950 2750 0    50   Input ~ 0
N_LED_OUT6
Text GLabel 9950 2650 0    50   Input ~ 0
VCC_LED
Text GLabel 9950 2550 0    50   Input ~ 0
GND
Wire Wire Line
	10150 2450 9950 2450
Text GLabel 9950 2450 0    50   Input ~ 0
N_LED_OUT5
Wire Wire Line
	10150 4550 9950 4550
Wire Wire Line
	10150 4450 9950 4450
Wire Wire Line
	10150 4350 9950 4350
Wire Wire Line
	10150 4250 9950 4250
Wire Wire Line
	10150 4150 9950 4150
Wire Wire Line
	10150 4050 9950 4050
Wire Wire Line
	10150 3950 9950 3950
Wire Wire Line
	10150 3850 9950 3850
Wire Wire Line
	10150 3750 9950 3750
Text GLabel 9950 4550 0    50   Input ~ 0
S_LED_OUT2
Text GLabel 9950 4450 0    50   Input ~ 0
S_LED_OUT1
Text GLabel 9950 4350 0    50   Input ~ 0
S_LED_OUT4
Text GLabel 9950 4250 0    50   Input ~ 0
S_LED_OUT3
Text GLabel 9950 4150 0    50   Input ~ 0
S_LED_OUT7
Text GLabel 9950 4050 0    50   Input ~ 0
S_LED_OUT8
Text GLabel 9950 3950 0    50   Input ~ 0
S_LED_OUT6
Text GLabel 9950 3850 0    50   Input ~ 0
VCC_LED
Text GLabel 9950 3750 0    50   Input ~ 0
GND
Wire Wire Line
	10150 3650 9950 3650
Text GLabel 9950 3650 0    50   Input ~ 0
S_LED_OUT5
$Comp
L Connector:Conn_01x40_Male J2
U 1 1 60B98A75
P 10350 4350
F 0 "J2" H 10322 4324 50  0000 R CNN
F 1 "Conn_01x40_Male" H 10322 4233 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20_Pitch1.27mm" H 10350 4350 50  0001 C CNN
F 3 "~" H 10350 4350 50  0001 C CNN
	1    10350 4350
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
