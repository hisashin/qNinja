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
Text GLabel 2350 6650 2    50   Input ~ 0
THERM_MUX_S0
Text GLabel 2350 6750 2    50   Input ~ 0
THERM_MUX_S1
Text GLabel 2350 6850 2    50   Input ~ 0
THERM_MUX_S2
Text GLabel 2350 6950 2    50   Input ~ 0
THERM_MUX_S3
Text GLabel 2350 7050 2    50   Input ~ 0
3V3
Text GLabel 2350 7150 2    50   Input ~ 0
GND
Text GLabel 2350 7250 2    50   Input ~ 0
THERM_GND
Text GLabel 2350 7350 2    50   Input ~ 0
THERM_OUT
Text GLabel 4700 1400 2    50   Input ~ 0
BODY_HEATER1A
Text GLabel 4700 1500 2    50   Input ~ 0
BODY_HEATER1B
Text GLabel 5500 2300 2    50   Input ~ 0
FAN_RED_VCC
Text GLabel 5500 2400 2    50   Input ~ 0
FAN_BLACK_GND
Text GLabel 4700 1600 2    50   Input ~ 0
BODY_HEATER2A
Text GLabel 4700 1700 2    50   Input ~ 0
BODY_HEATER2B
Text GLabel 4700 1800 2    50   Input ~ 0
LID_HEATER1A
Text GLabel 4700 1900 2    50   Input ~ 0
LID_HEATER1B
Text GLabel 4700 2000 2    50   Input ~ 0
LID_HEATER2A
Text GLabel 4700 2100 2    50   Input ~ 0
LID_HEATER2B
Wire Wire Line
	2350 6650 2150 6650
Wire Wire Line
	2150 6750 2350 6750
Wire Wire Line
	2150 6850 2350 6850
Wire Wire Line
	2350 6950 2150 6950
Wire Wire Line
	2150 7050 2350 7050
Wire Wire Line
	2350 7150 2150 7150
Wire Wire Line
	2150 7250 2350 7250
Wire Wire Line
	2350 7350 2150 7350
$Comp
L Connector:Conn_01x08_Male J_LID_MAIN_THERM
U 1 1 5F47D87C
P 1950 6950
F 0 "J_LID_MAIN_THERM" H 2058 7431 50  0000 C CNN
F 1 "Conn_01x08_Male" H 2058 7340 50  0000 C CNN
F 2 "" H 1950 6950 50  0001 C CNN
F 3 "~" H 1950 6950 50  0001 C CNN
	1    1950 6950
	1    0    0    -1  
$EndComp
Text GLabel 9250 1250 2    50   Input ~ 0
GND
Text GLabel 9250 1350 2    50   Input ~ 0
+10V
Text GLabel 9250 1450 2    50   Input ~ 0
-10V
Text GLabel 10150 1850 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 10150 1950 2    50   Input ~ 0
PD_MUX_SPI_SCLK
Text GLabel 10150 2050 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 10150 2150 2    50   Input ~ 0
PD_MUX_SYNC
Text GLabel 10150 2250 2    50   Input ~ 0
VCC
Text GLabel 7950 2000 2    50   Input ~ 0
LED_BLANK
Text GLabel 7950 2100 2    50   Input ~ 0
LED_LAT
Text GLabel 7950 2200 2    50   Input ~ 0
LED_SPI_SCLK
Text GLabel 7950 2300 2    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 7950 2400 2    50   Input ~ 0
LED_SPI_MISO
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J?
U 1 1 5F48A982
P 2400 2050
F 0 "J?" H 2400 3265 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 2400 3174 50  0000 C CNN
F 2 "" H 1950 1000 50  0001 C CNN
F 3 "" H 1950 1000 50  0001 C CNN
	1    2400 2050
	1    0    0    -1  
$EndComp
Text GLabel 1550 1100 0    50   Input ~ 0
3V3
Text GLabel 1550 1900 0    50   Input ~ 0
3V3
Wire Wire Line
	1550 1100 1700 1100
Wire Wire Line
	1550 1900 1700 1900
Text GLabel 1550 2300 0    50   Input ~ 0
GND
Wire Wire Line
	1550 2300 1700 2300
Text GLabel 1550 3000 0    50   Input ~ 0
GND
Wire Wire Line
	1550 3000 1700 3000
