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
Text GLabel 10250 4850 2    50   Input ~ 0
GND
Wire Wire Line
	10050 4850 10250 4850
Wire Wire Line
	10250 4950 10050 4950
Wire Wire Line
	10050 5050 10250 5050
Wire Wire Line
	10250 5150 10050 5150
Wire Wire Line
	10050 5250 10250 5250
Wire Wire Line
	10250 5550 10050 5550
Wire Wire Line
	10050 5650 10250 5650
Wire Wire Line
	10250 5750 10050 5750
Wire Wire Line
	10050 5850 10250 5850
Wire Wire Line
	10250 5950 10050 5950
Text GLabel 10250 5150 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 10250 5250 2    50   Input ~ 0
PD_MUX_OUT
Text GLabel 10250 5950 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 10250 5850 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 10250 5750 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 10250 5650 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 10250 5550 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 1300 1150 2    50   Input ~ 0
GND
Text GLabel 1300 1450 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 1300 1950 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 1300 1850 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 1300 1750 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 1300 1650 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 1300 1550 2    50   Input ~ 0
PD_MUX_GPIO5
$Comp
L Ninja-qPCR:ADS1219IPWR U2
U 1 1 5F63A689
P 3100 1050
F 0 "U2" H 4000 1437 60  0000 C CNN
F 1 "ADS1219IPWR" H 4000 1331 60  0000 C CNN
F 2 "PW16_TEX" H 4000 1290 60  0001 C CNN
F 3 "" H 3100 1050 60  0000 C CNN
	1    3100 1050
	1    0    0    -1  
$EndComp
Text GLabel 2900 1050 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2900 1250 0    50   Input ~ 0
GND
Text GLabel 2900 1550 0    50   Input ~ 0
THERM_WELL
Text GLabel 2900 1950 0    50   Input ~ 0
GND
Text GLabel 2900 2050 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2900 2150 0    50   Input ~ 0
I2C_SCL
Text GLabel 2900 2350 0    50   Input ~ 0
I2C_SDA
Text GLabel 2900 2750 0    50   Input ~ 0
VCC_LOGIC
Wire Wire Line
	3100 2750 3000 2750
Wire Wire Line
	3100 2950 3000 2950
Wire Wire Line
	3000 2950 3000 2750
Connection ~ 3000 2750
Wire Wire Line
	3000 2750 2900 2750
Wire Wire Line
	3100 2350 2900 2350
Wire Wire Line
	3100 2150 2900 2150
Wire Wire Line
	3100 2050 2900 2050
Wire Wire Line
	3100 1950 2900 1950
Wire Wire Line
	3100 1050 2900 1050
Wire Wire Line
	3100 1250 3000 1250
Wire Wire Line
	3100 1350 3000 1350
Wire Wire Line
	3000 1350 3000 1250
Connection ~ 3000 1250
Wire Wire Line
	3000 1250 2900 1250
Wire Wire Line
	3100 1550 2900 1550
Text GLabel 5100 1050 2    50   Input ~ 0
ADC_DRDY
Text GLabel 5100 1450 2    50   Input ~ 0
GND
Wire Wire Line
	5100 1050 4900 1050
Wire Wire Line
	5100 1450 5000 1450
Wire Wire Line
	4900 1550 5000 1550
Wire Wire Line
	5000 1550 5000 1450
Connection ~ 5000 1450
Wire Wire Line
	5000 1450 4900 1450
Text GLabel 1350 3900 2    50   Input ~ 0
THERM_TEST1
Text GLabel 1300 2150 2    50   Input ~ 0
ADC_DRDY
Text GLabel 1300 2250 2    50   Input ~ 0
I2C_SCL
Text GLabel 1300 2350 2    50   Input ~ 0
I2C_SDA
Text GLabel 1300 2450 2    50   Input ~ 0
THERM_WELL
Text GLabel 2900 4850 0    50   Input ~ 0
PD_REF_PWM
Text HLabel 2900 4750 0    50   Input ~ 0
AMP_OUT
Text HLabel 5250 4250 2    50   Input ~ 0
PHOTO_OUT_P
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 5F591AD7
P 9850 5050
F 0 "J3" H 9958 5431 50  0000 C CNN
F 1 "Conn_01x05_Male" H 9958 5340 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 9850 5050 50  0001 C CNN
F 3 "~" H 9850 5050 50  0001 C CNN
	1    9850 5050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J4
