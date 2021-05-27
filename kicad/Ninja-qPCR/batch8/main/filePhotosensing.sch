EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 10150 5000 2    50   Input ~ 0
GND
Wire Wire Line
	10150 5000 9950 5000
Wire Wire Line
	9950 5100 10150 5100
Wire Wire Line
	10150 5200 9950 5200
Wire Wire Line
	9950 5300 10150 5300
Wire Wire Line
	10150 5800 9950 5800
Wire Wire Line
	9950 5900 10150 5900
Wire Wire Line
	10150 6000 9950 6000
Wire Wire Line
	9950 6100 10150 6100
Wire Wire Line
	10150 6200 9950 6200
Text GLabel 10150 5400 2    50   Input ~ 0
PD_MUX_OUT
Text GLabel 10150 6200 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 10150 6100 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 10150 6000 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 10150 5900 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 10150 5800 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 1200 1400 2    50   Input ~ 0
GND
Text GLabel 1200 1700 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 1200 2200 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 1200 2100 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 1200 2000 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 1200 1900 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 1200 1800 2    50   Input ~ 0
PD_MUX_GPIO5
$Comp
L Ninja-qPCR:ADS1219IPWR U?
U 1 1 60B0A2C9
P 3000 1300
F 0 "U?" H 3900 1687 60  0000 C CNN
F 1 "ADS1219IPWR" H 3900 1581 60  0000 C CNN
F 2 "Ninja-qPCR:ADS1219IPWR" H 3900 1540 60  0001 C CNN
F 3 "" H 3000 1300 60  0000 C CNN
	1    3000 1300
	1    0    0    -1  
$EndComp
Text GLabel 2800 1300 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2800 1500 0    50   Input ~ 0
GND
Text GLabel 2800 1800 0    50   Input ~ 0
THERM_WELL
Text GLabel 2800 2200 0    50   Input ~ 0
GND
Text GLabel 2800 2300 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2800 2400 0    50   Input ~ 0
I2C_SCL
Text GLabel 2800 2600 0    50   Input ~ 0
I2C_SDA
Text GLabel 2800 3000 0    50   Input ~ 0
VCC_LOGIC
Wire Wire Line
	3000 3000 2900 3000
Wire Wire Line
	3000 3200 2900 3200
Wire Wire Line
	2900 3200 2900 3000
Connection ~ 2900 3000
Wire Wire Line
	2900 3000 2800 3000
Wire Wire Line
	3000 2600 2800 2600
Wire Wire Line
	3000 2400 2800 2400
Wire Wire Line
	3000 2300 2800 2300
Wire Wire Line
	3000 2200 2800 2200
Wire Wire Line
	3000 1300 2800 1300
Wire Wire Line
	3000 1500 2900 1500
Wire Wire Line
	3000 1600 2900 1600
Wire Wire Line
	2900 1600 2900 1500
Connection ~ 2900 1500
Wire Wire Line
	2900 1500 2800 1500
Wire Wire Line
	3000 1800 2800 1800
Text GLabel 5000 1300 2    50   Input ~ 0
ADC_DRDY
Text GLabel 5000 1700 2    50   Input ~ 0
GND
Wire Wire Line
	5000 1300 4800 1300
Wire Wire Line
	5000 1700 4900 1700
Wire Wire Line
	4800 1800 4900 1800
Wire Wire Line
	4900 1800 4900 1700
Connection ~ 4900 1700
Wire Wire Line
	4900 1700 4800 1700
