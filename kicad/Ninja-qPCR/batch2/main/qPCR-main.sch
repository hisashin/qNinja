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
$Comp
L Connector:Conn_01x12_Male J_LID_MAIN_POWER
U 1 1 5F47E862
P 1050 2650
F 0 "J_LID_MAIN_POWER" H 1158 3331 50  0000 C CNN
F 1 "Conn_01x12_Male" H 1158 3240 50  0000 C CNN
F 2 "" H 1050 2650 50  0001 C CNN
F 3 "~" H 1050 2650 50  0001 C CNN
	1    1050 2650
	1    0    0    -1  
$EndComp
Text GLabel 1450 1100 2    50   Input ~ 0
THERM_MUX_S0
Text GLabel 1450 1200 2    50   Input ~ 0
THERM_MUX_S1
Text GLabel 1450 1300 2    50   Input ~ 0
THERM_MUX_S2
Text GLabel 1450 1400 2    50   Input ~ 0
THERM_MUX_S3
Text GLabel 1450 1500 2    50   Input ~ 0
3V3
Text GLabel 1450 1600 2    50   Input ~ 0
GND
Text GLabel 1450 1700 2    50   Input ~ 0
THERM_GND
Text GLabel 1450 1800 2    50   Input ~ 0
THERM_OUT
Text GLabel 1450 2150 2    50   Input ~ 0
BODY_HEATER1A
Text GLabel 1450 2250 2    50   Input ~ 0
BODY_HEATER1B
Text GLabel 1450 2350 2    50   Input ~ 0
FAN_BLUE_FREQ
Text GLabel 1450 2450 2    50   Input ~ 0
FAN_RED_VCC
Text GLabel 1450 2550 2    50   Input ~ 0
FAN_BLACK_GND
Text GLabel 1450 2650 2    50   Input ~ 0
BODY_HEATER2A
Text GLabel 1450 2750 2    50   Input ~ 0
BODY_HEATER2B
Text GLabel 1450 2850 2    50   Input ~ 0
LID_HEATER1A
Text GLabel 1450 2950 2    50   Input ~ 0
LID_HEATER1B
Text GLabel 1450 3050 2    50   Input ~ 0
LID_HEATER2A
Text GLabel 1450 3150 2    50   Input ~ 0
LID_HEATER2B
Wire Wire Line
	1450 1100 1250 1100
Wire Wire Line
	1250 1200 1450 1200
Wire Wire Line
	1250 1300 1450 1300
Wire Wire Line
	1450 1400 1250 1400
Wire Wire Line
	1250 1500 1450 1500
Wire Wire Line
	1450 1600 1250 1600
Wire Wire Line
	1250 1700 1450 1700
Wire Wire Line
	1450 1800 1250 1800
$Comp
L Connector:Conn_01x08_Male J_LID_MAIN_THERM
U 1 1 5F47D87C
P 1050 1400
F 0 "J_LID_MAIN_THERM" H 1158 1881 50  0000 C CNN
F 1 "Conn_01x08_Male" H 1158 1790 50  0000 C CNN
F 2 "" H 1050 1400 50  0001 C CNN
F 3 "~" H 1050 1400 50  0001 C CNN
	1    1050 1400
	1    0    0    -1  
$EndComp
Text GLabel 1450 3600 2    50   Input ~ 0
GND
Text GLabel 1450 3700 2    50   Input ~ 0
+10V
Text GLabel 1450 3800 2    50   Input ~ 0
-10V
Text GLabel 1450 3900 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 1450 4000 2    50   Input ~ 0
PD_MUX_SPI_SCLK
Text GLabel 1450 4100 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 1450 4200 2    50   Input ~ 0
PD_MUX_SYNC
Text GLabel 1450 4300 2    50   Input ~ 0
VCC
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5F488696
P 1050 5100
F 0 "J?" H 1158 5481 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1158 5390 50  0000 C CNN
F 2 "" H 1050 5100 50  0001 C CNN
F 3 "~" H 1050 5100 50  0001 C CNN
	1    1050 5100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5F489683
