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
L Connector:Barrel_Jack_Switch J6
U 1 1 615CB67F
P 2150 1750
F 0 "J6" H 2207 2067 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 2207 1976 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 2200 1710 50  0001 C CNN
F 3 "~" H 2200 1710 50  0001 C CNN
	1    2150 1750
	-1   0    0    -1  
$EndComp
Text GLabel 1700 1650 0    50   Input ~ 0
12V
Text GLabel 1700 1850 0    50   Input ~ 0
GND
Wire Wire Line
	1700 1650 1850 1650
Wire Wire Line
	1850 1850 1800 1850
Wire Wire Line
	1850 1750 1800 1750
Wire Wire Line
	1800 1750 1800 1850
Connection ~ 1800 1850
Wire Wire Line
	1800 1850 1700 1850
Text GLabel 1950 3050 2    50   Input ~ 0
REG_OUT
Wire Wire Line
	1950 2950 1750 2950
Wire Wire Line
	1750 3050 1950 3050
$Comp
L pspice:DIODE D2
U 1 1 61611331
P 5200 5000
F 0 "D2" V 5246 4872 50  0000 R CNN
F 1 "DIODE" V 5155 4872 50  0000 R CNN
F 2 "Diodes_SMD:D_SMA" H 5200 5000 50  0001 C CNN
F 3 "~" H 5200 5000 50  0001 C CNN
	1    5200 5000
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D1
U 1 1 61611337
P 3800 5000
F 0 "D1" V 3850 4750 50  0000 L CNN
F 1 "DIODE" V 3750 4650 50  0000 L CNN
F 2 "Diodes_SMD:D_SMA" H 3800 5000 50  0001 C CNN
F 3 "~" H 3800 5000 50  0001 C CNN
	1    3800 5000
	0    1    -1   0   
$EndComp
Wire Wire Line
	5050 4800 5200 4800
Wire Wire Line
	5200 5200 5050 5200
Wire Wire Line
	3950 5200 3800 5200
$Comp
L Connector:Screw_Terminal_01x02 HLID?
U 1 1 61611349
P 6750 5100
AR Path="/60B6F672/61611349" Ref="HLID?"  Part="1" 
AR Path="/61611349" Ref="PEL1"  Part="1" 
AR Path="/615FFA84/61611349" Ref="HLID?"  Part="1" 
F 0 "PEL1" H 6750 5200 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 6550 4900 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 6750 5100 50  0001 C CNN
F 3 "~" H 6750 5100 50  0001 C CNN
	1    6750 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5100 6550 5100
Wire Wire Line
	6300 5200 6550 5200
$Comp
L Device:Q_NPN_BCE Q2
U 1 1 61611353
P 3700 5550
F 0 "Q2" H 3550 5450 50  0000 L CNN
F 1 "Q_NPN_BCE" H 3250 5350 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3900 5650 50  0001 C CNN
F 3 "~" H 3700 5550 50  0001 C CNN
	1    3700 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5200 3800 5350
Connection ~ 3800 5200
$Comp
L Device:R R8
U 1 1 6161135B
P 5800 5550
AR Path="/6161135B" Ref="R8"  Part="1" 
AR Path="/5F7519D0/6161135B" Ref="R?"  Part="1" 
AR Path="/5F7093B5/6161135B" Ref="R?"  Part="1" 
AR Path="/60AC8F63/6161135B" Ref="R?"  Part="1" 
AR Path="/615FFA84/6161135B" Ref="R?"  Part="1" 
F 0 "R8" V 5593 5550 50  0000 C CNN
F 1 "10k" V 5684 5550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5730 5550 50  0001 C CNN
F 3 "~" H 5800 5550 50  0001 C CNN
	1    5800 5550
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_BCE Q4
U 1 1 61611361
P 5300 5550
F 0 "Q4" H 5150 5450 50  0000 L CNN
F 1 "Q_NPN_BCE" H 4900 5350 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5500 5650 50  0001 C CNN
F 3 "~" H 5300 5550 50  0001 C CNN
	1    5300 5550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 61611367
