EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 10
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
L Ninja-qPCR:SN74LVC1G04DBVR U18
U 1 1 60B0D57A
P 4750 6500
F 0 "U18" H 4750 6967 50  0000 C CNN
F 1 "SN74LVC1GU04DCKR" H 4750 6876 50  0000 C CNN
F 2 "Ninja-qPCR:SN74LVC1GU04DBVR" H 4750 6500 50  0001 L BNN
F 3 "IPC-7351B" H 4750 6500 50  0001 L BNN
F 4 "1.45mm" H 4750 6500 50  0001 L BNN "Field4"
F 5 "AD" H 4750 6500 50  0001 L BNN "Field5"
F 6 "Texas Instruments" H 4750 6500 50  0001 L BNN "Field6"
	1    4750 6500
	1    0    0    -1  
$EndComp
Text GLabel 4200 6500 0    50   Input ~ 0
MUX_SELECT
Text HLabel 5300 6500 2    50   Input ~ 0
MUX_SELECT_INV
NoConn ~ 5300 6300
Wire Wire Line
	4350 6300 4200 6300
Wire Wire Line
	4200 6500 4350 6500
Wire Wire Line
	5300 6300 5150 6300
Wire Wire Line
	5300 6500 5150 6500
Wire Wire Line
	5300 6700 5150 6700
Text HLabel 6250 1250 2    50   Input ~ 0
MUX_SELECT_INV
Text GLabel 3350 1550 0    50   Input ~ 0
MUX_S3
Text GLabel 3350 1450 0    50   Input ~ 0
MUX_S2
Text GLabel 3350 1350 0    50   Input ~ 0
MUX_S1
Text GLabel 3350 1250 0    50   Input ~ 0
MUX_S0
Wire Wire Line
	6250 3150 6100 3150
Wire Wire Line
	6250 2950 6100 2950
Wire Wire Line
	6250 2850 6100 2850
Wire Wire Line
	6250 2750 6100 2750
Wire Wire Line
	6250 2650 6100 2650
Wire Wire Line
	6250 2550 6100 2550
Wire Wire Line
	6250 2450 6100 2450
Wire Wire Line
	6250 2350 6100 2350
Wire Wire Line
	6250 2250 6100 2250
Wire Wire Line
	6250 2150 6100 2150
Wire Wire Line
	6250 2050 6100 2050
Wire Wire Line
	6250 1950 6100 1950
Wire Wire Line
	6250 1850 6100 1850
Wire Wire Line
	6250 1750 6100 1750
Wire Wire Line
	6250 1650 6100 1650
Wire Wire Line
	6250 1550 6100 1550
Wire Wire Line
	6250 1450 6100 1450
Wire Wire Line
	6250 1250 6100 1250
Wire Wire Line
	3500 1250 3350 1250
Wire Wire Line
	3500 1350 3350 1350
Wire Wire Line
	3500 1450 3350 1450
Wire Wire Line
	3500 1550 3350 1550
Text GLabel 5300 6700 2    50   Input ~ 0
-1V
Text GLabel 4200 6300 0    50   Input ~ 0
3V3D
$Comp
L Ninja-qPCR:CD74HC4067M96 U19
U 2 1 60B0D59F
P 6050 4300
F 0 "U19" H 7350 4687 60  0000 C CNN
F 1 "CD74HC4067M96" H 7350 4581 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 7350 4540 60  0001 C CNN
F 3 "" H 6050 4300 60  0000 C CNN
	2    6050 4300
	-1   0    0    -1  