U 1 1 5F59281D
P 9850 5750
F 0 "J4" H 9958 6131 50  0000 C CNN
F 1 "Conn_01x05_Male" H 9958 6040 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 9850 5750 50  0001 C CNN
F 3 "~" H 9850 5750 50  0001 C CNN
	1    9850 5750
	1    0    0    -1  
$EndComp
Text GLabel 8800 4850 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 8800 5350 0    50   Input ~ 0
GND
$Comp
L Device:C C5
U 1 1 5F5B161D
P 8950 5100
F 0 "C5" H 9065 5146 50  0000 L CNN
F 1 "0.1uF" H 9065 5055 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8988 4950 50  0001 C CNN
F 3 "~" H 8950 5100 50  0001 C CNN
	1    8950 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5350 8950 5350
Wire Wire Line
	8950 5350 8950 5250
Wire Wire Line
	8950 4950 8950 4850
Wire Wire Line
	8950 4850 8800 4850
Wire Wire Line
	2900 4750 3100 4750
Wire Wire Line
	5250 4250 5100 4250
Wire Wire Line
	2900 4850 3100 4850
$Comp
L Ninja-qPCR:ADA2200ARUZ U1
U 1 1 5F7FB45A
P 3100 4250
F 0 "U1" H 4100 4737 60  0000 C CNN
F 1 "ADA2200ARUZ" H 4100 4631 60  0000 C CNN
F 2 "RU_16_ADI" H 4100 4590 60  0001 C CNN
F 3 "" H 3100 4250 60  0000 C CNN
	1    3100 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FDD9D62
P 2750 4250
F 0 "R1" V 2543 4250 50  0000 C CNN
F 1 "10K" V 2634 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2680 4250 50  0001 C CNN
F 3 "~" H 2750 4250 50  0001 C CNN
	1    2750 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5FDDE2F4
P 2750 4450
F 0 "R2" V 2543 4450 50  0000 C CNN
F 1 "10K" V 2634 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2680 4450 50  0001 C CNN
F 3 "~" H 2750 4450 50  0001 C CNN
	1    2750 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 4950 1750 4950
Wire Wire Line
	3100 4250 2900 4250
Wire Wire Line
	2900 4450 3100 4450
Text GLabel 2500 4250 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	2500 4250 2600 4250
Text GLabel 1750 4950 0    50   Input ~ 0
DEMOD_SPI_SCLK
Text HLabel 9450 3200 2    50   Input ~ 0
AMP_OUT
$Comp
L Device:R R7
U 1 1 5FDF4248
P 7000 850
F 0 "R7" V 6793 850 50  0000 C CNN
F 1 "R" V 6884 850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 6930 850 50  0001 C CNN
F 3 "~" H 7000 850 50  0001 C CNN
	1    7000 850 
	0    1    -1   0   
$EndComp
Wire Wire Line
	7150 850  7300 850 
Connection ~ 8950 3200
Wire Wire Line
	8950 3200 9450 3200
Wire Wire Line
	6850 850  6700 850 
Wire Wire Line
	1300 1150 1150 1150
Wire Wire Line
	1150 1250 1300 1250
Wire Wire Line
	1300 1450 1150 1450
Wire Wire Line
	1150 1550 1300 1550
Wire Wire Line
	1300 1650 1150 1650
Wire Wire Line
	1150 1750 1300 1750
Wire Wire Line
	1300 1850 1150 1850
Wire Wire Line
	1150 1950 1300 1950
Wire Wire Line
	1300 2050 1150 2050
Wire Wire Line
	1150 2150 1300 2150
Wire Wire Line
	1300 2250 1150 2250
Wire Wire Line
	1150 2350 1300 2350
Wire Wire Line
	1300 2450 1150 2450
Wire Wire Line
	3100 4350 2600 4350
Wire Wire Line
	3100 5050 2900 5050
Text GLabel 2600 4350 0    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 2900 5050 0    50   Input ~ 0
DEMOD_SPI_SDIO
Wire Wire Line
	1300 1350 1150 1350
Wire Wire Line
	3100 5150 2900 5150
