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
L Connector:Barrel_Jack_Switch J1
U 1 1 612341BB
P 2000 2600
F 0 "J1" H 2057 2917 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 2057 2826 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 2050 2560 50  0001 C CNN
F 3 "~" H 2050 2560 50  0001 C CNN
	1    2000 2600
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:AOZ6663DI-01 U1
U 1 1 61249DBC
P 5550 2400
F 0 "U1" H 5800 2665 50  0000 C CNN
F 1 "AOZ6663DI-01" H 5800 2574 50  0000 C CNN
F 2 "Ninja-qPCR:AOZ6663DI-01" H 5550 2400 50  0001 C CNN
F 3 "" H 5550 2400 50  0001 C CNN
	1    5550 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6124A82C
P 6250 2800
F 0 "#PWR0101" H 6250 2550 50  0001 C CNN
F 1 "GND" H 6255 2627 50  0000 C CNN
F 2 "" H 6250 2800 50  0001 C CNN
F 3 "" H 6250 2800 50  0001 C CNN
	1    6250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2700 6250 2700
Wire Wire Line
	6250 2700 6250 2800
$Comp
L Device:L L1
U 1 1 6124B593
P 6650 2500
F 0 "L1" V 6840 2500 50  0000 C CNN
F 1 "L" V 6749 2500 50  0000 C CNN
F 2 "Ninja-qPCR:SRN6045TA-3R3Y" H 6650 2500 50  0001 C CNN
F 3 "~" H 6650 2500 50  0001 C CNN
	1    6650 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 6124C71F
P 6900 2700
F 0 "R1" H 6970 2746 50  0000 L CNN
F 1 "110k" H 6970 2655 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6830 2700 50  0001 C CNN
F 3 "~" H 6900 2700 50  0001 C CNN
	1    6900 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 6124CE54
P 6900 3100
F 0 "R2" H 6970 3146 50  0000 L CNN
F 1 "15k" H 6970 3055 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6830 3100 50  0001 C CNN
F 3 "~" H 6900 3100 50  0001 C CNN
	1    6900 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2950 6900 2900
Wire Wire Line
	6900 2900 6550 2900
Wire Wire Line
	6550 2900 6550 2600
Connection ~ 6900 2900
Wire Wire Line
	6900 2900 6900 2850
$Comp
L power:GND #PWR0102
U 1 1 6124DCAC
P 7250 3350
F 0 "#PWR0102" H 7250 3100 50  0001 C CNN
F 1 "GND" H 7255 3177 50  0000 C CNN
F 2 "" H 7250 3350 50  0001 C CNN
F 3 "" H 7250 3350 50  0001 C CNN
	1    7250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3300 6900 3250
Wire Wire Line
	6900 2500 6900 2550
$Comp
L Device:C CBST1
U 1 1 6124EB6F
P 6450 2200
F 0 "CBST1" H 6335 2154 50  0000 R CNN
F 1 "0.1uF" H 6335 2245 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6488 2050 50  0001 C CNN
F 3 "~" H 6450 2200 50  0001 C CNN
	1    6450 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	6550 2600 6150 2600
Wire Wire Line
	6150 2400 6200 2400
Wire Wire Line
	6800 2500 6900 2500
Wire Wire Line
	6500 2500 6450 2500
Wire Wire Line
	6450 2350 6450 2500
Connection ~ 6450 2500
Wire Wire Line
	6450 2500 6150 2500
Wire Wire Line
	6450 2050 6450 2000
Wire Wire Line
	6450 2000 6200 2000
Wire Wire Line
	6200 2000 6200 2400
$Comp
L Device:C C2
U 1 1 61253F20
P 7250 2900
F 0 "C2" H 7135 2854 50  0000 R CNN
F 1 "C" H 7135 2945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7288 2750 50  0001 C CNN
F 3 "~" H 7250 2900 50  0001 C CNN
	1    7250 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 3050 7250 3300
Wire Wire Line
	6900 3300 7250 3300
Wire Wire Line
	6900 2500 7250 2500
Wire Wire Line
	7250 2500 7250 2750
Connection ~ 6900 2500
Text GLabel 7600 2500 2    50   Input ~ 0
5V
Wire Wire Line
	5450 2400 4950 2400
Text GLabel 3600 2400 0    50   Input ~ 0
12V
$Comp
L Device:C CIN3
U 1 1 61255E14
P 4400 2650
F 0 "CIN3" H 4285 2604 50  0000 R CNN
F 1 "0.1uF" H 4285 2695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4438 2500 50  0001 C CNN
F 3 "~" H 4400 2650 50  0001 C CNN
	1    4400 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 2500 4400 2400
$Comp
L power:GND #PWR0103
U 1 1 61256959
P 4400 2900
F 0 "#PWR0103" H 4400 2650 50  0001 C CNN
F 1 "GND" H 4405 2727 50  0000 C CNN
F 2 "" H 4400 2900 50  0001 C CNN
F 3 "" H 4400 2900 50  0001 C CNN
	1    4400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2900 4400 2850
