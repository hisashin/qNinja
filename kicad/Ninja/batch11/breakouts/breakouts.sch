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
P 3350 1000
F 0 "U1" H 4250 1287 60  0000 C CNN
F 1 "A4955GLPTR-T" H 4250 1181 60  0000 C CNN
F 2 "Ninja-qPCR:A4955GLPTR-T" H 4250 1190 60  0001 C CNN
F 3 "" H 3350 1000 60  0000 C CNN
	1    3350 1000
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:AM4967 U2
U 1 1 615B6665
P 6250 1300
F 0 "U2" H 6800 1565 50  0000 C CNN
F 1 "AM4967" H 6800 1474 50  0000 C CNN
F 2 "Housings_SSOP:SSOP-16_3.9x4.9mm_Pitch0.635mm" H 6800 1500 50  0001 C CNN
F 3 "" H 6800 1500 50  0001 C CNN
	1    6250 1300
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:BD61250MUV-E2‎ U3
U 1 1 615B7AC2
P 8650 950
F 0 "U3" H 9350 1215 50  0000 C CNN
F 1 "BD61250MUV-E2‎" H 9350 1124 50  0000 C CNN
F 2 "Ninja-qPCR:BD61250MUV-E2" H 8650 950 50  0001 C CNN
F 3 "" H 8650 950 50  0001 C CNN
	1    8650 950 
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
P 3750 3550
F 0 "J5" H 3858 4131 50  0000 C CNN
F 1 "Conn_01x10_Male" H 3858 4040 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 3750 3550 50  0001 C CNN
F 3 "~" H 3750 3550 50  0001 C CNN
	1    3750 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J6
U 1 1 615D082C
P 4950 3550
F 0 "J6" H 4922 3524 50  0000 R CNN
F 1 "Conn_01x10_Male" H 4922 3433 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 4950 3550 50  0001 C CNN
F 3 "~" H 4950 3550 50  0001 C CNN
	1    4950 3550
	-1   0    0    -1  
$EndComp
Text HLabel 3250 1000 0    50   Input ~ 0
C17
Text HLabel 3250 1100 0    50   Input ~ 0
C19
Text HLabel 3250 1400 0    50   Input ~ 0
C8
Text HLabel 3250 1500 0    50   Input ~ 0
C7
Text HLabel 3250 1600 0    50   Input ~ 0
C9
Text HLabel 3250 1750 0    50   Input ~ 0
C6
Text HLabel 3250 1850 0    50   Input ~ 0
C5
Text HLabel 3250 2000 0    50   Input ~ 0
C3
Text HLabel 3250 2100 0    50   Input ~ 0
C2
Text HLabel 3250 2200 0    50   Input ~ 0
C4
Text HLabel 3250 2500 0    50   Input ~ 0
C1
Text HLabel 5250 1000 2    50   Input ~ 0
C15
Text HLabel 5250 1200 2    50   Input ~ 0
C13
Text HLabel 5250 1400 2    50   Input ~ 0
C14
Text HLabel 5250 1600 2    50   Input ~ 0
C16
Text HLabel 5250 1800 2    50   Input ~ 0
C12
Text HLabel 5250 2000 2    50   Input ~ 0
C11
Text HLabel 5250 2200 2    50   Input ~ 0
C10
Text HLabel 5250 2400 2    50   Input ~ 0
C20
Text HLabel 5250 2500 2    50   Input ~ 0
C18
Wire Wire Line
	5250 2500 5100 2500
Wire Wire Line
	5250 2400 5100 2400
Wire Wire Line
	5250 2200 5100 2200
Wire Wire Line
	5250 2000 5100 2000
Wire Wire Line
	5250 1800 5100 1800
Wire Wire Line
	5250 1600 5100 1600
Wire Wire Line
	5250 1400 5100 1400
Wire Wire Line
	5250 1200 5100 1200
Wire Wire Line
	5250 1000 5100 1000
Wire Wire Line
	3400 1000 3250 1000
