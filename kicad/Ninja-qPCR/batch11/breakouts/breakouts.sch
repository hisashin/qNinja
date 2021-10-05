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
L Connector:Conn_01x04_Male J1
U 1 1 615B6A96
P 950 2300
F 0 "J1" H 1058 2581 50  0000 C CNN
F 1 "Conn_01x04_Male" H 1058 2490 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 950 2300 50  0001 C CNN
F 3 "~" H 950 2300 50  0001 C CNN
	1    950  2300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 615B86C2
P 2150 2300
F 0 "J4" H 2122 2274 50  0000 R CNN
F 1 "Conn_01x04_Male" H 2122 2183 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 2150 2300 50  0001 C CNN
F 3 "~" H 2150 2300 50  0001 C CNN
	1    2150 2300
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 615B9AE9
P 1000 4550
F 0 "J2" H 1108 4931 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1108 4840 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 1000 4550 50  0001 C CNN
F 3 "~" H 1000 4550 50  0001 C CNN
	1    1000 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 615BACC9
P 2100 4550
F 0 "J3" H 2072 4574 50  0000 R CNN
F 1 "Conn_01x05_Male" H 2072 4483 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 2100 4550 50  0001 C CNN
F 3 "~" H 2100 4550 50  0001 C CNN
	1    2100 4550
	-1   0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:A4955GLPTR-T U1
U 1 1 615B6595
P 3900 1350
F 0 "U1" H 4800 1637 60  0000 C CNN
F 1 "A4955GLPTR-T" H 4800 1531 60  0000 C CNN
F 2 "Ninja-qPCR:A4955GLPTR-T" H 4800 1540 60  0001 C CNN
F 3 "" H 3900 1350 60  0000 C CNN
	1    3900 1350
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:AM4967 U2
U 1 1 615B6665
P 6650 1550
F 0 "U2" H 7200 1815 50  0000 C CNN
F 1 "AM4967" H 7200 1724 50  0000 C CNN
F 2 "Housings_SSOP:SSOP-16_3.9x4.9mm_Pitch0.635mm" H 7200 1750 50  0001 C CNN
F 3 "" H 7200 1750 50  0001 C CNN
	1    6650 1550
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:BD61250MUV-E2‎ U3
U 1 1 615B7AC2
P 8600 1200
F 0 "U3" H 9300 1465 50  0000 C CNN
F 1 "BD61250MUV-E2‎" H 9300 1374 50  0000 C CNN
F 2 "Ninja-qPCR:BD61250MUV-E2" H 8600 1200 50  0001 C CNN
F 3 "" H 8600 1200 50  0001 C CNN
	1    8600 1200
	1    0    0    -1  
$EndComp
Text HLabel 950  1200 0    50   Input ~ 0
A2
Text HLabel 950  1600 0    50   Input ~ 0
A3
Text HLabel 1350 750  0    50   Input ~ 0
A4
Text HLabel 1350 1900 0    50   Input ~ 0
A5
Text HLabel 1550 1800 0    50   Input ~ 0
A1
Text HLabel 1650 1800 2    50   Input ~ 0
A8
Text HLabel 2250 1200 2    50   Input ~ 0
A6
Text HLabel 2250 1600 2    50   Input ~ 0
A7
$Comp
L Ninja-qPCR:EP2-3L3SAb K2
U 1 1 615B7084
P 1050 1200
F 0 "K2" H 1600 1603 60  0000 C CNN
F 1 "EP2-3L3SAb" H 1600 1497 60  0000 C CNN
F 2 "Ninja-qPCR:EP2-3L3SAb" H 1550 1890 60  0001 C CNN
F 3 "" H 1050 1200 60  0000 C CNN
	1    1050 1200
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:EX2-2U1S K1
U 1 1 615B92DF
P 1000 3200
F 0 "K1" H 1550 3603 60  0000 C CNN
F 1 "EX2-2U1S" H 1550 3497 60  0000 C CNN
F 2 "Ninja-qPCR:EX2-2U1S" H 1500 3890 60  0001 C CNN
F 3 "" H 1000 3200 60  0000 C CNN
	1    1000 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 750  1350 1000
Wire Wire Line
	1050 1200 950  1200
Wire Wire Line
	1050 1600 950  1600
Wire Wire Line
	2150 1200 2250 1200
Wire Wire Line
	2250 1600 2150 1600
Wire Wire Line
	1650 1800 1650 1400
Wire Wire Line
	1550 1800 1550 1400
