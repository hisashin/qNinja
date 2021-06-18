EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 4200 1350 2    50   Input ~ 0
MUX_SELECT
$Comp
L Ninja-qPCR:CD74HC4067M96 U?
U 2 1 60C17108
P 4150 5750
AR Path="/60AF0518/60C17108" Ref="U?"  Part="1" 
AR Path="/60C04E5C/60C17108" Ref="U14"  Part="2" 
F 0 "U14" H 5450 6137 60  0000 C CNN
F 1 "CD74HC4067M96" H 5450 6031 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 5450 5990 60  0001 C CNN
F 3 "" H 4150 5750 60  0000 C CNN
	2    4150 5750
	-1   0    0    -1  
$EndComp
Text GLabel 1300 1650 0    50   Input ~ 0
MUX_S3
Text GLabel 1300 1550 0    50   Input ~ 0
MUX_S2
Text GLabel 1300 1450 0    50   Input ~ 0
MUX_S1
Text GLabel 1300 1350 0    50   Input ~ 0
MUX_S0
Wire Wire Line
	1450 1350 1300 1350
Wire Wire Line
	1300 1450 1450 1450
Wire Wire Line
	1450 1550 1300 1550
Wire Wire Line
	1300 1650 1450 1650
Wire Wire Line
	4200 1350 4050 1350
Wire Wire Line
	4200 1550 4050 1550
Wire Wire Line
	4200 1650 4050 1650
Wire Wire Line
	4200 1750 4050 1750
Wire Wire Line
	4200 1850 4050 1850
Wire Wire Line
	4200 1950 4050 1950
Wire Wire Line
	4200 2050 4050 2050
Wire Wire Line
	4200 2150 4050 2150
Wire Wire Line
	4200 2250 4050 2250
Wire Wire Line
	4200 2350 4050 2350
Wire Wire Line
	4200 2450 4050 2450
Wire Wire Line
	4200 2550 4050 2550
Wire Wire Line
	4200 2650 4050 2650
Wire Wire Line
	4200 2750 4050 2750
Wire Wire Line
	4200 2850 4050 2850
Wire Wire Line
	4200 2950 4050 2950
Wire Wire Line
	4200 3050 4050 3050
Wire Wire Line
	4200 3250 4050 3250
Text GLabel 4200 3250 2    50   Input ~ 0
PD_MUX_OUT
Text GLabel 1250 5850 0    50   Input ~ 0
-1V
Text GLabel 4350 6750 2    50   Input ~ 0
3V3D
$Comp
L Ninja-qPCR:CD74HC4067M96 U?
U 1 1 60C3FEF0
P 4050 1350
AR Path="/60AF0518/60C3FEF0" Ref="U?"  Part="2" 
AR Path="/60C04E5C/60C3FEF0" Ref="U14"  Part="1" 
F 0 "U14" H 5350 1737 60  0000 C CNN
F 1 "CD74HC4067M96" H 5350 1631 60  0000 C CNN
F 2 "Ninja-qPCR:SOP65P780X200-24N" H 5350 1590 60  0001 C CNN
F 3 "" H 4050 1350 60  0000 C CNN
	1    4050 1350
	-1   0    0    -1  
