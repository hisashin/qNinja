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
$Comp
L Ninja-qPCR:SN74LVC1G04DBVR U7
U 1 1 60B0D57A
P 2250 6600
F 0 "U7" H 2250 7067 50  0000 C CNN
F 1 "SN74LVC1G04DBVR" H 2250 6976 50  0000 C CNN
F 2 "Ninja-qPCR:SN74LVC1G04DBVR" H 2250 6600 50  0001 L BNN
F 3 "IPC-7351B" H 2250 6600 50  0001 L BNN
F 4 "1.45mm" H 2250 6600 50  0001 L BNN "Field4"
F 5 "AD" H 2250 6600 50  0001 L BNN "Field5"
F 6 "Texas Instruments" H 2250 6600 50  0001 L BNN "Field6"
	1    2250 6600
	1    0    0    -1  
$EndComp
Text GLabel 1700 6600 0    50   Input ~ 0
MUX_SELECT
Text HLabel 2800 6600 2    50   Input ~ 0
MUX_SELECT_INV
NoConn ~ 2800 6400
Wire Wire Line
	1850 6400 1700 6400
Wire Wire Line
	1700 6600 1850 6600
Wire Wire Line
	2800 6400 2650 6400
Wire Wire Line
	2800 6600 2650 6600
Wire Wire Line
	2800 6800 2650 6800
Text HLabel 4050 1150 2    50   Input ~ 0
MUX_SELECT_INV
Text GLabel 1150 1450 0    50   Input ~ 0
MUX_S3
Text GLabel 1150 1350 0    50   Input ~ 0
MUX_S2
Text GLabel 1150 1250 0    50   Input ~ 0
MUX_S1
Text GLabel 1150 1150 0    50   Input ~ 0
MUX_S0
Wire Wire Line
	4050 3050 3900 3050
Wire Wire Line
	4050 2850 3900 2850
Wire Wire Line
	4050 2750 3900 2750
Wire Wire Line
	4050 2650 3900 2650
Wire Wire Line
	4050 2550 3900 2550
Wire Wire Line
	4050 2450 3900 2450
Wire Wire Line
	4050 2350 3900 2350
Wire Wire Line
	4050 2250 3900 2250
Wire Wire Line
	4050 2150 3900 2150
Wire Wire Line
	4050 2050 3900 2050
Wire Wire Line
	4050 1950 3900 1950
Wire Wire Line
	4050 1850 3900 1850
Wire Wire Line
	4050 1750 3900 1750
Wire Wire Line
	4050 1650 3900 1650
Wire Wire Line
	4050 1550 3900 1550
Wire Wire Line
	4050 1450 3900 1450
Wire Wire Line
	4050 1350 3900 1350
Wire Wire Line
	4050 1150 3900 1150
Wire Wire Line
	1300 1150 1150 1150
Wire Wire Line
	1300 1250 1150 1250
Wire Wire Line
	1300 1350 1150 1350
Wire Wire Line
	1300 1450 1150 1450