Wire Wire Line
	3250 1100 3400 1100
Wire Wire Line
	3400 1400 3250 1400
Wire Wire Line
	3250 1500 3400 1500
Wire Wire Line
	3400 1600 3250 1600
Wire Wire Line
	3250 1750 3400 1750
Wire Wire Line
	3400 1850 3250 1850
Wire Wire Line
	3250 2000 3400 2000
Wire Wire Line
	3400 2100 3250 2100
Wire Wire Line
	3250 2200 3400 2200
Wire Wire Line
	3400 2500 3250 2500
Text HLabel 4100 3150 2    50   Input ~ 0
C1
Text HLabel 4100 3250 2    50   Input ~ 0
C2
Text HLabel 4100 3350 2    50   Input ~ 0
C3
Text HLabel 4100 3450 2    50   Input ~ 0
C4
Text HLabel 4100 3550 2    50   Input ~ 0
C5
Text HLabel 4100 3650 2    50   Input ~ 0
C6
Text HLabel 4100 3750 2    50   Input ~ 0
C7
Text HLabel 4100 3850 2    50   Input ~ 0
C8
Text HLabel 4100 3950 2    50   Input ~ 0
C9
Text HLabel 4100 4050 2    50   Input ~ 0
C10
Text HLabel 4600 4050 0    50   Input ~ 0
C11
Text HLabel 4600 3950 0    50   Input ~ 0
C12
Text HLabel 4600 3850 0    50   Input ~ 0
C13
Text HLabel 4600 3750 0    50   Input ~ 0
C14
Text HLabel 4600 3650 0    50   Input ~ 0
C15
Text HLabel 4600 3550 0    50   Input ~ 0
C16
Text HLabel 4600 3450 0    50   Input ~ 0
C17
Text HLabel 4600 3350 0    50   Input ~ 0
C18
Text HLabel 4600 3250 0    50   Input ~ 0
C19
Text HLabel 4600 3150 0    50   Input ~ 0
C20
Wire Wire Line
	4750 4050 4600 4050
Wire Wire Line
	4600 3950 4750 3950
Wire Wire Line
	4750 3850 4600 3850
Wire Wire Line
	4600 3750 4750 3750
Wire Wire Line
	4750 3650 4600 3650
Wire Wire Line
	4600 3550 4750 3550
Wire Wire Line
	4750 3450 4600 3450
Wire Wire Line
	4600 3350 4750 3350
Wire Wire Line
	4750 3250 4600 3250
Wire Wire Line
	4600 3150 4750 3150
Wire Wire Line
	4100 3150 3950 3150
Wire Wire Line
	3950 3250 4100 3250
Wire Wire Line
	4100 3350 3950 3350
Wire Wire Line
	3950 3450 4100 3450
Wire Wire Line
	4100 3550 3950 3550
Wire Wire Line
	3950 3650 4100 3650
Wire Wire Line
	4100 3750 3950 3750
Wire Wire Line
	3950 3850 4100 3850
Wire Wire Line
	4100 3950 3950 3950
Wire Wire Line
	3950 4050 4100 4050
$Comp
L Connector:Conn_01x08_Male J7
U 1 1 61611AFB
P 6250 3150
F 0 "J7" H 6358 3631 50  0000 C CNN
F 1 "Conn_01x08_Male" H 6358 3540 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 6250 3150 50  0001 C CNN
F 3 "~" H 6250 3150 50  0001 C CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J8
U 1 1 61612D55
P 7400 3150
F 0 "J8" H 7372 3124 50  0000 R CNN
F 1 "Conn_01x08_Male" H 7372 3033 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 7400 3150 50  0001 C CNN
F 3 "~" H 7400 3150 50  0001 C CNN
	1    7400 3150
	-1   0    0    -1  
