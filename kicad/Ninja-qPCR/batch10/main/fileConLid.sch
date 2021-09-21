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
L Connector:Screw_Terminal_01x02 H?
U 1 1 60B5EDAB
P 4750 2850
F 0 "H?" H 4900 2850 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5250 2750 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 4750 2850 50  0001 C CNN
F 3 "~" H 4750 2850 50  0001 C CNN
	1    4750 2850
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TEXT?
U 1 1 60B5EDB1
P 4750 3950
F 0 "TEXT?" H 4650 3950 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4350 3850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 4750 3950 50  0001 C CNN
F 3 "~" H 4750 3950 50  0001 C CNN
	1    4750 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TL?
U 1 1 60B5EDB7
P 4750 4300
F 0 "TL?" H 4650 4300 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4350 4200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 4750 4300 50  0001 C CNN
F 3 "~" H 4750 4300 50  0001 C CNN
	1    4750 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TL?
U 1 1 60B5EDBD
P 4750 4650
F 0 "TL?" H 4650 4650 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4350 4550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 4750 4650 50  0001 C CNN
F 3 "~" H 4750 4650 50  0001 C CNN
	1    4750 4650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TEXT?
U 1 1 60B5EDC3
P 4750 5000
F 0 "TEXT?" H 4650 5000 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4350 4900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 4750 5000 50  0001 C CNN
F 3 "~" H 4750 5000 50  0001 C CNN
	1    4750 5000
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_02x05 U?
U 1 1 60B5EDC9
P 6950 3450
F 0 "U?" H 7269 3061 50  0000 L CNN
F 1 "Conn_02x05" H 7269 2970 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 6750 3550 50  0001 C CNN
F 3 "" H 6750 3550 50  0001 C CNN
	1    6950 3450
	1    0    0    -1  
$EndComp
Text GLabel 5200 2850 2    50   Input ~ 0
HEATER1A
Text GLabel 5200 2950 2    50   Input ~ 0
HEATER1B
Text GLabel 5200 3150 2    50   Input ~ 0
HEATER2A
Text GLabel 5200 3250 2    50   Input ~ 0
HEATER2B
Text GLabel 5200 3950 2    50   Input ~ 0
THERM_EXT1
Text GLabel 5200 4300 2    50   Input ~ 0
THERM_LID1
Text GLabel 5200 3600 2    50   Input ~ 0
THERM_AIR
Text GLabel 5200 4650 2    50   Input ~ 0
THERM_LID2
Text GLabel 5200 5000 2    50   Input ~ 0
THERM_EXT2
Text GLabel 5200 5100 2    50   Input ~ 0
GNDA
Wire Wire Line
	4950 3600 5200 3600
Wire Wire Line
	5200 3950 4950 3950
Wire Wire Line
	5200 2850 4950 2850
Wire Wire Line
	5200 2950 4950 2950
Wire Wire Line
	5200 3150 4950 3150
Wire Wire Line
	5200 3250 4950 3250
Wire Wire Line
	5200 4300 4950 4300
Wire Wire Line
	5200 4650 4950 4650
Wire Wire Line
	5200 5000 4950 5000
Wire Wire Line
	5200 5100 4950 5100
Text GLabel 5200 4750 2    50   Input ~ 0
GNDA
Text GLabel 5200 4400 2    50   Input ~ 0
GNDA
Text GLabel 5200 4050 2    50   Input ~ 0
GNDA
Text GLabel 5200 3700 2    50   Input ~ 0
GNDA
Wire Wire Line
	4950 3700 5200 3700
Wire Wire Line
	4950 4050 5200 4050
Wire Wire Line
	4950 4400 5200 4400
Wire Wire Line
	4950 4750 5200 4750
Text GLabel 6550 3450 0    50   Input ~ 0
HEATER1A
Text GLabel 6550 3550 0    50   Input ~ 0
HEATER1B
Text GLabel 6550 4250 0    50   Input ~ 0
HEATER2A
Text GLabel 6550 4350 0    50   Input ~ 0
HEATER2B
Text GLabel 6550 3950 0    50   Input ~ 0
GNDA
Text GLabel 6550 3650 0    50   Input ~ 0
THERM_AIR
Text GLabel 6550 3750 0    50   Input ~ 0
THERM_EXT1
Text GLabel 6550 3850 0    50   Input ~ 0
THERM_LID1
Text GLabel 6550 4050 0    50   Input ~ 0
THERM_LID2
Text GLabel 6550 4150 0    50   Input ~ 0
THERM_EXT2
Wire Wire Line
	6550 3450 6750 3450
Wire Wire Line
	6550 3650 6750 3650
Wire Wire Line
	6550 3750 6750 3750
Wire Wire Line
	6550 3850 6750 3850
Wire Wire Line
	6550 3950 6750 3950
Wire Wire Line
	6550 4050 6750 4050
Wire Wire Line
	6550 4150 6750 4150
Wire Wire Line
	6550 4350 6750 4350
$Comp
L Connector:Screw_Terminal_01x02 H?
U 1 1 60B5EDFD
P 4750 3150
F 0 "H?" H 4900 3150 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5250 3050 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 4750 3150 50  0001 C CNN
F 3 "~" H 4750 3150 50  0001 C CNN
	1    4750 3150
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TAIR?
U 1 1 60B5EE03
P 4750 3600
F 0 "TAIR?" H 4600 3600 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4350 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 4750 3600 50  0001 C CNN
F 3 "~" H 4750 3600 50  0001 C CNN
	1    4750 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3550 6750 3550
Wire Wire Line
	6550 4250 6750 4250
Text Notes 5900 3500 0    50   ~ 0
=12V
Text Notes 5900 4300 0    50   ~ 0
=12V
$EndSCHEMATC