$Comp
L Device:C C1
U 1 1 61257E4D
P 5400 3150
F 0 "C1" H 5285 3104 50  0000 R CNN
F 1 "1uF" H 5285 3195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5438 3000 50  0001 C CNN
F 3 "~" H 5400 3150 50  0001 C CNN
	1    5400 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5450 2700 5400 2700
$Comp
L power:GND #PWR0104
U 1 1 61258D90
P 5150 3400
F 0 "#PWR0104" H 5150 3150 50  0001 C CNN
F 1 "GND" H 5155 3227 50  0000 C CNN
F 2 "" H 5150 3400 50  0001 C CNN
F 3 "" H 5150 3400 50  0001 C CNN
	1    5150 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R RC1
U 1 1 6125987D
P 5150 2800
F 0 "RC1" H 5220 2846 50  0000 L CNN
F 1 "R" H 5220 2755 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5080 2800 50  0001 C CNN
F 3 "~" H 5150 2800 50  0001 C CNN
	1    5150 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C CC1
U 1 1 6125A0F6
P 5150 3150
F 0 "CC1" H 5035 3104 50  0000 R CNN
F 1 "C" H 5035 3195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5188 3000 50  0001 C CNN
F 3 "~" H 5150 3150 50  0001 C CNN
	1    5150 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5150 3000 5150 2950
Wire Wire Line
	5150 3300 5150 3350
Wire Wire Line
	5150 3350 5400 3350
Connection ~ 5150 3350
Wire Wire Line
	5150 3350 5150 3400
Wire Wire Line
	5400 3300 5400 3350
Wire Wire Line
	5450 2600 5150 2600
Wire Wire Line
	5150 2600 5150 2650
Wire Wire Line
	5400 2700 5400 3000
$Comp
L Device:R R3
U 1 1 6126616C
P 5200 2500
F 0 "R3" V 4993 2500 50  0000 C CNN
F 1 "10k" V 5084 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5130 2500 50  0001 C CNN
F 3 "~" H 5200 2500 50  0001 C CNN
	1    5200 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 2500 5450 2500
Wire Wire Line
	5050 2500 4950 2500
Wire Wire Line
	4950 2500 4950 2400
Text Notes 3000 3050 0    50   ~ 0
- Ceramic capacitor\n- Close to VIN pin and GND pin
Wire Wire Line
	7250 3350 7250 3300
Connection ~ 7250 3300
Wire Notes Line
	6200 2450 7450 2450
Wire Notes Line
	7450 2450 7450 3600
Wire Notes Line
	7450 3600 7050 3600
Wire Notes Line
	7050 3600 7050 2550
Wire Notes Line
	7050 2550 6200 2550
Wire Notes Line
	6200 2550 6200 2450
Text Notes 6900 3700 0    50   ~ 0
Geometrically short
Text GLabel 2550 2500 2    50   Input ~ 0
12V
$Comp
L power:GND #PWR0105
U 1 1 6124D551
P 2450 2750
F 0 "#PWR0105" H 2450 2500 50  0001 C CNN
F 1 "GND" H 2455 2577 50  0000 C CNN
F 2 "" H 2450 2750 50  0001 C CNN
F 3 "" H 2450 2750 50  0001 C CNN
	1    2450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2750 2450 2700
Wire Wire Line
	2450 2600 2300 2600
Wire Wire Line
	2300 2700 2450 2700
Connection ~ 2450 2700
Wire Wire Line
	2450 2700 2450 2600
Wire Wire Line
	2550 2500 2300 2500
Wire Wire Line
	7600 2500 7250 2500
Connection ~ 7250 2500
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 612659ED
P 2250 3550
F 0 "J2" H 2142 3225 50  0000 C CNN
F 1 "Conn_01x02_Female" H 2142 3316 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 2250 3550 50  0001 C CNN
F 3 "~" H 2250 3550 50  0001 C CNN
	1    2250 3550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 61267658
P 8850 2450
F 0 "J4" H 8878 2426 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8878 2335 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 8850 2450 50  0001 C CNN
F 3 "~" H 8850 2450 50  0001 C CNN
	1    8850 2450
	1    0    0    -1  
$EndComp
Text GLabel 2550 3450 2    50   Input ~ 0
12V
Wire Wire Line
	2550 3450 2450 3450
$Comp
L power:GND #PWR0106
U 1 1 612698CD
P 2550 3600
F 0 "#PWR0106" H 2550 3350 50  0001 C CNN
F 1 "GND" H 2555 3427 50  0000 C CNN
F 2 "" H 2550 3600 50  0001 C CNN
F 3 "" H 2550 3600 50  0001 C CNN
	1    2550 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3600 2550 3550
Wire Wire Line
	2550 3550 2450 3550
Text GLabel 8500 2450 0    50   Input ~ 0
5V
Wire Wire Line
	8500 2450 8650 2450
$Comp
L power:GND #PWR0107
U 1 1 6126D40F
P 8500 2650
F 0 "#PWR0107" H 8500 2400 50  0001 C CNN
F 1 "GND" H 8505 2477 50  0000 C CNN
F 2 "" H 8500 2650 50  0001 C CNN
F 3 "" H 8500 2650 50  0001 C CNN
	1    8500 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2650 8500 2550