Wire Wire Line
	1350 1900 1350 1800
Text HLabel 1300 2200 2    50   Input ~ 0
A1
Text HLabel 1300 2300 2    50   Input ~ 0
A2
Text HLabel 1300 2400 2    50   Input ~ 0
A3
Text HLabel 1300 2500 2    50   Input ~ 0
A4
Text HLabel 1800 2200 0    50   Input ~ 0
A5
Text HLabel 1800 2300 0    50   Input ~ 0
A6
Text HLabel 1800 2400 0    50   Input ~ 0
A7
Text HLabel 1800 2500 0    50   Input ~ 0
A8
Wire Wire Line
	1950 2200 1800 2200
Wire Wire Line
	1800 2300 1950 2300
Wire Wire Line
	1950 2400 1800 2400
Wire Wire Line
	1800 2500 1950 2500
Wire Wire Line
	1300 2500 1150 2500
Wire Wire Line
	1150 2400 1300 2400
Wire Wire Line
	1300 2300 1150 2300
Wire Wire Line
	1150 2200 1300 2200
Text HLabel 1500 3800 0    50   Input ~ 0
B1
Text HLabel 1600 3800 2    50   Input ~ 0
B6
Text HLabel 850  3200 0    50   Input ~ 0
B2
Text HLabel 850  3600 0    50   Input ~ 0
B3
Text HLabel 1300 2800 0    50   Input ~ 0
B5
Text HLabel 1800 2800 2    50   Input ~ 0
B9
Text HLabel 1300 3950 0    50   Input ~ 0
B4
Text HLabel 1800 3950 2    50   Input ~ 0
B10
Text HLabel 2250 3200 2    50   Input ~ 0
B7
Text HLabel 2250 3600 2    50   Input ~ 0
B8
Wire Wire Line
	1800 3950 1800 3800
Wire Wire Line
	1300 3950 1300 3800
Wire Wire Line
	1500 3800 1500 3400
Wire Wire Line
	1600 3800 1600 3400
Wire Wire Line
	2250 3600 2100 3600
Wire Wire Line
	2250 3200 2100 3200
Wire Wire Line
	1800 2800 1800 3000
Wire Wire Line
	1300 2800 1300 3000
Wire Wire Line
	850  3200 1000 3200
Wire Wire Line
	850  3600 1000 3600
Text HLabel 1350 4350 2    50   Input ~ 0
B1
Text HLabel 1350 4450 2    50   Input ~ 0
B2
Text HLabel 1350 4550 2    50   Input ~ 0
B3
Text HLabel 1350 4650 2    50   Input ~ 0
B4
Text HLabel 1350 4750 2    50   Input ~ 0
B5
Text HLabel 1750 4350 0    50   Input ~ 0
B6
Text HLabel 1750 4450 0    50   Input ~ 0
B7
Text HLabel 1750 4550 0    50   Input ~ 0
B8
Text HLabel 1750 4650 0    50   Input ~ 0
B9
Text HLabel 1750 4750 0    50   Input ~ 0
B10
Wire Wire Line
	1900 4350 1750 4350
Wire Wire Line
	1750 4450 1900 4450
Wire Wire Line
	1900 4550 1750 4550
Wire Wire Line
	1750 4650 1900 4650
Wire Wire Line
	1900 4750 1750 4750
Wire Wire Line
	1350 4750 1200 4750
Wire Wire Line
	1200 4650 1350 4650
Wire Wire Line
	1350 4550 1200 4550
Wire Wire Line
	1200 4450 1350 4450
Wire Wire Line
	1350 4350 1200 4350
$Comp
L Connector:Conn_01x10_Male J5
U 1 1 615CEAE2
P 4300 3900
F 0 "J5" H 4408 4481 50  0000 C CNN
F 1 "Conn_01x10_Male" H 4408 4390 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 4300 3900 50  0001 C CNN
F 3 "~" H 4300 3900 50  0001 C CNN
	1    4300 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J6
U 1 1 615D082C
P 5500 3900
F 0 "J6" H 5472 3874 50  0000 R CNN
F 1 "Conn_01x10_Male" H 5472 3783 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 5500 3900 50  0001 C CNN
F 3 "~" H 5500 3900 50  0001 C CNN
	1    5500 3900
	-1   0    0    -1  