Text GLabel 3250 1300 2    50   Input ~ 0
GND
Text GLabel 3250 2500 2    50   Input ~ 0
GND
Text GLabel 3250 2000 2    50   Input ~ 0
GND
Text GLabel 3250 2700 2    50   Input ~ 0
GND
Wire Wire Line
	3250 2700 3100 2700
Wire Wire Line
	3250 2000 3100 2000
Wire Wire Line
	3250 1700 3100 1700
Wire Wire Line
	3100 1300 3250 1300
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
Text HLabel 3250 2300 2    50   Input ~ 0
BOOT_MODE
Wire Wire Line
	3100 2300 3250 2300
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
Text HLabel 1550 1700 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	1550 1700 1700 1700
Wire Wire Line
	4700 1400 4500 1400
Wire Wire Line
	4500 1500 4700 1500
Wire Wire Line
	4700 1600 4500 1600
Wire Wire Line
	4500 1700 4700 1700
Wire Wire Line
	4700 1800 4500 1800
Wire Wire Line
	4500 1900 4700 1900
Wire Wire Line
	4700 2000 4500 2000
Wire Wire Line
	4500 2100 4700 2100
Wire Wire Line
	4700 2300 4500 2300
Wire Wire Line
	4500 2400 4700 2400
Wire Wire Line
	9250 1250 9050 1250
Wire Wire Line
	9050 1350 9250 1350
Wire Wire Line
	9250 1450 9050 1450
Wire Wire Line
	9050 1550 9250 1550
Wire Wire Line
	9250 1650 9050 1650
Wire Wire Line
	9050 1750 9250 1750
Wire Wire Line
	9250 1850 9050 1850
Wire Wire Line
	9050 1950 9250 1950
Text GLabel 3250 2800 2    50   Input ~ 0
THERM_MUX_S0
Text GLabel 1550 2500 0    50   Input ~ 0
THERM_MUX_S1
Text GLabel 1550 2600 0    50   Input ~ 0
THERM_MUX_S2
Text GLabel 1550 1400 0    50   Input ~ 0
THERM_MUX_S3
Text GLabel 10150 2350 2    50   Input ~ 0
PHOTO_OUT
Text GLabel 1550 2200 0    50   Input ~ 0
SPI_SCLK
Text GLabel 1550 2000 0    50   Input ~ 0
SPI_MOSI
Text GLabel 3250 1800 2    50   Input ~ 0
PD_MUX_SYNC
Text GLabel 1550 1300 0    50   Input ~ 0
I2C_SCL
Text GLabel 1550 1200 0    50   Input ~ 0
I2C_SDA
Text GLabel 1550 1800 0    50   Input ~ 0
LED_LAT
Text GLabel 1550 2100 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	1550 2000 1700 2000
Wire Wire Line
	1550 2100 1700 2100
Wire Wire Line
	1700 2200 1550 2200
Wire Wire Line
	1550 1200 1700 1200
Wire Wire Line
	1700 1300 1550 1300
Wire Wire Line
	1550 1400 1700 1400
Wire Wire Line
	1700 2500 1550 2500
Wire Wire Line
	3250 2800 3100 2800
Text HLabel 1550 2700 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	1550 2700 1700 2700
Wire Wire Line
	3250 1800 3100 1800
Wire Wire Line
	1700 1800 1550 1800
Wire Wire Line
	3250 2500 3100 2500
Text HLabel 3250 2100 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	3250 2100 3100 2100
Wire Wire Line
	9250 2050 9050 2050
Text GLabel 3250 2600 2    50   Input ~ 0
LED_PWM
Wire Wire Line
	3250 2600 3100 2600
Text GLabel 1550 2900 0    50   Input ~ 0
FAN_PWM
Wire Wire Line
	1550 2900 1700 2900
Text HLabel 1550 2800 0    50   Input ~ 0
LID_HEATER2
Text HLabel 1550 1600 0    50   Input ~ 0
WELL_HEATER2
Text GLabel 1550 1500 0    50   Input ~ 0
GND
Wire Wire Line
	1550 1500 1700 1500
Wire Wire Line
	1550 1600 1700 1600
Text GLabel 3250 1700 2    50   Input ~ 0
GND
NoConn ~ 3250 1100
NoConn ~ 3250 1200
Wire Wire Line
	3250 1100 3100 1100
Wire Wire Line
	3100 1200 3250 1200
