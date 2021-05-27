EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Ninja-qPCR:CD74HC4067M96 U?
U 1 1 60B1EBDE
P 5900 1700
AR Path="/60B1EBDE" Ref="U?"  Part="1" 
AR Path="/60B09AA3/60B1EBDE" Ref="U?"  Part="1" 
F 0 "U?" H 7200 2087 60  0000 C CNN
F 1 "CD74HC4067M96" H 7200 1981 60  0000 C CNN
F 2 "DW24_TEX" H 7200 1940 60  0001 C CNN
F 3 "" H 5900 1700 60  0000 C CNN
	1    5900 1700
	1    0    0    -1  
$EndComp
Text GLabel 5650 2400 0    50   Input ~ 0
THERM_EXT2
Text GLabel 5650 2300 0    50   Input ~ 0
THERM_EXT1
Text GLabel 5650 2200 0    50   Input ~ 0
THERM_LID2
Text GLabel 5650 2100 0    50   Input ~ 0
THERM_LID1
Text GLabel 5650 2000 0    50   Input ~ 0
THERM_AIR
Text GLabel 5650 2500 0    50   Input ~ 0
THERM_EXT3
Text GLabel 5650 1900 0    50   Input ~ 0
THERM_WELL
Text GLabel 8700 2000 2    50   Input ~ 0
MUX_S3
Text GLabel 8700 1900 2    50   Input ~ 0
MUX_S2
Text GLabel 8700 1700 2    50   Input ~ 0
MUX_S0
Text GLabel 8700 1800 2    50   Input ~ 0
MUX_S1
Text GLabel 5650 1700 0    50   Input ~ 0
MUX_SELECT
Wire Wire Line
	5650 1700 5900 1700
Wire Wire Line
	8700 1700 8500 1700
Wire Wire Line
	8700 1800 8500 1800
Wire Wire Line
	8700 1900 8500 1900
Wire Wire Line
	8700 2000 8500 2000
Wire Wire Line
	5650 1900 5900 1900
Wire Wire Line
	5650 2000 5900 2000
Wire Wire Line
	5650 2100 5900 2100
Wire Wire Line
	5650 2200 5900 2200
Wire Wire Line
	5650 2300 5900 2300
Wire Wire Line
	5650 2400 5900 2400
Wire Wire Line
	5650 2500 5900 2500
NoConn ~ 5650 2600
NoConn ~ 5650 2700
NoConn ~ 5650 2800
NoConn ~ 5650 2900
NoConn ~ 5650 3000
NoConn ~ 5650 3100
NoConn ~ 5650 3200
NoConn ~ 5650 3300
NoConn ~ 5650 3400
Wire Wire Line
	5650 2600 5900 2600
Wire Wire Line
	5650 2700 5900 2700
Wire Wire Line
	5650 2800 5900 2800
Wire Wire Line
	5650 2900 5900 2900
Wire Wire Line
	5650 3000 5900 3000
Wire Wire Line
	5650 3100 5900 3100
Wire Wire Line
	5650 3200 5900 3200
Wire Wire Line
	5650 3300 5900 3300
Wire Wire Line
	5650 3400 5900 3400
Wire Wire Line
	5900 3600 5800 3600
Wire Wire Line
	5800 3600 5800 4000
Wire Wire Line
	5800 4000 5350 4000
Connection ~ 5800 3600
Text GLabel 5350 4000 0    50   Input ~ 0
THERM_MUX_OUT
Text Notes 3000 4450 0    50   ~ 0
IN=High : COM <-> NO\nIN=Low : COM <-> NC
$Comp
L power:GND #PWR?
U 1 1 60D3592E
P 2700 3800
AR Path="/60AC9047/60D3592E" Ref="#PWR?"  Part="1" 
AR Path="/60D3592E" Ref="#PWR?"  Part="1" 
AR Path="/60B09AA3/60D3592E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 3550 50  0001 C CNN
F 1 "GND" H 2705 3627 50  0000 C CNN
F 2 "" H 2700 3800 50  0001 C CNN
F 3 "" H 2700 3800 50  0001 C CNN
	1    2700 3800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 3200 4100 3200
Wire Wire Line
	4100 3400 4050 3400