$EndComp
Text HLabel 3800 1350 0    50   Input ~ 0
C17
Text HLabel 3800 1450 0    50   Input ~ 0
C19
Text HLabel 3800 1750 0    50   Input ~ 0
C8
Text HLabel 3800 1850 0    50   Input ~ 0
C7
Text HLabel 3800 1950 0    50   Input ~ 0
C9
Text HLabel 3800 2100 0    50   Input ~ 0
C6
Text HLabel 3800 2200 0    50   Input ~ 0
C5
Text HLabel 3800 2350 0    50   Input ~ 0
C3
Text HLabel 3800 2450 0    50   Input ~ 0
C2
Text HLabel 3800 2550 0    50   Input ~ 0
C4
Text HLabel 3800 2850 0    50   Input ~ 0
C1
Text HLabel 5800 1350 2    50   Input ~ 0
C15
Text HLabel 5800 1550 2    50   Input ~ 0
C13
Text HLabel 5800 1750 2    50   Input ~ 0
C14
Text HLabel 5800 1950 2    50   Input ~ 0
C16
Text HLabel 5800 2150 2    50   Input ~ 0
C12
Text HLabel 5800 2350 2    50   Input ~ 0
C11
Text HLabel 5800 2550 2    50   Input ~ 0
C10
Text HLabel 5800 2750 2    50   Input ~ 0
C20
Text HLabel 5800 2850 2    50   Input ~ 0
C18
Wire Wire Line
	5800 2850 5650 2850
Wire Wire Line
	5800 2750 5650 2750
Wire Wire Line
	5800 2550 5650 2550
Wire Wire Line
	5800 2350 5650 2350
Wire Wire Line
	5800 2150 5650 2150
Wire Wire Line
	5800 1950 5650 1950
Wire Wire Line
	5800 1750 5650 1750
Wire Wire Line
	5800 1550 5650 1550
Wire Wire Line
	5800 1350 5650 1350
Wire Wire Line
	3950 1350 3800 1350
Wire Wire Line
	3800 1450 3950 1450
Wire Wire Line
	3950 1750 3800 1750
Wire Wire Line
	3800 1850 3950 1850
Wire Wire Line
	3950 1950 3800 1950
Wire Wire Line
	3800 2100 3950 2100
Wire Wire Line
	3950 2200 3800 2200
Wire Wire Line
	3800 2350 3950 2350
Wire Wire Line
	3950 2450 3800 2450
Wire Wire Line
	3800 2550 3950 2550
Wire Wire Line
	3950 2850 3800 2850
Text HLabel 4650 3500 2    50   Input ~ 0
C1
Text HLabel 4650 3600 2    50   Input ~ 0
C2
Text HLabel 4650 3700 2    50   Input ~ 0
C3
Text HLabel 4650 3800 2    50   Input ~ 0
C4
Text HLabel 4650 3900 2    50   Input ~ 0
C5
Text HLabel 4650 4000 2    50   Input ~ 0
C6
Text HLabel 4650 4100 2    50   Input ~ 0
C7
Text HLabel 4650 4200 2    50   Input ~ 0
C8
Text HLabel 4650 4300 2    50   Input ~ 0
C9
Text HLabel 4650 4400 2    50   Input ~ 0
C10
Text HLabel 5150 4400 0    50   Input ~ 0
C11
Text HLabel 5150 4300 0    50   Input ~ 0
C12
Text HLabel 5150 4200 0    50   Input ~ 0
C13
Text HLabel 5150 4100 0    50   Input ~ 0
C14
Text HLabel 5150 4000 0    50   Input ~ 0
C15
Text HLabel 5150 3900 0    50   Input ~ 0
C16
Text HLabel 5150 3800 0    50   Input ~ 0
C17
Text HLabel 5150 3700 0    50   Input ~ 0
C18
Text HLabel 5150 3600 0    50   Input ~ 0
C19
Text HLabel 5150 3500 0    50   Input ~ 0
C20
Wire Wire Line
	5300 4400 5150 4400
Wire Wire Line
	5150 4300 5300 4300
Wire Wire Line
	5300 4200 5150 4200
Wire Wire Line
	5150 4100 5300 4100
Wire Wire Line
	5300 4000 5150 4000
Wire Wire Line
	5150 3900 5300 3900
Wire Wire Line
	5300 3800 5150 3800
Wire Wire Line
	5150 3700 5300 3700
Wire Wire Line
	5300 3600 5150 3600
Wire Wire Line
	5150 3500 5300 3500
Wire Wire Line
	4650 3500 4500 3500
