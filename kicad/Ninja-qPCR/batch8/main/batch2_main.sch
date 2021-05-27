EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 9300 4800 0    50   Input ~ 0
GND
Wire Wire Line
	9300 4800 9500 4800
Wire Wire Line
	9500 4900 9300 4900
Wire Wire Line
	9300 5000 9500 5000
Wire Wire Line
	9500 5100 9300 5100
Wire Wire Line
	9300 5200 9500 5200
Wire Wire Line
	9500 5300 9300 5300
Wire Wire Line
	9300 5400 9500 5400
Wire Wire Line
	9500 5500 9300 5500
Wire Wire Line
	9300 5600 9500 5600
$Comp
L Ninja-qPCR:Conn_02x05 LED?
U 1 1 60B01251
P 9550 3500
AR Path="/60B01251" Ref="LED?"  Part="1" 
AR Path="/5F708CA1/60B01251" Ref="LED?"  Part="1" 
AR Path="/60AEA148/60B01251" Ref="LED?"  Part="1" 
F 0 "LED?" H 9950 3200 50  0000 C CNN
F 1 "Conn_02x05" H 10150 3100 50  0000 C CNN
F 2 "Ninja-qPCR:Con_2x05" H 9350 3600 50  0001 C CNN
F 3 "" H 9350 3600 50  0001 C CNN
	1    9550 3500
	1    0    0    -1  
$EndComp
Text GLabel 9100 3700 0    50   Input ~ 0
GND
Text GLabel 9100 3800 0    50   Input ~ 0
PD_REF_PWM
Text GLabel 9100 3900 0    50   Input ~ 0
LED_LAT
Text GLabel 9100 4100 0    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 9100 4200 0    50   Input ~ 0
SPI_MISO
Text GLabel 9100 4300 0    50   Input ~ 0
I2C_SCL
Text GLabel 9100 4400 0    50   Input ~ 0
I2C_SDA
Wire Wire Line
	9100 4400 9350 4400
Wire Wire Line
	9100 4300 9350 4300
Wire Wire Line
	9100 4200 9350 4200
Wire Wire Line
	9100 4100 9350 4100
Wire Wire Line
	9100 4000 9350 4000
Wire Wire Line
	9100 3900 9350 3900
Wire Wire Line
	9100 3800 9350 3800
Wire Wire Line
	9100 3700 9350 3700
Wire Wire Line
	9100 3600 9350 3600
Wire Wire Line
	9100 3500 9350 3500
Text GLabel 9300 5200 0    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 9300 5300 0    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 9300 5500 0    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 9300 5400 0    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 9300 5600 0    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 9300 5700 0    50   Input ~ 0
PD_REF_PWM
Text GLabel 9300 5800 0    50   Input ~ 0
ADC_DRDY
Text GLabel 9300 5900 0    50   Input ~ 0
I2C_SCL
Text GLabel 9300 6000 0    50   Input ~ 0
I2C_SDA
Wire Wire Line
	9500 5700 9300 5700
Wire Wire Line
	9500 5800 9300 5800
Wire Wire Line
	9500 5900 9300 5900
Wire Wire Line
	9500 6000 9300 6000
Text GLabel 9300 6100 0    50   Input ~ 0
THERM_WELL
Wire Wire Line
	9300 6100 9500 6100
$Comp
L Ninja-qPCR:Conn_02x05 BODY?
U 1 1 60B01277
P 9550 1050
AR Path="/5F58C19F/60B01277" Ref="BODY?"  Part="1" 
AR Path="/60B01277" Ref="BODY?"  Part="1" 
AR Path="/5F708CA1/60B01277" Ref="BODY?"  Part="1" 
AR Path="/60AEA148/60B01277" Ref="BODY?"  Part="1" 
F 0 "BODY?" H 9869 661 50  0000 L CNN
F 1 "Conn_02x05" H 9869 570 50  0000 L CNN
F 2 "Ninja-qPCR:Con_2x05" H 9350 1150 50  0001 C CNN
F 3 "" H 9350 1150 50  0001 C CNN
	1    9550 1050
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_02x05 LID_2X?
U 1 1 60B0127D
P 9550 2250
AR Path="/5F58C19F/60B0127D" Ref="LID_2X?"  Part="1" 
AR Path="/60B0127D" Ref="LID_2X?"  Part="1" 
AR Path="/5F708CA1/60B0127D" Ref="LID_2X?"  Part="1" 
AR Path="/60AEA148/60B0127D" Ref="LID_2X?"  Part="1" 
F 0 "LID_2X?" H 9869 1861 50  0000 L CNN
F 1 "Conn_02x05" H 9869 1770 50  0000 L CNN
F 2 "Ninja-qPCR:Con_2x05" H 9350 2350 50  0001 C CNN
F 3 "" H 9350 2350 50  0001 C CNN
	1    9550 2250
	1    0    0    -1  