P 1050 5950
F 0 "J?" H 1158 6331 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1158 6240 50  0000 C CNN
F 2 "" H 1050 5950 50  0001 C CNN
F 3 "~" H 1050 5950 50  0001 C CNN
	1    1050 5950
	1    0    0    -1  
$EndComp
Text GLabel 1450 4900 2    50   Input ~ 0
GND
Text GLabel 1450 5000 2    50   Input ~ 0
VCC
Text GLabel 1450 5100 2    50   Input ~ 0
I2C_SCL
Text GLabel 1450 5200 2    50   Input ~ 0
I2C_SDA
Text GLabel 1450 5750 2    50   Input ~ 0
LED_BLANK
Text GLabel 1450 5850 2    50   Input ~ 0
LED_LAT
Text GLabel 1450 5950 2    50   Input ~ 0
LED_SPI_SCLK
Text GLabel 1450 6050 2    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 1450 6150 2    50   Input ~ 0
LED_SPI_MISO
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J?
U 1 1 5F48A982
P 6350 2200
F 0 "J?" H 6350 3415 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 6350 3324 50  0000 C CNN
F 2 "" H 5900 1150 50  0001 C CNN
F 3 "" H 5900 1150 50  0001 C CNN
	1    6350 2200
	1    0    0    -1  
$EndComp
Text GLabel 5500 1250 0    50   Input ~ 0
3V3
Text GLabel 5500 2050 0    50   Input ~ 0
3V3
Wire Wire Line
	5500 1250 5650 1250
Wire Wire Line
	5500 2050 5650 2050
Text GLabel 5500 2450 0    50   Input ~ 0
GND
Wire Wire Line
	5500 2450 5650 2450
Text GLabel 5500 3150 0    50   Input ~ 0
GND
Wire Wire Line
	5500 3150 5650 3150
Text GLabel 7200 1450 2    50   Input ~ 0
GND
Text GLabel 7200 2650 2    50   Input ~ 0
GND
Text GLabel 7200 2150 2    50   Input ~ 0
GND
Text GLabel 7200 2850 2    50   Input ~ 0
GND
Wire Wire Line
	7200 2850 7050 2850
Wire Wire Line
	7200 2150 7050 2150
Wire Wire Line
	7200 1850 7050 1850
Wire Wire Line
	7050 1450 7200 1450
$Comp
L Switch:SW_MEC_5G SW?
U 1 1 5F4933BC
P 9750 5950
F 0 "SW?" H 9750 6235 50  0000 C CNN
F 1 "SW_MEC_5G" H 9750 6144 50  0000 C CNN
F 2 "" H 9750 6150 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 9750 6150 50  0001 C CNN
	1    9750 5950
	1    0    0    -1  
$EndComp
Text HLabel 10250 5950 2    50   Input ~ 0
BOOT_MODE
Text HLabel 7200 2450 2    50   Input ~ 0
BOOT_MODE
Wire Wire Line
	7050 2450 7200 2450
Wire Wire Line
	9950 5950 10050 5950
Text GLabel 9300 5950 0    50   Input ~ 0
GND
Text GLabel 10050 5400 1    50   Input ~ 0
3V3
$Comp
L Device:R R?
U 1 1 5F494E15
P 10050 5650
F 0 "R?" H 9980 5604 50  0000 R CNN
F 1 "10k" H 9980 5695 50  0000 R CNN
F 2 "" V 9980 5650 50  0001 C CNN
F 3 "~" H 10050 5650 50  0001 C CNN
	1    10050 5650
	-1   0    0    1   
$EndComp
Wire Wire Line
	10050 5400 10050 5500
Wire Wire Line
	9300 5950 9550 5950
Wire Wire Line
	10050 5800 10050 5950
Connection ~ 10050 5950
Wire Wire Line
	10050 5950 10250 5950
Text HLabel 5500 1850 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	5500 1850 5650 1850
Wire Wire Line
	1450 2150 1250 2150