Wire Wire Line
	4500 3600 4650 3600
Wire Wire Line
	4650 3700 4500 3700
Wire Wire Line
	4500 3800 4650 3800
Wire Wire Line
	4650 3900 4500 3900
Wire Wire Line
	4500 4000 4650 4000
Wire Wire Line
	4650 4100 4500 4100
Wire Wire Line
	4500 4200 4650 4200
Wire Wire Line
	4650 4300 4500 4300
Wire Wire Line
	4500 4400 4650 4400
$Comp
L Connector:Conn_01x08_Male J7
U 1 1 61611AFB
P 6650 3400
F 0 "J7" H 6758 3881 50  0000 C CNN
F 1 "Conn_01x08_Male" H 6758 3790 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 6650 3400 50  0001 C CNN
F 3 "~" H 6650 3400 50  0001 C CNN
	1    6650 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J8
U 1 1 61612D55
P 7800 3400
F 0 "J8" H 7772 3374 50  0000 R CNN
F 1 "Conn_01x08_Male" H 7772 3283 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 7800 3400 50  0001 C CNN
F 3 "~" H 7800 3400 50  0001 C CNN
	1    7800 3400
	-1   0    0    -1  
$EndComp
Text HLabel 6550 1550 0    50   Input ~ 0
D11
Text HLabel 6550 1650 0    50   Input ~ 0
D3
Text HLabel 6550 1750 0    50   Input ~ 0
D13
Text HLabel 6550 1900 0    50   Input ~ 0
D10
Text HLabel 6550 2000 0    50   Input ~ 0
D9
Text HLabel 6550 2200 0    50   Input ~ 0
D12
Text HLabel 6550 2300 0    50   Input ~ 0
D5
Text HLabel 6550 2400 0    50   Input ~ 0
D6
Text HLabel 6550 2500 0    50   Input ~ 0
D7
Text HLabel 7850 1550 2    50   Input ~ 0
D8
Text HLabel 7850 1800 2    50   Input ~ 0
D15
Text HLabel 7850 1900 2    50   Input ~ 0
D16
Text HLabel 7850 2000 2    50   Input ~ 0
D2
Text HLabel 7850 2100 2    50   Input ~ 0
D1
Text HLabel 7850 2400 2    50   Input ~ 0
D4
Text HLabel 7850 2500 2    50   Input ~ 0
D14
Wire Wire Line
	6650 1550 6550 1550
Wire Wire Line
	6650 1650 6550 1650
Wire Wire Line
	6550 1750 6650 1750
Wire Wire Line
	6550 1900 6650 1900
Wire Wire Line
	6550 2000 6650 2000
Wire Wire Line
	6550 2200 6650 2200
Wire Wire Line
	6550 2300 6650 2300
Wire Wire Line
	6550 2400 6650 2400
Wire Wire Line
	6550 2500 6650 2500
Wire Wire Line
	7850 1550 7750 1550
Wire Wire Line
	7750 1800 7850 1800
Wire Wire Line
	7850 1900 7750 1900
Wire Wire Line
	7750 2000 7850 2000
Wire Wire Line
	7850 2100 7750 2100
Wire Wire Line
	7750 2400 7850 2400
Wire Wire Line
	7850 2500 7750 2500
Text HLabel 7500 3600 0    50   Input ~ 0
D11
Text HLabel 7000 3300 2    50   Input ~ 0
D3
Text HLabel 7500 3400 0    50   Input ~ 0
D13
Text HLabel 7500 3700 0    50   Input ~ 0
D10
Text HLabel 7500 3800 0    50   Input ~ 0
D9
Text HLabel 7500 3500 0    50   Input ~ 0
D12
Text HLabel 7000 3500 2    50   Input ~ 0
D5
Text HLabel 7000 3600 2    50   Input ~ 0
D6
Text HLabel 7000 3700 2    50   Input ~ 0
D7
Text HLabel 7500 3300 0    50   Input ~ 0
D14
Text HLabel 7000 3400 2    50   Input ~ 0
D4
Text HLabel 7000 3100 2    50   Input ~ 0
D1
Text HLabel 7000 3200 2    50   Input ~ 0
D2
Text HLabel 7500 3100 0    50   Input ~ 0
D16
Text HLabel 7500 3200 0    50   Input ~ 0
D15
Text HLabel 7000 3800 2    50   Input ~ 0
D8
Wire Wire Line
	7000 3100 6850 3100
Wire Wire Line
	6850 3200 7000 3200