P 5200 5900
AR Path="/61611367" Ref="#PWR0111"  Part="1" 
AR Path="/5F7519D0/61611367" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/61611367" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/61611367" Ref="#PWR?"  Part="1" 
AR Path="/615FFA84/61611367" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H 5200 5650 50  0001 C CNN
F 1 "GND" H 5205 5727 50  0000 C CNN
F 2 "" H 5200 5900 50  0001 C CNN
F 3 "" H 5200 5900 50  0001 C CNN
	1    5200 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5750 5200 5900
Wire Wire Line
	5200 5200 5200 5350
Connection ~ 5200 5200
Wire Wire Line
	5650 5550 5500 5550
Wire Wire Line
	5950 5550 6050 5550
$Comp
L Device:R R6
U 1 1 61611394
P 3200 5550
AR Path="/61611394" Ref="R6"  Part="1" 
AR Path="/5F7519D0/61611394" Ref="R?"  Part="1" 
AR Path="/5F7093B5/61611394" Ref="R?"  Part="1" 
AR Path="/60AC8F63/61611394" Ref="R?"  Part="1" 
AR Path="/615FFA84/61611394" Ref="R?"  Part="1" 
F 0 "R6" V 2993 5550 50  0000 C CNN
F 1 "10k" V 3084 5550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3130 5550 50  0001 C CNN
F 3 "~" H 3200 5550 50  0001 C CNN
	1    3200 5550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 6161139A
P 3800 5900
AR Path="/6161139A" Ref="#PWR0113"  Part="1" 
AR Path="/5F7519D0/6161139A" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/6161139A" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F63/6161139A" Ref="#PWR?"  Part="1" 
AR Path="/615FFA84/6161139A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 3800 5650 50  0001 C CNN
F 1 "GND" H 3650 5850 50  0000 C CNN
F 2 "" H 3800 5900 50  0001 C CNN
F 3 "" H 3800 5900 50  0001 C CNN
	1    3800 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5750 3800 5900
Wire Wire Line
	3500 5550 3350 5550
Wire Wire Line
	3050 5550 2850 5550
Wire Wire Line
	9500 5050 9500 4950
Wire Wire Line
	9500 4950 9000 4950
Wire Wire Line
	9000 4950 9000 5050
Text HLabel 4600 5450 2    50   Input ~ 0
PEL_RED
Text HLabel 4400 5450 0    50   Input ~ 0
PEL_BLK
Wire Wire Line
	4600 5450 4550 5450
Wire Wire Line
	6400 4500 6400 4750
Wire Wire Line
	4400 5450 4450 5450
Wire Wire Line
	9500 5850 9500 6000
Wire Wire Line
	9500 6000 9000 6000
Wire Wire Line
	9000 5850 9000 6000
Wire Wire Line
	9800 5250 9900 5250
Wire Wire Line
	9900 5250 9900 4950
Wire Wire Line
	8650 5250 8650 4950
Wire Wire Line
	8650 4950 8550 4950
Text HLabel 3700 5200 0    50   Input ~ 0
PEL1
Text HLabel 5300 5200 2    50   Input ~ 0
PEL3
Wire Wire Line
	3700 5200 3800 5200
Wire Wire Line
	5200 5200 5300 5200
Text HLabel 8600 5650 0    50   Input ~ 0
PEL1
Text HLabel 9900 5650 2    50   Input ~ 0
PEL3
Wire Wire Line
	8600 5650 8700 5650
Wire Wire Line
	9800 5650 9900 5650
Text GLabel 6050 5550 2    50   Input ~ 0
PEL_SWB
Text GLabel 2850 5550 0    50   Input ~ 0
PEL_SWA
Wire Wire Line
	4450 5000 4450 5450
