EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Connector:Barrel_Jack_Switch J?
U 1 1 60BB4D44
P 1250 1000
F 0 "J?" H 1307 1317 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1307 1226 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1300 960 50  0001 C CNN
F 3 "~" H 1300 960 50  0001 C CNN
	1    1250 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4D4A
P 1700 1800
F 0 "#PWR?" H 1700 1550 50  0001 C CNN
F 1 "GND" H 1705 1627 50  0000 C CNN
F 2 "" H 1700 1800 50  0001 C CNN
F 3 "" H 1700 1800 50  0001 C CNN
	1    1700 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1100 1700 1100
Wire Wire Line
	1550 1000 1700 1000
Wire Wire Line
	1700 1000 1700 1100
$Comp
L Device:D_Schottky D?
U 1 1 60BB4D53
P 1900 1250
F 0 "D?" V 1854 1330 50  0000 L CNN
F 1 "D_Schottky" V 1945 1330 50  0000 L CNN
F 2 "Diodes_SMD:D_2114" H 1900 1250 50  0001 C CNN
F 3 "~" H 1900 1250 50  0001 C CNN
	1    1900 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60BB4D59
P 2450 1550
F 0 "R?" H 2520 1596 50  0000 L CNN
F 1 "2.2k" H 2520 1505 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2380 1550 50  0001 C CNN
F 3 "~" H 2450 1550 50  0001 C CNN
	1    2450 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4D5F
P 2450 1800
F 0 "#PWR?" H 2450 1550 50  0001 C CNN
F 1 "GND" H 2455 1627 50  0000 C CNN
F 2 "" H 2450 1800 50  0001 C CNN
F 3 "" H 2450 1800 50  0001 C CNN
	1    2450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 900  1900 900 
Wire Wire Line
	2450 1700 2450 1800
Text GLabel 2650 1350 2    50   Input ~ 0
VIN_SENSE
Wire Wire Line
	1700 1100 1700 1500
Connection ~ 1700 1100
Wire Wire Line
	1900 1400 1900 1500
Wire Wire Line
	1900 1500 1700 1500
Connection ~ 1700 1500
Wire Wire Line
	1700 1500 1700 1800
Wire Wire Line
	1900 1100 1900 900 
Wire Wire Line
	1900 900  2450 900 
Connection ~ 1900 900 
Wire Wire Line
	2650 900  2450 900 
Connection ~ 2450 900 
Wire Wire Line
	2450 1000 2450 900 
$Comp
L Device:R R?
U 1 1 60BB4D74
P 2450 1150
F 0 "R?" H 2520 1196 50  0000 L CNN
F 1 "10k" H 2520 1105 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2380 1150 50  0001 C CNN
F 3 "~" H 2450 1150 50  0001 C CNN
	1    2450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1350 2450 1350
Wire Wire Line
	2450 1300 2450 1350
Wire Wire Line
	2450 1350 2450 1400
Connection ~ 2450 1350
$Comp
L Device:D D?
U 1 1 60BB4D7E
P 2800 900
F 0 "D?" H 2800 683 50  0000 C CNN
F 1 "D" H 2800 774 50  0000 C CNN
F 2 "Diodes_SMD:D_2114" H 2800 900 50  0001 C CNN
F 3 "~" H 2800 900 50  0001 C CNN
	1    2800 900 
	-1   0    0    1   
$EndComp
Text Notes 6100 1150 0    50   ~ 0
Rasp UPS Reference :
Text GLabel 5550 900  2    50   Input ~ 0
12V_UPS
Text GLabel 2200 750  0    50   Input ~ 0
VIN
Wire Wire Line
	2200 750  2450 750 
Wire Wire Line
	2450 750  2450 900 
$Comp
L power:GND #PWR?
U 1 1 60BB4D89
P 1800 7350
AR Path="/60BB4D89" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4D89" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4D89" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4D89" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4D89" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1800 7100 50  0001 C CNN
F 1 "GND" H 1805 7177 50  0000 C CNN
F 2 "" H 1800 7350 50  0001 C CNN
F 3 "" H 1800 7350 50  0001 C CNN
	1    1800 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 7200 1800 7350
$Comp
L Device:C C?
U 1 1 60BB4D90
P 2250 7050
AR Path="/5F7093B5/60BB4D90" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4D90" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4D90" Ref="C?"  Part="1" 
AR Path="/60BB4D90" Ref="C?"  Part="1" 
F 0 "C?" H 2365 7096 50  0000 L CNN
F 1 "10uF" H 2365 7005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2288 6900 50  0001 C CNN
F 3 "~" H 2250 7050 50  0001 C CNN
	1    2250 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4D96
P 2250 7350
AR Path="/60BB4D96" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4D96" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4D96" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4D96" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4D96" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 7100 50  0001 C CNN
F 1 "GND" H 2255 7177 50  0000 C CNN
F 2 "" H 2250 7350 50  0001 C CNN
F 3 "" H 2250 7350 50  0001 C CNN
	1    2250 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 7200 2250 7350
$Comp
L Device:C C?
U 1 1 60BB4D9D
P 2700 7050
AR Path="/5F7093B5/60BB4D9D" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4D9D" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4D9D" Ref="C?"  Part="1" 
AR Path="/60BB4D9D" Ref="C?"  Part="1" 
F 0 "C?" H 2815 7096 50  0000 L CNN
F 1 "10uF" H 2815 7005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2738 6900 50  0001 C CNN
F 3 "~" H 2700 7050 50  0001 C CNN
	1    2700 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4DA3
