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
F 1 "SN74LVC1GU04DCKR" H 2250 6976 50  0000 C CNN
F 2 "Ninja-qPCR:SN74LVC1GU04DCKR" H 2250 6600 50  0001 L BNN
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
Text GLabel 4050 3050 2    50   Input ~ 0
PD_MUX_OUT
Text HLabel 4050 2150 2    50   Input ~ 0
S_PD_OUT1
Text HLabel 4050 2050 2    50   Input ~ 0
S_PD_OUT2
Text HLabel 4050 2250 2    50   Input ~ 0
S_PD_OUT3
Text HLabel 4050 1950 2    50   Input ~ 0
S_PD_OUT4
Text HLabel 4050 2350 2    50   Input ~ 0
S_PD_OUT5
Text HLabel 4050 1850 2    50   Input ~ 0
S_PD_OUT6
Text HLabel 4050 2450 2    50   Input ~ 0
S_PD_OUT7
Text HLabel 4050 1750 2    50   Input ~ 0
S_PD_OUT8
Text HLabel 4050 2550 2    50   Input ~ 0
S_PD_OUT9
Text HLabel 4050 1650 2    50   Input ~ 0
S_PD_OUT10
Text HLabel 4050 2650 2    50   Input ~ 0
S_PD_OUT11
Text HLabel 4050 1550 2    50   Input ~ 0
S_PD_OUT12
Text HLabel 4050 2750 2    50   Input ~ 0
S_PD_OUT13
Text HLabel 4050 1450 2    50   Input ~ 0
S_PD_OUT14
Text HLabel 4050 2850 2    50   Input ~ 0
S_PD_OUT15
Text HLabel 4050 1350 2    50   Input ~ 0
S_PD_OUT16
Text HLabel 6500 3800 0    50   Input ~ 0
S_PD_OUT1
Text HLabel 6500 2550 0    50   Input ~ 0
S_PD_OUT2
Text HLabel 6500 3600 0    50   Input ~ 0
S_PD_OUT3
Text HLabel 6500 2350 0    50   Input ~ 0
S_PD_OUT4
Text HLabel 6500 3400 0    50   Input ~ 0
S_PD_OUT5
Text HLabel 6500 2150 0    50   Input ~ 0
S_PD_OUT6
Text HLabel 6500 3200 0    50   Input ~ 0
S_PD_OUT7
Text HLabel 6500 1950 0    50   Input ~ 0
S_PD_OUT8
Text HLabel 6500 3100 0    50   Input ~ 0
S_PD_OUT9
Text HLabel 6500 2050 0    50   Input ~ 0
S_PD_OUT10
Text HLabel 6500 3300 0    50   Input ~ 0
S_PD_OUT11
Text HLabel 6500 2250 0    50   Input ~ 0
S_PD_OUT12
Text HLabel 6500 3500 0    50   Input ~ 0
S_PD_OUT13
Text HLabel 6500 2450 0    50   Input ~ 0
S_PD_OUT14
Text HLabel 6500 3700 0    50   Input ~ 0
S_PD_OUT15
Text HLabel 6500 2650 0    50   Input ~ 0
S_PD_OUT16
Wire Wire Line
	1050 4300 1250 4300
Wire Wire Line
	4000 5200 3850 5200
Text GLabel 6500 3900 0    50   Input ~ 0
GNDA
Text GLabel 6500 4000 0    50   Input ~ 0
GNDA
Wire Wire Line
	6750 2750 6500 2750
Wire Wire Line
	6750 2850 6500 2850
Wire Wire Line
	6750 3200 6500 3200
Wire Wire Line
	6750 3300 6500 3300
Wire Wire Line
	6750 3400 6500 3400
Wire Wire Line
	6750 3500 6500 3500
Wire Wire Line
	6750 3600 6500 3600
Wire Wire Line
	6750 3700 6500 3700
Wire Wire Line
	6750 3800 6500 3800
Wire Wire Line
	6750 3900 6500 3900
Wire Wire Line
	6750 4000 6500 4000
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
$Comp
L Connector:Conn_01x10_Male JPDS1
U 1 1 60D7840A
P 6950 2350
F 0 "JPDS1" H 6922 2324 50  0000 R CNN
F 1 "Conn_01x10_Male" H 6922 2233 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch1.27mm" H 6950 2350 50  0001 C CNN
F 3 "~" H 6950 2350 50  0001 C CNN
	1    6950 2350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male JPDS2
U 1 1 60D79D33
P 6950 3500
F 0 "JPDS2" H 6922 3474 50  0000 R CNN
F 1 "Conn_01x10_Male" H 6922 3383 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch1.27mm" H 6950 3500 50  0001 C CNN
F 3 "~" H 6950 3500 50  0001 C CNN
	1    6950 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6750 1950 6500 1950
Wire Wire Line
	6750 2050 6500 2050
Wire Wire Line
	6750 2150 6500 2150
Wire Wire Line
	6750 2250 6500 2250
Wire Wire Line
	6750 2350 6500 2350
Wire Wire Line
	6750 2450 6500 2450
Wire Wire Line
	6750 2550 6500 2550
Wire Wire Line
	6750 2650 6500 2650
Wire Wire Line
	6500 3100 6750 3100
Text GLabel 6500 2750 0    50   Input ~ 0
PD_TH1
Text GLabel 6500 2850 0    50   Input ~ 0
PD_TH2
$EndSCHEMATC