$EndComp
Text HLabel 6150 1300 0    50   Input ~ 0
D11
Text HLabel 6150 1400 0    50   Input ~ 0
D3
Text HLabel 6150 1500 0    50   Input ~ 0
D13
Text HLabel 6150 1650 0    50   Input ~ 0
D10
Text HLabel 6150 1750 0    50   Input ~ 0
D9
Text HLabel 6150 1950 0    50   Input ~ 0
D12
Text HLabel 6150 2050 0    50   Input ~ 0
D5
Text HLabel 6150 2150 0    50   Input ~ 0
D6
Text HLabel 6150 2250 0    50   Input ~ 0
D7
Text HLabel 7450 1300 2    50   Input ~ 0
D8
Text HLabel 7450 1550 2    50   Input ~ 0
D15
Text HLabel 7450 1650 2    50   Input ~ 0
D16
Text HLabel 7450 1750 2    50   Input ~ 0
D2
Text HLabel 7450 1850 2    50   Input ~ 0
D1
Text HLabel 7450 2150 2    50   Input ~ 0
D4
Text HLabel 7450 2250 2    50   Input ~ 0
D14
Wire Wire Line
	6250 1300 6150 1300
Wire Wire Line
	6250 1400 6150 1400
Wire Wire Line
	6150 1500 6250 1500
Wire Wire Line
	6150 1650 6250 1650
Wire Wire Line
	6150 1750 6250 1750
Wire Wire Line
	6150 1950 6250 1950
Wire Wire Line
	6150 2050 6250 2050
Wire Wire Line
	6150 2150 6250 2150
Wire Wire Line
	6150 2250 6250 2250
Wire Wire Line
	7450 1300 7350 1300
Wire Wire Line
	7350 1550 7450 1550
Wire Wire Line
	7450 1650 7350 1650
Wire Wire Line
	7350 1750 7450 1750
Wire Wire Line
	7450 1850 7350 1850
Wire Wire Line
	7350 2150 7450 2150
Wire Wire Line
	7450 2250 7350 2250
Text HLabel 7100 3350 0    50   Input ~ 0
D11
Text HLabel 6600 3050 2    50   Input ~ 0
D3
Text HLabel 7100 3150 0    50   Input ~ 0
D13
Text HLabel 7100 3450 0    50   Input ~ 0
D10
Text HLabel 7100 3550 0    50   Input ~ 0
D9
Text HLabel 7100 3250 0    50   Input ~ 0
D12
Text HLabel 6600 3250 2    50   Input ~ 0
D5
Text HLabel 6600 3350 2    50   Input ~ 0
D6
Text HLabel 6600 3450 2    50   Input ~ 0
D7
Text HLabel 7100 3050 0    50   Input ~ 0
D14
Text HLabel 6600 3150 2    50   Input ~ 0
D4
Text HLabel 6600 2850 2    50   Input ~ 0
D1
Text HLabel 6600 2950 2    50   Input ~ 0
D2
Text HLabel 7100 2850 0    50   Input ~ 0
D16
Text HLabel 7100 2950 0    50   Input ~ 0
D15
Text HLabel 6600 3550 2    50   Input ~ 0
D8
Wire Wire Line
	6600 2850 6450 2850
Wire Wire Line
	6450 2950 6600 2950
Wire Wire Line
	6450 3050 6600 3050
Wire Wire Line
	6450 3150 6600 3150
Wire Wire Line
	6450 3250 6600 3250
Wire Wire Line
	6450 3350 6600 3350
Wire Wire Line
	6450 3450 6600 3450
Wire Wire Line
	6450 3550 6600 3550
Wire Wire Line
	7200 2850 7100 2850
Wire Wire Line
	7100 2950 7200 2950
Wire Wire Line
	7200 3050 7100 3050
Wire Wire Line
	7200 3150 7100 3150
Wire Wire Line
	7100 3250 7200 3250
Wire Wire Line
	7100 3350 7200 3350
Wire Wire Line
	7100 3450 7200 3450
Wire Wire Line
	7100 3550 7200 3550