$EndComp
Text GLabel 9200 1150 0    50   Input ~ 0
BODY_HEATER1B
Text GLabel 9200 1250 0    50   Input ~ 0
THERM_WELL
Text GLabel 9200 1350 0    50   Input ~ 0
FAN_BLACK_GND1
Text GLabel 9200 1550 0    50   Input ~ 0
GND
Text GLabel 9200 1650 0    50   Input ~ 0
FAN_BLACK_GND2
Text GLabel 9200 1750 0    50   Input ~ 0
THERM_EXT3
Text GLabel 9200 1950 0    50   Input ~ 0
BODY_HEATER2B
Wire Wire Line
	9350 1050 9200 1050
Wire Wire Line
	9200 1150 9350 1150
Wire Wire Line
	9350 1250 9200 1250
Wire Wire Line
	9200 1350 9350 1350
Wire Wire Line
	9350 1450 9200 1450
Wire Wire Line
	9200 1550 9350 1550
Wire Wire Line
	9350 1650 9200 1650
Wire Wire Line
	9200 1750 9350 1750
Wire Wire Line
	9350 1850 9200 1850
Wire Wire Line
	9200 1950 9350 1950
Text GLabel 9200 2350 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 9200 3150 0    50   Input ~ 0
LID_HEATER2B
Text GLabel 9200 2450 0    50   Input ~ 0
THERM_AIR
Text GLabel 9200 2550 0    50   Input ~ 0
THERM_EXT1
Text GLabel 9200 2650 0    50   Input ~ 0
THERM_LID1
Text GLabel 9200 2750 0    50   Input ~ 0
GND
Text GLabel 9200 2850 0    50   Input ~ 0
THERM_LID2
Text GLabel 9200 2950 0    50   Input ~ 0
THERM_EXT2
Wire Wire Line
	9350 2250 9200 2250
Wire Wire Line
	9200 2350 9350 2350
Wire Wire Line
	9350 2450 9200 2450
Wire Wire Line
	9200 2550 9350 2550
Wire Wire Line
	9350 2650 9200 2650
Wire Wire Line
	9200 2750 9350 2750
Wire Wire Line
	9350 2850 9200 2850
Wire Wire Line
	9200 2950 9350 2950
Wire Wire Line
	9350 3050 9200 3050
Wire Wire Line
	9200 3150 9350 3150
$Comp
L Connector:Conn_01x14_Male PHOTO?
U 1 1 60B012A6
P 9700 5400
F 0 "PHOTO?" H 9550 5400 50  0000 R CNN
F 1 "Conn_01x14_Male" H 9550 5300 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x14_Pitch2.54mm" H 9700 5400 50  0001 C CNN
F 3 "~" H 9700 5400 50  0001 C CNN
	1    9700 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7450 3450 7300 3450
Wire Wire Line
	7450 3350 7300 3350
Wire Wire Line
	7450 3250 7300 3250
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 60B012AF
P 7100 3350
F 0 "J?" H 7208 3631 50  0000 C CNN
F 1 "Conn_01x03_Male" H 7208 3540 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7100 3350 50  0001 C CNN
F 3 "~" H 7100 3350 50  0001 C CNN
	1    7100 3350
	1    0    0    -1  
$EndComp
Text GLabel 7450 3350 2    50   Input ~ 0
THERM_EXT2
Text GLabel 7450 3250 2    50   Input ~ 0
THERM_EXT1
Text GLabel 7450 3450 2    50   Input ~ 0
THERM_EXT3
Wire Wire Line
	7250 2000 7250 1700
Connection ~ 7250 2000
Wire Wire Line
	7350 2000 7250 2000
Wire Wire Line
	7250 2300 7250 2000
Connection ~ 7250 2300
Wire Wire Line
	7350 2300 7250 2300
Wire Wire Line
	7250 2600 7250 2300
Connection ~ 7250 2600
Wire Wire Line
	7350 2600 7250 2600
Wire Wire Line
	7250 1700 7250 1400
Connection ~ 7250 1700
Wire Wire Line
	7350 1700 7250 1700
Wire Wire Line
	7250 1400 7250 1100
Connection ~ 7250 1400
Wire Wire Line
	7350 1400 7250 1400
Wire Wire Line
	7250 1100 7350 1100
Connection ~ 7250 1100
Wire Wire Line
	7250 2900 7250 2600
Wire Wire Line
	7350 2900 7250 2900
Wire Wire Line
	7650 2900 7800 2900
Wire Wire Line
	7650 2600 7800 2600
Wire Wire Line
	7650 2300 7800 2300
Wire Wire Line
	7650 2000 7800 2000
Wire Wire Line
	7650 1700 7800 1700
Wire Wire Line
	7650 1400 7800 1400