NoConn ~ 2900 5150
$Comp
L Device:C C1
U 1 1 5FDB9DB9
P 1800 5250
F 0 "C1" V 1548 5250 50  0000 C CNN
F 1 "1uF" V 1639 5250 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1838 5100 50  0001 C CNN
F 3 "~" H 1800 5250 50  0001 C CNN
	1    1800 5250
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 5FDD2096
P 7000 1200
F 0 "C6" V 6748 1200 50  0000 C CNN
F 1 "22pF" V 6839 1200 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7038 1050 50  0001 C CNN
F 3 "~" H 7000 1200 50  0001 C CNN
	1    7000 1200
	0    1    -1   0   
$EndComp
Wire Wire Line
	7150 1200 7300 1200
Wire Wire Line
	7300 1200 7300 850 
Wire Wire Line
	6850 1200 6700 1200
Wire Wire Line
	6700 1200 6700 850 
$Comp
L Device:C C7
U 1 1 5FDE1D78
P 9250 3350
F 0 "C7" V 8998 3350 50  0000 C CNN
F 1 "0.1uF" V 9089 3350 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9288 3200 50  0001 C CNN
F 3 "~" H 9250 3350 50  0001 C CNN
	1    9250 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 3350 8950 3350
Wire Wire Line
	8950 3350 8950 3200
Text GLabel 9500 3350 2    50   Input ~ 0
GND
Wire Wire Line
	9500 3350 9400 3350
$Comp
L Connector:Conn_01x14_Male J1
U 1 1 5FDCE564
P 950 1750
F 0 "J1" H 1058 2531 50  0000 C CNN
F 1 "Conn_01x14_Male" H 1058 2440 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x14_Pitch2.54mm" H 950 1750 50  0001 C CNN
F 3 "~" H 950 1750 50  0001 C CNN
	1    950  1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male JSPI1
U 1 1 5FDD1B56
P 3700 6800
F 0 "JSPI1" H 3808 7081 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3808 6990 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x02_Pitch2.54mm" H 3700 6800 50  0001 C CNN
F 3 "~" H 3700 6800 50  0001 C CNN
	1    3700 6800
	1    0    0    -1  
$EndComp
Text GLabel 4150 7000 2    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 4150 6700 2    50   Input ~ 0
GND
Text GLabel 4150 6900 2    50   Input ~ 0
DEMOD_SPI_SDIO
Text GLabel 4150 6800 2    50   Input ~ 0
DEMOD_SPI_SCLK
Wire Wire Line
	4150 6700 3900 6700
Wire Wire Line
	3900 6800 4150 6800
Wire Wire Line
	4150 6900 3900 6900
Wire Wire Line
	3900 7000 4150 7000
NoConn ~ 1300 1250
NoConn ~ 1300 1350
Text GLabel 1300 2050 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 6150 3300 0    50   Input ~ 0
PD_MUX_OUT
$Comp
L Device:R R6
U 1 1 5FE329AB
P 7000 1800
F 0 "R6" V 6793 1800 50  0000 C CNN
F 1 "R" V 6884 1800 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 6930 1800 50  0001 C CNN
F 3 "~" H 7000 1800 50  0001 C CNN
	1    7000 1800
	0    -1   1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5FE329B3
P 7000 2150
F 0 "C4" V 6748 2150 50  0000 C CNN
F 1 "22pF" V 6839 2150 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7038 2000 50  0001 C CNN
F 3 "~" H 7000 2150 50  0001 C CNN
	1    7000 2150
	0    1    -1   0   
$EndComp
Wire Wire Line
	7150 2150 7300 2150
Wire Wire Line
	7300 2150 7300 1800
Wire Wire Line
	6850 2150 6700 2150
Wire Wire Line
	6700 2150 6700 1800
Text Label 9300 1600 0    50   ~ 0
AMP_GAIN_SW
Text Label 1350 3800 0    50   ~ 0
AMP_GAIN_SW
Text Notes 6700 2600 0    50   ~ 0
SMALL GAIN FOR\nSTRONG SIGNAL
Wire Wire Line
	7300 1800 7150 1800
Wire Wire Line
	6700 1800 6850 1800