$EndComp
Text GLabel 3250 4400 0    50   Input ~ 0
-1V
Text GLabel 6200 5300 2    50   Input ~ 0
3V3D
Text GLabel 6250 3150 2    50   Input ~ 0
PD_MUX_OUT
Text HLabel 6250 2250 2    50   Input ~ 0
S_PD_OUT9
Text HLabel 6250 2350 2    50   Input ~ 0
S_PD_OUT10
Text HLabel 6250 2450 2    50   Input ~ 0
S_PD_OUT11
Text HLabel 6250 2550 2    50   Input ~ 0
S_PD_OUT12
Text HLabel 6250 2650 2    50   Input ~ 0
S_PD_OUT13
Text HLabel 6250 2750 2    50   Input ~ 0
S_PD_OUT14
Text HLabel 6250 2850 2    50   Input ~ 0
S_PD_OUT15
Text HLabel 6250 2950 2    50   Input ~ 0
S_PD_OUT16
Wire Wire Line
	3250 4400 3450 4400
Wire Wire Line
	6200 5300 6050 5300
$Comp
L Ninja-qPCR:CD74HC4067M96 U19
U 1 1 60B0D5A6
P 6100 1250
F 0 "U19" H 7400 1637 60  0000 C CNN
F 1 "CD74HC4067M96" H 7400 1531 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 7400 1490 60  0001 C CNN
F 3 "" H 6100 1250 60  0000 C CNN
	1    6100 1250
	-1   0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_01x60_Male J?
U 1 1 614C5E7E
P 1150 3150
AR Path="/614F8F7A/614C5E7E" Ref="J?"  Part="1" 
AR Path="/614A4E6A/614C5E7E" Ref="J?"  Part="1" 
AR Path="/6154FC7E/614C5E7E" Ref="J18"  Part="1" 
F 0 "J18" H 1258 5231 50  0000 C CNN
F 1 "Conn_01x60_Male" H 1258 5140 50  0000 C CNN
F 2 "Ninja-qPCR:FFC_60_Ali_HUISHUNFA" H 1150 3150 50  0001 C CNN
F 3 "~" H 1150 3150 50  0001 C CNN
	1    1150 3150
	1    0    0    -1  
$EndComp
Text GLabel 1650 1250 2    50   Input ~ 0
GNDL
Text GLabel 1650 1350 2    50   Input ~ 0
GNDL
Text GLabel 1650 1450 2    50   Input ~ 0
VCC_LED
Text GLabel 1650 1550 2    50   Input ~ 0
VCC_LED
Text GLabel 1650 3250 2    50   Input ~ 0
GNDL
Text GLabel 1650 3350 2    50   Input ~ 0
GNDA
Text HLabel 1650 3450 2    50   Input ~ 0
S_PD_OUT16
Text HLabel 1650 3550 2    50   Input ~ 0
S_PD_OUT15
Text HLabel 1650 3650 2    50   Input ~ 0
S_PD_OUT14
Text HLabel 1650 3750 2    50   Input ~ 0
S_PD_OUT13
Text HLabel 1650 3850 2    50   Input ~ 0
S_PD_OUT12
Text HLabel 1650 3950 2    50   Input ~ 0
S_PD_OUT11
Text HLabel 1650 4050 2    50   Input ~ 0
S_PD_OUT10
Text HLabel 1650 4150 2    50   Input ~ 0
S_PD_OUT9
Text HLabel 1650 4250 2    50   Input ~ 0
S_PD_OUT8
Text HLabel 1650 4350 2    50   Input ~ 0
S_PD_OUT7
Text HLabel 1650 4450 2    50   Input ~ 0
S_PD_OUT6
Text HLabel 1650 4550 2    50   Input ~ 0
S_PD_OUT5
Text HLabel 1650 4650 2    50   Input ~ 0
S_PD_OUT4
Text HLabel 1650 4750 2    50   Input ~ 0
S_PD_OUT3
Text HLabel 1650 4850 2    50   Input ~ 0
S_PD_OUT2
Text HLabel 1650 4950 2    50   Input ~ 0
S_PD_OUT1
Text GLabel 1650 5050 2    50   Input ~ 0
GNDA
Text GLabel 1650 5350 2    50   Input ~ 0
GNDA
Text HLabel 1650 5450 2    50   Input ~ 0
N_PD_OUT1
Text HLabel 1650 5550 2    50   Input ~ 0
N_PD_OUT2
Text HLabel 1650 5650 2    50   Input ~ 0
N_PD_OUT3
Text HLabel 1650 5750 2    50   Input ~ 0
N_PD_OUT4
Text HLabel 1650 5850 2    50   Input ~ 0
N_PD_OUT5
Text HLabel 1650 5950 2    50   Input ~ 0
N_PD_OUT6
Text HLabel 1650 6050 2    50   Input ~ 0
N_PD_OUT7
Text HLabel 1650 6150 2    50   Input ~ 0
N_PD_OUT8
Text HLabel 1650 6250 2    50   Input ~ 0
N_PD_OUT9
Text HLabel 1650 6350 2    50   Input ~ 0
N_PD_OUT10
Text HLabel 1650 6450 2    50   Input ~ 0
N_PD_OUT11
Text HLabel 1650 6550 2    50   Input ~ 0
N_PD_OUT12
Text HLabel 1650 6650 2    50   Input ~ 0
N_PD_OUT13
Text HLabel 1650 6750 2    50   Input ~ 0
N_PD_OUT14
Text HLabel 1650 6850 2    50   Input ~ 0
N_PD_OUT15
Text HLabel 1650 6950 2    50   Input ~ 0
N_PD_OUT16
Text GLabel 1650 7050 2    50   Input ~ 0
GNDA
Text GLabel 1650 7150 2    50   Input ~ 0
GNDA
Wire Wire Line
	1650 7150 1350 7150