Wire Wire Line
	4550 5000 4550 5450
Wire Wire Line
	8650 5250 8700 5250
Text HLabel 9150 5850 0    50   Input ~ 0
PEL_BLK
Text HLabel 9350 5850 2    50   Input ~ 0
PEL_RED
Wire Wire Line
	9300 5450 9300 5850
Wire Wire Line
	9300 5850 9350 5850
Wire Wire Line
	9200 5450 9200 5850
Wire Wire Line
	9200 5850 9150 5850
Text GLabel 8550 4950 0    50   Input ~ 0
12V
Wire Wire Line
	3950 4800 3800 4800
Connection ~ 3950 4800
Wire Wire Line
	4000 4800 3950 4800
$Comp
L Ninja-qPCR:EP2-3L3SAb K1
U 1 1 61624824
P 3950 4800
F 0 "K1" H 4500 5203 60  0000 C CNN
F 1 "EP2-3L3SAb" H 4500 5097 60  0000 C CNN
F 2 "Ninja-qPCR:EP2-3L3SAb" H 4450 5490 60  0001 C CNN
F 3 "" H 3950 4800 60  0000 C CNN
	1    3950 4800
	1    0    0    -1  
$EndComp
Connection ~ 3800 4800
Connection ~ 5200 4800
Wire Wire Line
	3800 4500 3800 4800
Wire Wire Line
	5200 4800 5200 4500
$Comp
L Connector:Barrel_Jack_Switch J7
U 1 1 6168C9ED
P 2150 1150
F 0 "J7" H 2207 1467 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 2207 1376 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 2200 1110 50  0001 C CNN
F 3 "~" H 2200 1110 50  0001 C CNN
	1    2150 1150
	-1   0    0    -1  
$EndComp
Text GLabel 1700 1050 0    50   Input ~ 0
12V
Text GLabel 1700 1250 0    50   Input ~ 0
GND
Wire Wire Line
	1700 1050 1850 1050
Wire Wire Line
	1850 1250 1800 1250
Wire Wire Line
	1850 1150 1800 1150
Wire Wire Line
	1800 1150 1800 1250
Connection ~ 1800 1250
Wire Wire Line
	1800 1250 1700 1250
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 616E0F34
P 1550 2950
F 0 "J4" H 1442 3135 50  0000 C CNN
F 1 "Conn_01x02_Female" H 1442 3044 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1550 2950 50  0001 C CNN
F 3 "~" H 1550 2950 50  0001 C CNN
	1    1550 2950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J8
U 1 1 616E1BB7
P 1550 3650
F 0 "J8" H 1522 3674 50  0000 R CNN
F 1 "Conn_01x03_Male" H 1522 3583 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 1550 3650 50  0001 C CNN
F 3 "~" H 1550 3650 50  0001 C CNN
	1    1550 3650
	1    0    0    -1  
$EndComp
Text GLabel 1950 3550 2    50   Input ~ 0
PEL_SWA
Text GLabel 1950 3650 2    50   Input ~ 0
PEL_SWB
Text GLabel 1950 3750 2    50   Input ~ 0
PEL_PWM
Wire Wire Line
	1750 3550 1950 3550
Wire Wire Line
	1750 3650 1950 3650
Wire Wire Line
	1750 3750 1950 3750
Text HLabel 6250 4500 0    50   Input ~ 0
PEL_BLK
Text HLabel 6450 4500 2    50   Input ~ 0
PEL_RED
Wire Wire Line
	6300 4500 6250 4500
Wire Wire Line
	6400 4500 6450 4500
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 6189FB08
P 6650 4750
F 0 "J3" H 6542 4935 50  0000 C CNN
F 1 "Conn_01x02_Female" H 6542 4844 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 6650 4750 50  0001 C CNN
F 3 "~" H 6650 4750 50  0001 C CNN
	1    6650 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 4750 6400 4750
