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
L Ninja-qPCR:AOZ2264QI-19 U1
U 1 1 615B3E6F
P 3050 2400
F 0 "U1" H 3050 2525 50  0000 C CNN
F 1 "AOZ2264QI-19" H 3050 2434 50  0000 C CNN
F 2 "Ninja-qPCR:AOZ2264QI-19" H 3050 2400 50  0001 C CNN
F 3 "" H 3050 2400 50  0001 C CNN
	1    3050 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 615B1D45
P 2450 2300
F 0 "R2" H 2520 2346 50  0000 L CNN
F 1 "150k" H 2520 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2380 2300 50  0001 C CNN
F 3 "~" H 2450 2300 50  0001 C CNN
	1    2450 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2450 2450 2500
Wire Wire Line
	2450 2500 2650 2500
Wire Wire Line
	3450 2500 3550 2500
Wire Wire Line
	3550 2500 3550 2600
Wire Wire Line
	3550 2800 3450 2800
Wire Wire Line
	3450 2700 3550 2700
Connection ~ 3550 2700
Wire Wire Line
	3550 2700 3550 2800
Wire Wire Line
	3450 2600 3550 2600
Connection ~ 3550 2600
Wire Wire Line
	3550 2600 3550 2700
Connection ~ 3550 2500
Wire Wire Line
	3550 2500 3550 2100
Wire Wire Line
	3550 2100 2450 2100
Wire Wire Line
	2450 2100 2450 2150
Wire Wire Line
	2650 2600 2150 2600
Text GLabel 1750 2600 0    50   Input ~ 0
5V
Wire Wire Line
	3450 3000 3550 3000
Wire Wire Line
	3550 3000 3550 3100
Wire Wire Line
	3550 3400 3450 3400
Wire Wire Line
	3450 3100 3550 3100
Connection ~ 3550 3100
Wire Wire Line
	3550 3100 3550 3200
Wire Wire Line
	3450 3200 3550 3200
Connection ~ 3550 3200
Wire Wire Line
	3550 3200 3550 3300
Wire Wire Line
	3450 3300 3550 3300
Connection ~ 3550 3300
Wire Wire Line
	3550 3300 3550 3400
Wire Wire Line
	3450 3700 3550 3700
Wire Wire Line
	3550 3700 3550 3800
Wire Wire Line
	3550 4100 3450 4100
Wire Wire Line
	3450 4000 3550 4000
Connection ~ 3550 4000
Wire Wire Line
	3550 4000 3550 4100
Wire Wire Line
	3450 3900 3550 3900
Connection ~ 3550 3900
Wire Wire Line
	3550 3900 3550 4000
Wire Wire Line
	3450 3800 3550 3800
Connection ~ 3550 3800
Wire Wire Line
	3550 3800 3550 3900
$Comp
L Device:C C2
U 1 1 615B4693
P 2500 3700
F 0 "C2" H 2615 3746 50  0000 L CNN
F 1 "10uF" H 2615 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2538 3550 50  0001 C CNN
F 3 "~" H 2500 3700 50  0001 C CNN
	1    2500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3500 2500 3500
Wire Wire Line
	2500 3500 2500 3550
$Comp
L power:GND #PWR0101
U 1 1 615B536D
P 2500 3950
F 0 "#PWR0101" H 2500 3700 50  0001 C CNN
F 1 "GND" H 2505 3777 50  0000 C CNN
F 2 "" H 2500 3950 50  0001 C CNN
F 3 "" H 2500 3950 50  0001 C CNN
	1    2500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3950 2500 3850
$Comp
L power:GND #PWR0102
U 1 1 615B5CB4
P 3700 4150
F 0 "#PWR0102" H 3700 3900 50  0001 C CNN
F 1 "GND" H 3705 3977 50  0000 C CNN
F 2 "" H 3700 4150 50  0001 C CNN
F 3 "" H 3700 4150 50  0001 C CNN
	1    3700 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4100 3700 4100
Wire Wire Line
	3700 4100 3700 4150
Connection ~ 3550 4100
$Comp
L power:GND #PWR0103
U 1 1 615B6916
P 3700 3700
F 0 "#PWR0103" H 3700 3450 50  0001 C CNN
F 1 "GND" H 3705 3527 50  0000 C CNN
F 2 "" H 3700 3700 50  0001 C CNN
F 3 "" H 3700 3700 50  0001 C CNN
	1    3700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3700 3700 3600