Text GLabel 1200 3450 2    50   Input ~ 0
THERM_TEST1
Text GLabel 1200 2400 2    50   Input ~ 0
ADC_DRDY
Text GLabel 1200 2500 2    50   Input ~ 0
I2C_SCL
Text GLabel 1200 2600 2    50   Input ~ 0
I2C_SDA
Text GLabel 1200 2700 2    50   Input ~ 0
THERM_WELL
Text GLabel 2800 5100 0    50   Input ~ 0
PD_REF_PWM
Text HLabel 2800 5000 0    50   Input ~ 0
AMP_OUT
Text HLabel 5150 4500 2    50   Input ~ 0
PHOTO_OUT_P
Text GLabel 10500 1050 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 10500 1550 0    50   Input ~ 0
GND
$Comp
L Device:C C?
U 1 1 60B0A2F9
P 10650 1300
F 0 "C?" H 10765 1346 50  0000 L CNN
F 1 "0.1uF" H 10765 1255 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10688 1150 50  0001 C CNN
F 3 "~" H 10650 1300 50  0001 C CNN
	1    10650 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 1550 10650 1550
Wire Wire Line
	10650 1550 10650 1450
Wire Wire Line
	10650 1150 10650 1050
Wire Wire Line
	10650 1050 10500 1050
Wire Wire Line
	2800 5000 3000 5000
Wire Wire Line
	5150 4500 5000 4500
Wire Wire Line
	2800 5100 3000 5100
$Comp
L Ninja-qPCR:ADA2200ARUZ U?
U 1 1 60B0A306
P 3000 4500
F 0 "U?" H 4000 4987 60  0000 C CNN
F 1 "ADA2200ARUZ" H 4000 4881 60  0000 C CNN
F 2 "Ninja-qPCR:ADA2200ARUZ" H 4000 4840 60  0001 C CNN
F 3 "" H 3000 4500 60  0000 C CNN
	1    3000 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B0A30C
P 2650 4500
F 0 "R?" V 2443 4500 50  0000 C CNN
F 1 "10K" V 2534 4500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2580 4500 50  0001 C CNN
F 3 "~" H 2650 4500 50  0001 C CNN
	1    2650 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B0A312
P 1700 4700
F 0 "R?" V 1493 4700 50  0000 C CNN
F 1 "10K" V 1584 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1630 4700 50  0001 C CNN
F 3 "~" H 1700 4700 50  0001 C CNN
	1    1700 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 5200 1650 5200
Wire Wire Line
	3000 4500 2800 4500
Text GLabel 2400 4500 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	2400 4500 2500 4500
Text GLabel 1650 5200 0    50   Input ~ 0
DEMOD_SPI_SCLK
Text HLabel 9350 3450 2    50   Input ~ 0
AMP_OUT
Wire Wire Line
	7050 1100 7200 1100
Connection ~ 8850 3450
Wire Wire Line
	6750 1100 6600 1100
Wire Wire Line
	1200 1400 1050 1400
Wire Wire Line
	1050 1500 1200 1500
Wire Wire Line
	1200 1700 1050 1700
Wire Wire Line
	1050 1800 1200 1800
Wire Wire Line
	1200 1900 1050 1900
Wire Wire Line
	1050 2000 1200 2000
Wire Wire Line
	1200 2100 1050 2100
Wire Wire Line
	1050 2200 1200 2200
Wire Wire Line
	1200 2300 1050 2300
Wire Wire Line
	1050 2400 1200 2400
Wire Wire Line
	1200 2500 1050 2500
Wire Wire Line
	1050 2600 1200 2600
Wire Wire Line
	1200 2700 1050 2700
Wire Wire Line
	3000 4600 2500 4600
Wire Wire Line
	3000 5300 2800 5300
Text GLabel 2500 4600 0    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 2800 5300 0    50   Input ~ 0
DEMOD_SPI_SDIO
Wire Wire Line
	1200 1600 1050 1600
Wire Wire Line
	3000 5400 2800 5400
NoConn ~ 2800 5400
$Comp
L Device:C C?
U 1 1 60B0A335
P 1700 5500
F 0 "C?" V 1448 5500 50  0000 C CNN
F 1 "1uF" V 1539 5500 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1738 5350 50  0001 C CNN
F 3 "~" H 1700 5500 50  0001 C CNN
	1    1700 5500
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60B0A33B
P 6900 1450
F 0 "C?" V 6648 1450 50  0000 C CNN
F 1 "22pF" V 6739 1450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6938 1300 50  0001 C CNN
F 3 "~" H 6900 1450 50  0001 C CNN
	1    6900 1450
	0    1    -1   0   