P 2700 7350
AR Path="/60BB4DA3" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4DA3" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4DA3" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4DA3" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4DA3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 7100 50  0001 C CNN
F 1 "GND" H 2705 7177 50  0000 C CNN
F 2 "" H 2700 7350 50  0001 C CNN
F 3 "" H 2700 7350 50  0001 C CNN
	1    2700 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7200 2700 7350
$Comp
L Device:C C?
U 1 1 60BB4DAA
P 3150 7050
AR Path="/5F7093B5/60BB4DAA" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4DAA" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4DAA" Ref="C?"  Part="1" 
AR Path="/60BB4DAA" Ref="C?"  Part="1" 
F 0 "C?" H 3265 7096 50  0000 L CNN
F 1 "0.1uF" H 3265 7005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3188 6900 50  0001 C CNN
F 3 "~" H 3150 7050 50  0001 C CNN
	1    3150 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4DB0
P 3150 7350
AR Path="/60BB4DB0" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4DB0" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4DB0" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4DB0" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4DB0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3150 7100 50  0001 C CNN
F 1 "GND" H 3155 7177 50  0000 C CNN
F 2 "" H 3150 7350 50  0001 C CNN
F 3 "" H 3150 7350 50  0001 C CNN
	1    3150 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 7200 3150 7350
$Comp
L Device:C C?
U 1 1 60BB4DB7
P 3600 7050
AR Path="/5F7093B5/60BB4DB7" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4DB7" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4DB7" Ref="C?"  Part="1" 
AR Path="/60BB4DB7" Ref="C?"  Part="1" 
F 0 "C?" H 3715 7096 50  0000 L CNN
F 1 "0.01uF" H 3715 7005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3638 6900 50  0001 C CNN
F 3 "~" H 3600 7050 50  0001 C CNN
	1    3600 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4DBD
P 3600 7350
AR Path="/60BB4DBD" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4DBD" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4DBD" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4DBD" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4DBD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 7100 50  0001 C CNN
F 1 "GND" H 3605 7177 50  0000 C CNN
F 2 "" H 3600 7350 50  0001 C CNN
F 3 "" H 3600 7350 50  0001 C CNN
	1    3600 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 7200 3600 7350
$Comp
L Device:CP C?
U 1 1 60BB4DC4
P 1800 7050
AR Path="/5F7093B5/60BB4DC4" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4DC4" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4DC4" Ref="C?"  Part="1" 
AR Path="/60BB4DC4" Ref="C?"  Part="1" 
F 0 "C?" H 1918 7096 50  0000 L CNN
F 1 "100uF" H 1918 7005 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_6.3x5.8" H 1838 6900 50  0001 C CNN
F 3 "~" H 1800 7050 50  0001 C CNN
	1    1800 7050
	1    0    0    -1  
$EndComp
Connection ~ 3150 6650
Wire Wire Line
	3150 6650 3600 6650
Connection ~ 2700 6650
Wire Wire Line
	2700 6650 3150 6650
Connection ~ 2250 6650
Wire Wire Line
	2250 6650 2700 6650
Wire Wire Line
	1800 6650 2250 6650
Wire Wire Line
	3600 6650 3750 6650
Connection ~ 3600 6650
$Comp
L Ninja-qPCR:BD9D320EFJ-E2 U?
U 1 1 60BB4DD3
P 5000 6100
AR Path="/5F7093B5/60BB4DD3" Ref="U?"  Part="1" 
AR Path="/602F5E03/60BB4DD3" Ref="U?"  Part="1" 
AR Path="/603FF008/60BB4DD3" Ref="U?"  Part="1" 
AR Path="/60BB4DD3" Ref="U?"  Part="1" 
F 0 "U?" H 5800 6587 60  0000 C CNN
F 1 "BD9D320EFJ-E2" H 5800 6481 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8-1EP_3.9x4.9mm_Pitch1.27mm" H 5800 6440 60  0001 C CNN
F 3 "" H 5000 6100 60  0000 C CNN
	1    5000 6100
	1    0    0    -1  
$EndComp
Text GLabel 4850 6300 0    50   Input ~ 0
GND
$Comp
L Device:C C?
U 1 1 60BB4DDA
P 4800 7050
AR Path="/5F7093B5/60BB4DDA" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4DDA" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4DDA" Ref="C?"  Part="1" 
AR Path="/60BB4DDA" Ref="C?"  Part="1" 
F 0 "C?" H 4915 7096 50  0000 L CNN
F 1 "1uF" H 4915 7005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4838 6900 50  0001 C CNN
F 3 "~" H 4800 7050 50  0001 C CNN
	1    4800 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4DE0
P 4800 7350
AR Path="/60BB4DE0" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4DE0" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4DE0" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4DE0" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4DE0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4800 7100 50  0001 C CNN
F 1 "GND" H 4805 7177 50  0000 C CNN
F 2 "" H 4800 7350 50  0001 C CNN
F 3 "" H 4800 7350 50  0001 C CNN
	1    4800 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6800 4800 6800
Wire Wire Line
	4800 6800 4800 6900
Wire Wire Line
	4800 7200 4800 7350
Wire Wire Line
	5000 6700 4850 6700
Wire Wire Line
	5000 6300 4850 6300
Wire Wire Line
	5000 6200 4850 6200
$Comp
L power:GND #PWR?
U 1 1 60BB4DEC
P 6700 6450
AR Path="/60BB4DEC" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4DEC" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4DEC" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4DEC" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4DEC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6700 6200 50  0001 C CNN
F 1 "GND" H 6705 6277 50  0000 C CNN
F 2 "" H 6700 6450 50  0001 C CNN
F 3 "" H 6700 6450 50  0001 C CNN
	1    6700 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 6300 6700 6300