Wire Wire Line
	6450 4850 6400 4850
Wire Wire Line
	6400 4850 6400 5100
Wire Wire Line
	6300 4500 6300 5200
Text GLabel 3700 4500 0    50   Input ~ 0
12V
Text GLabel 5300 4500 2    50   Input ~ 0
12V
Wire Wire Line
	5300 4500 5200 4500
Wire Wire Line
	3800 4500 3700 4500
Text GLabel 9000 6100 3    50   Input ~ 0
REG_OUT
$Comp
L Ninja-qPCR:EX2-2U1S K2
U 1 1 6164633B
P 8700 5250
F 0 "K2" H 9250 5653 60  0000 C CNN
F 1 "EX2-2U1S" H 9250 5547 60  0000 C CNN
F 2 "Ninja-qPCR:EX2-2U1S" H 9200 5940 60  0001 C CNN
F 3 "" H 8700 5250 60  0000 C CNN
	1    8700 5250
	1    0    0    -1  
$EndComp
Text GLabel 10000 4950 2    50   Input ~ 0
12V
Wire Wire Line
	10000 4950 9900 4950
Wire Wire Line
	9000 4950 9000 4750
Connection ~ 9000 4950
Wire Wire Line
	5350 1000 5350 850 
Connection ~ 5350 1500
Wire Wire Line
	5450 1500 5350 1500
$Comp
L Ninja-qPCR:SRP1265C-220M L1
U 1 1 61A26907
P 5000 1500
F 0 "L1" H 5000 1725 50  0000 C CNN
F 1 "SRP1265C-220M" H 5000 1634 50  0000 C CNN
F 2 "Ninja-qPCR:SRP1265C" H 5000 1700 50  0001 C CNN
F 3 "https://www.digikey.com/en/products/detail/bourns-inc/srp1265c-220m/11633469" H 5000 1700 50  0001 C CNN
	1    5000 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2600 4000 2500
$Comp
L power:GND #PWR0101
U 1 1 61A20DE9
P 4000 2600
F 0 "#PWR0101" H 4000 2350 50  0001 C CNN
F 1 "GND" H 4005 2427 50  0000 C CNN
F 2 "" H 4000 2600 50  0001 C CNN
F 3 "" H 4000 2600 50  0001 C CNN
	1    4000 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2200 4000 2100
$Comp
L Device:R R1
U 1 1 61A1B4E1
P 4000 2350
F 0 "R1" H 4070 2396 50  0000 L CNN
F 1 "10k" H 4070 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3930 2350 50  0001 C CNN
F 3 "~" H 4000 2350 50  0001 C CNN
	1    4000 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2400 4750 2600
Connection ~ 4750 2400
Wire Wire Line
	4700 2400 4750 2400
Wire Wire Line
	4750 2300 4750 2400
Connection ~ 4750 2300
Wire Wire Line
	4700 2300 4750 2300
Wire Wire Line
	4750 2200 4750 2300
Wire Wire Line
	4700 2200 4750 2200
Wire Wire Line
	4750 1700 4750 1800
Connection ~ 4750 1700
Wire Wire Line
	4700 1700 4750 1700
Wire Wire Line
	4750 1800 4750 1900
Connection ~ 4750 1800
Wire Wire Line
	4700 1800 4750 1800
Wire Wire Line
	4750 1900 4750 2000
Connection ~ 4750 1900
Wire Wire Line
	4700 1900 4750 1900
Wire Wire Line
	4750 1500 4750 1700
Wire Wire Line
	4750 2000 4700 2000