$EndComp
Wire Wire Line
	7050 1450 7200 1450
Wire Wire Line
	7200 1450 7200 1100
Wire Wire Line
	6750 1450 6600 1450
Wire Wire Line
	6600 1450 6600 1100
$Comp
L Device:C C?
U 1 1 60B0A345
P 9150 3600
F 0 "C?" V 8898 3600 50  0000 C CNN
F 1 "0.1uF" V 8989 3600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9188 3450 50  0001 C CNN
F 3 "~" H 9150 3600 50  0001 C CNN
	1    9150 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 3600 8850 3600
Wire Wire Line
	8850 3600 8850 3450
Wire Wire Line
	9400 3600 9300 3600
$Comp
L Connector:Conn_01x14_Male J?
U 1 1 60B0A34E
P 850 2000
F 0 "J?" H 958 2781 50  0000 C CNN
F 1 "Conn_01x14_Male" H 958 2690 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x14_Pitch2.54mm" H 850 2000 50  0001 C CNN
F 3 "~" H 850 2000 50  0001 C CNN
	1    850  2000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male JSPI?
U 1 1 60B0A354
P 2900 7000
F 0 "JSPI?" H 3008 7281 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3008 7190 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x02_Pitch2.54mm" H 2900 7000 50  0001 C CNN
F 3 "~" H 2900 7000 50  0001 C CNN
	1    2900 7000
	1    0    0    -1  
$EndComp
Text GLabel 3350 7200 2    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 3350 6900 2    50   Input ~ 0
GND
Text GLabel 3350 7100 2    50   Input ~ 0
DEMOD_SPI_SDIO
Wire Wire Line
	3350 6900 3100 6900
Wire Wire Line
	3100 7000 3350 7000
Wire Wire Line
	3350 7100 3100 7100
Wire Wire Line
	3100 7200 3350 7200
NoConn ~ 1200 1500
NoConn ~ 1200 1600
Text GLabel 1200 2300 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 6050 3550 0    50   Input ~ 0
PD_MUX_OUT
$Comp
L Device:R R?
U 1 1 60B0A365
P 6900 2050
F 0 "R?" V 6693 2050 50  0000 C CNN
F 1 "R" V 6784 2050 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 6830 2050 50  0001 C CNN
F 3 "~" H 6900 2050 50  0001 C CNN
	1    6900 2050
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60B0A36B
P 6900 2400
F 0 "C?" V 6648 2400 50  0000 C CNN
F 1 "22pF" V 6739 2400 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6938 2250 50  0001 C CNN
F 3 "~" H 6900 2400 50  0001 C CNN
	1    6900 2400
	0    1    -1   0   
$EndComp
Wire Wire Line
	7050 2400 7200 2400
Wire Wire Line
	7200 2400 7200 2050
Wire Wire Line
	6750 2400 6600 2400
Wire Wire Line
	6600 2400 6600 2050
Text Notes 6400 2850 0    50   ~ 0
SMALL GAIN FOR\nSTRONG SIGNAL
Wire Wire Line
	7200 2050 7050 2050
Wire Wire Line
	6600 2050 6750 2050
Text GLabel 1200 3550 2    50   Input ~ 0
PHOTO_GND
Text GLabel 1200 3650 2    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	5000 4600 5550 4600
Text GLabel 5550 4600 2    50   Input ~ 0
XOUT
Text GLabel 1700 6950 2    50   Input ~ 0
XOUT
Text GLabel 2400 4800 0    50   Input ~ 0
CLKIN
Wire Wire Line
	2400 4800 3000 4800
Text GLabel 1700 6850 2    50   Input ~ 0
CLKIN
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60B0A380
P 1300 6850
F 0 "J?" H 1408 7031 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1408 6940 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 1300 6850 50  0001 C CNN
F 3 "~" H 1300 6850 50  0001 C CNN
	1    1300 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6850 1700 6850