$Comp
L Ninja-qPCR:AD8605ARTZ-R2 U?
U 1 1 606B7AFD
P 8600 3200
F 0 "U?" H 9400 3587 60  0000 C CNN
F 1 "AD8605ARTZ-R2" H 9400 3481 60  0000 C CNN
F 2 "RJ_5_ADI" H 9400 3440 60  0001 C CNN
F 3 "" H 8600 3200 60  0000 C CNN
	1    8600 3200
	-1   0    0    -1  
$EndComp
Text GLabel 1350 3500 2    50   Input ~ 0
PHOTO_GND
Text GLabel 1350 3600 2    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	5100 4350 5650 4350
Text GLabel 5650 4350 2    50   Input ~ 0
XOUT
Text GLabel 2500 6850 2    50   Input ~ 0
XOUT
Text GLabel 2500 4550 0    50   Input ~ 0
CLKIN
Wire Wire Line
	2500 4550 3100 4550
Text GLabel 2500 6750 2    50   Input ~ 0
CLKIN
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 606F1692
P 2100 6750
F 0 "J?" H 2208 6931 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2208 6840 50  0000 C CNN
F 2 "" H 2100 6750 50  0001 C CNN
F 3 "~" H 2100 6750 50  0001 C CNN
	1    2100 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6750 2500 6750
Wire Wire Line
	2500 6850 2300 6850
Text GLabel 8800 3500 3    50   Input ~ 0
PHOTO_GND
Text GLabel 6850 3200 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	8600 3200 8950 3200
Wire Wire Line
	8600 3300 8800 3300
Wire Wire Line
	8800 3300 8800 3500
Wire Wire Line
	7000 3200 6850 3200
Text GLabel 6850 3400 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	6850 3400 7000 3400
Wire Wire Line
	6300 3300 7000 3300
Text GLabel 9200 1400 2    50   Input ~ 0
PHOTO_3V3
Text GLabel 1350 3700 2    50   Input ~ 0
-1V
Text GLabel 7550 2200 3    50   Input ~ 0
-1V
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 6074D106
P 9850 6250
F 0 "J?" H 9958 6431 50  0000 C CNN
F 1 "Conn_01x01_Male" H 9958 6340 50  0000 C CNN
F 2 "" H 9850 6250 50  0001 C CNN
F 3 "~" H 9850 6250 50  0001 C CNN
	1    9850 6250
	1    0    0    -1  
$EndComp
Text GLabel 10250 6250 2    50   Input ~ 0
-1V
Wire Wire Line
	10250 6250 10050 6250
$Comp
L Device:R R?
U 1 1 606BE3B5
P 9300 1800
F 0 "R?" V 9093 1800 50  0000 C CNN
F 1 "R" V 9184 1800 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 9230 1800 50  0001 C CNN
F 3 "~" H 9300 1800 50  0001 C CNN
	1    9300 1800
	0    -1   -1   0   
$EndComp
Text GLabel 9550 1800 2    50   Input ~ 0
-1V
Wire Wire Line
	6150 3300 6300 3300
Connection ~ 6300 3300
Text Notes 6350 4150 0    50   ~ 0
Debug pins
Text GLabel 7200 4950 2    50   Input ~ 0
PD_MUX_OUT
Text HLabel 7200 5200 2    50   Input ~ 0
AMP_OUT
Text HLabel 5250 4150 2    50   Input ~ 0
PHOTO_OUT_N
Wire Wire Line
	5250 4150 5100 4150
Text HLabel 7200 4700 2    50   Input ~ 0
PHOTO_OUT_N
Text HLabel 7200 4450 2    50   Input ~ 0
PHOTO_OUT_P
Text HLabel 2900 1750 0    50   Input ~ 0
PHOTO_OUT_P
Text HLabel 2900 1650 0    50   Input ~ 0
PHOTO_OUT_N
Wire Wire Line
	2900 1650 3100 1650
Wire Wire Line
	3100 1750 2900 1750
Text GLabel 2900 1450 0    50   Input ~ 0
THERM_TEST1
Wire Wire Line
	2900 1450 3100 1450
$Comp
L Ninja-qPCR:TS5A9411DCKR U?
U 1 1 606C0A32
P 8300 1700
F 0 "U?" H 8300 2388 60  0000 C CNN
F 1 "TS5A9411DCKR" H 8300 2282 60  0000 C CNN
F 2 "DCK0006A_N" H 8300 1640 60  0001 C CNN
F 3 "" H 8300 1700 60  0000 C CNN
	1    8300 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7700 2000 7550 2000
