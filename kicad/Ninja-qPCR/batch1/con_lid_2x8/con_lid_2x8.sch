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
L Connector:Screw_Terminal_01x02 H1
U 1 1 5F2B5266
P 3300 2800
F 0 "H1" H 3450 2800 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3800 2700 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 3300 2800 50  0001 C CNN
F 3 "~" H 3300 2800 50  0001 C CNN
	1    3300 2800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TEXT1
U 1 1 5F2B7778
P 3300 3900
F 0 "TEXT1" H 3200 3900 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2900 3800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 3300 3900 50  0001 C CNN
F 3 "~" H 3300 3900 50  0001 C CNN
	1    3300 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TL1
U 1 1 5F2BA46F
P 3300 4250
F 0 "TL1" H 3200 4250 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2900 4150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 3300 4250 50  0001 C CNN
F 3 "~" H 3300 4250 50  0001 C CNN
	1    3300 4250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TL2
U 1 1 5F2BA479
P 3300 4600
F 0 "TL2" H 3200 4600 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2900 4500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 3300 4600 50  0001 C CNN
F 3 "~" H 3300 4600 50  0001 C CNN
	1    3300 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TEXT2
U 1 1 5F2BC0F4
P 3300 4950
F 0 "TEXT2" H 3200 4950 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2900 4850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 3300 4950 50  0001 C CNN
F 3 "~" H 3300 4950 50  0001 C CNN
	1    3300 4950
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_02x05 U1
U 1 1 5F2BEF9C
P 5500 3400
F 0 "U1" H 5819 3011 50  0000 L CNN
F 1 "Conn_02x05" H 5819 2920 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 5300 3500 50  0001 C CNN
F 3 "" H 5300 3500 50  0001 C CNN
	1    5500 3400
	1    0    0    -1  
$EndComp
Text GLabel 3750 2800 2    50   Input ~ 0
HEATER1A
Text GLabel 3750 2900 2    50   Input ~ 0
HEATER1B
Text GLabel 3750 3100 2    50   Input ~ 0
HEATER2A
Text GLabel 3750 3200 2    50   Input ~ 0
HEATER2B
Text GLabel 3750 3900 2    50   Input ~ 0
THERM_EXT1
Text GLabel 3750 4250 2    50   Input ~ 0
THERM_LID1
Text GLabel 3750 3550 2    50   Input ~ 0
THERM_AIR
Text GLabel 3750 4600 2    50   Input ~ 0
THERM_LID2
Text GLabel 3750 4950 2    50   Input ~ 0
THERM_EXT2
Text GLabel 3750 5050 2    50   Input ~ 0
GNDA
Wire Wire Line
	3500 3550 3750 3550
Wire Wire Line
	3750 3900 3500 3900
Wire Wire Line
	3750 2800 3500 2800
Wire Wire Line
	3750 2900 3500 2900
Wire Wire Line
	3750 3100 3500 3100
Wire Wire Line
	3750 3200 3500 3200
Wire Wire Line
	3750 4250 3500 4250
Wire Wire Line
	3750 4600 3500 4600
Wire Wire Line
	3750 4950 3500 4950
Wire Wire Line
	3750 5050 3500 5050
Text GLabel 3750 4700 2    50   Input ~ 0
GNDA
Text GLabel 3750 4350 2    50   Input ~ 0
GNDA
Text GLabel 3750 4000 2    50   Input ~ 0
GNDA
Text GLabel 3750 3650 2    50   Input ~ 0
GNDA
Wire Wire Line
	3500 3650 3750 3650
Wire Wire Line
	3500 4000 3750 4000
Wire Wire Line
	3500 4350 3750 4350
Wire Wire Line
	3500 4700 3750 4700
Text GLabel 5100 3400 0    50   Input ~ 0
HEATER1A
Text GLabel 5100 3500 0    50   Input ~ 0
HEATER1B
Text GLabel 5100 4200 0    50   Input ~ 0
HEATER2A
Text GLabel 5100 4300 0    50   Input ~ 0
HEATER2B
Text GLabel 5100 3900 0    50   Input ~ 0
GNDA
Text GLabel 5100 3600 0    50   Input ~ 0
THERM_AIR
Text GLabel 5100 3700 0    50   Input ~ 0
THERM_EXT1
Text GLabel 5100 3800 0    50   Input ~ 0
THERM_LID1
Text GLabel 5100 4000 0    50   Input ~ 0
THERM_LID2
Text GLabel 5100 4100 0    50   Input ~ 0
THERM_EXT2
Wire Wire Line
	5100 3400 5300 3400
Wire Wire Line
	5100 3600 5300 3600
Wire Wire Line
	5100 3700 5300 3700
Wire Wire Line
	5100 3800 5300 3800
Wire Wire Line
	5100 3900 5300 3900
Wire Wire Line
	5100 4000 5300 4000
Wire Wire Line
	5100 4100 5300 4100
Wire Wire Line
	5100 4300 5300 4300
$Comp
L Connector:Screw_Terminal_01x02 H2
U 1 1 5F2B5A56
P 3300 3100
F 0 "H2" H 3450 3100 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3800 3000 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 3300 3100 50  0001 C CNN
F 3 "~" H 3300 3100 50  0001 C CNN
	1    3300 3100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male TAIR1
U 1 1 5F2B6313
P 3300 3550
F 0 "TAIR1" H 3150 3550 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2900 3450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 3300 3550 50  0001 C CNN
F 3 "~" H 3300 3550 50  0001 C CNN
	1    3300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3500 5300 3500
Wire Wire Line
	5100 4200 5300 4200
Text Notes 4450 3450 0    50   ~ 0
=12V
Text Notes 4450 4250 0    50   ~ 0
=12V
$EndSCHEMATC