$Comp
L Device:R R?
U 1 1 60B012D1
P 7500 2900
AR Path="/5F58C19F/60B012D1" Ref="R?"  Part="1" 
AR Path="/60B012D1" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60B012D1" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B012D1" Ref="R?"  Part="1" 
F 0 "R?" V 7293 2900 50  0000 C CNN
F 1 "15kHP" V 7384 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7430 2900 50  0001 C CNN
F 3 "~" H 7500 2900 50  0001 C CNN
	1    7500 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B012D7
P 7500 2600
AR Path="/5F58C19F/60B012D7" Ref="R?"  Part="1" 
AR Path="/60B012D7" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60B012D7" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B012D7" Ref="R?"  Part="1" 
F 0 "R?" V 7293 2600 50  0000 C CNN
F 1 "15kHP" V 7384 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7430 2600 50  0001 C CNN
F 3 "~" H 7500 2600 50  0001 C CNN
	1    7500 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B012DD
P 7500 2300
AR Path="/5F58C19F/60B012DD" Ref="R?"  Part="1" 
AR Path="/60B012DD" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60B012DD" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B012DD" Ref="R?"  Part="1" 
F 0 "R?" V 7293 2300 50  0000 C CNN
F 1 "15kHP" V 7384 2300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7430 2300 50  0001 C CNN
F 3 "~" H 7500 2300 50  0001 C CNN
	1    7500 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B012E3
P 7500 2000
AR Path="/5F58C19F/60B012E3" Ref="R?"  Part="1" 
AR Path="/60B012E3" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60B012E3" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B012E3" Ref="R?"  Part="1" 
F 0 "R?" V 7293 2000 50  0000 C CNN
F 1 "4.99kHP" V 7384 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7430 2000 50  0001 C CNN
F 3 "~" H 7500 2000 50  0001 C CNN
	1    7500 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B012E9
P 7500 1700
AR Path="/5F58C19F/60B012E9" Ref="R?"  Part="1" 
AR Path="/60B012E9" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60B012E9" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B012E9" Ref="R?"  Part="1" 
F 0 "R?" V 7293 1700 50  0000 C CNN
F 1 "4.99kHP" V 7384 1700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7430 1700 50  0001 C CNN
F 3 "~" H 7500 1700 50  0001 C CNN
	1    7500 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B012EF
P 7500 1400
AR Path="/5F58C19F/60B012EF" Ref="R?"  Part="1" 
AR Path="/60B012EF" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60B012EF" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B012EF" Ref="R?"  Part="1" 
F 0 "R?" V 7293 1400 50  0000 C CNN
F 1 "15kHP" V 7384 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7430 1400 50  0001 C CNN
F 3 "~" H 7500 1400 50  0001 C CNN
	1    7500 1400
	0    1    1    0   
$EndComp
Text GLabel 7800 2600 2    50   Input ~ 0
THERM_EXT2
Text GLabel 7800 2300 2    50   Input ~ 0
THERM_EXT1
Text GLabel 7800 2000 2    50   Input ~ 0
THERM_LID2
Text GLabel 7800 1700 2    50   Input ~ 0
THERM_LID1
Text GLabel 7800 1400 2    50   Input ~ 0
THERM_AIR
Text GLabel 7800 2900 2    50   Input ~ 0
THERM_EXT3
Wire Wire Line
	7650 1100 7800 1100
Wire Wire Line
	7200 1100 7250 1100
Text GLabel 7800 1100 2    50   Input ~ 0
THERM_WELL
$Comp
L Device:R R?
U 1 1 60B012FE
P 7500 1100
AR Path="/5F58C19F/60B012FE" Ref="R?"  Part="1" 
AR Path="/60B012FE" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60B012FE" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B012FE" Ref="R?"  Part="1" 
F 0 "R?" V 7293 1100 50  0000 C CNN
F 1 "15kHP" V 7384 1100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7430 1100 50  0001 C CNN
F 3 "~" H 7500 1100 50  0001 C CNN
	1    7500 1100
	0    1    1    0   
$EndComp
Text GLabel 7550 3800 2    50   Input ~ 0
GPIO7
Text GLabel 7550 4050 2    50   Input ~ 0
GPIO25
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 60B01306
P 7100 3800
F 0 "J?" H 7208 3981 50  0000 C CNN
F 1 "Conn_01x01_Male" H 7208 3890 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 7100 3800 50  0001 C CNN
F 3 "~" H 7100 3800 50  0001 C CNN
	1    7100 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 60B0130C
P 7100 4050
F 0 "J?" H 7208 4231 50  0000 C CNN
F 1 "Conn_01x01_Male" H 7208 4140 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 7100 4050 50  0001 C CNN
F 3 "~" H 7100 4050 50  0001 C CNN
	1    7100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3800 7300 3800
Wire Wire Line
	7550 4050 7300 4050