NoConn ~ 1550 2400
Wire Wire Line
	1700 2400 1550 2400
NoConn ~ 3250 2400
Wire Wire Line
	3250 2400 3100 2400
Wire Wire Line
	1550 2800 1700 2800
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
Text GLabel 3250 1900 2    50   Input ~ 0
SPI_MOSI_SWITCH
Wire Wire Line
	3250 1900 3100 1900
Text GLabel 3250 1400 2    50   Input ~ 0
GPIO15
Text GLabel 3250 1500 2    50   Input ~ 0
GPIO16
Text GLabel 3250 1600 2    50   Input ~ 0
GPIO1
Wire Wire Line
	3250 1400 3100 1400
Wire Wire Line
	3100 1500 3250 1500
Wire Wire Line
	3250 1600 3100 1600
Text GLabel 3800 6650 2    50   Input ~ 0
GPIO15
Text GLabel 3800 6750 2    50   Input ~ 0
GPIO16
Text GLabel 3800 6850 2    50   Input ~ 0
GPIO1
Text GLabel 3250 2200 2    50   Input ~ 0
GPIO10
Wire Wire Line
	3250 2200 3100 2200
Text GLabel 3800 6950 2    50   Input ~ 0
GPIO10
Text GLabel 3250 2900 2    50   Input ~ 0
GPIO28
Text GLabel 3250 3000 2    50   Input ~ 0
GPIO29
Wire Wire Line
	3100 2900 3250 2900
Wire Wire Line
	3100 3000 3250 3000
Text GLabel 3800 7050 2    50   Input ~ 0
GPIO28
Text GLabel 3800 7150 2    50   Input ~ 0
GPIO29
Text GLabel 3800 7250 2    50   Input ~ 0
3V3
Text GLabel 3800 7350 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x08_Male J_EXTRA
U 1 1 5F5386EE
P 3400 6950
F 0 "J_EXTRA" H 3508 7431 50  0000 C CNN
F 1 "Conn_01x08_Male" H 3508 7340 50  0000 C CNN
F 2 "" H 3400 6950 50  0001 C CNN
F 3 "~" H 3400 6950 50  0001 C CNN
	1    3400 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6650 3800 6650
Wire Wire Line
	3800 6750 3600 6750
Wire Wire Line
	3600 6850 3800 6850
Wire Wire Line
	3800 6950 3600 6950
Wire Wire Line
	3600 7050 3800 7050
Wire Wire Line
	3800 7150 3600 7150
Wire Wire Line
	3600 7250 3800 7250
Wire Wire Line
	3800 7350 3600 7350
$Comp
L Ninja-qPCR:SPI_SWITCHER U?
U 1 1 5F529806
P 3900 4900
F 0 "U?" H 3925 5025 50  0000 C CNN
F 1 "SPI_SWITCHER" H 3925 4934 50  0000 C CNN
F 2 "" H 3900 4900 50  0001 C CNN
F 3 "" H 3900 4900 50  0001 C CNN
	1    3900 4900
	1    0    0    -1  
$EndComp
Text GLabel 3050 5000 0    50   Input ~ 0
3V3
Text GLabel 3050 5100 0    50   Input ~ 0
SPI_MOSI_SWITCH
Text GLabel 3050 5500 0    50   Input ~ 0
GND
Text GLabel 3050 5200 0    50   Input ~ 0
SPI_MOSI
Text GLabel 3050 5300 0    50   Input ~ 0
SPI_MISO
Text GLabel 3050 5400 0    50   Input ~ 0
SPI_SCLK
Text GLabel 4850 5200 2    50   Input ~ 0
PD_MUX_SPI_SCLK
Text GLabel 4850 5500 2    50   Input ~ 0
LED_SPI_SCLK
Text GLabel 4850 5400 2    50   Input ~ 0
LED_SPI_MISO
Text GLabel 4850 5300 2    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 4850 5000 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Wire Wire Line
	4850 5500 4650 5500
Wire Wire Line
	4850 5400 4650 5400
Wire Wire Line
	4850 5300 4650 5300
Wire Wire Line
	4850 5200 4650 5200
Wire Wire Line
	4850 5000 4650 5000
Wire Wire Line
	3200 5500 3050 5500
Wire Wire Line
	3200 5400 3050 5400
Wire Wire Line
	3200 5300 3050 5300