Text GLabel 2800 6800 2    50   Input ~ 0
-1V
Text GLabel 1700 6400 0    50   Input ~ 0
3V3D
$Comp
L Device:D_Photo D9
U 1 1 60C204B0
P 9400 1200
F 0 "D9" H 9350 983 50  0000 C CNN
F 1 "D_Photo" H 9350 1074 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 1200 50  0001 C CNN
F 3 "~" H 9350 1200 50  0001 C CNN
	1    9400 1200
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D10
U 1 1 60C204B6
P 9400 1600
F 0 "D10" H 9350 1383 50  0000 C CNN
F 1 "D_Photo" H 9350 1474 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 1600 50  0001 C CNN
F 3 "~" H 9350 1600 50  0001 C CNN
	1    9400 1600
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D11
U 1 1 60C204BC
P 9400 2000
F 0 "D11" H 9350 1783 50  0000 C CNN
F 1 "D_Photo" H 9350 1874 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 2000 50  0001 C CNN
F 3 "~" H 9350 2000 50  0001 C CNN
	1    9400 2000
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D12
U 1 1 60C204C2
P 9400 2400
F 0 "D12" H 9350 2183 50  0000 C CNN
F 1 "D_Photo" H 9350 2274 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 2400 50  0001 C CNN
F 3 "~" H 9350 2400 50  0001 C CNN
	1    9400 2400
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D13
U 1 1 60C204C8
P 9400 2800
F 0 "D13" H 9350 2583 50  0000 C CNN
F 1 "D_Photo" H 9350 2674 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 2800 50  0001 C CNN
F 3 "~" H 9350 2800 50  0001 C CNN
	1    9400 2800
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D14
U 1 1 60C204CE
P 9400 3200
F 0 "D14" H 9350 2983 50  0000 C CNN
F 1 "D_Photo" H 9350 3074 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 3200 50  0001 C CNN
F 3 "~" H 9350 3200 50  0001 C CNN
	1    9400 3200
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D15
U 1 1 60C204D4
P 9400 3600
F 0 "D15" H 9350 3383 50  0000 C CNN
F 1 "D_Photo" H 9350 3474 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 3600 50  0001 C CNN
F 3 "~" H 9350 3600 50  0001 C CNN
	1    9400 3600
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D16
U 1 1 60C204DA
P 9400 4000
F 0 "D16" H 9350 3783 50  0000 C CNN
F 1 "D_Photo" H 9350 3874 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 9350 4000 50  0001 C CNN
F 3 "~" H 9350 4000 50  0001 C CNN
	1    9400 4000
	1    0    0    1   
$EndComp
Wire Wire Line
	9500 1200 9650 1200
Wire Wire Line
	9650 1200 9650 1600
Wire Wire Line
	9500 4000 9650 4000
Connection ~ 9650 4000
Wire Wire Line
	9650 4000 9650 4400
Wire Wire Line
	9500 3600 9650 3600
Connection ~ 9650 3600
Wire Wire Line
	9650 3600 9650 4000
Wire Wire Line
	9500 3200 9650 3200
Connection ~ 9650 3200
Wire Wire Line
	9650 3200 9650 3600
Wire Wire Line
	9500 1600 9650 1600
Connection ~ 9650 1600
Wire Wire Line
	9650 1600 9650 2000
Wire Wire Line
	9500 2000 9650 2000
Connection ~ 9650 2000
Wire Wire Line
	9650 2000 9650 2400
Wire Wire Line
	9500 2400 9650 2400
Connection ~ 9650 2400
Wire Wire Line
	9650 2400 9650 2800
Wire Wire Line
	9500 2800 9650 2800
Connection ~ 9650 2800
Wire Wire Line
	9650 2800 9650 3200
Wire Wire Line
	8950 4000 9200 4000
Wire Wire Line
	8950 3600 9200 3600
Wire Wire Line
	8950 3200 9200 3200
Wire Wire Line
	8950 2800 9200 2800
Wire Wire Line
	8950 2400 9200 2400
Wire Wire Line
	8950 2000 9200 2000
Wire Wire Line
	8950 1600 9200 1600
Wire Wire Line
	8950 1200 9200 1200
$Comp
L Ninja-qPCR:CD74HC4067M96 U6
U 2 1 60B0D59F
P 3850 4200
F 0 "U6" H 5150 4587 60  0000 C CNN
F 1 "CD74HC4067M96" H 5150 4481 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 5150 4440 60  0001 C CNN
F 3 "" H 3850 4200 60  0000 C CNN
	2    3850 4200
	-1   0    0    -1  
$EndComp
Text GLabel 1050 4300 0    50   Input ~ 0
-1V
Text GLabel 4000 5200 2    50   Input ~ 0
3V3D
$Comp
L Ninja-qPCR:CD74HC4067M96 U6
U 1 1 60B0D5A6
P 3900 1150
F 0 "U6" H 5200 1537 60  0000 C CNN
F 1 "CD74HC4067M96" H 5200 1431 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 5200 1390 60  0001 C CNN
F 3 "" H 3900 1150 60  0000 C CNN
	1    3900 1150
	-1   0    0    -1  