Wire Wire Line
	6700 6300 6700 6450
Text HLabel 4850 6400 0    50   Input ~ 0
BD_FB
Text HLabel 4850 6600 0    50   Input ~ 0
BD_SW
Wire Wire Line
	5000 6400 4850 6400
Wire Wire Line
	5000 6600 4850 6600
Text HLabel 4850 6100 0    50   Input ~ 0
BD_BOOT
Wire Wire Line
	5000 6100 4850 6100
$Comp
L Device:C C?
U 1 1 60BB4DFA
P 4300 7050
AR Path="/5F7093B5/60BB4DFA" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4DFA" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4DFA" Ref="C?"  Part="1" 
AR Path="/60BB4DFA" Ref="C?"  Part="1" 
F 0 "C?" H 4415 7096 50  0000 L CNN
F 1 "3300pF" H 4415 7005 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4338 6900 50  0001 C CNN
F 3 "~" H 4300 7050 50  0001 C CNN
	1    4300 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4E00
P 4300 7350
AR Path="/60BB4E00" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4E00" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4E00" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4E00" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4E00" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4300 7100 50  0001 C CNN
F 1 "GND" H 4305 7177 50  0000 C CNN
F 2 "" H 4300 7350 50  0001 C CNN
F 3 "" H 4300 7350 50  0001 C CNN
	1    4300 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7200 4300 7350
Text HLabel 7200 5250 0    50   Input ~ 0
BD_BOOT
Text HLabel 7200 5850 0    50   Input ~ 0
BD_SW
$Comp
L Device:C C?
U 1 1 60BB4E09
P 7300 5550
AR Path="/5F7093B5/60BB4E09" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4E09" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4E09" Ref="C?"  Part="1" 
AR Path="/60BB4E09" Ref="C?"  Part="1" 
F 0 "C?" H 7415 5596 50  0000 L CNN
F 1 "0.1uF" H 7415 5505 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7338 5400 50  0001 C CNN
F 3 "~" H 7300 5550 50  0001 C CNN
	1    7300 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 5250 7300 5250
Wire Wire Line
	7300 5250 7300 5400
Wire Wire Line
	7200 5850 7300 5850
Wire Wire Line
	7300 5850 7300 5700
Wire Wire Line
	4300 6500 4300 6900
Wire Wire Line
	4300 6500 5000 6500
$Comp
L Device:L L?
U 1 1 60BB4E15
P 8350 4900
AR Path="/5F7093B5/60BB4E15" Ref="L?"  Part="1" 
AR Path="/602F5E03/60BB4E15" Ref="L?"  Part="1" 
AR Path="/603FF008/60BB4E15" Ref="L?"  Part="1" 
AR Path="/60BB4E15" Ref="L?"  Part="1" 
F 0 "L?" V 8540 4900 50  0000 C CNN
F 1 "3.3uH(ALPS GLMC / TDK SPM6530)" V 8449 4900 50  0000 C CNN
F 2 "Ninja-qPCR:IND_VLS5045EX-4R7M" H 8350 4900 50  0001 C CNN
F 3 "~" H 8350 4900 50  0001 C CNN
	1    8350 4900
	0    -1   -1   0   
$EndComp
Text HLabel 8500 5750 0    50   Input ~ 0
BD_FB
Text HLabel 8000 4900 0    50   Input ~ 0
BD_SW
Wire Wire Line
	8000 4900 8200 4900
$Comp
L Device:R R?
U 1 1 60BB4E1E
P 8700 5150
AR Path="/5F7093B5/60BB4E1E" Ref="R?"  Part="1" 
AR Path="/602F5E03/60BB4E1E" Ref="R?"  Part="1" 
AR Path="/603FF008/60BB4E1E" Ref="R?"  Part="1" 
AR Path="/60BB4E1E" Ref="R?"  Part="1" 
F 0 "R?" H 8770 5196 50  0000 L CNN
F 1 "220k" H 8770 5105 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8630 5150 50  0001 C CNN
F 3 "~" H 8700 5150 50  0001 C CNN
	1    8700 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BB4E24
P 8700 5950
AR Path="/5F7093B5/60BB4E24" Ref="R?"  Part="1" 
AR Path="/602F5E03/60BB4E24" Ref="R?"  Part="1" 
AR Path="/603FF008/60BB4E24" Ref="R?"  Part="1" 
AR Path="/60BB4E24" Ref="R?"  Part="1" 
F 0 "R?" H 8770 5996 50  0000 L CNN
F 1 "39k" H 8770 5905 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8630 5950 50  0001 C CNN
F 3 "~" H 8700 5950 50  0001 C CNN
	1    8700 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4E2A
P 8700 6200
AR Path="/60BB4E2A" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4E2A" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4E2A" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4E2A" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4E2A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8700 5950 50  0001 C CNN
F 1 "GND" H 8705 6027 50  0000 C CNN
F 2 "" H 8700 6200 50  0001 C CNN
F 3 "" H 8700 6200 50  0001 C CNN
	1    8700 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 6100 8700 6200
Wire Wire Line
	8700 5750 8500 5750
Connection ~ 8700 5750
Wire Wire Line
	8700 5750 8700 5800
$Comp
L Device:C C?
U 1 1 60BB4E34
P 9050 5150
AR Path="/5F7093B5/60BB4E34" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4E34" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4E34" Ref="C?"  Part="1" 
AR Path="/60BB4E34" Ref="C?"  Part="1" 
F 0 "C?" H 9165 5196 50  0000 L CNN
F 1 "(5-100pF)" H 9165 5105 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9088 5000 50  0001 C CNN
F 3 "~" H 9050 5150 50  0001 C CNN
	1    9050 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 5750 8700 5750