Wire Wire Line
	3700 3600 3450 3600
$Comp
L Device:L L1
U 1 1 615B9655
P 3800 3200
F 0 "L1" V 3990 3200 50  0000 C CNN
F 1 "3.3uH" V 3899 3200 50  0000 C CNN
F 2 "Ninja-qPCR:SRN6045TA-3R3Y" H 3800 3200 50  0001 C CNN
F 3 "~" H 3800 3200 50  0001 C CNN
	1    3800 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 3200 3600 3200
Text Label 4050 3300 0    50   ~ 0
FB_RES_A
Text Label 4050 3400 0    50   ~ 0
FB_RES_B
Wire Wire Line
	3900 3400 3900 3500
Wire Wire Line
	3900 3900 3900 3850
$Comp
L power:GND #PWR0104
U 1 1 615B8459
P 3900 3900
F 0 "#PWR0104" H 3900 3650 50  0001 C CNN
F 1 "GND" H 3905 3727 50  0000 C CNN
F 2 "" H 3900 3900 50  0001 C CNN
F 3 "" H 3900 3900 50  0001 C CNN
	1    3900 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 615B7D54
P 3900 3700
F 0 "R3" H 3970 3746 50  0000 L CNN
F 1 "5k" H 3970 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 3830 3700 50  0001 C CNN
F 3 "~" H 3900 3700 50  0001 C CNN
	1    3900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3500 3900 3500
Connection ~ 3900 3500
Wire Wire Line
	3900 3500 3900 3550
Wire Wire Line
	4050 3400 3900 3400
Wire Wire Line
	4050 3300 4000 3300
Wire Wire Line
	4000 3300 4000 3200
Wire Wire Line
	4000 3200 3950 3200
Wire Wire Line
	4000 3200 4550 3200
Wire Wire Line
	4550 3200 4550 3450
Connection ~ 4000 3200
$Comp
L Device:C C6
U 1 1 615C3ADF
P 4550 3600
F 0 "C6" H 4665 3646 50  0000 L CNN
F 1 "47uF" H 4665 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 4588 3450 50  0001 C CNN
F 3 "~" H 4550 3600 50  0001 C CNN
	1    4550 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 615C40DF
P 4550 3900
F 0 "#PWR0105" H 4550 3650 50  0001 C CNN
F 1 "GND" H 4555 3727 50  0000 C CNN
F 2 "" H 4550 3900 50  0001 C CNN
F 3 "" H 4550 3900 50  0001 C CNN
	1    4550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3900 4550 3850
Connection ~ 4550 3200
$Comp
L power:GND #PWR0106
U 1 1 615C599D
P 2350 3450
F 0 "#PWR0106" H 2350 3200 50  0001 C CNN
F 1 "GND" H 2355 3277 50  0000 C CNN
F 2 "" H 2350 3450 50  0001 C CNN
F 3 "" H 2350 3450 50  0001 C CNN
	1    2350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3400 2350 3400
Wire Wire Line
	2350 3400 2350 3450
Text GLabel 2550 3100 0    50   Input ~ 0
5V
Wire Wire Line
	2550 3100 2650 3100
$Comp
L Device:C C1
U 1 1 615C767B
P 2150 2800
F 0 "C1" H 2265 2846 50  0000 L CNN
F 1 "10uF" H 2265 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2188 2650 50  0001 C CNN
F 3 "~" H 2150 2800 50  0001 C CNN
	1    2150 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 615C8AB9
P 2150 3000
F 0 "#PWR0107" H 2150 2750 50  0001 C CNN
F 1 "GND" H 2155 2827 50  0000 C CNN
F 2 "" H 2150 3000 50  0001 C CNN
F 3 "" H 2150 3000 50  0001 C CNN
	1    2150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3000 2150 2950
Wire Wire Line
	2150 2650 2150 2600
Connection ~ 2150 2600
$Comp
L Device:C C4
U 1 1 615CE6D3
P 4050 2700
F 0 "C4" H 4165 2746 50  0000 L CNN
F 1 "1uF" H 4165 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4088 2550 50  0001 C CNN
F 3 "~" H 4050 2700 50  0001 C CNN
	1    4050 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 615CF30F
P 4350 2700
F 0 "C5" H 4465 2746 50  0000 L CNN
F 1 "22uF" H 4465 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 4388 2550 50  0001 C CNN
F 3 "~" H 4350 2700 50  0001 C CNN
	1    4350 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2850 4050 2900