$Comp
L Connector:Conn_01x12_Male J9
U 1 1 616907A1
P 8700 3500
F 0 "J9" H 8808 4181 50  0000 C CNN
F 1 "Conn_01x12_Male" H 8808 4090 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x12_Pitch2.54mm" H 8700 3500 50  0001 C CNN
F 3 "~" H 8700 3500 50  0001 C CNN
	1    8700 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Male J10
U 1 1 616927A1
P 9900 3500
F 0 "J10" H 9872 3474 50  0000 R CNN
F 1 "Conn_01x12_Male" H 9872 3383 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x12_Pitch2.54mm" H 9900 3500 50  0001 C CNN
F 3 "~" H 9900 3500 50  0001 C CNN
	1    9900 3500
	-1   0    0    -1  
$EndComp
Text HLabel 8500 950  0    50   Input ~ 0
E12
Text HLabel 8500 1150 0    50   Input ~ 0
E14
Text HLabel 8500 1350 0    50   Input ~ 0
E4
Text HLabel 8500 1550 0    50   Input ~ 0
E15
Text HLabel 8500 1750 0    50   Input ~ 0
E16
Text HLabel 8500 1850 0    50   Input ~ 0
E17
Text HLabel 8500 2050 0    50   Input ~ 0
E18
Text HLabel 8500 2150 0    50   Input ~ 0
E19
Text HLabel 8500 2250 0    50   Input ~ 0
E20
Text HLabel 8500 2350 0    50   Input ~ 0
E21
Text HLabel 8500 2450 0    50   Input ~ 0
E22
Text HLabel 8500 2550 0    50   Input ~ 0
E23
Text HLabel 8500 2650 0    50   Input ~ 0
E24
Text HLabel 10250 950  2    50   Input ~ 0
E2
Text HLabel 10250 1050 2    50   Input ~ 0
E3
Text HLabel 10250 1250 2    50   Input ~ 0
E11
Text HLabel 10250 1450 2    50   Input ~ 0
E10
Text HLabel 10250 1650 2    50   Input ~ 0
E9
Text HLabel 10250 1850 2    50   Input ~ 0
E8
Text HLabel 10250 2050 2    50   Input ~ 0
E5
Text HLabel 10250 2150 2    50   Input ~ 0
E13
Text HLabel 10250 2350 2    50   Input ~ 0
E6
Text HLabel 10250 2450 2    50   Input ~ 0
E7
Text HLabel 10250 2550 2    50   Input ~ 0
E25
Text HLabel 10250 2650 2    50   Input ~ 0
E1
Text HLabel 9050 4100 2    50   Input ~ 0
E12
Text HLabel 9550 4000 0    50   Input ~ 0
E14
Text HLabel 9050 3300 2    50   Input ~ 0
E4
Text HLabel 9550 3900 0    50   Input ~ 0
E15
Text HLabel 9550 3800 0    50   Input ~ 0
E16
Text HLabel 9550 3700 0    50   Input ~ 0
E17
Text HLabel 9550 3600 0    50   Input ~ 0
E18
Text HLabel 9550 3500 0    50   Input ~ 0
E19
Text HLabel 9550 3400 0    50   Input ~ 0
E20
Text HLabel 9550 3300 0    50   Input ~ 0
E21
Text HLabel 9550 3200 0    50   Input ~ 0
E22
Text HLabel 9550 3100 0    50   Input ~ 0
E23
Text HLabel 9550 3000 0    50   Input ~ 0
E24
Text HLabel 9050 3100 2    50   Input ~ 0
E2
Text HLabel 9050 3200 2    50   Input ~ 0
E3
Text HLabel 9050 4000 2    50   Input ~ 0
E11
Text HLabel 9050 3900 2    50   Input ~ 0
E10
Text HLabel 9050 3800 2    50   Input ~ 0
E9
Text HLabel 9050 3700 2    50   Input ~ 0
E8
Text HLabel 9050 3400 2    50   Input ~ 0
E5
Text HLabel 9550 4100 0    50   Input ~ 0
E13
Text HLabel 9050 3500 2    50   Input ~ 0
E6
Text HLabel 9050 3600 2    50   Input ~ 0
E7
Text HLabel 9050 3000 2    50   Input ~ 0
E1
Wire Wire Line
	8500 950  8650 950 