Wire Wire Line
	8500 4900 8700 4900
Wire Wire Line
	8700 5000 8700 4900
Connection ~ 8700 4900
Wire Wire Line
	8700 4900 9050 4900
Wire Wire Line
	8700 5650 8700 5750
$Comp
L Device:C C?
U 1 1 60BB4E40
P 9750 5150
AR Path="/5F7093B5/60BB4E40" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4E40" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4E40" Ref="C?"  Part="1" 
AR Path="/60BB4E40" Ref="C?"  Part="1" 
F 0 "C?" H 9865 5196 50  0000 L CNN
F 1 "22uF" H 9865 5105 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9788 5000 50  0001 C CNN
F 3 "~" H 9750 5150 50  0001 C CNN
	1    9750 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60BB4E46
P 10200 5150
AR Path="/5F7093B5/60BB4E46" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4E46" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4E46" Ref="C?"  Part="1" 
AR Path="/60BB4E46" Ref="C?"  Part="1" 
F 0 "C?" H 10315 5196 50  0000 L CNN
F 1 "22uF" H 10315 5105 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 10238 5000 50  0001 C CNN
F 3 "~" H 10200 5150 50  0001 C CNN
	1    10200 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4E4C
P 9750 5450
AR Path="/60BB4E4C" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4E4C" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4E4C" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4E4C" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4E4C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9750 5200 50  0001 C CNN
F 1 "GND" H 9755 5277 50  0000 C CNN
F 2 "" H 9750 5450 50  0001 C CNN
F 3 "" H 9750 5450 50  0001 C CNN
	1    9750 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4E52
P 10200 5450
AR Path="/60BB4E52" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4E52" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4E52" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4E52" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4E52" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10200 5200 50  0001 C CNN
F 1 "GND" H 10205 5277 50  0000 C CNN
F 2 "" H 10200 5450 50  0001 C CNN
F 3 "" H 10200 5450 50  0001 C CNN
	1    10200 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 5300 10200 5450
Wire Wire Line
	9750 5300 9750 5450
Wire Wire Line
	9050 4900 9050 5000
Wire Wire Line
	10200 5000 10200 4900
Wire Wire Line
	10200 4900 9750 4900
Connection ~ 9050 4900
Wire Wire Line
	9750 5000 9750 4900
Connection ~ 9750 4900
Wire Wire Line
	9750 4900 9050 4900
Wire Wire Line
	1800 6650 1800 6900
Wire Wire Line
	2250 6650 2250 6900
Wire Wire Line
	2700 6650 2700 6900
Wire Wire Line
	3150 6650 3150 6900
Wire Wire Line
	3600 6650 3600 6900
$Comp
L Device:R R?
U 1 1 60BB4E66
P 8700 5500
AR Path="/5F7093B5/60BB4E66" Ref="R?"  Part="1" 
AR Path="/602F5E03/60BB4E66" Ref="R?"  Part="1" 
AR Path="/603FF008/60BB4E66" Ref="R?"  Part="1" 
AR Path="/60BB4E66" Ref="R?"  Part="1" 
F 0 "R?" H 8770 5546 50  0000 L CNN
F 1 "0" H 8770 5455 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8630 5500 50  0001 C CNN
F 3 "~" H 8700 5500 50  0001 C CNN
	1    8700 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5300 8700 5350
Wire Wire Line
	9050 5300 9050 5750
Wire Wire Line
	10200 4900 10550 4900
Connection ~ 10200 4900
$Comp
L power:GND #PWR?
U 1 1 60BB4E70
P 1300 7350
AR Path="/60BB4E70" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4E70" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4E70" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4E70" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4E70" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1300 7100 50  0001 C CNN
F 1 "GND" H 1305 7177 50  0000 C CNN
F 2 "" H 1300 7350 50  0001 C CNN
F 3 "" H 1300 7350 50  0001 C CNN
	1    1300 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 7200 1300 7350
$Comp
L Device:CP C?
U 1 1 60BB4E77
P 1300 7050
AR Path="/5F7093B5/60BB4E77" Ref="C?"  Part="1" 
AR Path="/602F5E03/60BB4E77" Ref="C?"  Part="1" 
AR Path="/603FF008/60BB4E77" Ref="C?"  Part="1" 
AR Path="/60BB4E77" Ref="C?"  Part="1" 
F 0 "C?" H 1418 7096 50  0000 L CNN
F 1 "100uF" H 1418 7005 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_6.3x5.8" H 1338 6900 50  0001 C CNN
F 3 "~" H 1300 7050 50  0001 C CNN
	1    1300 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6650 1300 6900
Wire Wire Line
	1800 6650 1300 6650
Connection ~ 1800 6650
Wire Wire Line
	1300 6650 1050 6650
Connection ~ 1300 6650
Text GLabel 1050 6650 0    50   Input ~ 0
12V_UPS
Text GLabel 10550 4900 2    50   Input ~ 0
5V
Text GLabel 3750 6650 2    50   Input ~ 0
12V_BD_VIN
Text GLabel 4850 6200 0    50   Input ~ 0
12V_BD_VIN
Text GLabel 4850 6700 0    50   Input ~ 0
12V_BD_VIN
Text GLabel 1850 2300 2    50   Input ~ 0
VIN
$Comp
L power:GND #PWR?
U 1 1 60BB4E88
P 1750 2550
AR Path="/60BB4E88" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4E88" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4E88" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4E88" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4E88" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1750 2300 50  0001 C CNN
F 1 "GND" H 1755 2377 50  0000 C CNN
F 2 "" H 1750 2550 50  0001 C CNN
F 3 "" H 1750 2550 50  0001 C CNN
	1    1750 2550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60BB4E8E