Text GLabel 9100 4000 0    50   Input ~ 0
SPI_SCLK
Text HLabel 7100 5600 0    50   Input ~ 0
3V3_RASP
Text HLabel 7100 6200 0    50   Input ~ 0
3V3_RASP
Text HLabel 7950 5500 2    50   Input ~ 0
VCC_LOGIC_LED
Text HLabel 7950 6100 2    50   Input ~ 0
VCC_LOGIC_PHOTO
Text HLabel 9300 5100 0    50   Input ~ 0
VCC_LOGIC_PHOTO
Text HLabel 9100 3600 0    50   Input ~ 0
VCC_LOGIC_LED
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 60B0131B
P 7450 5500
F 0 "J?" H 7500 5817 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7500 5726 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7450 5500 50  0001 C CNN
F 3 "~" H 7450 5500 50  0001 C CNN
	1    7450 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 60B01321
P 7450 6100
F 0 "J?" H 7500 6417 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7500 6326 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7450 6100 50  0001 C CNN
F 3 "~" H 7450 6100 50  0001 C CNN
	1    7450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5400 7850 5400
Wire Wire Line
	7850 5400 7850 5500
Wire Wire Line
	7850 5600 7750 5600
Wire Wire Line
	7750 5500 7850 5500
Connection ~ 7850 5500
Wire Wire Line
	7850 5500 7850 5600
Wire Wire Line
	7950 5500 7850 5500
Wire Wire Line
	7750 6000 7850 6000
Wire Wire Line
	7850 6000 7850 6100
Wire Wire Line
	7850 6200 7750 6200
Wire Wire Line
	7750 6100 7850 6100
Connection ~ 7850 6100
Wire Wire Line
	7850 6100 7850 6200
Wire Wire Line
	7850 6100 7950 6100
Wire Wire Line
	7250 6000 7100 6000
Wire Wire Line
	7250 6100 7100 6100
Wire Wire Line
	7250 6200 7100 6200
Wire Wire Line
	7250 5600 7100 5600
Wire Wire Line
	7250 5500 7100 5500
Wire Wire Line
	7250 5400 7100 5400
Text HLabel 7200 1100 0    50   Input ~ 0
VCC_THERM
Text HLabel 7950 4950 2    50   Input ~ 0
VCC_THERM
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 60B0133D
P 7450 4950
F 0 "J?" H 7500 5267 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7500 5176 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7450 4950 50  0001 C CNN
F 3 "~" H 7450 4950 50  0001 C CNN
	1    7450 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4850 7850 4850
Wire Wire Line
	7850 4850 7850 4950
Wire Wire Line
	7850 5050 7750 5050
Wire Wire Line
	7750 4950 7850 4950
Connection ~ 7850 4950
Wire Wire Line
	7850 4950 7850 5050
Wire Wire Line
	7950 4950 7850 4950
Text HLabel 7100 5050 0    50   Input ~ 0
3V3_RASP
Wire Wire Line
	7250 5050 7100 5050
Wire Wire Line
	7250 4950 7100 4950
Wire Wire Line
	7250 4850 7100 4850
Text GLabel 9100 3500 0    50   Input ~ 0
5V
Text GLabel 9300 4900 0    50   Input ~ 0
+10V
Text GLabel 9300 5000 0    50   Input ~ 0
-10V
Text GLabel 7100 4850 0    50   Input ~ 0
3V3_SENSE
Text GLabel 7100 4950 0    50   Input ~ 0
3V3_REG
Text GLabel 7100 5400 0    50   Input ~ 0
3V3_SENSE
Text GLabel 7100 5500 0    50   Input ~ 0
3V3_REG
Text GLabel 7100 6000 0    50   Input ~ 0
3V3_SENSE
Text GLabel 7100 6100 0    50   Input ~ 0
3V3_REG
Text GLabel 9200 1050 0    50   Input ~ 0
12V
Text GLabel 9200 1450 0    50   Input ~ 0
12V
Text GLabel 9200 1850 0    50   Input ~ 0
12V
Text GLabel 9200 2250 0    50   Input ~ 0
12V
Text GLabel 9200 3050 0    50   Input ~ 0
12V
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J?
U 1 1 60B0DE19
P 2350 2000
AR Path="/60B0DE19" Ref="J?"  Part="1" 
AR Path="/60AEA148/60B0DE19" Ref="J?"  Part="1" 
F 0 "J?" H 2350 3215 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 2350 3124 50  0000 C CNN
F 2 "Ninja-qPCR:Raspberry_Pi_3A+_Socketed_THT_FaceDown_MountingHoles" H 1900 950 50  0001 C CNN
F 3 "" H 1900 950 50  0001 C CNN
	1    2350 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1050 1650 1050
Wire Wire Line
	1500 1850 1650 1850
Text GLabel 1500 2250 0    50   Input ~ 0
GND
Wire Wire Line
	1500 2250 1650 2250
Text GLabel 1500 2950 0    50   Input ~ 0
GND
Wire Wire Line
	1500 2950 1650 2950