Wire Wire Line
	4350 2900 4350 2850
Wire Wire Line
	4350 2550 4350 2500
Connection ~ 4350 2500
Wire Wire Line
	4050 2550 4050 2500
Connection ~ 4050 2500
Wire Wire Line
	4050 2500 4350 2500
$Comp
L power:GND #PWR0108
U 1 1 615D3376
P 4350 2950
F 0 "#PWR0108" H 4350 2700 50  0001 C CNN
F 1 "GND" H 4355 2777 50  0000 C CNN
F 2 "" H 4350 2950 50  0001 C CNN
F 3 "" H 4350 2950 50  0001 C CNN
	1    4350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2950 4350 2900
Connection ~ 4350 2900
$Comp
L Ninja-qPCR:MCP4551T-104 U2
U 1 1 615B4F06
P 6650 1950
F 0 "U2" H 7450 2337 60  0000 C CNN
F 1 "MCP4551T-104" H 7450 2231 60  0000 C CNN
F 2 "Ninja-qPCR:MCP4551T-502E&slash_MS" H 7450 2190 60  0001 C CNN
F 3 "" H 6650 1950 60  0000 C CNN
	1    6650 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 615B6E0E
P 8350 2350
F 0 "#PWR0109" H 8350 2100 50  0001 C CNN
F 1 "GND" H 8355 2177 50  0000 C CNN
F 2 "" H 8350 2350 50  0001 C CNN
F 3 "" H 8350 2350 50  0001 C CNN
	1    8350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2350 8350 2250
Wire Wire Line
	8350 2250 8250 2250
Text GLabel 6550 2850 0    50   Input ~ 0
5V
Wire Wire Line
	6550 2850 6650 2850
Text GLabel 6550 1950 0    50   Input ~ 0
GND
Wire Wire Line
	6550 1950 6650 1950
Wire Wire Line
	6650 2050 6550 2050
Wire Wire Line
	6650 2550 6550 2550
Text GLabel 6550 2050 0    50   Input ~ 0
I2C_SCL
Text GLabel 6550 2550 0    50   Input ~ 0
I2C_SDA
Text GLabel 1450 1700 0    50   Input ~ 0
I2C_SDA
Text GLabel 1450 1600 0    50   Input ~ 0
I2C_SCL
Text GLabel 1450 1500 0    50   Input ~ 0
5V
Text Label 6550 2250 2    50   ~ 0
POT_RES_A
Text Label 6550 2450 2    50   ~ 0
POT_RES_B
NoConn ~ 6550 2350
Wire Wire Line
	6550 2350 6650 2350
Wire Wire Line
	6650 2250 6550 2250
Wire Wire Line
	6550 2450 6650 2450
$Comp
L Device:C C3
U 1 1 615C31C8
P 3650 2900
F 0 "C3" V 3902 2900 50  0000 C CNN
F 1 "0.1uF" V 3811 2900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3688 2750 50  0001 C CNN
F 3 "~" H 3650 2900 50  0001 C CNN
	1    3650 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 2900 4350 2900
Wire Wire Line
	3550 2500 4050 2500
Wire Wire Line
	3500 2900 3450 2900
Wire Wire Line
	3800 2900 3900 2900
Wire Wire Line
	3900 2900 3900 3050
Wire Wire Line
	3900 3050 3600 3050
Wire Wire Line
	3600 3050 3600 3200
Connection ~ 3600 3200
Wire Wire Line
	3600 3200 3550 3200
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 615DF263
P 7250 3500
F 0 "J2" H 7222 3524 50  0000 R CNN
F 1 "Conn_01x03_Male" H 7222 3433 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7250 3500 50  0001 C CNN
F 3 "~" H 7250 3500 50  0001 C CNN
	1    7250 3500
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 615E1AD1
P 7250 4200
F 0 "J3" H 7222 4224 50  0000 R CNN
F 1 "Conn_01x03_Male" H 7222 4133 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7250 4200 50  0001 C CNN
F 3 "~" H 7250 4200 50  0001 C CNN
	1    7250 4200
	-1   0    0    -1  
$EndComp
Text Label 6950 3500 2    50   ~ 0
FB_RES_A
Text Label 6950 4200 2    50   ~ 0
FB_RES_B
Text Label 6950 3400 2    50   ~ 0
POT_RES_A
Text Label 6950 4300 2    50   ~ 0
POT_RES_B
Wire Wire Line
	7050 3400 6950 3400