P 1400 2300
AR Path="/603FF008/60BB4E8E" Ref="J?"  Part="1" 
AR Path="/60BB4E8E" Ref="J?"  Part="1" 
F 0 "J?" H 1372 2274 50  0000 R CNN
F 1 "Conn_01x02_Male" H 1372 2183 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1400 2300 50  0001 C CNN
F 3 "~" H 1400 2300 50  0001 C CNN
	1    1400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2300 1850 2300
Wire Wire Line
	1600 2400 1750 2400
Wire Wire Line
	1750 2400 1750 2550
Text Notes 6100 1250 0    50   ~ 0
https://www.smbaker.com/supercapacitor-uninterruptable-power-supply-ups-for-raspberry-pi
Text Notes 6100 1350 0    50   ~ 0
http://www.hackerspace-ffm.de/wiki/index.php?title=Raspi_EDLC_UPS
$Comp
L Ninja-qPCR:Raspberry_Pi_3A_Plus_wpi J?
U 1 1 60BB4E99
P 8000 3000
F 0 "J?" H 8000 4215 50  0000 C CNN
F 1 "Raspberry_Pi_3A_Plus_wpi" H 8000 4124 50  0000 C CNN
F 2 "Ninja-qPCR:Raspberry_Pi_3A+_Socketed_THT_FaceDown_MountingHoles_minimum" H 7550 1950 50  0001 C CNN
F 3 "" H 7550 1950 50  0001 C CNN
	1    8000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2150 8800 2150
Wire Wire Line
	8800 2150 8800 2050
Connection ~ 8800 2050
Wire Wire Line
	8800 2050 8700 2050
Wire Wire Line
	8800 2050 8900 2050
$Comp
L power:GND #PWR?
U 1 1 60BB4EA4
P 7150 4050
AR Path="/60BB4EA4" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4EA4" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4EA4" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4EA4" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4EA4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7150 3800 50  0001 C CNN
F 1 "GND" H 7155 3877 50  0000 C CNN
F 2 "" H 7150 4050 50  0001 C CNN
F 3 "" H 7150 4050 50  0001 C CNN
	1    7150 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BB4EAA
P 8900 4050
AR Path="/60BB4EAA" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4EAA" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4EAA" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4EAA" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4EAA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8900 3800 50  0001 C CNN
F 1 "GND" H 8905 3877 50  0000 C CNN
F 2 "" H 8900 4050 50  0001 C CNN
F 3 "" H 8900 4050 50  0001 C CNN
	1    8900 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2250 8900 2250
Wire Wire Line
	7300 2450 7150 2450
Wire Wire Line
	7300 3250 7150 3250
Wire Wire Line
	7300 3950 7150 3950
Text GLabel 7000 3650 0    50   Input ~ 0
VIN_SENSE
Wire Wire Line
	8900 2650 8700 2650
Wire Wire Line
	8900 2950 8700 2950
Wire Wire Line
	8900 3450 8700 3450
Wire Wire Line
	8900 3650 8700 3650
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60BB4EB9
P 3100 650
AR Path="/603FF008/60BB4EB9" Ref="J?"  Part="1" 
AR Path="/60BB4EB9" Ref="J?"  Part="1" 
F 0 "J?" V 3050 500 50  0000 R CNN
F 1 "Conn_01x02_Male" V 3150 500 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3100 650 50  0001 C CNN
F 3 "~" H 3100 650 50  0001 C CNN
	1    3100 650 
	0    -1   1    0   
$EndComp
Wire Wire Line
	2950 900  3100 900 
Wire Wire Line
	3100 900  3100 850 
Wire Wire Line
	3200 900  3200 850 
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60BB4EC2
P 4400 650
AR Path="/603FF008/60BB4EC2" Ref="J?"  Part="1" 
AR Path="/60BB4EC2" Ref="J?"  Part="1" 
F 0 "J?" V 4350 500 50  0000 R CNN
F 1 "Conn_01x02_Male" V 4450 500 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4400 650 50  0001 C CNN
F 3 "~" H 4400 650 50  0001 C CNN
	1    4400 650 
	0    -1   1    0   
$EndComp
Wire Wire Line
	4400 900  4400 850 
Wire Wire Line
	4500 900  4500 850 
Text GLabel 1850 3000 2    50   Input ~ 0
12V_UPS
$Comp
L power:GND #PWR?
U 1 1 60BB4ECB
P 1750 3250
AR Path="/60BB4ECB" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4ECB" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4ECB" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4ECB" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4ECB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1750 3000 50  0001 C CNN
F 1 "GND" H 1755 3077 50  0000 C CNN
F 2 "" H 1750 3250 50  0001 C CNN
F 3 "" H 1750 3250 50  0001 C CNN
	1    1750 3250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60BB4ED1
P 1400 3000
AR Path="/603FF008/60BB4ED1" Ref="J?"  Part="1" 
AR Path="/60BB4ED1" Ref="J?"  Part="1" 
F 0 "J?" H 1372 2974 50  0000 R CNN
F 1 "Conn_01x02_Male" H 1372 2883 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1400 3000 50  0001 C CNN
F 3 "~" H 1400 3000 50  0001 C CNN
	1    1400 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3000 1850 3000