Wire Wire Line
	1250 2250 1450 2250
Wire Wire Line
	1450 2350 1250 2350
Wire Wire Line
	1250 2450 1450 2450
Wire Wire Line
	1450 2550 1250 2550
Wire Wire Line
	1250 2650 1450 2650
Wire Wire Line
	1450 2750 1250 2750
Wire Wire Line
	1250 2850 1450 2850
Wire Wire Line
	1450 2950 1250 2950
Wire Wire Line
	1250 3050 1450 3050
Wire Wire Line
	1450 3150 1250 3150
Wire Wire Line
	1450 3600 1250 3600
Wire Wire Line
	1250 3700 1450 3700
Wire Wire Line
	1450 3800 1250 3800
Wire Wire Line
	1250 3900 1450 3900
Wire Wire Line
	1450 4000 1250 4000
Wire Wire Line
	1250 4100 1450 4100
Wire Wire Line
	1450 4200 1250 4200
Wire Wire Line
	1250 4300 1450 4300
Wire Wire Line
	1250 4900 1450 4900
Wire Wire Line
	1450 5000 1250 5000
Wire Wire Line
	1250 5100 1450 5100
Wire Wire Line
	1450 5200 1250 5200
Wire Wire Line
	1250 5750 1450 5750
Wire Wire Line
	1450 5850 1250 5850
Wire Wire Line
	1250 5950 1450 5950
Wire Wire Line
	1450 6050 1250 6050
Wire Wire Line
	1250 6150 1450 6150
Text GLabel 7200 2950 2    50   Input ~ 0
THERM_MUX_S0
Text GLabel 5500 2650 0    50   Input ~ 0
THERM_MUX_S1
Text GLabel 5500 2750 0    50   Input ~ 0
THERM_MUX_S2
Text GLabel 5500 1550 0    50   Input ~ 0
THERM_MUX_S3
Text GLabel 1450 4400 2    50   Input ~ 0
PHOTO_OUT
Text GLabel 9950 2250 0    50   Input ~ 0
PD_REF_PWM
Text GLabel 5500 2350 0    50   Input ~ 0
SPI_SCLK
Text GLabel 5500 2150 0    50   Input ~ 0
SPI_MOSI
Text GLabel 7200 1950 2    50   Input ~ 0
PD_MUX_SYNC
Text GLabel 5500 1450 0    50   Input ~ 0
I2C_SCL
Text GLabel 5500 1350 0    50   Input ~ 0
I2C_SDA
Text GLabel 8700 2650 0    50   Input ~ 0
LED_BLANK
Text GLabel 5500 1950 0    50   Input ~ 0
LED_LAT
Text GLabel 5500 2250 0    50   Input ~ 0
SPI_MISO
$Comp
L Ninja-qPCR:ADS1219IPWR U?
U 1 1 5F4922C5
P 6800 3950
F 0 "U?" H 7700 4337 60  0000 C CNN
F 1 "ADS1219IPWR" H 7700 4231 60  0000 C CNN
F 2 "PW16_TEX" H 7700 4190 60  0001 C CNN
F 3 "" H 6800 3950 60  0000 C CNN
	1    6800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2150 5650 2150
Wire Wire Line
	5500 2250 5650 2250
Wire Wire Line
	5650 2350 5500 2350
Wire Wire Line
	5500 1350 5650 1350
Wire Wire Line
	5650 1450 5500 1450
Wire Wire Line
	5500 1550 5650 1550
Wire Wire Line
	5650 2650 5500 2650
Wire Wire Line
	7200 2950 7050 2950
Text HLabel 5500 2850 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	5500 2850 5650 2850
Wire Wire Line
	7200 1950 7050 1950
Wire Wire Line
	5650 1950 5500 1950
Wire Wire Line
	7200 2650 7050 2650