Wire Wire Line
	8500 2550 8650 2550
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 6125DBCA
P 8850 3050
F 0 "J5" H 8878 3026 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8878 2935 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 8850 3050 50  0001 C CNN
F 3 "~" H 8850 3050 50  0001 C CNN
	1    8850 3050
	1    0    0    -1  
$EndComp
Text GLabel 8500 3050 0    50   Input ~ 0
5V
Wire Wire Line
	8500 3050 8650 3050
$Comp
L power:GND #PWR0108
U 1 1 6125DBD2
P 8500 3250
F 0 "#PWR0108" H 8500 3000 50  0001 C CNN
F 1 "GND" H 8505 3077 50  0000 C CNN
F 2 "" H 8500 3250 50  0001 C CNN
F 3 "" H 8500 3250 50  0001 C CNN
	1    8500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3250 8500 3150
Wire Wire Line
	8500 3150 8650 3150
Wire Notes Line
	8300 2300 9750 2300
Wire Notes Line
	9750 2300 9750 3500
Wire Notes Line
	9750 3500 8300 3500
Wire Notes Line
	8300 3500 8300 2300
Text Notes 8800 3600 0    50   ~ 0
USB breakout
$Comp
L Device:C CIN2
U 1 1 61263205
P 4100 2650
F 0 "CIN2" H 3985 2604 50  0000 R CNN
F 1 "10uF" H 3985 2695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4138 2500 50  0001 C CNN
F 3 "~" H 4100 2650 50  0001 C CNN
	1    4100 2650
	-1   0    0    1   
$EndComp
$Comp
L Device:C CIN1
U 1 1 6126362D
P 3800 2650
F 0 "CIN1" H 3685 2604 50  0000 R CNN
F 1 "10uF" H 3685 2695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3838 2500 50  0001 C CNN
F 3 "~" H 3800 2650 50  0001 C CNN
	1    3800 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 2400 3600 2450
Wire Wire Line
	3600 2400 3800 2400
Wire Wire Line
	3800 2500 3800 2400
Connection ~ 3800 2400
Wire Wire Line
	3800 2400 4100 2400
Wire Wire Line
	4100 2500 4100 2400
Connection ~ 4100 2400
Wire Wire Line
	4100 2400 4400 2400
Wire Wire Line
	3800 2800 3800 2850
Wire Wire Line
	3800 2850 4100 2850
Connection ~ 4400 2850
Wire Wire Line
	4400 2850 4400 2800
Wire Wire Line
	4100 2800 4100 2850
Connection ~ 4100 2850
Wire Wire Line
	4100 2850 4400 2850
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 612691DE
P 4750 2850
F 0 "J6" H 4642 2525 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4642 2616 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4750 2850 50  0001 C CNN
F 3 "~" H 4750 2850 50  0001 C CNN
	1    4750 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 2400 4950 2400
Connection ~ 4400 2400
Connection ~ 4950 2400
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 6127132F
P 4750 3200
F 0 "J7" H 4642 2875 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4642 2966 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4750 3200 50  0001 C CNN
F 3 "~" H 4750 3200 50  0001 C CNN
	1    4750 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 2850 4950 3100
Wire Wire Line
	4950 2750 4950 2600
Wire Wire Line
	4950 2600 5150 2600
Connection ~ 5150 2600
Wire Wire Line
	5150 3300 4950 3300
Wire Wire Line
	4950 3300 4950 3200
Connection ~ 5150 3300
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J8
U 1 1 6126B928
P 2150 5300
F 0 "J8" H 2200 6417 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 2200 6326 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20_Pitch2.54mm" H 2150 5300 50  0001 C CNN
F 3 "~" H 2150 5300 50  0001 C CNN
	1    2150 5300
	1    0    0    -1  
$EndComp
Text GLabel 2650 4400 2    50   Input ~ 0
5V
Wire Wire Line
	2650 4400 2550 4400
Wire Wire Line
	2450 4500 2550 4500
Wire Wire Line
	2550 4500 2550 4400
Connection ~ 2550 4400
Wire Wire Line
	2550 4400 2450 4400
Wire Wire Line
	2450 4600 2650 4600
Text GLabel 2650 4600 2    50   Input ~ 0
GND
Text GLabel 2650 5000 2    50   Input ~ 0
GND
Text GLabel 2650 5300 2    50   Input ~ 0
GND
Text GLabel 2650 5800 2    50   Input ~ 0
GND
Text GLabel 2650 6000 2    50   Input ~ 0
GND
Wire Wire Line
	2650 6000 2450 6000
Wire Wire Line
	2650 5000 2450 5000
Wire Wire Line
	2650 5300 2450 5300
Wire Wire Line
	2650 5800 2450 5800
Text GLabel 1800 6300 0    50   Input ~ 0
GND
Wire Wire Line
	1800 6300 1950 6300
Text GLabel 1800 5600 0    50   Input ~ 0
GND
Wire Wire Line
	1800 5600 1950 5600
Text GLabel 1800 4800 0    50   Input ~ 0
GND
Wire Wire Line
	1800 4800 1950 4800
$EndSCHEMATC