$EndComp
Connection ~ 7800 1200
Wire Wire Line
	7800 1100 7800 1200
$Comp
L power:PWR_FLAG #FLG01
U 1 1 60C2052F
P 7800 1100
F 0 "#FLG01" H 7800 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 7800 1273 50  0000 C CNN
F 2 "" H 7800 1100 50  0001 C CNN
F 3 "~" H 7800 1100 50  0001 C CNN
	1    7800 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 4000 7350 4000
Wire Wire Line
	7100 3600 7350 3600
Wire Wire Line
	7100 3200 7350 3200
Wire Wire Line
	7100 2800 7350 2800
Wire Wire Line
	7100 2400 7350 2400
Wire Wire Line
	7100 2000 7350 2000
Wire Wire Line
	7100 1600 7350 1600
Wire Wire Line
	7100 1200 7350 1200
Wire Wire Line
	7800 2800 7800 3200
Connection ~ 7800 2800
Wire Wire Line
	7650 2800 7800 2800
Wire Wire Line
	7800 2400 7800 2800
Connection ~ 7800 2400
Wire Wire Line
	7650 2400 7800 2400
Wire Wire Line
	7800 2000 7800 2400
Connection ~ 7800 2000
Wire Wire Line
	7650 2000 7800 2000
Wire Wire Line
	7800 1600 7800 2000
Connection ~ 7800 1600
Wire Wire Line
	7650 1600 7800 1600
Wire Wire Line
	7800 3200 7800 3600
Connection ~ 7800 3200
Wire Wire Line
	7650 3200 7800 3200
Wire Wire Line
	7800 3600 7800 4000
Connection ~ 7800 3600
Wire Wire Line
	7650 3600 7800 3600
Wire Wire Line
	7800 4000 7800 4400
Connection ~ 7800 4000
Wire Wire Line
	7650 4000 7800 4000
Wire Wire Line
	7800 1200 7800 1600
Wire Wire Line
	7650 1200 7800 1200
$Comp
L Device:D_Photo D8
U 1 1 60C2048D
P 7550 4000
F 0 "D8" H 7500 3783 50  0000 C CNN
F 1 "D_Photo" H 7500 3874 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 4000 50  0001 C CNN
F 3 "~" H 7500 4000 50  0001 C CNN
	1    7550 4000
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D7
U 1 1 60C20487
P 7550 3600
F 0 "D7" H 7500 3383 50  0000 C CNN
F 1 "D_Photo" H 7500 3474 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 3600 50  0001 C CNN
F 3 "~" H 7500 3600 50  0001 C CNN
	1    7550 3600
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D6
U 1 1 60C20481
P 7550 3200
F 0 "D6" H 7500 2983 50  0000 C CNN
F 1 "D_Photo" H 7500 3074 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 3200 50  0001 C CNN
F 3 "~" H 7500 3200 50  0001 C CNN
	1    7550 3200
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D5
U 1 1 60C2047B
P 7550 2800
F 0 "D5" H 7500 2583 50  0000 C CNN
F 1 "D_Photo" H 7500 2674 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 2800 50  0001 C CNN
F 3 "~" H 7500 2800 50  0001 C CNN
	1    7550 2800
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D4
U 1 1 60C20475
P 7550 2400
F 0 "D4" H 7500 2183 50  0000 C CNN
F 1 "D_Photo" H 7500 2274 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 2400 50  0001 C CNN
F 3 "~" H 7500 2400 50  0001 C CNN
	1    7550 2400
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D3
U 1 1 60C2046F
P 7550 2000
F 0 "D3" H 7500 1783 50  0000 C CNN
F 1 "D_Photo" H 7500 1874 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 2000 50  0001 C CNN
F 3 "~" H 7500 2000 50  0001 C CNN
	1    7550 2000
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D2
U 1 1 60C20469
P 7550 1600
F 0 "D2" H 7500 1383 50  0000 C CNN
F 1 "D_Photo" H 7500 1474 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 1600 50  0001 C CNN
F 3 "~" H 7500 1600 50  0001 C CNN
	1    7550 1600
	1    0    0    1   