Wire Wire Line
	1700 6950 1500 6950
Text GLabel 5900 3850 0    50   Input ~ 0
PHOTO_GND
Text GLabel 6750 4150 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	8500 3450 8850 3450
Text GLabel 6750 3450 0    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	6750 3450 6900 3450
Wire Wire Line
	6200 3550 6900 3550
Text GLabel 9100 1650 2    50   Input ~ 0
PHOTO_3V3
Text GLabel 1200 3750 2    50   Input ~ 0
-1V
Text GLabel 7500 2250 0    50   Input ~ 0
-1V
Text GLabel 10150 5300 2    50   Input ~ 0
-1V
$Comp
L Device:R R?
U 1 1 60B0A392
P 9200 2050
F 0 "R?" V 8993 2050 50  0000 C CNN
F 1 "10K" V 9084 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9130 2050 50  0001 C CNN
F 3 "~" H 9200 2050 50  0001 C CNN
	1    9200 2050
	0    -1   -1   0   
$EndComp
Text GLabel 9450 2050 2    50   Input ~ 0
-1V
Wire Wire Line
	6050 3550 6200 3550
Connection ~ 6200 3550
Text Notes 4950 6600 0    50   ~ 0
Debug pins\n(Photo measurement)
Text GLabel 5350 7100 2    50   Input ~ 0
PD_MUX_OUT
Text HLabel 5350 7200 2    50   Input ~ 0
AMP_OUT
Text HLabel 5150 4400 2    50   Input ~ 0
PHOTO_OUT_N
Wire Wire Line
	5150 4400 5000 4400
Text HLabel 5350 6900 2    50   Input ~ 0
PHOTO_OUT_N
Text HLabel 5350 7000 2    50   Input ~ 0
PHOTO_OUT_P
Text HLabel 2800 2000 0    50   Input ~ 0
PHOTO_OUT_P
Text HLabel 2800 1900 0    50   Input ~ 0
PHOTO_OUT_N
Wire Wire Line
	2800 1900 3000 1900
Wire Wire Line
	3000 2000 2800 2000
Text GLabel 2800 1700 0    50   Input ~ 0
THERM_TEST1
Wire Wire Line
	2800 1700 3000 1700
$Comp
L Ninja-qPCR:TS5A9411DCKR U?
U 1 1 60B0A3A8
P 8200 1950
F 0 "U?" H 8200 2638 60  0000 C CNN
F 1 "TS5A9411DCKR" H 8200 2532 60  0000 C CNN
F 2 "Ninja-qPCR:TS5A9411DCKR" H 8200 1890 60  0001 C CNN
F 3 "" H 8200 1950 60  0000 C CNN
	1    8200 1950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7600 2050 7200 2050
Connection ~ 7200 2050
Wire Wire Line
	9100 1650 8800 1650
Wire Wire Line
	6600 2050 6200 2050
Connection ~ 6600 2050
Wire Wire Line
	6200 2050 6200 3550
Wire Wire Line
	7600 1850 7200 1850
Wire Wire Line
	8950 1850 8950 2050
Wire Wire Line
	8950 2050 9050 2050
Wire Wire Line
	8950 1850 9200 1850
Wire Wire Line
	9450 2050 9350 2050
Text GLabel 5150 5000 2    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	5150 5000 5000 5000
Text GLabel 1450 4700 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	1450 4700 1550 4700
Text GLabel 2800 5800 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	2800 5800 3000 5800
Text GLabel 1400 5500 0    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	1400 5500 1550 5500
Wire Wire Line
	1850 5500 3000 5500
Text GLabel 2800 4900 0    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	2800 4900 3000 4900
Wire Wire Line
	8850 3450 8850 2050
Wire Wire Line
	8850 2050 8800 2050
Wire Wire Line
	8950 1850 8800 1850