Wire Wire Line
	1600 3100 1750 3100
Wire Wire Line
	1750 3100 1750 3250
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60BB4EDA
P 5100 1250
AR Path="/603FF008/60BB4EDA" Ref="J?"  Part="1" 
AR Path="/60BB4EDA" Ref="J?"  Part="1" 
F 0 "J?" V 5150 1400 50  0000 R CNN
F 1 "Conn_01x02_Male" V 5050 1950 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5100 1250 50  0001 C CNN
F 3 "~" H 5100 1250 50  0001 C CNN
	1    5100 1250
	0    1    -1   0   
$EndComp
Wire Wire Line
	5000 1050 4750 1050
Wire Wire Line
	5100 1050 5350 1050
$Comp
L Device:Fuse F?
U 1 1 60BB4EE2
P 5050 900
F 0 "F?" V 4853 900 50  0000 C CNN
F 1 "Fuse" V 4944 900 50  0000 C CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 4980 900 50  0001 C CNN
F 3 "~" H 5050 900 50  0001 C CNN
	1    5050 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 900  5350 900 
Wire Wire Line
	5350 1050 5350 900 
Connection ~ 5350 900 
Wire Wire Line
	5350 900  5550 900 
Wire Wire Line
	4750 1050 4750 900 
Wire Wire Line
	4750 900  4900 900 
Wire Wire Line
	4500 900  4750 900 
Connection ~ 4750 900 
Text GLabel 8900 2050 2    50   Input ~ 0
5V
Wire Wire Line
	8900 2250 8900 2650
Connection ~ 8900 2650
Wire Wire Line
	8900 2650 8900 2950
Connection ~ 8900 2950
Wire Wire Line
	8900 2950 8900 3450
Connection ~ 8900 3450
Wire Wire Line
	8900 3450 8900 3650
Wire Wire Line
	7150 2450 7150 3250
Wire Wire Line
	7150 3950 7150 4050
Connection ~ 8900 3650
Wire Wire Line
	7000 3650 7300 3650
Wire Wire Line
	8900 3650 8900 4050
$Comp
L power:GND #PWR?
U 1 1 60BB4EFD
P 7150 3350
AR Path="/60BB4EFD" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/60BB4EFD" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/60BB4EFD" Ref="#PWR?"  Part="1" 
AR Path="/602F5E03/60BB4EFD" Ref="#PWR?"  Part="1" 
AR Path="/603FF008/60BB4EFD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7150 3100 50  0001 C CNN
F 1 "GND" H 7155 3177 50  0000 C CNN
F 2 "" H 7150 3350 50  0001 C CNN
F 3 "" H 7150 3350 50  0001 C CNN
	1    7150 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3250 7150 3350
Connection ~ 7150 3250
Wire Wire Line
	3200 900  3600 900 
Text Notes 2700 1300 0    50   ~ 0
High:1.34V+
$Comp
L Device:R R?
U 1 1 60BB4F07
P 3350 1600
F 0 "R?" H 3550 1450 50  0000 R CNN
F 1 "8.2Ω 3W" H 3750 1550 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_Power_L25.0mm_W6.4mm_P27.94mm" V 3280 1600 50  0001 C CNN
F 3 "~" H 3350 1600 50  0001 C CNN
	1    3350 1600
	-1   0    0    1   
$EndComp
$Comp
L Ninja-qPCR:NJM431U-ND U?
U 1 1 60BB4F0D
P 3200 2450
F 0 "U?" V 3150 2300 50  0000 R CNN
F 1 "TL431PK" V 3050 2400 50  0000 R CNN
F 2 "Ninja-qPCR:NJM431U-ND" H 3200 2300 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 3200 2450 50  0001 C CIN
	1    3200 2450
	0    1    -1   0   
$EndComp
$Comp
L Device:CP C?
U 1 1 60BB4F13
P 3600 2450
F 0 "C?" H 3650 2650 50  0000 L CNN
F 1 "10F2.7V" H 3650 2550 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D13.0mm_P5.00mm" H 3638 2300 50  0001 C CNN
F 3 "~" H 3600 2450 50  0001 C CNN
	1    3600 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BB4F19
P 3900 2700
F 0 "R?" V 3700 2700 50  0000 R CNN
F 1 "1k?W" V 3800 2800 50  0000 R CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 3830 2700 50  0001 C CNN
F 3 "~" H 3900 2700 50  0001 C CNN
	1    3900 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 2150 3400 2150
Wire Wire Line
	3600 2300 3600 2150
Connection ~ 3600 2150
Wire Wire Line
	3300 2450 3400 2450
Wire Wire Line
	3400 2450 3400 2150
Connection ~ 3400 2150
Wire Wire Line
	3400 2150 3600 2150
Wire Wire Line
	3200 2700 3600 2700
Wire Wire Line
	3600 2600 3600 2700
Connection ~ 3600 2700
$Comp
L Ninja-qPCR:NJM431U-ND U?
U 1 1 60BB4F29
P 3200 3100
F 0 "U?" V 3246 3031 50  0000 R CNN
F 1 "TL431PK" V 3155 3031 50  0000 R CNN
F 2 "Ninja-qPCR:NJM431U-ND" H 3200 2950 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 3200 3100 50  0001 C CIN
	1    3200 3100
	0    1    -1   0   
$EndComp
$Comp
L Device:CP C?
U 1 1 60BB4F2F
P 3600 3100
F 0 "C?" H 3718 3146 50  0000 L CNN
F 1 "10F2.7V" H 3718 3055 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D13.0mm_P5.00mm" H 3638 2950 50  0001 C CNN
F 3 "~" H 3600 3100 50  0001 C CNN
	1    3600 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BB4F35