Wire Wire Line
	6950 3500 7050 3500
Wire Wire Line
	6950 4200 7050 4200
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 615F2016
P 6650 3800
F 0 "J1" H 6542 3985 50  0000 C CNN
F 1 "Conn_01x02_Female" H 6542 3894 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 6650 3800 50  0001 C CNN
F 3 "~" H 6650 3800 50  0001 C CNN
	1    6650 3800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6950 4300 7050 4300
Wire Wire Line
	7050 3600 6950 3600
Wire Wire Line
	6950 3800 6850 3800
Wire Wire Line
	6850 3900 6950 3900
Wire Wire Line
	6950 4100 7050 4100
Wire Wire Line
	6950 3600 6950 3800
Wire Wire Line
	6950 3900 6950 4100
Text Notes 2250 2700 0    50   ~ 0
Ceramic
Text Notes 4600 2750 0    50   ~ 0
Ceramic
Text Notes 4800 4000 0    50   ~ 0
Ceramic
Wire Wire Line
	4350 2500 4650 2500
Text Notes 4800 4100 0    50   ~ 0
Ripple 0.02V, 0.8A
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 615C37B0
P 1850 1600
F 0 "J5" H 1822 1624 50  0000 R CNN
F 1 "Conn_01x03_Male" H 1822 1533 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1850 1600 50  0001 C CNN
F 3 "~" H 1850 1600 50  0001 C CNN
	1    1850 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1650 1700 1450 1700
Wire Wire Line
	1450 1600 1650 1600
Wire Wire Line
	1650 1500 1450 1500
Wire Wire Line
	1750 2600 2150 2600
NoConn ~ 2600 2900
Wire Wire Line
	2600 2900 2650 2900
$Comp
L Connector:Barrel_Jack_Switch J6
U 1 1 615CB67F
P 1900 1050
F 0 "J6" H 1957 1367 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1957 1276 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1950 1010 50  0001 C CNN
F 3 "~" H 1950 1010 50  0001 C CNN
	1    1900 1050
	-1   0    0    -1  
$EndComp
Text GLabel 1450 950  0    50   Input ~ 0
12V
Text GLabel 1450 1150 0    50   Input ~ 0
GND
Wire Wire Line
	1450 950  1600 950 
Wire Wire Line
	1600 1150 1550 1150
Wire Wire Line
	1600 1050 1550 1050
Wire Wire Line
	1550 1050 1550 1150
Connection ~ 1550 1150
Wire Wire Line
	1550 1150 1450 1150
Wire Wire Line
	4650 2350 4650 2500
Text GLabel 4650 2350 1    50   Input ~ 0
12V
$Comp
L Device:C C8
U 1 1 615DBFE6
P 4950 3600
F 0 "C8" H 5065 3646 50  0000 L CNN
F 1 "47uF" H 5065 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 4988 3450 50  0001 C CNN
F 3 "~" H 4950 3600 50  0001 C CNN
	1    4950 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3750 4950 3850
Wire Wire Line
	4950 3850 4550 3850
Connection ~ 4550 3850
Wire Wire Line
	4550 3850 4550 3750
Text GLabel 5150 3200 2    50   Input ~ 0
REG_OUT
Wire Wire Line
	4550 3200 4950 3200
Wire Wire Line
	4950 3450 4950 3200
Connection ~ 4950 3200
Wire Wire Line
	4950 3200 5150 3200
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 6160000E
P 8300 950
F 0 "J4" H 8218 1167 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 8218 1076 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 8300 950 50  0001 C CNN
F 3 "~" H 8300 950 50  0001 C CNN
	1    8300 950 
	-1   0    0    -1  
$EndComp
Text GLabel 8700 950  2    50   Input ~ 0
REG_OUT
$Comp
L power:GND #PWR0110
U 1 1 61601E7A
P 8700 1150
F 0 "#PWR0110" H 8700 900 50  0001 C CNN
F 1 "GND" H 8705 977 50  0000 C CNN
F 2 "" H 8700 1150 50  0001 C CNN
F 3 "" H 8700 1150 50  0001 C CNN
	1    8700 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 950  8500 950 
Wire Wire Line
	8500 1050 8700 1050
Wire Wire Line
	8700 1050 8700 1150
$EndSCHEMATC