Wire Wire Line
	1650 7050 1350 7050
Wire Wire Line
	1650 6950 1350 6950
Wire Wire Line
	1650 6850 1350 6850
Wire Wire Line
	1650 6750 1350 6750
Wire Wire Line
	1650 6650 1350 6650
Wire Wire Line
	1650 6550 1350 6550
Wire Wire Line
	1650 6450 1350 6450
Wire Wire Line
	1650 6350 1350 6350
Wire Wire Line
	1650 6250 1350 6250
Wire Wire Line
	1650 6150 1350 6150
Wire Wire Line
	1650 6050 1350 6050
Wire Wire Line
	1650 5950 1350 5950
Wire Wire Line
	1650 1250 1350 1250
Wire Wire Line
	1650 1350 1350 1350
Wire Wire Line
	1650 1450 1350 1450
Wire Wire Line
	1650 1550 1350 1550
Wire Wire Line
	1650 1650 1350 1650
Wire Wire Line
	1650 1750 1350 1750
Wire Wire Line
	1650 1850 1350 1850
Wire Wire Line
	1650 1950 1350 1950
Wire Wire Line
	1650 2050 1350 2050
Wire Wire Line
	1650 2150 1350 2150
Wire Wire Line
	1650 2250 1350 2250
Wire Wire Line
	1650 2350 1350 2350
Wire Wire Line
	1650 2450 1350 2450
Wire Wire Line
	1650 2550 1350 2550
Wire Wire Line
	1650 2650 1350 2650
Wire Wire Line
	1650 2750 1350 2750
Wire Wire Line
	1650 2850 1350 2850
Wire Wire Line
	1650 2950 1350 2950
Wire Wire Line
	1650 3050 1350 3050
Wire Wire Line
	1650 3150 1350 3150
Wire Wire Line
	1650 3250 1350 3250
Wire Wire Line
	1650 3350 1350 3350
Wire Wire Line
	1650 3450 1350 3450
Wire Wire Line
	1650 3550 1350 3550
Wire Wire Line
	1650 3650 1350 3650
Wire Wire Line
	1650 3750 1350 3750
Wire Wire Line
	1650 3850 1350 3850
Wire Wire Line
	1650 3950 1350 3950
Wire Wire Line
	1650 4050 1350 4050
Wire Wire Line
	1650 4150 1350 4150
Wire Wire Line
	1650 4250 1350 4250
Wire Wire Line
	1650 4350 1350 4350
Wire Wire Line
	1650 4450 1350 4450
Wire Wire Line
	1650 4550 1350 4550
Wire Wire Line
	1650 4650 1350 4650
Wire Wire Line
	1650 4750 1350 4750