$Comp
L Ninja-qPCR:SIRA88BDP-T1-GE3 Q1
U 1 1 619ECC82
P 4450 2000
F 0 "Q1" H 4450 2565 50  0000 C CNN
F 1 "SIRA88BDP-T1-GE3" H 4450 2474 50  0000 C CNN
F 2 "Ninja-qPCR:PowerPAK_SO-8_Long" H 4450 2550 50  0001 C CNN
F 3 "https://www.digikey.com/en/products/detail/vishay-siliconix/SIRA88BDP-T1-GE3/10321634?s=N4IgTCBcDaIMoEkBKBBAHGgQgEQAogF0BfIA" H 4450 2550 50  0001 C CNN
	1    4450 2000
	1    0    0    -1  
$EndComp
Text Notes 4050 950  0    50   ~ 0
Ceramic
Text GLabel 5450 1500 2    50   Input ~ 0
REG_OUT
$Comp
L power:GND #PWR0102
U 1 1 61ABF8DC
P 3950 1350
F 0 "#PWR0102" H 3950 1100 50  0001 C CNN
F 1 "GND" H 3955 1177 50  0000 C CNN
F 2 "" H 3950 1350 50  0001 C CNN
F 3 "" H 3950 1350 50  0001 C CNN
	1    3950 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 61AA59D5
P 3950 1150
F 0 "C1" H 4065 1196 50  0000 L CNN
F 1 "22uF" H 4065 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3988 1000 50  0001 C CNN
F 3 "~" H 3950 1150 50  0001 C CNN
	1    3950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 850  4750 850 
Wire Wire Line
	5350 1500 5150 1500
Wire Wire Line
	5350 1300 5350 1500
$Comp
L Device:C C2
U 1 1 61A8B41C
P 5350 1150
F 0 "C2" H 5465 1196 50  0000 L CNN
F 1 "22uF" H 5465 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 5388 1000 50  0001 C CNN
F 3 "~" H 5350 1150 50  0001 C CNN
	1    5350 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 850  4750 1000
Text GLabel 3750 850  0    50   Input ~ 0
12V
Connection ~ 4750 1500
Wire Wire Line
	4750 1300 4750 1500
$Comp
L Device:D_Schottky D3
U 1 1 61A5B8B9
P 4750 1150
F 0 "D3" V 4704 1230 50  0000 L CNN
F 1 "D_Schottky" V 4795 1230 50  0000 L CNN
F 2 "Ninja-qPCR:MSS1P3L-M3&slash_89A" H 4750 1150 50  0001 C CNN
F 3 "~" H 4750 1150 50  0001 C CNN
	1    4750 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 1500 4750 1500
$Comp
L power:GND #PWR0103
U 1 1 61A1DEFA
P 4750 2600
F 0 "#PWR0103" H 4750 2350 50  0001 C CNN
F 1 "GND" H 4755 2427 50  0000 C CNN
F 2 "" H 4750 2600 50  0001 C CNN
F 3 "" H 4750 2600 50  0001 C CNN
	1    4750 2600
	1    0    0    -1  
$EndComp
Text GLabel 3750 2100 0    50   Input ~ 0
PEL_PWM
Wire Wire Line
	3950 1350 3950 1300
Connection ~ 4750 850 
Wire Wire Line
	3750 850  3950 850 
Connection ~ 3950 850 
Wire Wire Line
	3950 850  4750 850 
Wire Wire Line
	3750 2100 4000 2100
Connection ~ 4000 2100
Wire Wire Line
	4000 2100 4200 2100
Wire Wire Line
	3950 850  3950 1000
Wire Wire Line
	4250 5400 4250 5800
Wire Wire Line
	9000 6000 9000 6100
Connection ~ 9000 6000
Text GLabel 4250 5800 3    50   Input ~ 0
REG_OUT
Text GLabel 4250 4200 1    50   Input ~ 0
12V
Wire Wire Line
	4250 4200 4250 4600
Text GLabel 1950 2950 2    50   Input ~ 0
12V
Text GLabel 9000 4750 1    50   Input ~ 0
12V
Text GLabel 1950 3850 2    50   Input ~ 0
GND
Wire Wire Line
	1950 3850 1750 3850
$EndSCHEMATC