Wire Wire Line
	8500 1150 8650 1150
Wire Wire Line
	8500 1350 8650 1350
Wire Wire Line
	8500 1550 8650 1550
Wire Wire Line
	8500 1750 8650 1750
Wire Wire Line
	8500 1850 8650 1850
Wire Wire Line
	8500 2050 8650 2050
Wire Wire Line
	8500 2150 8650 2150
Wire Wire Line
	8500 2250 8650 2250
Wire Wire Line
	8500 2350 8650 2350
Wire Wire Line
	8500 2450 8650 2450
Wire Wire Line
	8500 2550 8650 2550
Wire Wire Line
	8500 2650 8650 2650
Wire Wire Line
	10250 950  10050 950 
Wire Wire Line
	10250 1050 10050 1050
Wire Wire Line
	10250 1250 10050 1250
Wire Wire Line
	10250 1450 10050 1450
Wire Wire Line
	10250 1650 10050 1650
Wire Wire Line
	10250 1850 10050 1850
Wire Wire Line
	10250 2050 10050 2050
Wire Wire Line
	10250 2150 10050 2150
Wire Wire Line
	10250 2350 10050 2350
Wire Wire Line
	10250 2450 10050 2450
Wire Wire Line
	10250 2550 10050 2550
Wire Wire Line
	10250 2650 10050 2650
Wire Wire Line
	9050 3000 8900 3000
Wire Wire Line
	8900 3100 9050 3100
Wire Wire Line
	8900 3200 9050 3200
Wire Wire Line
	8900 3300 9050 3300
Wire Wire Line
	8900 3400 9050 3400
Wire Wire Line
	8900 3500 9050 3500
Wire Wire Line
	8900 3600 9050 3600
Wire Wire Line
	8900 3700 9050 3700
Wire Wire Line
	8900 3800 9050 3800
Wire Wire Line
	8900 3900 9050 3900
Wire Wire Line
	8900 4000 9050 4000
Wire Wire Line
	8900 4100 9050 4100
Wire Wire Line
	9700 4100 9550 4100
Wire Wire Line
	9550 4000 9700 4000
Wire Wire Line
	9700 3900 9550 3900
Wire Wire Line
	9550 3800 9700 3800
Wire Wire Line
	9700 3700 9550 3700
Wire Wire Line
	9550 3600 9700 3600
Wire Wire Line
	9700 3500 9550 3500
Wire Wire Line
	9550 3400 9700 3400
Wire Wire Line
	9700 3300 9550 3300
Wire Wire Line
	9550 3200 9700 3200
Wire Wire Line
	9700 3100 9550 3100
Wire Wire Line
	9550 3000 9700 3000
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
P 4250 5300
F 0 "J13" H 4358 5681 50  0000 C CNN
F 1 "Conn_01x05_Male" H 4358 5590 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 4250 5300 50  0001 C CNN
F 3 "~" H 4250 5300 50  0001 C CNN
	1    4250 5300
	1    0    0    -1  
$EndComp
Text HLabel 4600 5100 2    50   Input ~ 0
H1
Text HLabel 4600 5200 2    50   Input ~ 0
H2
Text HLabel 4600 5300 2    50   Input ~ 0
H3
Text HLabel 4600 5400 2    50   Input ~ 0
H4
Text HLabel 4600 5500 2    50   Input ~ 0
H5
Wire Wire Line
	4600 5100 4450 5100
Wire Wire Line
	4450 5200 4600 5200
Wire Wire Line
	4450 5300 4600 5300
Wire Wire Line
	4450 5400 4600 5400
Wire Wire Line
	4450 5500 4600 5500