Wire Wire Line
	1650 4850 1350 4850
Wire Wire Line
	1650 4950 1350 4950
Wire Wire Line
	1650 5050 1350 5050
Wire Wire Line
	1650 5150 1350 5150
Wire Wire Line
	1650 5250 1350 5250
Wire Wire Line
	1650 5350 1350 5350
Wire Wire Line
	1650 5450 1350 5450
Wire Wire Line
	1650 5550 1350 5550
Wire Wire Line
	1650 5650 1350 5650
Wire Wire Line
	1650 5750 1350 5750
Wire Wire Line
	1650 5850 1350 5850
Text GLabel 10450 1250 2    50   Input ~ 0
MUX_SELECT
$Comp
L Ninja-qPCR:CD74HC4067M96 U?
U 2 1 6152C5C5
P 10350 4250
AR Path="/60AF0518/6152C5C5" Ref="U?"  Part="1" 
AR Path="/60C04E5C/6152C5C5" Ref="U?"  Part="2" 
AR Path="/614A5737/6152C5C5" Ref="U?"  Part="2" 
AR Path="/6154FC7E/6152C5C5" Ref="U20"  Part="2" 
F 0 "U20" H 11650 4637 60  0000 C CNN
F 1 "CD74HC4067M96" H 11650 4531 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 11650 4490 60  0001 C CNN
F 3 "" H 10350 4250 60  0000 C CNN
	2    10350 4250
	-1   0    0    -1  
$EndComp
Text GLabel 7550 1550 0    50   Input ~ 0
MUX_S3
Text GLabel 7550 1450 0    50   Input ~ 0
MUX_S2
Text GLabel 7550 1350 0    50   Input ~ 0
MUX_S1
Text GLabel 7550 1250 0    50   Input ~ 0
MUX_S0
Wire Wire Line
	7700 1250 7550 1250
Wire Wire Line
	7550 1350 7700 1350
Wire Wire Line
	7700 1450 7550 1450
Wire Wire Line
	7550 1550 7700 1550
Wire Wire Line
	10450 1250 10300 1250
Wire Wire Line
	10450 1450 10300 1450
Wire Wire Line
	10450 1550 10300 1550
Wire Wire Line
	10450 1650 10300 1650
Wire Wire Line
	10450 1750 10300 1750
Wire Wire Line
	10450 1850 10300 1850
Wire Wire Line
	10450 1950 10300 1950
Wire Wire Line
	10450 2050 10300 2050
Wire Wire Line
	10450 2150 10300 2150
Wire Wire Line
	10450 2250 10300 2250
Wire Wire Line
	10450 2350 10300 2350
Wire Wire Line
	10450 2450 10300 2450
Wire Wire Line
	10450 2550 10300 2550
Wire Wire Line
	10450 2650 10300 2650
Wire Wire Line
	10450 2750 10300 2750
Wire Wire Line
	10450 2850 10300 2850
Wire Wire Line
	10450 2950 10300 2950
Wire Wire Line
	10450 3150 10300 3150
Text GLabel 10450 3150 2    50   Input ~ 0
PD_MUX_OUT
Text GLabel 7450 4350 0    50   Input ~ 0
-1V
Text GLabel 10550 5250 2    50   Input ~ 0
3V3D
$Comp
L Ninja-qPCR:CD74HC4067M96 U?
U 1 1 6152C5E8
P 10300 1250
AR Path="/60AF0518/6152C5E8" Ref="U?"  Part="2" 
AR Path="/60C04E5C/6152C5E8" Ref="U?"  Part="1" 
AR Path="/614A5737/6152C5E8" Ref="U?"  Part="1" 
AR Path="/6154FC7E/6152C5E8" Ref="U20"  Part="1" 
F 0 "U20" H 11600 1637 60  0000 C CNN
F 1 "CD74HC4067M96" H 11600 1531 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 11600 1490 60  0001 C CNN
F 3 "" H 10300 1250 60  0000 C CNN
	1    10300 1250
	-1   0    0    -1  
