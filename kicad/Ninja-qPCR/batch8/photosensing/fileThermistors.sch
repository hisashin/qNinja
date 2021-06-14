EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 5200 1900 0    50   Input ~ 0
THERM_EXT2
Text GLabel 7700 2300 2    50   Input ~ 0
THERM_EXT1
Text GLabel 7700 2000 2    50   Input ~ 0
THERM_LID
Text GLabel 7700 2100 2    50   Input ~ 0
THERM_AIR
Text GLabel 5200 2300 0    50   Input ~ 0
THERM_EXT3
Text GLabel 7700 2200 2    50   Input ~ 0
THERM_WELL
Text GLabel 7700 2600 2    50   Input ~ 0
MUX_S2
Text GLabel 7700 2400 2    50   Input ~ 0
MUX_S0
Text GLabel 7700 2500 2    50   Input ~ 0
MUX_S1
Text Notes 2050 4950 0    50   ~ 0
IN=High : COM <-> NO\nIN=Low : COM <-> NC
Wire Wire Line
	3350 4200 3400 4200
Wire Wire Line
	3400 3600 3350 3600
Text GLabel 3400 3600 2    50   Input ~ 0
THERM_R_SWITCH
$Comp
L Device:R R?
U 1 1 60D57FA5
P 1500 3600
AR Path="/5F58C19F/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60D57FA5" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60AEA148/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60B09AA3/60D57FA5" Ref="R?"  Part="1" 
AR Path="/60BEA899/60D57FA5" Ref="R9"  Part="1" 
F 0 "R9" V 1293 3600 50  0000 C CNN
F 1 "?k" V 1384 3600 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 1430 3600 50  0001 C CNN
F 3 "~" H 1500 3600 50  0001 C CNN
	1    1500 3600
	0    -1   1    0   
$EndComp
Wire Wire Line
	3350 3800 4150 3800
Text GLabel 850  3600 0    50   Input ~ 0
3V3A
$Comp
L power:GND #PWR?
U 1 1 60B11468
P 5150 2650
AR Path="/60AC9047/60B11468" Ref="#PWR?"  Part="1" 
AR Path="/60B11468" Ref="#PWR?"  Part="1" 
AR Path="/60B09AA3/60B11468" Ref="#PWR?"  Part="1" 
AR Path="/60BEA899/60B11468" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 5150 2400 50  0001 C CNN
F 1 "GND" H 5155 2477 50  0000 C CNN
F 2 "" H 5150 2650 50  0001 C CNN
F 3 "" H 5150 2650 50  0001 C CNN
	1    5150 2650
	-1   0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Open JP4
U 1 1 60B18AB9
P 2800 2650
F 0 "JP4" H 2800 2885 50  0000 C CNN
F 1 "Jumper_2_Open" H 2800 2794 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 2800 2650 50  0001 C CNN
F 3 "~" H 2800 2650 50  0001 C CNN
	1    2800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2650 4150 2650
Wire Wire Line
	4150 2650 4150 3800
Connection ~ 4150 3800
Wire Wire Line
	4150 3800 4650 3800
Text Notes 2200 2350 0    50   ~ 0
Connet in case of switching trouble
Text GLabel 3400 4200 2    50   Input ~ 0
3V3D
Text GLabel 7700 1900 2    50   Input ~ 0
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
AR Path="/60B09AA3/60E1FB7C" Ref="TEXT?"  Part="1" 
AR Path="/60BEA899/60E1FB7C" Ref="TEXT1"  Part="1" 
F 0 "TEXT1" H 9850 3150 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 3050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10000 3150 50  0001 C CNN
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
AR Path="/60B09AA3/60E1FB8E" Ref="TEXT?"  Part="1" 
AR Path="/60BEA899/60E1FB8E" Ref="TEXT2"  Part="1" 
F 0 "TEXT2" H 9850 3500 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 3400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10000 3500 50  0001 C CNN
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
AR Path="/60B09AA3/60E1FBA8" Ref="TAIR?"  Part="1" 
AR Path="/60BEA899/60E1FBA8" Ref="TAIR1"  Part="1" 
F 0 "TAIR1" H 9850 2250 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 2150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10000 2250 50  0001 C CNN
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
AR Path="/60B09AA3/60E2AB80" Ref="TWELL?"  Part="1" 
AR Path="/60BEA899/60E2AB80" Ref="TWELL1"  Part="1" 
F 0 "TWELL1" H 9850 1950 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 1850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10000 1950 50  0001 C CNN
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
AR Path="/60B09AA3/60E2B42C" Ref="TEXT?"  Part="1" 
AR Path="/60BEA899/60E2B42C" Ref="TEXT3"  Part="1" 
F 0 "TEXT3" H 9850 3800 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 3700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10000 3800 50  0001 C CNN
F 3 "~" H 10000 3800 50  0001 C CNN
	1    10000 3800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TLID?
U 1 1 60E1FB82
P 10000 2550
AR Path="/60B6F672/60E1FB82" Ref="TLID?"  Part="1" 
AR Path="/60E1FB82" Ref="TLID?"  Part="1" 
AR Path="/60B09AA3/60E1FB82" Ref="TLID?"  Part="1" 
AR Path="/60BEA899/60E1FB82" Ref="TLID1"  Part="1" 
F 0 "TLID1" H 9850 2550 50  0000 C CNN
F 1 "Conn_01x02_Male" H 9600 2450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10000 2550 50  0001 C CNN
F 3 "~" H 10000 2550 50  0001 C CNN
	1    10000 2550
	-1   0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:SN74LV4051APWR U13