Text GLabel 6500 5250 0    50   Input ~ 0
I2C_SDA
Text GLabel 6500 5050 0    50   Input ~ 0
I2C_SCL
Text HLabel 8800 3950 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	6800 4350 6500 4350
Wire Wire Line
	6800 5250 6500 5250
Text HLabel 7200 2250 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	7200 2250 7050 2250
$Comp
L Connector:Conn_01x10_Male J?
U 1 1 5F4E5B72
P 1050 4000
F 0 "J?" H 1158 4581 50  0000 C CNN
F 1 "Conn_01x10_Male" H 1158 4490 50  0000 C CNN
F 2 "" H 1050 4000 50  0001 C CNN
F 3 "~" H 1050 4000 50  0001 C CNN
	1    1050 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4400 1250 4400
Text GLabel 7200 2750 2    50   Input ~ 0
LED_PWM
Wire Wire Line
	7200 2750 7050 2750
Text GLabel 10400 2250 2    50   Input ~ 0
LED_PWM
Wire Wire Line
	10400 2250 10300 2250
$Comp
L Device:Jumper JP?
U 1 1 5F5096F4
P 9800 2650
F 0 "JP?" H 9800 2914 50  0000 C CNN
F 1 "Jumper" H 9800 2823 50  0000 C CNN
F 2 "" H 9800 2650 50  0001 C CNN
F 3 "~" H 9800 2650 50  0001 C CNN
	1    9800 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP?
U 1 1 5F50AA83
P 9800 3050
F 0 "JP?" H 9800 3314 50  0000 C CNN
F 1 "Jumper" H 9800 3223 50  0000 C CNN
F 2 "" H 9800 3050 50  0001 C CNN
F 3 "~" H 9800 3050 50  0001 C CNN
	1    9800 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 2250 10300 2650
Connection ~ 10300 2250
Wire Wire Line
	10300 2250 9950 2250
Wire Wire Line
	10100 2650 10300 2650
$Comp
L 74xGxx:SN74LVC1G14DBV U?
U 1 1 5F523819
P 9150 3050
F 0 "U?" H 8906 3004 50  0000 R CNN
F 1 "SN74LVC1G14DBV" H 8906 3095 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 9150 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g14.pdf" H 9150 3050 50  0001 C CNN
	1    9150 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9350 3050 9500 3050
Text GLabel 9250 2750 2    50   Input ~ 0
GND
Text GLabel 9250 3350 2    50   Input ~ 0
3V3
Wire Wire Line
	9250 2750 9150 2750
Wire Wire Line
	9150 2750 9150 2850
Wire Wire Line
	9150 3250 9150 3350
Wire Wire Line
	9150 3350 9250 3350
Wire Wire Line
	10100 3050 10300 3050
Wire Wire Line
	10300 3050 10300 2650
Connection ~ 10300 2650
Wire Wire Line
	8700 2650 8750 2650
Wire Wire Line
	8750 2650 8750 3050
Wire Wire Line
	8750 3050 8850 3050
Connection ~ 8750 2650
Wire Wire Line
	8750 2650 9500 2650
Text GLabel 5500 3050 0    50   Input ~ 0
FAN_PWM
Wire Wire Line
	5500 3050 5650 3050
Text HLabel 5500 2950 0    50   Input ~ 0
LID_HEATER2
Text HLabel 5500 1750 0    50   Input ~ 0
WELL_HEATER2
Text GLabel 5500 1650 0    50   Input ~ 0
GND
Wire Wire Line
	5500 1650 5650 1650
Wire Wire Line
	5500 1750 5650 1750
Text GLabel 7200 1850 2    50   Input ~ 0
GND
NoConn ~ 7200 1250
NoConn ~ 7200 1350
Wire Wire Line
	7200 1250 7050 1250
Wire Wire Line
	7050 1350 7200 1350
NoConn ~ 5500 2550
Wire Wire Line
	5650 2550 5500 2550
NoConn ~ 7200 2550
Wire Wire Line
	7200 2550 7050 2550
Wire Wire Line
	5500 2950 5650 2950