Wire Wire Line
	6850 3300 7000 3300
Wire Wire Line
	6850 3400 7000 3400
Wire Wire Line
	6850 3500 7000 3500
Wire Wire Line
	6850 3600 7000 3600
Wire Wire Line
	6850 3700 7000 3700
Wire Wire Line
	6850 3800 7000 3800
Wire Wire Line
	7600 3100 7500 3100
Wire Wire Line
	7500 3200 7600 3200
Wire Wire Line
	7600 3300 7500 3300
Wire Wire Line
	7600 3400 7500 3400
Wire Wire Line
	7500 3500 7600 3500
Wire Wire Line
	7500 3600 7600 3600
Wire Wire Line
	7500 3700 7600 3700
Wire Wire Line
	7500 3800 7600 3800
$Comp
L Connector:Conn_01x12_Male J9
U 1 1 616907A1
P 8650 3750
F 0 "J9" H 8758 4431 50  0000 C CNN
F 1 "Conn_01x12_Male" H 8758 4340 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x12_Pitch2.54mm" H 8650 3750 50  0001 C CNN
F 3 "~" H 8650 3750 50  0001 C CNN
	1    8650 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Male J10
U 1 1 616927A1
P 9850 3750
F 0 "J10" H 9822 3724 50  0000 R CNN
F 1 "Conn_01x12_Male" H 9822 3633 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x12_Pitch2.54mm" H 9850 3750 50  0001 C CNN
F 3 "~" H 9850 3750 50  0001 C CNN
	1    9850 3750
	-1   0    0    -1  
$EndComp
Text HLabel 8450 1200 0    50   Input ~ 0
E12
Text HLabel 8450 1400 0    50   Input ~ 0
E14
Text HLabel 8450 1600 0    50   Input ~ 0
E4
Text HLabel 8450 1800 0    50   Input ~ 0
E15
Text HLabel 8450 2000 0    50   Input ~ 0
E16
Text HLabel 8450 2100 0    50   Input ~ 0
E17
Text HLabel 8450 2300 0    50   Input ~ 0
E18
Text HLabel 8450 2400 0    50   Input ~ 0
E19
Text HLabel 8450 2500 0    50   Input ~ 0
E20
Text HLabel 8450 2600 0    50   Input ~ 0
E21
Text HLabel 8450 2700 0    50   Input ~ 0
E22
Text HLabel 8450 2800 0    50   Input ~ 0
E23
Text HLabel 8450 2900 0    50   Input ~ 0
E24
Text HLabel 10200 1200 2    50   Input ~ 0
E2
Text HLabel 10200 1300 2    50   Input ~ 0
E3
Text HLabel 10200 1500 2    50   Input ~ 0
E11
Text HLabel 10200 1700 2    50   Input ~ 0
E10
Text HLabel 10200 1900 2    50   Input ~ 0
E9
Text HLabel 10200 2100 2    50   Input ~ 0
E8
Text HLabel 10200 2300 2    50   Input ~ 0
E5
Text HLabel 10200 2400 2    50   Input ~ 0
E13
Text HLabel 10200 2600 2    50   Input ~ 0
E6
Text HLabel 10200 2700 2    50   Input ~ 0
E7
Text HLabel 10200 2800 2    50   Input ~ 0
E25
Text HLabel 10200 2900 2    50   Input ~ 0
E1
Text HLabel 9000 4350 2    50   Input ~ 0
E12
Text HLabel 9500 4250 0    50   Input ~ 0
E14
Text HLabel 9000 3550 2    50   Input ~ 0
E4
Text HLabel 9500 4150 0    50   Input ~ 0
E15
Text HLabel 9500 4050 0    50   Input ~ 0
E16
Text HLabel 9500 3950 0    50   Input ~ 0
E17
Text HLabel 9500 3850 0    50   Input ~ 0
E18
Text HLabel 9500 3750 0    50   Input ~ 0
E19
Text HLabel 9500 3650 0    50   Input ~ 0
E20
Text HLabel 9500 3550 0    50   Input ~ 0
E21
Text HLabel 9500 3450 0    50   Input ~ 0
E22
Text HLabel 9500 3350 0    50   Input ~ 0
E23
Text HLabel 9500 3250 0    50   Input ~ 0
E24
Text HLabel 9000 3350 2    50   Input ~ 0
E2
Text HLabel 9000 3450 2    50   Input ~ 0
E3
Text HLabel 9000 4250 2    50   Input ~ 0
E11
Text HLabel 9000 4150 2    50   Input ~ 0
E10
Text HLabel 9000 4050 2    50   Input ~ 0
E9
Text HLabel 9000 3950 2    50   Input ~ 0
E8
Text HLabel 9000 3650 2    50   Input ~ 0
E5
Text HLabel 9500 4350 0    50   Input ~ 0
E13
Text HLabel 9000 3750 2    50   Input ~ 0
E6
Text HLabel 9000 3850 2    50   Input ~ 0
E7
Text HLabel 9000 3250 2    50   Input ~ 0
E1
Wire Wire Line
	8450 1200 8600 1200