U 1 1 60CEB8B0
P 5350 1900
F 0 "U13" H 6450 2287 60  0000 C CNN
F 1 "SN74LV4051APWR" H 6450 2181 60  0000 C CNN
F 2 "Ninja-qPCR:SN74LV4051APWR" H 6450 2140 60  0001 C CNN
F 3 "" H 5350 1900 60  0000 C CNN
	1    5350 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2400 7550 2400
Wire Wire Line
	7700 2500 7550 2500
Wire Wire Line
	7700 2600 7550 2600
Wire Wire Line
	5200 1900 5350 1900
Wire Wire Line
	5200 2300 5350 2300
Wire Wire Line
	5350 2100 4650 2100
Wire Wire Line
	4650 2100 4650 3800
Wire Wire Line
	4400 4000 4650 4000
Wire Wire Line
	4650 4000 4650 3800
Connection ~ 4650 3800
Wire Wire Line
	7700 1900 7550 1900
Wire Wire Line
	7700 2000 7550 2000
Wire Wire Line
	7700 2100 7550 2100
Wire Wire Line
	7700 2200 7550 2200
Wire Wire Line
	7700 2300 7550 2300
Wire Wire Line
	5150 2650 5150 2600
Wire Wire Line
	5150 2500 5350 2500
Wire Wire Line
	5350 2600 5150 2600
Connection ~ 5150 2600
Wire Wire Line
	5150 2600 5150 2500
Wire Wire Line
	5350 2400 5150 2400
Wire Wire Line
	5150 2400 5150 2500
Connection ~ 5150 2500
NoConn ~ 5200 2200
Wire Wire Line
	5200 2200 5350 2200
Text GLabel 5050 4950 0    50   Input ~ 0
GNDD
$Comp
L power:GND #PWR?
U 1 1 60BF0E05
P 5300 5100
AR Path="/60AC9047/60BF0E05" Ref="#PWR?"  Part="1" 
AR Path="/60BF0E05" Ref="#PWR?"  Part="1" 
AR Path="/60B09AA3/60BF0E05" Ref="#PWR?"  Part="1" 
AR Path="/60BEA899/60BF0E05" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 5300 4850 50  0001 C CNN
F 1 "GND" H 5305 4927 50  0000 C CNN
F 2 "" H 5300 5100 50  0001 C CNN
F 3 "" H 5300 5100 50  0001 C CNN
	1    5300 5100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5050 4950 5300 4950
Wire Wire Line
	5300 4950 5300 5100
Text GLabel 4400 4000 0    50   Input ~ 0
THERM_MUX_OUT
NoConn ~ 5200 2000
Wire Wire Line
	5350 2000 5200 2000
$Comp
L Ninja-qPCR:TS12A12511DCNR U15
U 1 1 60C7338A
P 3350 3600
F 0 "U15" H 4150 3987 60  0000 C CNN
F 1 "TS12A12511DCNR" H 4150 3881 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-8" H 4150 3840 60  0001 C CNN
F 3 "" H 3350 3600 60  0000 C CNN
	1    3350 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 4500 3350 4500
$Comp
L power:GND #PWR?
U 1 1 60D3592E
P 3450 4500
AR Path="/60AC9047/60D3592E" Ref="#PWR?"  Part="1" 
AR Path="/60D3592E" Ref="#PWR?"  Part="1" 
AR Path="/60B09AA3/60D3592E" Ref="#PWR?"  Part="1" 
AR Path="/60BEA899/60D3592E" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 3450 4250 50  0001 C CNN
F 1 "GND" H 3455 4327 50  0000 C CNN
F 2 "" H 3450 4500 50  0001 C CNN
F 3 "" H 3450 4500 50  0001 C CNN
	1    3450 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60D549A8
P 1500 4000
AR Path="/5F58C19F/60D549A8" Ref="R?"  Part="1" 
AR Path="/60D549A8" Ref="R?"  Part="1" 
AR Path="/5F708CA1/60D549A8" Ref="R?"  Part="1" 
AR Path="/60AEA148/60D549A8" Ref="R?"  Part="1" 
AR Path="/60AC8F63/60D549A8" Ref="R?"  Part="1" 
AR Path="/60B09AA3/60D549A8" Ref="R?"  Part="1" 
AR Path="/60BEA899/60D549A8" Ref="R8"  Part="1" 
F 0 "R8" V 1293 4000 50  0000 C CNN
F 1 "?k" V 1384 4000 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 1430 4000 50  0001 C CNN
F 3 "~" H 1500 4000 50  0001 C CNN
	1    1500 4000
	0    -1   1    0   
$EndComp
Wire Wire Line
	850  3600 1150 3600
Wire Wire Line
	1750 3600 1650 3600
Wire Wire Line
	1750 4000 1700 4000
Wire Wire Line
	1350 4000 1150 4000
Wire Wire Line
	1150 4000 1150 3600
Connection ~ 1150 3600
Wire Wire Line
	1150 3600 1350 3600
Wire Wire Line
	1700 2650 1700 4000
Connection ~ 1700 4000
Wire Wire Line
	1700 4000 1650 4000
Wire Wire Line
	1700 2650 2600 2650
Wire Wire Line
	3350 4300 3450 4300
Wire Wire Line
	3450 4300 3450 4500
Connection ~ 3450 4500
$EndSCHEMATC