P 4150 3100
F 0 "R?" H 4080 3054 50  0000 R CNN
F 1 "1k?W" H 4080 3145 50  0000 R CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 4080 3100 50  0001 C CNN
F 3 "~" H 4150 3100 50  0001 C CNN
	1    4150 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 2800 3400 2800
Wire Wire Line
	4150 2800 4150 2950
Wire Wire Line
	3600 2950 3600 2800
Connection ~ 3600 2800
Wire Wire Line
	3300 3100 3400 3100
Wire Wire Line
	3400 3100 3400 2800
Connection ~ 3400 2800
Wire Wire Line
	3400 2800 3600 2800
Wire Wire Line
	3200 3350 3600 3350
Wire Wire Line
	4150 3350 4150 3250
Wire Wire Line
	3600 3250 3600 3350
Connection ~ 3600 3350
$Comp
L Ninja-qPCR:NJM431U-ND U?
U 1 1 60BB4F47
P 3200 3750
F 0 "U?" V 3246 3681 50  0000 R CNN
F 1 "TL431PK" V 3155 3681 50  0000 R CNN
F 2 "Ninja-qPCR:NJM431U-ND" H 3200 3600 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 3200 3750 50  0001 C CIN
	1    3200 3750
	0    1    -1   0   
$EndComp
$Comp
L Device:CP C?
U 1 1 60BB4F4D
P 3600 3750
F 0 "C?" H 3718 3796 50  0000 L CNN
F 1 "10F2.7V" H 3718 3705 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D13.0mm_P5.00mm" H 3638 3600 50  0001 C CNN
F 3 "~" H 3600 3750 50  0001 C CNN
	1    3600 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BB4F53
P 4150 3750
F 0 "R?" H 4080 3704 50  0000 R CNN
F 1 "1k?W" H 4080 3795 50  0000 R CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 4080 3750 50  0001 C CNN
F 3 "~" H 4150 3750 50  0001 C CNN
	1    4150 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 3450 3400 3450
Wire Wire Line
	4150 3450 4150 3600
Wire Wire Line
	3600 3600 3600 3450
Connection ~ 3600 3450
Wire Wire Line
	3300 3750 3400 3750
Wire Wire Line
	3400 3750 3400 3450
Connection ~ 3400 3450
Wire Wire Line
	3400 3450 3600 3450
Wire Wire Line
	3200 4000 3600 4000
Wire Wire Line
	4150 4000 4150 3900
Wire Wire Line
	3600 3900 3600 4000
Connection ~ 3600 4000
$Comp
L Ninja-qPCR:NJM431U-ND U?
U 1 1 60BB4F65
P 3200 4400
F 0 "U?" V 3246 4331 50  0000 R CNN
F 1 "TL431PK" V 3155 4331 50  0000 R CNN
F 2 "Ninja-qPCR:NJM431U-ND" H 3200 4250 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 3200 4400 50  0001 C CIN
	1    3200 4400
	0    1    -1   0   
$EndComp
$Comp
L Device:CP C?
U 1 1 60BB4F6B
P 3600 4400
F 0 "C?" H 3718 4446 50  0000 L CNN
F 1 "10F2.7V" H 3718 4355 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D13.0mm_P5.00mm" H 3638 4250 50  0001 C CNN
F 3 "~" H 3600 4400 50  0001 C CNN
	1    3600 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BB4F71
P 4150 4400
F 0 "R?" H 4080 4354 50  0000 R CNN
F 1 "1k?W" H 4080 4445 50  0000 R CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 4080 4400 50  0001 C CNN
F 3 "~" H 4150 4400 50  0001 C CNN
	1    4150 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 4100 3400 4100
Wire Wire Line
	4150 4100 4150 4250
Wire Wire Line
	3600 4250 3600 4100
Connection ~ 3600 4100
Wire Wire Line
	3300 4400 3400 4400
Wire Wire Line
	3400 4400 3400 4100
Connection ~ 3400 4100
Wire Wire Line
	3400 4100 3600 4100
Wire Wire Line
	3200 4650 3600 4650
Wire Wire Line
	4150 4650 4150 4550
Wire Wire Line
	3600 4550 3600 4650
Connection ~ 3600 4650
$Comp
L Ninja-qPCR:NJM431U-ND U?
U 1 1 60BB4F83
P 3200 5050
F 0 "U?" V 3246 4981 50  0000 R CNN
F 1 "TL431PK" V 3155 4981 50  0000 R CNN
F 2 "Ninja-qPCR:NJM431U-ND" H 3200 4900 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 3200 5050 50  0001 C CIN
	1    3200 5050
	0    1    -1   0   
$EndComp
$Comp
L Device:CP C?
U 1 1 60BB4F89
P 3600 5050
F 0 "C?" H 3718 5096 50  0000 L CNN
F 1 "10F2.7V" H 3718 5005 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D13.0mm_P5.00mm" H 3638 4900 50  0001 C CNN
F 3 "~" H 3600 5050 50  0001 C CNN
	1    3600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4750 3400 4750
Wire Wire Line
	3600 4900 3600 4750
Connection ~ 3600 4750
Wire Wire Line
	3300 5050 3400 5050
Wire Wire Line
	3400 5050 3400 4750
Connection ~ 3400 4750
Wire Wire Line
	3400 4750 3600 4750
Wire Wire Line
	3200 5300 3600 5300
Wire Wire Line
	3600 5200 3600 5300
Connection ~ 3600 5300
Wire Wire Line
	3600 2700 3600 2800