Wire Wire Line
	8450 1400 8600 1400
Wire Wire Line
	8450 1600 8600 1600
Wire Wire Line
	8450 1800 8600 1800
Wire Wire Line
	8450 2000 8600 2000
Wire Wire Line
	8450 2100 8600 2100
Wire Wire Line
	8450 2300 8600 2300
Wire Wire Line
	8450 2400 8600 2400
Wire Wire Line
	8450 2500 8600 2500
Wire Wire Line
	8450 2600 8600 2600
Wire Wire Line
	8450 2700 8600 2700
Wire Wire Line
	8450 2800 8600 2800
Wire Wire Line
	8450 2900 8600 2900
Wire Wire Line
	10200 1200 10000 1200
Wire Wire Line
	10200 1300 10000 1300
Wire Wire Line
	10200 1500 10000 1500
Wire Wire Line
	10200 1700 10000 1700
Wire Wire Line
	10200 1900 10000 1900
Wire Wire Line
	10200 2100 10000 2100
Wire Wire Line
	10200 2300 10000 2300
Wire Wire Line
	10200 2400 10000 2400
Wire Wire Line
	10200 2600 10000 2600
Wire Wire Line
	10200 2700 10000 2700
Wire Wire Line
	10200 2800 10000 2800
Wire Wire Line
	10200 2900 10000 2900
Wire Wire Line
	9000 3250 8850 3250
Wire Wire Line
	8850 3350 9000 3350
Wire Wire Line
	8850 3450 9000 3450
Wire Wire Line
	8850 3550 9000 3550
Wire Wire Line
	8850 3650 9000 3650
Wire Wire Line
	8850 3750 9000 3750
Wire Wire Line
	8850 3850 9000 3850
Wire Wire Line
	8850 3950 9000 3950
Wire Wire Line
	8850 4050 9000 4050
Wire Wire Line
	8850 4150 9000 4150
Wire Wire Line
	8850 4250 9000 4250
Wire Wire Line
	8850 4350 9000 4350
Wire Wire Line
	9650 4350 9500 4350
Wire Wire Line
	9500 4250 9650 4250
Wire Wire Line
	9650 4150 9500 4150
Wire Wire Line
	9500 4050 9650 4050
Wire Wire Line
	9650 3950 9500 3950
Wire Wire Line
	9500 3850 9650 3850
Wire Wire Line
	9650 3750 9500 3750
Wire Wire Line
	9500 3650 9650 3650
Wire Wire Line
	9650 3550 9500 3550
Wire Wire Line
	9500 3450 9650 3450
Wire Wire Line
	9650 3350 9500 3350
Wire Wire Line
	9500 3250 9650 3250
Text HLabel 1250 5350 2    50   Input ~ 0
F1
$Comp
L Connector:Conn_01x06_Male J11
U 1 1 615D93EA
P 900 5550
F 0 "J11" H 1008 5931 50  0000 C CNN
F 1 "Conn_01x06_Male" H 1008 5840 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 900 5550 50  0001 C CNN
F 3 "~" H 900 5550 50  0001 C CNN
	1    900  5550
	1    0    0    -1  
$EndComp
Text HLabel 1250 5450 2    50   Input ~ 0
F2
Text HLabel 1250 5550 2    50   Input ~ 0
F3
Text HLabel 1250 5650 2    50   Input ~ 0
F4
Text HLabel 1250 5750 2    50   Input ~ 0
F5
Text HLabel 1250 5850 2    50   Input ~ 0
F6
Wire Wire Line
	1100 5350 1250 5350
Wire Wire Line
	1100 5450 1250 5450
Wire Wire Line
	1100 5550 1250 5550
Wire Wire Line
	1100 5650 1250 5650
Wire Wire Line
	1100 5750 1250 5750
Wire Wire Line
	1100 5850 1250 5850