$Comp
L Ninja-qPCR:TS5A9411DCKR U?
U 1 1 60D3593D
P 3450 3500
AR Path="/60AC9047/60D3593D" Ref="U?"  Part="1" 
AR Path="/60D3593D" Ref="U?"  Part="1" 
AR Path="/60B09AA3/60D3593D" Ref="U?"  Part="1" 
F 0 "U?" H 3450 4188 60  0000 C CNN
F 1 "TS5A9411DCKR" H 3450 4082 60  0000 C CNN
F 2 "DCK0006A_N" H 3450 3440 60  0001 C CNN
F 3 "" H 3450 3500 60  0000 C CNN
	1    3450 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 3800 2850 3800
Text GLabel 4100 3400 2    50   Input ~ 0
THERM_R_SWITCH
$Comp
L Device:R R?
U 1 1 60D549A8
P 2500 3250
AR Path="/5F58C19F/60D549A8" Ref="R?"  Part="1" 
AR Path="/60D549A8" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60D549A8" Ref="R?"  Part="1" 
AR Path="/60AEA148/60D549A8" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60D549A8" Ref="R?"  Part="1" 
AR Path="/60B09AA3/60D549A8" Ref="R?"  Part="1" 
F 0 "R?" V 2293 3250 50  0000 C CNN
F 1 "47k" V 2384 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2430 3250 50  0001 C CNN
F 3 "~" H 2500 3250 50  0001 C CNN
	1    2500 3250
	0    -1   1    0   
$EndComp
Wire Wire Line
	2200 3250 2350 3250
$Comp
L Device:R R?
U 1 1 60D57FA5
P 2500 3600
AR Path="/5F58C19F/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60D57FA5" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60AEA148/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60B09AA3/60D57FA5" Ref="R?"  Part="1" 
F 0 "R?" V 2293 3600 50  0000 C CNN
F 1 "47k" V 2384 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2430 3600 50  0001 C CNN
F 3 "~" H 2500 3600 50  0001 C CNN
	1    2500 3600
	0    -1   1    0   
$EndComp
Wire Wire Line
	2850 3600 2650 3600
Wire Wire Line
	2350 3600 2200 3600
Wire Wire Line
	2200 3250 2200 3600
Connection ~ 2200 3600
Wire Wire Line
	4050 3600 4850 3600
Wire Wire Line
	6250 5250 6500 5250
Text GLabel 1850 3600 0    50   Input ~ 0
3V3A
Wire Wire Line
	1850 3600 2200 3600
$Comp
L Ninja-qPCR:CD74HC4067M96 U?
U 2 1 60B1EBE4
P 6500 4250
AR Path="/60B1EBE4" Ref="U?"  Part="2" 
AR Path="/60B09AA3/60B1EBE4" Ref="U?"  Part="2" 
F 0 "U?" H 7800 4637 60  0000 C CNN
F 1 "CD74HC4067M96" H 7800 4531 60  0000 C CNN
F 2 "DW24_TEX" H 7800 4490 60  0001 C CNN
F 3 "" H 6500 4250 60  0000 C CNN
	2    6500 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B11468
P 9250 4350
AR Path="/60AC9047/60B11468" Ref="#PWR?"  Part="1" 
AR Path="/60B11468" Ref="#PWR?"  Part="1" 
AR Path="/60B09AA3/60B11468" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9250 4100 50  0001 C CNN
F 1 "GND" H 9255 4177 50  0000 C CNN
F 2 "" H 9250 4350 50  0001 C CNN
F 3 "" H 9250 4350 50  0001 C CNN
	1    9250 4350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9250 4350 9100 4350
Wire Wire Line
	2850 3400 2750 3400
Wire Wire Line
	2750 3400 2750 3250
Wire Wire Line
	2750 3250 2650 3250
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 60B18AB9
P 3500 2450
F 0 "JP?" H 3500 2685 50  0000 C CNN
F 1 "Jumper_2_Open" H 3500 2594 50  0000 C CNN
F 2 "" H 3500 2450 50  0001 C CNN
F 3 "~" H 3500 2450 50  0001 C CNN
	1    3500 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2450 2750 2450
Wire Wire Line
	2750 2450 2750 3250
Connection ~ 2750 3250
Wire Wire Line
	3700 2450 4850 2450
Wire Wire Line
	4850 2450 4850 3600
Connection ~ 4850 3600
Wire Wire Line
	4850 3600 5800 3600
Text Notes 2900 2150 0    50   ~ 0
Connet in case of switching trouble
Text GLabel 4100 3200 2    50   Input ~ 0
3V3D
Text GLabel 6250 5250 0    50   Input ~ 0
3V3D
$EndSCHEMATC