Connection ~ 8950 1850
Text Notes 8750 1450 0    50   ~ 0
IN=High : COM<->NO (Low gain)\nIN=Low : COM<->NC (High gain)
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 60B0A3C9
P 800 3650
F 0 "J?" H 908 4031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 908 3940 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x05_Pitch2.54mm" H 800 3650 50  0001 C CNN
F 3 "~" H 800 3650 50  0001 C CNN
	1    800  3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 3850 1200 3850
Wire Wire Line
	1200 3450 1000 3450
Wire Wire Line
	1000 3550 1200 3550
Wire Wire Line
	1200 3650 1000 3650
Wire Wire Line
	1000 3750 1200 3750
Wire Wire Line
	5350 6900 4900 6900
Wire Wire Line
	5350 7000 4900 7000
Wire Wire Line
	5350 7200 4900 7200
Wire Wire Line
	5350 7100 4900 7100
Text Notes 2700 6600 0    50   ~ 0
ADA2200 SPI debug
Text Notes 1100 6600 0    50   ~ 0
ADA2200 Clock\n(For external X’tal circuit)
Text Notes 650  1150 0    50   ~ 0
Main <-> Photosensing
Wire Wire Line
	8850 3450 9350 3450
$Comp
L Device:R R?
U 1 1 60B0A3DC
P 6900 1100
F 0 "R?" V 6693 1100 50  0000 C CNN
F 1 "R" V 6784 1100 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 6830 1100 50  0001 C CNN
F 3 "~" H 6900 1100 50  0001 C CNN
	1    6900 1100
	0    -1   1    0   
$EndComp
Wire Wire Line
	6750 4150 6900 4150
$Comp
L Ninja-qPCR:AD8605ARTZ-R2 U?
U 1 1 60B0A3E3
P 6900 3450
F 0 "U?" H 7700 3837 60  0000 C CNN
F 1 "AD8605ARTZ-R2" H 7700 3731 60  0000 C CNN
F 2 "Ninja-qPCR:AD8605ARTZ-R2" H 7700 3690 60  0001 C CNN
F 3 "" H 6900 3450 60  0000 C CNN
	1    6900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1850 7200 1450
Connection ~ 7200 1450
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 60B0A3EB
P 9750 5200
F 0 "J?" H 9642 5585 50  0000 C CNN
F 1 "Conn_01x05_Female" H 9642 5494 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 9750 5200 50  0001 C CNN
F 3 "~" H 9750 5200 50  0001 C CNN
	1    9750 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5400 9950 5400
$Comp
L Connector:Conn_01x05_Female J?
U 1 1 60B0A3F2
P 9750 6000
F 0 "J?" H 9642 6385 50  0000 C CNN
F 1 "Conn_01x05_Female" H 9642 6294 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 9750 6000 50  0001 C CNN
F 3 "~" H 9750 6000 50  0001 C CNN
	1    9750 6000
	-1   0    0    -1  
$EndComp
Text GLabel 10150 5100 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 10150 5200 2    50   Input ~ 0
PHOTO_GND
Text GLabel 8350 5500 2    50   Input ~ 0
GND
Text GLabel 8350 5400 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 6600 5700 0    50   Input ~ 0
CLKIN
$Comp
L Device:R R?
U 1 1 60B0A3FD
P 7000 5400
F 0 "R?" V 6793 5400 50  0000 C CNN
F 1 "10K" V 6884 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6930 5400 50  0001 C CNN
F 3 "~" H 7000 5400 50  0001 C CNN
	1    7000 5400
	0    1    1    0   
$EndComp
Text GLabel 6600 5400 0    50   Input ~ 0
VCC_LOGIC
Wire Wire Line
	7500 2250 7600 2250
Wire Wire Line
	7200 2400 7200 2700
Wire Wire Line
	7200 2700 7500 2700
Connection ~ 7200 2400
Wire Wire Line
	7200 1100 7500 1100
Connection ~ 7200 1100
Wire Wire Line
	6200 2050 6200 1100
Wire Wire Line
	6200 1100 6600 1100