Text GLabel 3200 1250 2    50   Input ~ 0
GND
Text GLabel 3200 2450 2    50   Input ~ 0
GND
Text GLabel 3200 1950 2    50   Input ~ 0
GND
Text GLabel 3200 2650 2    50   Input ~ 0
GND
Wire Wire Line
	3200 2650 3050 2650
Wire Wire Line
	3200 1950 3050 1950
Wire Wire Line
	3200 1650 3050 1650
Wire Wire Line
	3050 1250 3200 1250
Text HLabel 1500 1650 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	1500 1650 1650 1650
Text GLabel 1500 1350 0    50   Input ~ 0
GPIO7
Text GLabel 1500 2150 0    50   Input ~ 0
SPI_SCLK
Text GLabel 1500 1950 0    50   Input ~ 0
SPI_MOSI
Text GLabel 3200 1750 2    50   Input ~ 0
PD_MUX_GPIO2?
Text GLabel 1500 1250 0    50   Input ~ 0
I2C_SCL
Text GLabel 1500 1150 0    50   Input ~ 0
I2C_SDA
Text GLabel 1500 1750 0    50   Input ~ 0
LED_LAT
Text GLabel 1500 2050 0    50   Input ~ 0
SPI_MISO
Wire Wire Line
	1500 1950 1650 1950
Wire Wire Line
	1500 2050 1650 2050
Wire Wire Line
	1650 2150 1500 2150
Wire Wire Line
	1500 1150 1650 1150
Wire Wire Line
	1650 1250 1500 1250
Wire Wire Line
	1500 1350 1650 1350
Wire Wire Line
	1650 2450 1500 2450
Wire Wire Line
	3200 2750 3050 2750
Text HLabel 1500 2650 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	1500 2650 1650 2650
Wire Wire Line
	3200 1750 3050 1750
Wire Wire Line
	1650 1750 1500 1750
Wire Wire Line
	3200 2450 3050 2450
Text HLabel 3200 2150 2    50   Input ~ 0
ADC_DRDY
Wire Wire Line
	3200 2050 3050 2050
Text GLabel 3200 2550 2    50   Input ~ 0
PD_REF_PWM
Wire Wire Line
	3200 2550 3050 2550
Text GLabel 1500 2850 0    50   Input ~ 0
GPIO25
Wire Wire Line
	1500 2850 1650 2850
Text HLabel 1500 2750 0    50   Input ~ 0
LID_HEATER2
Text HLabel 1500 1550 0    50   Input ~ 0
WELL_HEATER2
Text GLabel 1500 1450 0    50   Input ~ 0
GND
Wire Wire Line
	1500 1450 1650 1450
Wire Wire Line
	1500 1550 1650 1550
Text GLabel 3200 1650 2    50   Input ~ 0
GND
NoConn ~ 1500 2350
Wire Wire Line
	1650 2350 1500 2350
NoConn ~ 3200 2350
Wire Wire Line
	3200 2350 3050 2350
Wire Wire Line
	1500 2750 1650 2750
Wire Wire Line
	3200 1850 3050 1850
Text GLabel 3200 1350 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 3200 1450 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 3200 1550 2    50   Input ~ 0
PD_MUX_GPIO3?
Wire Wire Line
	3200 1350 3050 1350
Wire Wire Line
	3050 1450 3200 1450
Wire Wire Line
	3200 1550 3050 1550
Text GLabel 3200 2050 2    50   Input ~ 0
PD_MUX_GPIO1
Wire Wire Line
	3200 2150 3050 2150
Wire Wire Line
	3050 2850 3200 2850
Wire Wire Line
	3050 2950 3200 2950
Wire Wire Line
	4350 2500 4200 2500
Wire Wire Line
	4350 2250 4300 2250
Text GLabel 4350 2250 2    50   Input ~ 0
GND
$Comp
L Device:R R?
U 1 1 60B0DE63
P 4050 2500
AR Path="/60B0DE63" Ref="R?"  Part="1" 
AR Path="/60AEA148/60B0DE63" Ref="R?"  Part="1" 
F 0 "R?" H 3980 2454 50  0000 R CNN
F 1 "10k" H 3980 2545 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3980 2500 50  0001 C CNN
F 3 "~" H 4050 2500 50  0001 C CNN
	1    4050 2500
	0    -1   1    0   
$EndComp
Wire Wire Line
	3800 2300 3800 2250
Connection ~ 3800 2250
Wire Wire Line
	4300 2300 4300 2250
Connection ~ 4300 2250
Wire Wire Line
	1650 2550 1500 2550
Text GLabel 3200 2750 2    50   Input ~ 0
THERM_AIR
Text GLabel 3200 2850 2    50   Input ~ 0
THERM_LID1
Text GLabel 3200 2950 2    50   Input ~ 0
THERM_LID2
Text GLabel 3200 1850 2    50   Input ~ 0
SPI_SWITCH
Wire Wire Line
	3050 1050 3150 1050
Wire Wire Line
	3050 1150 3150 1150
