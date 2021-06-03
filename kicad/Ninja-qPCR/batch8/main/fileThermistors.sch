EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
P 5200 1900
AR Path="/60B1EBDE" Ref="U?"  Part="1" 
AR Path="/60B09AA3/60B1EBDE" Ref="U7"  Part="1" 
F 0 "U7" H 6500 2287 60  0000 C CNN
F 1 "CD74HC4067M96" H 6500 2181 60  0000 C CNN
F 2 "Ninja-qPCR:CD74HC4067M96" H 6500 2140 60  0001 C CNN
F 3 "" H 5200 1900 60  0000 C CNN
	1    5200 1900
	1    0    0    -1  
$EndComp
Text GLabel 4950 2600 0    50   Input ~ 0
THERM_EXT2
Text GLabel 4950 2500 0    50   Input ~ 0
THERM_EXT1
Text GLabel 4950 2300 0    50   Input ~ 0
THERM_LID
Text GLabel 4950 2200 0    50   Input ~ 0
THERM_AIR
Text GLabel 4950 2700 0    50   Input ~ 0
THERM_EXT3
Text GLabel 4950 2100 0    50   Input ~ 0
THERM_WELL
Text GLabel 8000 2200 2    50   Input ~ 0
MUX_S3
Text GLabel 8000 2100 2    50   Input ~ 0
MUX_S2
Text GLabel 8000 1900 2    50   Input ~ 0
MUX_S0
Text GLabel 8000 2000 2    50   Input ~ 0
MUX_S1
Text GLabel 4950 1900 0    50   Input ~ 0
MUX_SELECT
Wire Wire Line
	4950 1900 5200 1900
Wire Wire Line
	8000 1900 7800 1900
Wire Wire Line
	8000 2000 7800 2000
Wire Wire Line
	8000 2100 7800 2100
Wire Wire Line
	8000 2200 7800 2200
Wire Wire Line
	4950 2100 5200 2100
Wire Wire Line
	4950 2200 5200 2200
Wire Wire Line
	4950 2300 5200 2300
Wire Wire Line
	4950 2400 5200 2400
Wire Wire Line
	4950 2500 5200 2500
Wire Wire Line
	4950 2600 5200 2600
Wire Wire Line
	4950 2700 5200 2700
NoConn ~ 4950 2800
NoConn ~ 4950 2900
NoConn ~ 4950 3000
NoConn ~ 4950 3100
NoConn ~ 4950 3200
NoConn ~ 4950 3300
NoConn ~ 4950 3400
NoConn ~ 4950 3500
NoConn ~ 4950 3600
Wire Wire Line
	4950 2800 5200 2800
Wire Wire Line
	4950 2900 5200 2900
Wire Wire Line
	4950 3000 5200 3000
Wire Wire Line
	4950 3100 5200 3100
Wire Wire Line
	4950 3200 5200 3200
Wire Wire Line
	4950 3300 5200 3300
Wire Wire Line
	4950 3400 5200 3400
Wire Wire Line
	4950 3500 5200 3500
Wire Wire Line
	4950 3600 5200 3600
Wire Wire Line
	5200 3800 5100 3800
Wire Wire Line
	5100 3800 5100 4200
Wire Wire Line
	5100 4200 4650 4200
Connection ~ 5100 3800
Text GLabel 4650 4200 0    50   Input ~ 0
THERM_MUX_OUT
Text Notes 2300 4650 0    50   ~ 0
IN=High : COM <-> NO\nIN=Low : COM <-> NC
$Comp
L power:GND #PWR?
U 1 1 60D3592E
P 2000 4000
AR Path="/60AC9047/60D3592E" Ref="#PWR?"  Part="1" 
AR Path="/60D3592E" Ref="#PWR?"  Part="1" 
AR Path="/60B09AA3/60D3592E" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 2000 3750 50  0001 C CNN
F 1 "GND" H 2005 3827 50  0000 C CNN
F 2 "" H 2000 4000 50  0001 C CNN
F 3 "" H 2000 4000 50  0001 C CNN
	1    2000 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 3400 3400 3400
Wire Wire Line
	3400 3600 3350 3600
$Comp
L Ninja-qPCR:TS5A9411DCKR U?
U 1 1 60D3593D
P 2750 3700
AR Path="/60AC9047/60D3593D" Ref="U?"  Part="1" 
AR Path="/60D3593D" Ref="U?"  Part="1" 
AR Path="/60B09AA3/60D3593D" Ref="U6"  Part="1" 
F 0 "U6" H 2750 4388 60  0000 C CNN
F 1 "TS5A9411DCKR" H 2750 4282 60  0000 C CNN
F 2 "Ninja-qPCR:TS5A9411DCKR" H 2750 3640 60  0001 C CNN
F 3 "" H 2750 3700 60  0000 C CNN
	1    2750 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2000 4000 2150 4000