Wire Wire Line
	3200 5200 3050 5200
Wire Wire Line
	3200 5100 3050 5100
Wire Wire Line
	3200 5000 3050 5000
Text GLabel 5500 2200 2    50   Input ~ 0
FAN_BLUE_FREQ
Text GLabel 4700 2300 2    50   Input ~ 0
FAN_BLACK_GND1
Text GLabel 4700 2400 2    50   Input ~ 0
FAN_BLACK_GND2
$Comp
L Connector:Conn_01x11_Male J?
U 1 1 5F57B5FA
P 4300 1900
F 0 "J?" H 4408 2581 50  0000 C CNN
F 1 "Conn_01x11_Male" H 4408 2490 50  0000 C CNN
F 2 "" H 4300 1900 50  0001 C CNN
F 3 "~" H 4300 1900 50  0001 C CNN
	1    4300 1900
	1    0    0    -1  
$EndComp
Text GLabel 4700 2200 2    50   Input ~ 0
FAN_RED_VCC
Wire Wire Line
	4700 2200 4500 2200
$Comp
L Ninja-qPCR:Conn_02x05 U?
U 1 1 5F59E0F9
P 6700 1500
F 0 "U?" H 6738 1725 50  0000 C CNN
F 1 "Conn_02x05" H 6738 1634 50  0000 C CNN
F 2 "" H 6500 1600 50  0001 C CNN
F 3 "" H 6500 1600 50  0001 C CNN
	1    6700 1500
	-1   0    0    -1  
$EndComp
Text GLabel 7150 1500 2    50   Input ~ 0
VCC_LED
Text GLabel 7150 1600 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 7150 1700 2    50   Input ~ 0
GND
Text GLabel 7150 1800 2    50   Input ~ 0
LED_PWM
Text GLabel 7150 1900 2    50   Input ~ 0
LED_LAT
Text GLabel 7150 2000 2    50   Input ~ 0
LED_SPI_SCLK
Text GLabel 7150 2100 2    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 7150 2200 2    50   Input ~ 0
LED_SPI_MISO
Text GLabel 7150 2300 2    50   Input ~ 0
I2C_SCL
Text GLabel 7150 2400 2    50   Input ~ 0
I2C_SDA
Wire Wire Line
	7150 2400 6900 2400
Wire Wire Line
	7150 2300 6900 2300
Wire Wire Line
	7150 2200 6900 2200
Wire Wire Line
	7150 2100 6900 2100
Wire Wire Line
	7150 2000 6900 2000
Wire Wire Line
	7150 1900 6900 1900
Wire Wire Line
	7150 1800 6900 1800
Wire Wire Line
	7150 1700 6900 1700
Wire Wire Line
	7150 1600 6900 1600
Wire Wire Line
	7150 1500 6900 1500
NoConn ~ 4850 5100
Wire Wire Line
	4850 5100 4650 5100
$Sheet
S 6750 4250 1350 500 
U 5F58C19F
F0 "SheetLidBody" 50
F1 "fileLidBody.sch" 50
$EndSheet
Text GLabel 9250 1550 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 9250 1650 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 9250 1750 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 9250 1950 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 9250 1850 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 9250 2050 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 9250 2150 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 9250 2250 2    50   Input ~ 0
ADC_DRDY
Text GLabel 9250 2350 2    50   Input ~ 0
I2C_SCL
Text GLabel 9250 2450 2    50   Input ~ 0
I2C_SDA
Wire Wire Line
	9050 2150 9250 2150
Wire Wire Line
	9050 2250 9250 2250
Wire Wire Line
	9050 2350 9250 2350
Wire Wire Line
	9050 2450 9250 2450
Text GLabel 9250 2550 2    50   Input ~ 0
THERM_AIR
Text GLabel 9250 2650 2    50   Input ~ 0
THERM_WELL
$Comp
L Connector:Conn_01x15_Male J?
U 1 1 5F57E0A5
P 8850 1950
F 0 "J?" H 8958 2831 50  0000 C CNN
F 1 "Conn_01x15_Male" H 8958 2740 50  0000 C CNN
F 2 "" H 8850 1950 50  0001 C CNN
F 3 "~" H 8850 1950 50  0001 C CNN
	1    8850 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2550 9050 2550
Wire Wire Line
	9250 2650 9050 2650
$EndSCHEMATC