$EndComp
Text HLabel 10450 2850 2    50   Input ~ 0
N_PD_OUT2
Text HLabel 10450 2750 2    50   Input ~ 0
N_PD_OUT3
Text HLabel 10450 2650 2    50   Input ~ 0
N_PD_OUT4
Text HLabel 10450 2550 2    50   Input ~ 0
N_PD_OUT5
Text HLabel 10450 2450 2    50   Input ~ 0
N_PD_OUT6
Text HLabel 10450 2350 2    50   Input ~ 0
N_PD_OUT7
Text HLabel 10450 2250 2    50   Input ~ 0
N_PD_OUT8
Text HLabel 10450 1450 2    50   Input ~ 0
N_PD_OUT9
Text HLabel 10450 1550 2    50   Input ~ 0
N_PD_OUT10
Text HLabel 10450 1650 2    50   Input ~ 0
N_PD_OUT11
Text HLabel 10450 1750 2    50   Input ~ 0
N_PD_OUT12
Text HLabel 10450 1850 2    50   Input ~ 0
N_PD_OUT13
Text HLabel 10450 1950 2    50   Input ~ 0
N_PD_OUT14
Text HLabel 10450 2050 2    50   Input ~ 0
N_PD_OUT15
Text HLabel 10450 2150 2    50   Input ~ 0
N_PD_OUT16
Wire Wire Line
	10550 5250 10350 5250
Wire Wire Line
	7450 4350 7750 4350
Text GLabel 1650 1650 2    50   Input ~ 0
S_LED_OUT8
Text GLabel 1650 1750 2    50   Input ~ 0
S_LED_OUT7
Text GLabel 1650 1850 2    50   Input ~ 0
S_LED_OUT6
Text GLabel 1650 1950 2    50   Input ~ 0
S_LED_OUT5
Text GLabel 1650 2050 2    50   Input ~ 0
S_LED_OUT4
Text GLabel 1650 2150 2    50   Input ~ 0
S_LED_OUT3
Text GLabel 1650 2250 2    50   Input ~ 0
S_LED_OUT2
Text GLabel 1650 2350 2    50   Input ~ 0
S_LED_OUT1
Text GLabel 1650 2450 2    50   Input ~ 0
N_LED_OUT8
Text GLabel 1650 2550 2    50   Input ~ 0
N_LED_OUT7
Text GLabel 1650 2650 2    50   Input ~ 0
N_LED_OUT6
Text GLabel 1650 2750 2    50   Input ~ 0
N_LED_OUT5
Text GLabel 1650 2850 2    50   Input ~ 0
N_LED_OUT4
Text GLabel 1650 2950 2    50   Input ~ 0
N_LED_OUT3
Text GLabel 1650 3050 2    50   Input ~ 0
N_LED_OUT2
Text GLabel 1650 3150 2    50   Input ~ 0
N_LED_OUT1
Text GLabel 1650 5150 2    50   Input ~ 0
PD_TH1
Text GLabel 1650 5250 2    50   Input ~ 0
PD_TH2
Text HLabel 6250 1450 2    50   Input ~ 0
S_PD_OUT8
Text HLabel 6250 1550 2    50   Input ~ 0
S_PD_OUT7
Text HLabel 6250 1650 2    50   Input ~ 0
S_PD_OUT6
Text HLabel 6250 1750 2    50   Input ~ 0
S_PD_OUT5
Text HLabel 6250 1850 2    50   Input ~ 0
S_PD_OUT4
Text HLabel 6250 1950 2    50   Input ~ 0
S_PD_OUT3
Text HLabel 6250 2050 2    50   Input ~ 0
S_PD_OUT2
Text HLabel 6250 2150 2    50   Input ~ 0
S_PD_OUT1
Text HLabel 10450 2950 2    50   Input ~ 0
N_PD_OUT1
NoConn ~ 1650 7350
NoConn ~ 1650 7450
Wire Wire Line
	1650 7350 1350 7350
Wire Wire Line
	1650 7450 1350 7450
$EndSCHEMATC