Wire Wire Line
	3150 1150 3150 1050
Connection ~ 3150 1050
Wire Wire Line
	3150 1050 3200 1050
NoConn ~ 1500 1850
Text HLabel 1500 2450 0    50   Input ~ 0
FAN1
Text HLabel 1500 2550 0    50   Input ~ 0
FAN2
Text HLabel 1500 1050 0    50   Input ~ 0
3V3_RASP
Text HLabel 4350 2500 2    50   Input ~ 0
3V3_RASP
Text GLabel 3200 1050 2    50   Input ~ 0
5V
Wire Wire Line
	3750 2500 3900 2500
Wire Wire Line
	3050 2250 3750 2250
Wire Wire Line
	3750 2250 3800 2250
Connection ~ 3750 2250
Wire Wire Line
	3750 2500 3750 2250
$Comp
L Ninja-qPCR:TACTILE_4 SW?
U 1 1 60B0DE82
P 4050 2250
AR Path="/60B0DE82" Ref="SW?"  Part="1" 
AR Path="/60AEA148/60B0DE82" Ref="SW?"  Part="1" 
F 0 "SW?" H 4244 2323 50  0000 L CNN
F 1 "TACTILE_4" H 4244 2232 50  0000 L CNN
F 2 "Ninja-qPCR:SW_TH_Tactile_Omron_B3F-10xx" H 4050 2450 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 4050 2450 50  0001 C CNN
	1    4050 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2250 4300 2250
Wire Wire Line
	4200 2300 4300 2300
Wire Wire Line
	3800 2250 3900 2250
Wire Wire Line
	3800 2300 3900 2300
$Comp
L Device:R R?
U 1 1 60B244D9
P 2150 4750
AR Path="/60B244D9" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B244D9" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B244D9" Ref="R?"  Part="1" 
F 0 "R?" V 1943 4750 50  0000 C CNN
F 1 "10k" V 2034 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2080 4750 50  0001 C CNN
F 3 "~" H 2150 4750 50  0001 C CNN
	1    2150 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B244DF
P 1700 4500
AR Path="/60B244DF" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B244DF" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B244DF" Ref="R?"  Part="1" 
F 0 "R?" V 1493 4500 50  0000 C CNN
F 1 "1k" V 1584 4500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1630 4500 50  0001 C CNN
F 3 "~" H 1700 4500 50  0001 C CNN
	1    1700 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 4500 1900 4500
Wire Wire Line
	2000 4750 1900 4750
Wire Wire Line
	1900 4750 1900 4500
Connection ~ 1900 4500
Wire Wire Line
	1900 4500 1850 4500
$Comp
L power:GND #PWR?
U 1 1 60B244EA
P 2550 4850
AR Path="/60B244EA" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60B244EA" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B244EA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 4600 50  0001 C CNN
F 1 "GND" H 2555 4677 50  0000 C CNN
F 2 "" H 2550 4850 50  0001 C CNN
F 3 "" H 2550 4850 50  0001 C CNN
	1    2550 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4850 2550 4750
Wire Wire Line
	2300 4750 2550 4750
Connection ~ 2550 4750
Wire Wire Line
	2550 4750 2550 4700
Text HLabel 1400 4500 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	1400 4500 1550 4500
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60B244F6
P 2450 4500
AR Path="/60B244F6" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60B244F6" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60B244F6" Ref="Q?"  Part="1" 
F 0 "Q?" H 2654 4546 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2654 4455 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2650 4600 50  0001 C CNN
F 3 "~" H 2450 4500 50  0001 C CNN
	1    2450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4150 2550 4300
Text GLabel 4950 5350 0    50   Input ~ 0
BODY_HEATER2B
Text GLabel 2400 4150 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 2400 5300 0    50   Input ~ 0
LID_HEATER2B
$Comp
L Device:R R?
U 1 1 60B24500
P 4650 4750
AR Path="/60B24500" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B24500" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B24500" Ref="R?"  Part="1" 
F 0 "R?" V 4443 4750 50  0000 C CNN
F 1 "10k" V 4534 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4580 4750 50  0001 C CNN
F 3 "~" H 4650 4750 50  0001 C CNN
	1    4650 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B24506
P 4200 4500
AR Path="/60B24506" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B24506" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B24506" Ref="R?"  Part="1" 
F 0 "R?" V 3993 4500 50  0000 C CNN
F 1 "1k" V 4084 4500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4130 4500 50  0001 C CNN
F 3 "~" H 4200 4500 50  0001 C CNN
	1    4200 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 4500 4400 4500
Wire Wire Line
	4500 4750 4400 4750
Wire Wire Line
	4400 4750 4400 4500
Connection ~ 4400 4500
Wire Wire Line
	4400 4500 4350 4500