Text GLabel 6500 4450 0    50   Input ~ 0
PHOTO_OUT
Text GLabel 6500 4350 0    50   Input ~ 0
THERM_OUT
Wire Wire Line
	6500 4450 6800 4450
Wire Wire Line
	6800 5050 6500 5050
Text GLabel 6500 4950 0    50   Input ~ 0
3V3
Text GLabel 6500 4150 0    50   Input ~ 0
GND
Wire Wire Line
	6500 4150 6650 4150
Text GLabel 6500 3950 0    50   Input ~ 0
3V3
Wire Wire Line
	6500 3950 6800 3950
Text GLabel 6500 4850 0    50   Input ~ 0
GND
Wire Wire Line
	6500 4850 6800 4850
Wire Wire Line
	6800 4950 6500 4950
Text GLabel 6650 5650 0    50   Input ~ 0
3V3
Wire Wire Line
	6650 5650 6750 5650
Wire Wire Line
	6800 4250 6650 4250
Wire Wire Line
	6650 4250 6650 4150
Connection ~ 6650 4150
Wire Wire Line
	6650 4150 6800 4150
Text GLabel 8800 4350 2    50   Input ~ 0
GND
Wire Wire Line
	8800 4350 8700 4350
Wire Wire Line
	8700 4350 8700 4450
Wire Wire Line
	8700 4450 8600 4450
Connection ~ 8700 4350
Wire Wire Line
	8700 4350 8600 4350
Wire Wire Line
	8800 3950 8600 3950
Wire Wire Line
	6750 5650 6750 5850
Wire Wire Line
	6750 5850 6800 5850
Connection ~ 6750 5650
Wire Wire Line
	6750 5650 6800 5650
NoConn ~ 6650 4550
Wire Wire Line
	6650 4550 6800 4550
NoConn ~ 6650 4650
Wire Wire Line
	6650 4650 6800 4650
$Sheet
S 0    8800 11700 3450
U 5F7519D0
F0 "Power Output" 50
F1 "qPCR-main_power_output.sch" 50
$EndSheet
$Sheet
S -50  13500 11700 3500
U 5F78C568
F0 "Power Input" 50
F1 "qPCR-main_power_input.sch" 50
$EndSheet
Text GLabel 3450 6550 2    50   Input ~ 0
SPI_SCLK
Text GLabel 3950 6300 1    50   Input ~ 0
SPI_MOSI
Text GLabel 3450 7500 2    50   Input ~ 0
SPI_MISO
Text GLabel 3150 6550 0    50   Input ~ 0
PD_MUX_SPI_SCLK
Text GLabel 3150 6650 0    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 3200 7300 0    50   Input ~ 0
LED_SPI_SCLK
Text GLabel 3200 7400 0    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 3200 7500 0    50   Input ~ 0
LED_SPI_MISO
Wire Wire Line
	3450 6550 3150 6550
Text GLabel 3450 7300 2    50   Input ~ 0
SPI_SCLK
Wire Wire Line
	3450 7300 3200 7300
Wire Wire Line
	3450 7500 3200 7500
Text GLabel 7200 2050 2    50   Input ~ 0
SPI_MOSI_SWITCH
Wire Wire Line
	7200 2050 7050 2050
Text GLabel 5400 6500 2    50   Input ~ 0
SPI_MOSI_SWITCH
$Comp
L 74xGxx:74LVC2G66 U?
U 1 1 5F51F0AF
P 4350 6500
F 0 "U?" H 4350 6816 50  0000 C CNN
F 1 "74LVC2G66" H 4350 6725 50  0000 C CNN
F 2 "" H 4350 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4350 6500 50  0001 C CNN
	1    4350 6500
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G66 U?
U 2 1 5F5201B9
P 4350 7250
F 0 "U?" H 4350 7566 50  0000 C CNN
F 1 "74LVC2G66" H 4350 7475 50  0000 C CNN
F 2 "" H 4350 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4350 7250 50  0001 C CNN
	2    4350 7250
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:SN74LVC1G14DBV U?
U 1 1 5F526BC8
P 5000 7250
F 0 "U?" H 4756 7204 50  0000 R CNN
F 1 "SN74LVC1G14DBV" H 4756 7295 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5000 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g14.pdf" H 5000 7250 50  0001 C CNN
	1    5000 7250
	-1   0    0    1   