Wire Wire Line
	3600 3350 3600 3450
Wire Wire Line
	3600 4000 3600 4100
Wire Wire Line
	3600 4650 3600 4750
$Comp
L power:GND #PWR?
U 1 1 60BB4F9D
P 3600 5500
F 0 "#PWR?" H 3600 5250 50  0001 C CNN
F 1 "GND" H 3605 5327 50  0000 C CNN
F 2 "" H 3600 5500 50  0001 C CNN
F 3 "" H 3600 5500 50  0001 C CNN
	1    3600 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5300 3600 5500
$Comp
L Device:D D?
U 1 1 60BB4FA4
P 4050 2050
F 0 "D?" H 3900 2000 50  0000 C CNN
F 1 "D" H 3900 1900 50  0000 C CNN
F 2 "Diodes_SMD:D_2114" H 4050 2050 50  0001 C CNN
F 3 "~" H 4050 2050 50  0001 C CNN
	1    4050 2050
	-1   0    0    1   
$EndComp
Connection ~ 3600 2050
Wire Wire Line
	3600 2050 3600 2150
Wire Wire Line
	4200 2050 4300 2050
Wire Wire Line
	4150 5300 4150 5200
Wire Wire Line
	4150 4750 4150 4900
$Comp
L Device:R R?
U 1 1 60BB4FAF
P 4150 5050
F 0 "R?" H 4080 5004 50  0000 R CNN
F 1 "1k?W" H 4080 5095 50  0000 R CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 4080 5050 50  0001 C CNN
F 3 "~" H 4150 5050 50  0001 C CNN
	1    4150 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 2800 4150 2800
Wire Wire Line
	3600 3350 4150 3350
Wire Wire Line
	3600 3450 4150 3450
Wire Wire Line
	3600 4000 4150 4000
Wire Wire Line
	3600 4100 4150 4100
Wire Wire Line
	3600 4650 4150 4650
Wire Wire Line
	3600 4750 4150 4750
Wire Wire Line
	3600 5300 4150 5300
Wire Wire Line
	3600 2700 3750 2700
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60BB4FBE
P 4350 2350
AR Path="/603FF008/60BB4FBE" Ref="J?"  Part="1" 
AR Path="/60BB4FBE" Ref="J?"  Part="1" 
F 0 "J?" H 4322 2324 50  0000 R CNN
F 1 "Conn_01x02_Male" H 4322 2233 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4350 2350 50  0001 C CNN
F 3 "~" H 4350 2350 50  0001 C CNN
	1    4350 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3600 2150 4150 2150
Wire Wire Line
	4150 2150 4150 2350
Wire Wire Line
	4150 2450 4150 2700
Wire Wire Line
	4150 2700 4050 2700
$Comp
L Device:R R?
U 1 1 60BB4FC8
P 3850 1600
F 0 "R?" H 3800 1450 50  0000 R CNN
F 1 "8.2Ω 3W" H 3800 1550 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0617_L17.0mm_D6.0mm_P20.32mm_Horizontal" V 3780 1600 50  0001 C CNN
F 3 "~" H 3850 1600 50  0001 C CNN
	1    3850 1600
	-1   0    0    1   
$EndComp
$Comp
L Jumper:Jumper_3_Open JP?
U 1 1 60BB4FCE
P 3600 1300
F 0 "JP?" H 3500 1000 50  0000 C CNN
F 1 "Jumper_3_Open" H 3250 1100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 3600 1300 50  0001 C CNN
F 3 "~" H 3600 1300 50  0001 C CNN
	1    3600 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 2050 3900 2050
Wire Wire Line
	3850 1300 3850 1450
Wire Wire Line
	3350 1300 3350 1450
Wire Wire Line
	3350 1750 3350 1850
Wire Wire Line
	3350 1850 3600 1850
Wire Wire Line
	3850 1850 3850 1750
Wire Wire Line
	3600 1850 3600 2050
Connection ~ 3600 1850
Wire Wire Line
	3600 1850 3850 1850
Wire Wire Line
	3200 2350 3200 2150
Wire Wire Line
	3200 3000 3200 2800
Wire Wire Line
	3200 3200 3200 3350
Wire Wire Line
	3200 3650 3200 3450
Wire Wire Line
	3200 3850 3200 4000
Wire Wire Line
	3200 4300 3200 4100
Wire Wire Line
	3200 4500 3200 4650
Wire Wire Line
	3200 4950 3200 4750
Wire Wire Line
	3200 5150 3200 5300
Wire Wire Line
	4300 2050 4300 900 
Connection ~ 4300 900 
Wire Wire Line
	4300 900  4400 900 
Wire Wire Line
	3600 1150 3600 900 
Connection ~ 3600 900 
Wire Wire Line
	3600 900  4300 900 
Wire Wire Line
	3200 2550 3200 2700
Wire Wire Line
	3200 2700 3100 2700
Wire Wire Line
	3100 2700 3100 2550
Connection ~ 3200 2700
Wire Wire Line
	3200 3350 3100 3350
Wire Wire Line
	3100 3350 3100 3200
Connection ~ 3200 3350
Wire Wire Line
	3200 4000 3100 4000
Wire Wire Line
	3100 4000 3100 3850
Connection ~ 3200 4000
Wire Wire Line
	3200 4650 3100 4650
Wire Wire Line
	3100 4650 3100 4500
Connection ~ 3200 4650
Wire Wire Line
	3200 5300 3100 5300
Wire Wire Line
	3100 5300 3100 5150
Connection ~ 3200 5300
$EndSCHEMATC