$EndComp
Text HLabel 4200 1550 2    50   Input ~ 0
N_PD_OUT1
Text HLabel 4200 1650 2    50   Input ~ 0
N_PD_OUT2
Text HLabel 4200 1750 2    50   Input ~ 0
N_PD_OUT3
Text HLabel 4200 1850 2    50   Input ~ 0
N_PD_OUT4
Text HLabel 4200 1950 2    50   Input ~ 0
N_PD_OUT5
Text HLabel 4200 2050 2    50   Input ~ 0
N_PD_OUT6
Text HLabel 4200 2150 2    50   Input ~ 0
N_PD_OUT7
Text HLabel 4200 2250 2    50   Input ~ 0
N_PD_OUT8
Text HLabel 4200 2350 2    50   Input ~ 0
N_PD_OUT9
Text HLabel 4200 2450 2    50   Input ~ 0
N_PD_OUT10
Text HLabel 4200 2550 2    50   Input ~ 0
N_PD_OUT11
Text HLabel 4200 2650 2    50   Input ~ 0
N_PD_OUT12
Text HLabel 4200 2750 2    50   Input ~ 0
N_PD_OUT13
Text HLabel 4200 2850 2    50   Input ~ 0
N_PD_OUT14
Text HLabel 4200 2950 2    50   Input ~ 0
N_PD_OUT15
Text HLabel 4200 3050 2    50   Input ~ 0
N_PD_OUT16
Text HLabel 7850 2700 0    50   Input ~ 0
N_PD_OUT1
Text HLabel 7850 2900 0    50   Input ~ 0
N_PD_OUT3
Text HLabel 7850 2800 0    50   Input ~ 0
N_PD_OUT2
Text HLabel 7850 3000 0    50   Input ~ 0
N_PD_OUT4
Text HLabel 7850 3100 0    50   Input ~ 0
N_PD_OUT5
Text HLabel 7850 3200 0    50   Input ~ 0
N_PD_OUT6
Text HLabel 7850 3300 0    50   Input ~ 0
N_PD_OUT7
Text HLabel 7850 3400 0    50   Input ~ 0
N_PD_OUT8
Text HLabel 7850 3500 0    50   Input ~ 0
N_PD_OUT9
Text HLabel 7850 3600 0    50   Input ~ 0
N_PD_OUT10
Text HLabel 7850 3700 0    50   Input ~ 0
N_PD_OUT11
Text HLabel 7850 3800 0    50   Input ~ 0
N_PD_OUT12
Text HLabel 7850 3900 0    50   Input ~ 0
N_PD_OUT13
Text HLabel 7850 4000 0    50   Input ~ 0
N_PD_OUT14
Text HLabel 7850 4100 0    50   Input ~ 0
N_PD_OUT15
Text HLabel 7850 4200 0    50   Input ~ 0
N_PD_OUT16
Wire Wire Line
	4350 6750 4150 6750
Wire Wire Line
	1250 5850 1550 5850
Text GLabel 7850 4300 0    50   Input ~ 0
GNDA
Text GLabel 7850 4400 0    50   Input ~ 0
GNDA
Text GLabel 7850 2600 0    50   Input ~ 0
GNDA
Text GLabel 7850 2500 0    50   Input ~ 0
GNDA
$Comp
L Connector:Conn_01x20_Male JPD?
U 1 1 60CFB9BA
P 8300 3400
AR Path="/60AF0518/60CFB9BA" Ref="JPD?"  Part="1" 
AR Path="/60C04E5C/60CFB9BA" Ref="JPDN1"  Part="1" 
F 0 "JPDN1" H 8272 3374 50  0000 R CNN
F 1 "Conn_01x20_Male" H 8272 3283 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x10_Pitch1.27mm" H 8300 3400 50  0001 C CNN
F 3 "~" H 8300 3400 50  0001 C CNN
	1    8300 3400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8100 2500 7850 2500
Wire Wire Line
	8100 2600 7850 2600
Wire Wire Line
	8100 2700 7850 2700
Wire Wire Line
	8100 2800 7850 2800
Wire Wire Line
	8100 2900 7850 2900
Wire Wire Line
	8100 3000 7850 3000
Wire Wire Line
	8100 3100 7850 3100
Wire Wire Line
	8100 3200 7850 3200
Wire Wire Line
	8100 3300 7850 3300
Wire Wire Line
	8100 3400 7850 3400
Wire Wire Line
	8100 3500 7850 3500
Wire Wire Line
	8100 3600 7850 3600
Wire Wire Line
	8100 3700 7850 3700
Wire Wire Line
	8100 3800 7850 3800
Wire Wire Line
	8100 3900 7850 3900
Wire Wire Line
	8100 4000 7850 4000
Wire Wire Line
	8100 4100 7850 4100
Wire Wire Line
	8100 4200 7850 4200
Wire Wire Line
	8100 4300 7850 4300
Wire Wire Line
	8100 4400 7850 4400
$EndSCHEMATC
