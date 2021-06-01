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
U 1 1 60B5E4CE
P 4350 3000
F 0 "H?" H 4268 3217 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4268 3126 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 4350 3000 50  0001 C CNN
F 3 "~" H 4350 3000 50  0001 C CNN
	1    4350 3000
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 H?
U 1 1 60B5E4D4
P 4350 3450
F 0 "H?" H 4268 3667 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4268 3576 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 4350 3450 50  0001 C CNN
F 3 "~" H 4350 3450 50  0001 C CNN
	1    4350 3450
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 F?
U 1 1 60B5E4DA
P 4350 3900
F 0 "F?" H 4268 4117 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4268 4026 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 4350 3900 50  0001 C CNN
F 3 "~" H 4350 3900 50  0001 C CNN
	1    4350 3900
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 F?
U 1 1 60B5E4E0
P 4350 4350
F 0 "F?" H 4268 4567 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4268 4476 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 4350 4350 50  0001 C CNN
F 3 "~" H 4350 4350 50  0001 C CNN
	1    4350 4350
	-1   0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_02x05 U?
U 1 1 60B5E4E6
P 7050 3600
F 0 "U?" H 7369 3211 50  0000 L CNN
F 1 "Conn_02x05" H 7369 3120 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 6850 3700 50  0001 C CNN
F 3 "" H 6850 3700 50  0001 C CNN
	1    7050 3600
	1    0    0    -1  
$EndComp
Text GLabel 4800 3000 2    50   Input ~ 0
HEATER1A
Text GLabel 4800 3100 2    50   Input ~ 0
HEATER1B
Text GLabel 4800 3450 2    50   Input ~ 0
HEATER2A
Text GLabel 4800 3550 2    50   Input ~ 0
HEATER2B
Text GLabel 4800 3900 2    50   Input ~ 0
FAN_RED_VCC
Text GLabel 4800 4350 2    50   Input ~ 0
FAN_RED_VCC
Text GLabel 4800 4450 2    50   Input ~ 0
FAN_BLACK_GND2
Text GLabel 4800 4750 2    50   Input ~ 0
THERM_WELL
Text GLabel 4800 4950 2    50   Input ~ 0
THERM_EXT3
Text GLabel 4800 4850 2    50   Input ~ 0
GNDA
Text GLabel 4800 5050 2    50   Input ~ 0
GNDA
Wire Wire Line
	4800 5050 4550 5050
Wire Wire Line
	4800 4950 4550 4950
Wire Wire Line
	4800 4850 4550 4850
Wire Wire Line
	4800 4750 4550 4750
Wire Wire Line
	4800 4450 4550 4450
Wire Wire Line
	4800 4350 4550 4350
Wire Wire Line
	4800 3000 4550 3000
Wire Wire Line
	4800 3100 4550 3100
Wire Wire Line
	4800 3450 4550 3450
Wire Wire Line
	4800 3550 4550 3550
Wire Wire Line
	4800 3900 4550 3900
Wire Wire Line
	4800 4000 4550 4000
Text GLabel 6650 3600 0    50   Input ~ 0
HEATER1A
Text GLabel 6650 3700 0    50   Input ~ 0
HEATER1B
Text GLabel 6650 4400 0    50   Input ~ 0
HEATER2A
Text GLabel 6650 4500 0    50   Input ~ 0
HEATER2B
Text GLabel 6650 4000 0    50   Input ~ 0
FAN_RED_VCC
Text GLabel 6650 4100 0    50   Input ~ 0
GNDA
Text GLabel 6650 4300 0    50   Input ~ 0
THERM_EXT3
Text GLabel 6650 3800 0    50   Input ~ 0
THERM_WELL
Wire Wire Line
	6850 3600 6650 3600
Wire Wire Line
	6650 3700 6850 3700
Wire Wire Line
	6650 4400 6850 4400
Wire Wire Line
	6650 4500 6850 4500
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 60B5E50F
P 4350 4850
F 0 "J?" H 4458 5131 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4458 5040 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x02_Pitch2.54mm" H 4350 4850 50  0001 C CNN
F 3 "~" H 4350 4850 50  0001 C CNN
	1    4350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4300 6650 4300
Wire Wire Line
	6850 4200 6650 4200
Wire Wire Line
	6850 4100 6650 4100
Wire Wire Line
	6850 4000 6650 4000
Wire Wire Line
	6850 3900 6650 3900
Wire Wire Line
	6850 3800 6650 3800
Text GLabel 6650 4200 0    50   Input ~ 0
FAN_BLACK_GND2
Text GLabel 4800 4000 2    50   Input ~ 0
FAN_BLACK_GND1
Text GLabel 6650 3900 0    50   Input ~ 0
FAN_BLACK_GND1
Text Notes 6000 3650 0    50   ~ 0
=12V
Text Notes 5850 4050 0    50   ~ 0
=12V
Text Notes 6000 4450 0    50   ~ 0
=12V
$EndSCHEMATC