$Comp
L Ninja-qPCR:SiZ346DT U6
U 1 1 615D95B9
P 4400 6100
F 0 "U6" H 5200 6487 60  0000 C CNN
F 1 "SiZ346DT" H 5200 6381 60  0000 C CNN
F 2 "Ninja-qPCR:SiZ346DT" H 5200 6340 60  0001 C CNN
F 3 "" H 6000 5900 60  0000 C CNN
	1    4400 6100
	1    0    0    -1  
$EndComp
Text HLabel 6200 6550 2    50   Input ~ 0
H1
Text HLabel 4300 6650 0    50   Input ~ 0
H2
Text HLabel 6000 6200 2    50   Input ~ 0
H3
Text HLabel 4300 6300 0    50   Input ~ 0
H4
Text HLabel 4300 6200 0    50   Input ~ 0
H5
Wire Wire Line
	4400 6650 4300 6650
Wire Wire Line
	4400 6300 4300 6300
Wire Wire Line
	4400 6200 4350 6200
Wire Wire Line
	4400 6000 4350 6000
Wire Wire Line
	4350 6000 4350 6100
Connection ~ 4350 6200
Wire Wire Line
	4350 6200 4300 6200
Wire Wire Line
	4400 6100 4350 6100
Connection ~ 4350 6100
Wire Wire Line
	4350 6100 4350 6200
Wire Wire Line
	5900 6200 6000 6200
Wire Wire Line
	6200 6550 6100 6550
Wire Wire Line
	6000 6850 6100 6850
Wire Wire Line
	6100 6850 6100 6750
Connection ~ 6100 6550
Wire Wire Line
	6100 6550 6000 6550
Wire Wire Line
	6000 6750 6100 6750
Connection ~ 6100 6750
Wire Wire Line
	6100 6750 6100 6650
Wire Wire Line
	6000 6650 6100 6650
Connection ~ 6100 6650
Wire Wire Line
	6100 6650 6100 6550
$Comp
L Ninja-qPCR:AOZ2264QI-19 U7
U 1 1 615E2052
P 9250 4600
F 0 "U7" H 9250 4725 50  0000 C CNN
F 1 "AOZ2264QI-19" H 9250 4634 50  0000 C CNN
F 2 "Ninja-qPCR:AOZ2264QI-19" H 9250 4600 50  0001 C CNN
F 3 "" H 9250 4600 50  0001 C CNN
	1    9250 4600
	1    0    0    -1  
$EndComp
Text HLabel 8650 5100 0    50   Input ~ 0
I1
Text HLabel 8650 5300 0    50   Input ~ 0
I2
Text HLabel 8650 5600 0    50   Input ~ 0
I3
Text HLabel 9850 5800 2    50   Input ~ 0
I4
Text HLabel 9850 5700 2    50   Input ~ 0
I5
Text HLabel 8650 4700 0    50   Input ~ 0
I6
Text HLabel 9850 4700 2    50   Input ~ 0
I7
Text HLabel 9850 5200 2    50   Input ~ 0
I10
Text HLabel 9850 5900 2    50   Input ~ 0
I12
Text HLabel 9850 5100 2    50   Input ~ 0
I20
Wire Wire Line
	8850 4700 8650 4700
Text HLabel 8650 4800 0    50   Input ~ 0
I21
Wire Wire Line
	8850 4800 8650 4800
Wire Wire Line
	8850 5100 8650 5100
Wire Wire Line
	8850 5300 8650 5300
Wire Wire Line
	8850 5600 8650 5600
Text HLabel 8650 5700 0    50   Input ~ 0
I23
Wire Wire Line
	8650 5700 8850 5700
Wire Wire Line
	9650 4700 9750 4700
Wire Wire Line
	9650 5000 9750 5000
Wire Wire Line
	9750 5000 9750 4900
Connection ~ 9750 4700
Wire Wire Line
	9750 4700 9850 4700
Wire Wire Line
	9650 4800 9750 4800