Text HLabel 1800 5600 0    50   Input ~ 0
F1
Text HLabel 1800 5700 0    50   Input ~ 0
F2
Text HLabel 3700 5600 2    50   Input ~ 0
F3
Text HLabel 3700 5400 2    50   Input ~ 0
F4
Text HLabel 1800 5500 0    50   Input ~ 0
F5
Text HLabel 1800 5400 0    50   Input ~ 0
F6
Wire Wire Line
	3700 5400 3600 5400
Wire Wire Line
	3700 5600 3600 5600
Wire Wire Line
	3550 5700 3600 5700
Wire Wire Line
	3600 5700 3600 5600
Connection ~ 3600 5600
Wire Wire Line
	3600 5600 3550 5600
Wire Wire Line
	3550 5500 3600 5500
Wire Wire Line
	3600 5500 3600 5400
Connection ~ 3600 5400
Wire Wire Line
	3600 5400 3550 5400
Wire Wire Line
	1950 5400 1800 5400
Wire Wire Line
	1800 5500 1950 5500
Wire Wire Line
	1950 5600 1800 5600
Wire Wire Line
	1800 5700 1950 5700
$Comp
L Ninja-qPCR:8-PowerTDFN-PN U4
U 1 1 615DC9BE
P 1950 5400
F 0 "U4" H 2750 5787 60  0000 C CNN
F 1 "8-PowerTDFN-PN" H 2750 5681 60  0000 C CNN
F 2 "Ninja-qPCR:8-PowerTDFN" H 2750 5640 60  0001 C CNN
F 3 "" H 1950 5400 60  0000 C CNN
	1    1950 5400
	1    0    0    -1  
$EndComp
Text HLabel 1250 6350 2    50   Input ~ 0
G1
$Comp
L Connector:Conn_01x06_Male J12
U 1 1 615E1C81
P 900 6550
F 0 "J12" H 1008 6931 50  0000 C CNN
F 1 "Conn_01x06_Male" H 1008 6840 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 900 6550 50  0001 C CNN
F 3 "~" H 900 6550 50  0001 C CNN
	1    900  6550
	1    0    0    -1  
$EndComp
Text HLabel 1250 6450 2    50   Input ~ 0
G2
Text HLabel 1250 6550 2    50   Input ~ 0
G3
Text HLabel 1250 6650 2    50   Input ~ 0
G4
Text HLabel 1250 6750 2    50   Input ~ 0
G5
Text HLabel 1250 6850 2    50   Input ~ 0
G6
Wire Wire Line
	1100 6350 1250 6350
Wire Wire Line
	1100 6450 1250 6450
Wire Wire Line
	1100 6550 1250 6550
Wire Wire Line
	1100 6650 1250 6650
Wire Wire Line
	1100 6750 1250 6750
Wire Wire Line
	1100 6850 1250 6850
Text HLabel 1800 6600 0    50   Input ~ 0
G1
Text HLabel 1800 6700 0    50   Input ~ 0
G2
Text HLabel 3700 6600 2    50   Input ~ 0
G3
Text HLabel 3700 6400 2    50   Input ~ 0
G4
Text HLabel 1800 6500 0    50   Input ~ 0
G5
Text HLabel 1800 6400 0    50   Input ~ 0
G6
Wire Wire Line
	3700 6400 3600 6400
Wire Wire Line
	3700 6600 3600 6600
Wire Wire Line
	3550 6700 3600 6700
Wire Wire Line
	3600 6700 3600 6600
Connection ~ 3600 6600
Wire Wire Line
	3600 6600 3550 6600
Wire Wire Line
	3550 6500 3600 6500
Wire Wire Line
	3600 6500 3600 6400
Connection ~ 3600 6400
Wire Wire Line
	3600 6400 3550 6400
Wire Wire Line
	1950 6400 1800 6400
Wire Wire Line
	1800 6500 1950 6500
Wire Wire Line
	1950 6600 1800 6600
Wire Wire Line
	1800 6700 1950 6700
$Comp
L Ninja-qPCR:8-PowerTDFN-NN U5
U 1 1 6160647D
P 1950 6400
F 0 "U5" H 2750 6787 60  0000 C CNN
F 1 "8-PowerTDFN-NN" H 2750 6681 60  0000 C CNN
F 2 "Ninja-qPCR:8-PowerTDFN" H 2750 6640 60  0001 C CNN
F 3 "" H 1950 6400 60  0000 C CNN
	1    1950 6400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J13