Connection ~ 6200 2050
Connection ~ 6600 1100
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 60B0A40E
P 9700 2900
F 0 "J?" H 9808 3181 50  0000 C CNN
F 1 "Conn_01x04_Male" H 9808 3090 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04_Pitch2.54mm" H 9700 2900 50  0001 C CNN
F 3 "~" H 9700 2900 50  0001 C CNN
	1    9700 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 3100 9900 3100
Wire Wire Line
	10150 2800 9900 2800
Text GLabel 10150 2900 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10150 2900 9900 2900
Text GLabel 10150 3000 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10150 3000 9900 3000
Text Notes 9700 2550 0    50   ~ 0
External gain resistors
$Comp
L Device:Jumper JP?
U 1 1 60B0A41B
P 7000 5700
F 0 "JP?" V 6954 5827 50  0000 L CNN
F 1 "Jumper" V 7045 5827 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 7000 5700 50  0001 C CNN
F 3 "~" H 7000 5700 50  0001 C CNN
	1    7000 5700
	-1   0    0    1   
$EndComp
Text HLabel 7500 1100 2    50   Input ~ 0
GAIN_LARGE
Text HLabel 7500 2700 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10150 3100 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10150 2800 2    50   Input ~ 0
GAIN_LARGE
Text HLabel 1200 3850 2    50   Input ~ 0
AMP_GAIN_SW
Text HLabel 9200 1850 2    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 9400 3600 2    50   Input ~ 0
PHOTO_GND
Text GLabel 3350 7000 2    50   Input ~ 0
DEMOD_SPI_SCLK
Text Notes 9450 4650 0    50   ~ 0
-> Photosensing
Wire Wire Line
	1850 4700 1950 4700
$Comp
L Device:C C?
U 1 1 60B0A42B
P 1700 4950
F 0 "C?" V 1448 4950 50  0000 C CNN
F 1 "10uF" V 1539 4950 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1738 4800 50  0001 C CNN
F 3 "~" H 1700 4950 50  0001 C CNN
	1    1700 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 4950 1950 4950
Wire Wire Line
	1950 4950 1950 4700
Connection ~ 1950 4700
Wire Wire Line
	1950 4700 3000 4700
Text GLabel 1450 4950 0    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	1450 4950 1550 4950
$Comp
L Ninja-qPCR:COM1305-0.032768-EXT-T-TR U?
U 1 1 60B0A437
P 7400 5400
F 0 "U?" H 7825 5665 50  0000 C CNN
F 1 "COM1305-0.032768-EXT-T-TR" H 7825 5574 50  0000 C CNN
F 2 "Ninja-qPCR:COM1305-0.032768-EXT-T-TR" H 7400 5400 50  0001 C CNN
F 3 "" H 7400 5400 50  0001 C CNN
	1    7400 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 5400 8250 5400
Wire Wire Line
	8350 5500 8250 5500
Wire Wire Line
	7400 5500 7350 5500
Wire Wire Line
	7350 5500 7350 5700
Wire Wire Line
	7350 5700 7300 5700
Wire Wire Line
	7150 5400 7400 5400
Wire Wire Line
	6850 5400 6600 5400
Wire Wire Line
	6700 5700 6600 5700
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 60B0A445
P 4700 7000
F 0 "J?" H 4808 7281 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4808 7190 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04_Pitch2.54mm" H 4700 7000 50  0001 C CNN
F 3 "~" H 4700 7000 50  0001 C CNN
	1    4700 7000
	1    0    0    -1  
$EndComp
Text GLabel 5900 4250 0    50   Input ~ 0
-1V
$Comp
L Jumper:SolderJumper_3_Open JP?
U 1 1 60B0A44C
P 6100 4050
F 0 "JP?" V 6146 4117 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 6055 4117 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P2.0mm_Open_TrianglePad1.0x1.5mm" H 6100 4050 50  0001 C CNN
F 3 "~" H 6100 4050 50  0001 C CNN
	1    6100 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 4050 6900 4050
Wire Wire Line
	5900 3850 6100 3850
Wire Wire Line
	5900 4250 6100 4250
$EndSCHEMATC