$EndComp
Text GLabel 4600 6250 2    50   Input ~ 0
3V3
Text GLabel 4600 6700 2    50   Input ~ 0
GND
Text GLabel 4600 7000 2    50   Input ~ 0
3V3
Wire Wire Line
	4600 7000 4400 7000
Wire Wire Line
	4400 7000 4400 7100
Wire Wire Line
	4600 6250 4400 6250
Wire Wire Line
	4400 6250 4400 6350
Wire Wire Line
	4600 6700 4400 6700
Wire Wire Line
	4400 6700 4400 6650
Text GLabel 4600 7450 2    50   Input ~ 0
GND
Wire Wire Line
	4600 7450 4400 7450
Wire Wire Line
	4400 7450 4400 7400
Wire Wire Line
	4700 7250 4600 7250
Wire Wire Line
	4600 6500 5300 6500
Wire Wire Line
	5300 6500 5300 7250
Wire Wire Line
	5300 7250 5200 7250
Connection ~ 5300 6500
Wire Wire Line
	5300 6500 5400 6500
Wire Wire Line
	3950 6300 3950 6500
Wire Wire Line
	3950 7250 4100 7250
Wire Wire Line
	4100 6500 3950 6500
Connection ~ 3950 6500
Wire Wire Line
	3950 6500 3950 7250
Wire Wire Line
	4100 7400 3200 7400
Wire Wire Line
	4100 6650 3150 6650
Text GLabel 7200 1550 2    50   Input ~ 0
GPIO15
Text GLabel 7200 1650 2    50   Input ~ 0
GPIO16
Text GLabel 7200 1750 2    50   Input ~ 0
GPIO1
Wire Wire Line
	7200 1550 7050 1550
Wire Wire Line
	7050 1650 7200 1650
Wire Wire Line
	7200 1750 7050 1750
Text GLabel 2900 1100 2    50   Input ~ 0
GPIO15
Text GLabel 2900 1200 2    50   Input ~ 0
GPIO16
Text GLabel 2900 1300 2    50   Input ~ 0
GPIO1
Text GLabel 7200 2350 2    50   Input ~ 0
GPIO10
Wire Wire Line
	7200 2350 7050 2350
Text GLabel 2900 1400 2    50   Input ~ 0
GPIO10
Text GLabel 7200 3050 2    50   Input ~ 0
GPIO28
Text GLabel 7200 3150 2    50   Input ~ 0
GPIO29
Wire Wire Line
	7050 3050 7200 3050
Wire Wire Line
	7050 3150 7200 3150
Text GLabel 2900 1500 2    50   Input ~ 0
GPIO28
Text GLabel 2900 1600 2    50   Input ~ 0
GPIO29
Text GLabel 2900 1700 2    50   Input ~ 0
3V3
Text GLabel 2900 1800 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x08_Male J_EXTRA
U 1 1 5F5386EE
P 2500 1400
F 0 "J_EXTRA" H 2608 1881 50  0000 C CNN
F 1 "Conn_01x08_Male" H 2608 1790 50  0000 C CNN
F 2 "" H 2500 1400 50  0001 C CNN
F 3 "~" H 2500 1400 50  0001 C CNN
	1    2500 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1100 2900 1100
Wire Wire Line
	2900 1200 2700 1200
Wire Wire Line
	2700 1300 2900 1300
Wire Wire Line
	2900 1400 2700 1400
Wire Wire Line
	2700 1500 2900 1500
Wire Wire Line
	2900 1600 2700 1600
Wire Wire Line
	2700 1700 2900 1700
Wire Wire Line
	2900 1800 2700 1800
$EndSCHEMATC