U 1 1 6160DAD3
P 5150 5750
F 0 "J13" H 5258 6131 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5258 6040 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 5150 5750 50  0001 C CNN
F 3 "~" H 5150 5750 50  0001 C CNN
	1    5150 5750
	1    0    0    -1  
$EndComp
Text HLabel 5500 5550 2    50   Input ~ 0
H1
Text HLabel 5500 5650 2    50   Input ~ 0
H2
Text HLabel 5500 5750 2    50   Input ~ 0
H3
Text HLabel 5500 5850 2    50   Input ~ 0
H4
Text HLabel 5500 5950 2    50   Input ~ 0
H5
Wire Wire Line
	5500 5550 5350 5550
Wire Wire Line
	5350 5650 5500 5650
Wire Wire Line
	5350 5750 5500 5750
Wire Wire Line
	5350 5850 5500 5850
Wire Wire Line
	5350 5950 5500 5950
$Comp
L Ninja-qPCR:SiZ346DT U6
U 1 1 615D95B9
P 6350 5150
F 0 "U6" H 7150 5537 60  0000 C CNN
F 1 "SiZ346DT" H 7150 5431 60  0000 C CNN
F 2 "Ninja-qPCR:SiZ346DT" H 7150 5390 60  0001 C CNN
F 3 "" H 7950 4950 60  0000 C CNN
	1    6350 5150
	1    0    0    -1  
$EndComp
Text HLabel 8150 5600 2    50   Input ~ 0
H1
Text HLabel 6250 5700 0    50   Input ~ 0
H2
Text HLabel 7950 5250 2    50   Input ~ 0
H3
Text HLabel 6250 5350 0    50   Input ~ 0
H4
Text HLabel 6250 5250 0    50   Input ~ 0
H5
Wire Wire Line
	6350 5700 6250 5700
Wire Wire Line
	6350 5350 6250 5350
Wire Wire Line
	6350 5250 6300 5250
Wire Wire Line
	6350 5050 6300 5050
Wire Wire Line
	6300 5050 6300 5150
Connection ~ 6300 5250
Wire Wire Line
	6300 5250 6250 5250
Wire Wire Line
	6350 5150 6300 5150
Connection ~ 6300 5150
Wire Wire Line
	6300 5150 6300 5250
Wire Wire Line
	7850 5250 7950 5250
Wire Wire Line
	8150 5600 8050 5600
Wire Wire Line
	7950 5900 8050 5900
Wire Wire Line
	8050 5900 8050 5800
Connection ~ 8050 5600
Wire Wire Line
	8050 5600 7950 5600
Wire Wire Line
	7950 5800 8050 5800
Connection ~ 8050 5800
Wire Wire Line
	8050 5800 8050 5700
Wire Wire Line
	7950 5700 8050 5700
Connection ~ 8050 5700
Wire Wire Line
	8050 5700 8050 5600
$Comp
L Connector:Conn_01x10_Male J?
U 1 1 616A141E
P 9500 6100
F 0 "J?" H 9608 6681 50  0000 C CNN
F 1 "Conn_01x10_Male" H 9608 6590 50  0000 C CNN
F 2 "" H 9500 6100 50  0001 C CNN
F 3 "~" H 9500 6100 50  0001 C CNN
	1    9500 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J?
U 1 1 616A3AE2
P 10550 6100
F 0 "J?" H 10522 6074 50  0000 R CNN
F 1 "Conn_01x10_Male" H 10522 5983 50  0000 R CNN
F 2 "" H 10550 6100 50  0001 C CNN
F 3 "~" H 10550 6100 50  0001 C CNN
	1    10550 6100
	-1   0    0    -1  
$EndComp
Text HLabel 9850 5700 2    50   Input ~ 0
I1
Text HLabel 9850 5800 2    50   Input ~ 0
I2
Text HLabel 9850 5900 2    50   Input ~ 0
I3
Text HLabel 9850 6000 2    50   Input ~ 0
I4
Text HLabel 9850 6100 2    50   Input ~ 0
I5
Text HLabel 9850 6200 2    50   Input ~ 0
I6
Text HLabel 9850 6300 2    50   Input ~ 0
I7
Text HLabel 9850 6400 2    50   Input ~ 0
I8
Text HLabel 9850 6500 2    50   Input ~ 0
I9
Text HLabel 9850 6600 2    50   Input ~ 0
I10
$EndSCHEMATC