$Comp
L power:GND #PWR?
U 1 1 60B24511
P 5050 4850
AR Path="/60B24511" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60B24511" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B24511" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 4600 50  0001 C CNN
F 1 "GND" H 5055 4677 50  0000 C CNN
F 2 "" H 5050 4850 50  0001 C CNN
F 3 "" H 5050 4850 50  0001 C CNN
	1    5050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4850 5050 4750
Wire Wire Line
	4800 4750 5050 4750
Connection ~ 5050 4750
Wire Wire Line
	5050 4750 5050 4700
Text HLabel 3900 4500 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	3900 4500 4050 4500
Text GLabel 4950 4150 0    50   Input ~ 0
BODY_HEATER1B
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60B2451E
P 4950 4500
AR Path="/60B2451E" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60B2451E" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60B2451E" Ref="Q?"  Part="1" 
F 0 "Q?" H 5154 4546 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5154 4455 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5150 4600 50  0001 C CNN
F 3 "~" H 4950 4500 50  0001 C CNN
	1    4950 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4150 5050 4150
Wire Wire Line
	5050 4150 5050 4300
Wire Wire Line
	2550 4150 2400 4150
$Comp
L Device:R R?
U 1 1 60B24527
P 2150 5900
AR Path="/60B24527" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B24527" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B24527" Ref="R?"  Part="1" 
F 0 "R?" V 1943 5900 50  0000 C CNN
F 1 "10k" V 2034 5900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2080 5900 50  0001 C CNN
F 3 "~" H 2150 5900 50  0001 C CNN
	1    2150 5900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B2452D
P 1700 5650
AR Path="/60B2452D" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B2452D" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B2452D" Ref="R?"  Part="1" 
F 0 "R?" V 1493 5650 50  0000 C CNN
F 1 "1k" V 1584 5650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1630 5650 50  0001 C CNN
F 3 "~" H 1700 5650 50  0001 C CNN
	1    1700 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 5650 1900 5650
Wire Wire Line
	2000 5900 1900 5900
Wire Wire Line
	1900 5900 1900 5650
Connection ~ 1900 5650
Wire Wire Line
	1900 5650 1850 5650
$Comp
L power:GND #PWR?
U 1 1 60B24538
P 2550 6000
AR Path="/60B24538" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60B24538" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B24538" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 5750 50  0001 C CNN
F 1 "GND" H 2555 5827 50  0000 C CNN
F 2 "" H 2550 6000 50  0001 C CNN
F 3 "" H 2550 6000 50  0001 C CNN
	1    2550 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6000 2550 5900
Wire Wire Line
	2300 5900 2550 5900
Connection ~ 2550 5900
Wire Wire Line
	2550 5900 2550 5850
Text HLabel 1400 5650 0    50   Input ~ 0
LID_HEATER2
Wire Wire Line
	1400 5650 1550 5650
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60B24544
P 2450 5650
AR Path="/60B24544" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60B24544" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60B24544" Ref="Q?"  Part="1" 
F 0 "Q?" H 2654 5696 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2654 5605 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2650 5750 50  0001 C CNN
F 3 "~" H 2450 5650 50  0001 C CNN
	1    2450 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5300 2550 5450
Wire Wire Line
	2550 5300 2400 5300
$Comp
L Device:R R?
U 1 1 60B2454C
P 4650 5950
AR Path="/60B2454C" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B2454C" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B2454C" Ref="R?"  Part="1" 
F 0 "R?" V 4443 5950 50  0000 C CNN
F 1 "10k" V 4534 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4580 5950 50  0001 C CNN
F 3 "~" H 4650 5950 50  0001 C CNN
	1    4650 5950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B24552
P 4200 5700
AR Path="/60B24552" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B24552" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B24552" Ref="R?"  Part="1" 
F 0 "R?" V 3993 5700 50  0000 C CNN
F 1 "1k" V 4084 5700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4130 5700 50  0001 C CNN
F 3 "~" H 4200 5700 50  0001 C CNN
	1    4200 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 5700 4400 5700
Wire Wire Line
	4500 5950 4400 5950
Wire Wire Line
	4400 5950 4400 5700
Connection ~ 4400 5700
Wire Wire Line
	4400 5700 4350 5700
$Comp
L power:GND #PWR?
U 1 1 60B2455D
P 5050 6050
AR Path="/60B2455D" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60B2455D" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B2455D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 5800 50  0001 C CNN
F 1 "GND" H 5055 5877 50  0000 C CNN
F 2 "" H 5050 6050 50  0001 C CNN
F 3 "" H 5050 6050 50  0001 C CNN
	1    5050 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 6050 5050 5950
Wire Wire Line
	4800 5950 5050 5950
Connection ~ 5050 5950
Wire Wire Line
	5050 5950 5050 5900