$EndComp
$Comp
L Device:D_Photo D1
U 1 1 60C20463
P 7550 1200
F 0 "D1" H 7500 983 50  0000 C CNN
F 1 "D_Photo" H 7500 1074 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 7500 1200 50  0001 C CNN
F 3 "~" H 7500 1200 50  0001 C CNN
	1    7550 1200
	1    0    0    1   
$EndComp
Text GLabel 9750 4400 2    50   Input ~ 0
GNDA
Wire Wire Line
	9750 4400 9650 4400
Text GLabel 4050 3050 2    50   Input ~ 0
PD_MUX_OUT
Text HLabel 4050 1350 2    50   Input ~ 0
S_PD_OUT1
Text HLabel 4050 1450 2    50   Input ~ 0
S_PD_OUT2
Text HLabel 4050 1550 2    50   Input ~ 0
S_PD_OUT3
Text HLabel 4050 1650 2    50   Input ~ 0
S_PD_OUT4
Text HLabel 4050 1750 2    50   Input ~ 0
S_PD_OUT5
Text HLabel 4050 1850 2    50   Input ~ 0
S_PD_OUT6
Text HLabel 4050 1950 2    50   Input ~ 0
S_PD_OUT7
Text HLabel 4050 2050 2    50   Input ~ 0
S_PD_OUT8
Text HLabel 4050 2150 2    50   Input ~ 0
S_PD_OUT9
Text HLabel 4050 2250 2    50   Input ~ 0
S_PD_OUT10
Text HLabel 4050 2350 2    50   Input ~ 0
S_PD_OUT11
Text HLabel 4050 2450 2    50   Input ~ 0
S_PD_OUT12
Text HLabel 4050 2550 2    50   Input ~ 0
S_PD_OUT13
Text HLabel 4050 2650 2    50   Input ~ 0
S_PD_OUT14
Text HLabel 4050 2750 2    50   Input ~ 0
S_PD_OUT15
Text HLabel 4050 2850 2    50   Input ~ 0
S_PD_OUT16
Text HLabel 7100 1200 0    50   Input ~ 0
S_PD_OUT1
Text HLabel 7100 1600 0    50   Input ~ 0
S_PD_OUT2
Text HLabel 7100 2000 0    50   Input ~ 0
S_PD_OUT3
Text HLabel 7100 2400 0    50   Input ~ 0
S_PD_OUT4
Text HLabel 7100 2800 0    50   Input ~ 0
S_PD_OUT5
Text HLabel 7100 3200 0    50   Input ~ 0
S_PD_OUT6
Text HLabel 7100 3600 0    50   Input ~ 0
S_PD_OUT7
Text HLabel 7100 4000 0    50   Input ~ 0
S_PD_OUT8
Text HLabel 8950 1200 0    50   Input ~ 0
S_PD_OUT9
Text HLabel 8950 1600 0    50   Input ~ 0
S_PD_OUT10
Text HLabel 8950 2000 0    50   Input ~ 0
S_PD_OUT11
Text HLabel 8950 2400 0    50   Input ~ 0
S_PD_OUT12
Text HLabel 8950 2800 0    50   Input ~ 0
S_PD_OUT13
Text HLabel 8950 3200 0    50   Input ~ 0
S_PD_OUT14
Text HLabel 8950 3600 0    50   Input ~ 0
S_PD_OUT15
Text HLabel 8950 4000 0    50   Input ~ 0
S_PD_OUT16
Wire Wire Line
	7800 4400 9650 4400
Connection ~ 9650 4400
Wire Wire Line
	1050 4300 1250 4300
Wire Wire Line
	4000 5200 3850 5200
$EndSCHEMATC