Text GLabel 3400 3600 2    50   Input ~ 0
THERM_R_SWITCH
$Comp
L Device:R R?
U 1 1 60D549A8
P 1800 3450
AR Path="/5F58C19F/60D549A8" Ref="R?"  Part="1" 
AR Path="/60D549A8" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60D549A8" Ref="R?"  Part="1" 
AR Path="/60AEA148/60D549A8" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60D549A8" Ref="R?"  Part="1" 
AR Path="/60B09AA3/60D549A8" Ref="R12"  Part="1" 
F 0 "R12" V 1593 3450 50  0000 C CNN
F 1 "?k" V 1684 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1730 3450 50  0001 C CNN
F 3 "~" H 1800 3450 50  0001 C CNN
	1    1800 3450
	0    -1   1    0   
$EndComp
Wire Wire Line
	1500 3450 1650 3450
$Comp
L Device:R R?
U 1 1 60D57FA5
P 1800 3800
AR Path="/5F58C19F/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60D57FA5" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60AEA148/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60B09AA3/60D57FA5" Ref="R13"  Part="1" 
F 0 "R13" V 1593 3800 50  0000 C CNN
F 1 "?k" V 1684 3800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1730 3800 50  0001 C CNN
F 3 "~" H 1800 3800 50  0001 C CNN
	1    1800 3800
	0    -1   1    0   
$EndComp
Wire Wire Line
	2150 3800 1950 3800
Wire Wire Line
	1650 3800 1500 3800
Wire Wire Line
	1500 3450 1500 3800
Connection ~ 1500 3800
Wire Wire Line
	3350 3800 4150 3800
Wire Wire Line
	5550 5450 5800 5450
Text GLabel 1150 3800 0    50   Input ~ 0
3V3A
Wire Wire Line
	1150 3800 1500 3800
$Comp
L Ninja-qPCR:CD74HC4067M96 U?
U 2 1 60B1EBE4
P 5800 4450
AR Path="/60B1EBE4" Ref="U?"  Part="2" 
AR Path="/60B09AA3/60B1EBE4" Ref="U7"  Part="2" 
F 0 "U7" H 7100 4837 60  0000 C CNN
F 1 "CD74HC4067M96" H 7100 4731 60  0000 C CNN
F 2 "Ninja-qPCR:CD74HC4067M96" H 7100 4690 60  0001 C CNN
F 3 "" H 5800 4450 60  0000 C CNN
	2    5800 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B11468
P 8550 4550
AR Path="/60AC9047/60B11468" Ref="#PWR?"  Part="1" 
AR Path="/60B11468" Ref="#PWR?"  Part="1" 
AR Path="/60B09AA3/60B11468" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 8550 4300 50  0001 C CNN
F 1 "GND" H 8555 4377 50  0000 C CNN
F 2 "" H 8550 4550 50  0001 C CNN
F 3 "" H 8550 4550 50  0001 C CNN
	1    8550 4550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8550 4550 8400 4550
Wire Wire Line
	2150 3600 2050 3600
Wire Wire Line
	2050 3600 2050 3450
Wire Wire Line
	2050 3450 1950 3450
$Comp
L Jumper:Jumper_2_Open JP2
U 1 1 60B18AB9
P 2800 2650
F 0 "JP2" H 2800 2885 50  0000 C CNN
F 1 "Jumper_2_Open" H 2800 2794 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 2800 2650 50  0001 C CNN
F 3 "~" H 2800 2650 50  0001 C CNN
	1    2800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2650 2050 2650
Wire Wire Line
	2050 2650 2050 3450
Connection ~ 2050 3450
Wire Wire Line
	3000 2650 4150 2650
Wire Wire Line
	4150 2650 4150 3800
Connection ~ 4150 3800
Wire Wire Line
	4150 3800 5100 3800
Text Notes 2200 2350 0    50   ~ 0
Connet in case of switching trouble
Text GLabel 3400 3400 2    50   Input ~ 0
3V3D
Text GLabel 5550 5450 0    50   Input ~ 0
3V3D
Text GLabel 9550 1950 0    50   Input ~ 0
THERM_WELL
Text GLabel 9550 3800 0    50   Input ~ 0
THERM_EXT3
Text GLabel 9550 2050 0    50   Input ~ 0
GNDA
Text GLabel 9550 3900 0    50   Input ~ 0
GNDA
Wire Wire Line
	9550 3900 9800 3900
Wire Wire Line
	9550 3800 9800 3800