Connection ~ 9750 4800
Wire Wire Line
	9750 4800 9750 4700
Wire Wire Line
	9650 4900 9750 4900
Connection ~ 9750 4900
Wire Wire Line
	9750 4900 9750 4800
Wire Wire Line
	9650 5100 9850 5100
Wire Wire Line
	9650 5200 9750 5200
Wire Wire Line
	9650 5600 9750 5600
Wire Wire Line
	9750 5600 9750 5500
Connection ~ 9750 5200
Wire Wire Line
	9750 5200 9850 5200
Wire Wire Line
	9650 5300 9750 5300
Connection ~ 9750 5300
Wire Wire Line
	9750 5300 9750 5200
Wire Wire Line
	9650 5400 9750 5400
Connection ~ 9750 5400
Wire Wire Line
	9750 5400 9750 5300
Wire Wire Line
	9650 5500 9750 5500
Connection ~ 9750 5500
Wire Wire Line
	9750 5500 9750 5400
Wire Wire Line
	9650 5700 9850 5700
Wire Wire Line
	9650 5800 9850 5800
Wire Wire Line
	9650 5900 9750 5900
Wire Wire Line
	9650 6300 9750 6300
Wire Wire Line
	9750 6300 9750 6200
Connection ~ 9750 5900
Wire Wire Line
	9750 5900 9850 5900
Wire Wire Line
	9650 6000 9750 6000
Connection ~ 9750 6000
Wire Wire Line
	9750 6000 9750 5900
Wire Wire Line
	9650 6100 9750 6100
Connection ~ 9750 6100
Wire Wire Line
	9750 6100 9750 6000
Wire Wire Line
	9650 6200 9750 6200
Connection ~ 9750 6200
Wire Wire Line
	9750 6200 9750 6100
Text HLabel 6700 5050 2    50   Input ~ 0
I1
Text HLabel 6700 5150 2    50   Input ~ 0
I2
Text HLabel 6700 5250 2    50   Input ~ 0
I3
Text HLabel 6700 5350 2    50   Input ~ 0
I4
Text HLabel 6700 5450 2    50   Input ~ 0
I5
Text HLabel 6700 5550 2    50   Input ~ 0
I6
Text HLabel 7100 5450 0    50   Input ~ 0
I10
Text HLabel 7100 5550 0    50   Input ~ 0
I7
Text HLabel 7100 5350 0    50   Input ~ 0
I12
Text HLabel 7100 5250 0    50   Input ~ 0
I20
Text HLabel 7100 5150 0    50   Input ~ 0
I21
Text HLabel 7100 5050 0    50   Input ~ 0
I23
$Comp
L Connector:Conn_01x06_Male J14
U 1 1 618F77E7
P 6300 5250
F 0 "J14" H 6408 5631 50  0000 C CNN
F 1 "Conn_01x06_Male" H 6408 5540 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 6300 5250 50  0001 C CNN
F 3 "~" H 6300 5250 50  0001 C CNN
	1    6300 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J15
U 1 1 618F8D1E
P 7500 5250
F 0 "J15" H 7472 5224 50  0000 R CNN
F 1 "Conn_01x06_Male" H 7472 5133 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 7500 5250 50  0001 C CNN
F 3 "~" H 7500 5250 50  0001 C CNN
	1    7500 5250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 5550 7300 5550
Wire Wire Line
	7300 5450 7100 5450
Wire Wire Line
	7100 5350 7300 5350
Wire Wire Line
	7300 5250 7100 5250
Wire Wire Line
	7100 5150 7300 5150
Wire Wire Line
	7100 5050 7300 5050
Wire Wire Line
	6700 5050 6500 5050
Wire Wire Line
	6700 5150 6500 5150
Wire Wire Line
	6700 5250 6500 5250
Wire Wire Line
	6700 5350 6500 5350
Wire Wire Line
	6700 5450 6500 5450
Wire Wire Line
	6700 5550 6500 5550
$EndSCHEMATC