Text HLabel 3900 5700 0    50   Input ~ 0
WELL_HEATER2
Wire Wire Line
	3900 5700 4050 5700
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60B24569
P 4950 5700
AR Path="/60B24569" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60B24569" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60B24569" Ref="Q?"  Part="1" 
F 0 "Q?" H 5154 5746 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5154 5655 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5150 5800 50  0001 C CNN
F 3 "~" H 4950 5700 50  0001 C CNN
	1    4950 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5350 5050 5350
Wire Wire Line
	5050 5350 5050 5500
$Comp
L Device:R R?
U 1 1 60B24571
P 2150 7050
AR Path="/60B24571" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B24571" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B24571" Ref="R?"  Part="1" 
F 0 "R?" V 1943 7050 50  0000 C CNN
F 1 "10k" V 2034 7050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2080 7050 50  0001 C CNN
F 3 "~" H 2150 7050 50  0001 C CNN
	1    2150 7050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B24577
P 1700 6800
AR Path="/60B24577" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B24577" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B24577" Ref="R?"  Part="1" 
F 0 "R?" V 1493 6800 50  0000 C CNN
F 1 "1k" V 1584 6800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1630 6800 50  0001 C CNN
F 3 "~" H 1700 6800 50  0001 C CNN
	1    1700 6800
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 6800 1900 6800
Wire Wire Line
	2000 7050 1900 7050
Wire Wire Line
	1900 7050 1900 6800
Connection ~ 1900 6800
Wire Wire Line
	1900 6800 1850 6800
$Comp
L power:GND #PWR?
U 1 1 60B24582
P 2550 7150
AR Path="/60B24582" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60B24582" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B24582" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 6900 50  0001 C CNN
F 1 "GND" H 2555 6977 50  0000 C CNN
F 2 "" H 2550 7150 50  0001 C CNN
F 3 "" H 2550 7150 50  0001 C CNN
	1    2550 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 7150 2550 7050
Wire Wire Line
	2300 7050 2550 7050
Connection ~ 2550 7050
Wire Wire Line
	2550 7050 2550 7000
Text HLabel 1400 6800 0    50   Input ~ 0
FAN1
Wire Wire Line
	1400 6800 1550 6800
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60B2458E
P 2450 6800
AR Path="/60B2458E" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60B2458E" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60B2458E" Ref="Q?"  Part="1" 
F 0 "Q?" H 2654 6846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2654 6755 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2650 6900 50  0001 C CNN
F 3 "~" H 2450 6800 50  0001 C CNN
	1    2450 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6450 2550 6450
Wire Wire Line
	2550 6450 2550 6600
Text GLabel 2450 6450 0    50   Input ~ 0
FAN_BLACK_GND1
$Comp
L Device:R R?
U 1 1 60B24597
P 4650 7050
AR Path="/60B24597" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B24597" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B24597" Ref="R?"  Part="1" 
F 0 "R?" V 4443 7050 50  0000 C CNN
F 1 "10k" V 4534 7050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4580 7050 50  0001 C CNN
F 3 "~" H 4650 7050 50  0001 C CNN
	1    4650 7050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B2459D
P 4200 6800
AR Path="/60B2459D" Ref="R?"  Part="1" 
AR Path="/5F7519D0/60B2459D" Ref="R?"  Part="1" 
AR Path="/5F7093B5/60B2459D" Ref="R?"  Part="1" 
F 0 "R?" V 3993 6800 50  0000 C CNN
F 1 "1k" V 4084 6800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4130 6800 50  0001 C CNN
F 3 "~" H 4200 6800 50  0001 C CNN
	1    4200 6800
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 6800 4400 6800
Wire Wire Line
	4500 7050 4400 7050
Wire Wire Line
	4400 7050 4400 6800
Connection ~ 4400 6800
Wire Wire Line
	4400 6800 4350 6800
$Comp
L power:GND #PWR?
U 1 1 60B245A8
P 5050 7150
AR Path="/60B245A8" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60B245A8" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60B245A8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 6900 50  0001 C CNN
F 1 "GND" H 5055 6977 50  0000 C CNN
F 2 "" H 5050 7150 50  0001 C CNN
F 3 "" H 5050 7150 50  0001 C CNN
	1    5050 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 7150 5050 7050
Wire Wire Line
	4800 7050 5050 7050
Connection ~ 5050 7050
Wire Wire Line
	5050 7050 5050 7000
Text HLabel 3900 6800 0    50   Input ~ 0
FAN2
Wire Wire Line
	3900 6800 4050 6800
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 60B245B4
P 4950 6800
AR Path="/60B245B4" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/60B245B4" Ref="Q?"  Part="1" 
AR Path="/5F7093B5/60B245B4" Ref="Q?"  Part="1" 
F 0 "Q?" H 5154 6846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5154 6755 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5150 6900 50  0001 C CNN
F 3 "~" H 4950 6800 50  0001 C CNN
	1    4950 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6450 5050 6450
Wire Wire Line
	5050 6450 5050 6600
Text GLabel 4950 6450 0    50   Input ~ 0
FAN_BLACK_GND2
$EndSCHEMATC