Wire Wire Line
	9550 2050 9800 2050
Wire Wire Line
	9550 1950 9800 1950
$Comp
L Connector:Conn_01x02_Male TEXT?
U 1 1 60E1FB7C
P 10000 3150
AR Path="/60B6F672/60E1FB7C" Ref="TEXT?"  Part="1" 
AR Path="/60E1FB7C" Ref="TEXT?"  Part="1" 
AR Path="/60B09AA3/60E1FB7C" Ref="TEXT1"  Part="1" 
F 0 "TEXT1" H 9850 3150 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 3050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 10000 3150 50  0001 C CNN
F 3 "~" H 10000 3150 50  0001 C CNN
	1    10000 3150
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TEXT?
U 1 1 60E1FB8E
P 10000 3500
AR Path="/60B6F672/60E1FB8E" Ref="TEXT?"  Part="1" 
AR Path="/60E1FB8E" Ref="TEXT?"  Part="1" 
AR Path="/60B09AA3/60E1FB8E" Ref="TEXT2"  Part="1" 
F 0 "TEXT2" H 9850 3500 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 3400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 10000 3500 50  0001 C CNN
F 3 "~" H 10000 3500 50  0001 C CNN
	1    10000 3500
	-1   0    0    -1  
$EndComp
Text GLabel 9550 3150 0    50   Input ~ 0
THERM_EXT1
Text GLabel 9550 2550 0    50   Input ~ 0
THERM_LID
Text GLabel 9550 2250 0    50   Input ~ 0
THERM_AIR
Text GLabel 9550 3500 0    50   Input ~ 0
THERM_EXT2
Text GLabel 9550 3600 0    50   Input ~ 0
GNDA
Wire Wire Line
	9800 2250 9550 2250
Wire Wire Line
	9550 3150 9800 3150
Wire Wire Line
	9550 2550 9800 2550
Wire Wire Line
	9550 3500 9800 3500
Wire Wire Line
	9550 3600 9800 3600
Text GLabel 9550 2650 0    50   Input ~ 0
GNDA
Text GLabel 9550 3250 0    50   Input ~ 0
GNDA
Text GLabel 9550 2350 0    50   Input ~ 0
GNDA
Wire Wire Line
	9800 2350 9550 2350
Wire Wire Line
	9800 3250 9550 3250
Wire Wire Line
	9800 2650 9550 2650
$Comp
L Connector:Conn_01x02_Male TAIR?
U 1 1 60E1FBA8
P 10000 2250
AR Path="/60B6F672/60E1FBA8" Ref="TAIR?"  Part="1" 
AR Path="/60E1FBA8" Ref="TAIR?"  Part="1" 
AR Path="/60B09AA3/60E1FBA8" Ref="TAIR1"  Part="1" 
F 0 "TAIR1" H 9850 2250 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 2150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 10000 2250 50  0001 C CNN
F 3 "~" H 10000 2250 50  0001 C CNN
	1    10000 2250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TWELL?
U 1 1 60E2AB80
P 10000 1950
AR Path="/60B6F672/60E2AB80" Ref="TWELL?"  Part="1" 
AR Path="/60E2AB80" Ref="TWELL?"  Part="1" 
AR Path="/60B09AA3/60E2AB80" Ref="TWELL1"  Part="1" 
F 0 "TWELL1" H 9850 1950 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 1850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 10000 1950 50  0001 C CNN
F 3 "~" H 10000 1950 50  0001 C CNN
	1    10000 1950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TEXT?
U 1 1 60E2B42C
P 10000 3800
AR Path="/60B6F672/60E2B42C" Ref="TEXT?"  Part="1" 
AR Path="/60E2B42C" Ref="TEXT?"  Part="1" 
AR Path="/60B09AA3/60E2B42C" Ref="TEXT3"  Part="1" 
F 0 "TEXT3" H 9850 3800 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 3700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 10000 3800 50  0001 C CNN
F 3 "~" H 10000 3800 50  0001 C CNN
	1    10000 3800
	-1   0    0    -1  
$EndComp
NoConn ~ 4950 2400
$Comp
L Connector:Conn_01x02_Male TLID?
U 1 1 60E1FB82
P 10000 2550
AR Path="/60B6F672/60E1FB82" Ref="TLID?"  Part="1" 
AR Path="/60E1FB82" Ref="TLID?"  Part="1" 
AR Path="/60B09AA3/60E1FB82" Ref="TLID1"  Part="1" 
F 0 "TLID1" H 9850 2550 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 2450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 10000 2550 50  0001 C CNN
F 3 "~" H 10000 2550 50  0001 C CNN
	1    10000 2550
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