Wire Wire Line
	7550 2000 7550 2200
Wire Wire Line
	7700 1800 7300 1800
Connection ~ 7300 1800
Wire Wire Line
	9200 1400 8900 1400
Wire Wire Line
	6700 1800 6300 1800
Connection ~ 6700 1800
Wire Wire Line
	6300 1800 6300 3300
Wire Wire Line
	7700 1600 7300 1600
Wire Wire Line
	7300 1600 7300 1200
Connection ~ 7300 1200
Wire Wire Line
	6700 1200 6300 1200
Wire Wire Line
	6300 1200 6300 1800
Connection ~ 6700 1200
Connection ~ 6300 1800
Wire Wire Line
	9050 1600 9050 1800
Wire Wire Line
	9050 1800 9150 1800
Wire Wire Line
	9050 1600 9300 1600
Wire Wire Line
	9550 1800 9450 1800
Text GLabel 5250 4750 2    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	5250 4750 5100 4750
Text GLabel 2500 4450 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	2500 4450 2600 4450
Text GLabel 2900 5550 0    50   Input ~ 0
PHOTO_3V3
Wire Wire Line
	2900 5550 3100 5550
Text GLabel 1500 5250 0    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	1500 5250 1650 5250
Wire Wire Line
	1950 5250 3100 5250
Text GLabel 2900 4650 0    50   Input ~ 0
PHOTO_GND
Wire Wire Line
	2900 4650 3100 4650
Wire Wire Line
	8950 3200 8950 1800
Wire Wire Line
	8950 1800 8900 1800
Wire Wire Line
	9050 1600 8900 1600
Connection ~ 9050 1600
Text Notes 8850 1200 0    50   ~ 0
IN=High : COM<->NO (Low gain)\nIN=Low : COM<->NC (High gain)
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 607C2091
P 950 3700
F 0 "J?" H 1058 4081 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1058 3990 50  0000 C CNN
F 2 "" H 950 3700 50  0001 C CNN
F 3 "~" H 950 3700 50  0001 C CNN
	1    950  3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3900 1350 3900
Wire Wire Line
	1350 3500 1150 3500
Wire Wire Line
	1150 3600 1350 3600
Wire Wire Line
	1350 3700 1150 3700
Wire Wire Line
	1150 3800 1350 3800
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 607F0249
P 6550 4450
F 0 "J?" H 6658 4631 50  0000 C CNN
F 1 "Conn_01x01_Male" H 6658 4540 50  0000 C CNN
F 2 "" H 6550 4450 50  0001 C CNN
F 3 "~" H 6550 4450 50  0001 C CNN
	1    6550 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4450 6750 4450
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 607F79E2
P 6550 4700
F 0 "J?" H 6658 4881 50  0000 C CNN
F 1 "Conn_01x01_Male" H 6658 4790 50  0000 C CNN
F 2 "" H 6550 4700 50  0001 C CNN
F 3 "~" H 6550 4700 50  0001 C CNN
	1    6550 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 608062B7
P 6550 4950
F 0 "J?" H 6658 5131 50  0000 C CNN
F 1 "Conn_01x01_Male" H 6658 5040 50  0000 C CNN
F 2 "" H 6550 4950 50  0001 C CNN
F 3 "~" H 6550 4950 50  0001 C CNN
	1    6550 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 60806962
P 6550 5200
F 0 "J?" H 6658 5381 50  0000 C CNN
F 1 "Conn_01x01_Male" H 6658 5290 50  0000 C CNN
F 2 "" H 6550 5200 50  0001 C CNN
F 3 "~" H 6550 5200 50  0001 C CNN
	1    6550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4700 6750 4700
Wire Wire Line
	7200 5200 6750 5200
Wire Wire Line
	7200 4950 6750 4950
Text Notes 3500 6400 0    50   ~ 0
ADA2200 Debug
Text Notes 1900 6500 0    50   ~ 0
ADA2200 Clock
Text Notes 750  900  0    50   ~ 0
Main <-> Photosensing
$EndSCHEMATC
