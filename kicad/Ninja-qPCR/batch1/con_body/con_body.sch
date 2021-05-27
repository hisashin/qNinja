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
U 1 1 5F2B8621
P 3950 2350
F 0 "H1" H 3868 2567 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3868 2476 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 3950 2350 50  0001 C CNN
F 3 "~" H 3950 2350 50  0001 C CNN
	1    3950 2350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 H2
U 1 1 5F2B8F0B
P 3950 2800
F 0 "H2" H 3868 3017 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3868 2926 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 3950 2800 50  0001 C CNN
F 3 "~" H 3950 2800 50  0001 C CNN
	1    3950 2800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 F1
U 1 1 5F2B97D5
P 3950 3250
F 0 "F1" H 3868 3467 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3868 3376 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 3950 3250 50  0001 C CNN
F 3 "~" H 3950 3250 50  0001 C CNN
	1    3950 3250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 F2
U 1 1 5F2B9F97
P 3950 3700
F 0 "F2" H 3868 3917 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3868 3826 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 3950 3700 50  0001 C CNN
F 3 "~" H 3950 3700 50  0001 C CNN
	1    3950 3700
	-1   0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:Conn_02x05 U1
U 1 1 5F2BB8F2
P 6650 2950
F 0 "U1" H 6969 2561 50  0000 L CNN
F 1 "Conn_02x05" H 6969 2470 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 6450 3050 50  0001 C CNN
F 3 "" H 6450 3050 50  0001 C CNN
	1    6650 2950
	1    0    0    -1  
$EndComp
Text GLabel 4400 2350 2    50   Input ~ 0
HEATER1A
Text GLabel 4400 2450 2    50   Input ~ 0
HEATER1B
Text GLabel 4400 2800 2    50   Input ~ 0
HEATER2A
Text GLabel 4400 2900 2    50   Input ~ 0
HEATER2B
Text GLabel 4400 3250 2    50   Input ~ 0
FAN_RED_VCC
Text GLabel 4400 3700 2    50   Input ~ 0
FAN_RED_VCC
Text GLabel 4400 3800 2    50   Input ~ 0
FAN_BLACK_GND2
Text GLabel 4400 4100 2    50   Input ~ 0
THERM_WELL
Text GLabel 4400 4300 2    50   Input ~ 0
THERM_EXT3
Text GLabel 4400 4200 2    50   Input ~ 0
GNDA
Text GLabel 4400 4400 2    50   Input ~ 0
GNDA
Wire Wire Line
	4400 4400 4150 4400
Wire Wire Line
	4400 4300 4150 4300
Wire Wire Line
	4400 4200 4150 4200
Wire Wire Line
	4400 4100 4150 4100
Wire Wire Line
	4400 3800 4150 3800
Wire Wire Line
	4400 3700 4150 3700
Wire Wire Line
	4400 2350 4150 2350
Wire Wire Line
	4400 2450 4150 2450
Wire Wire Line
	4400 2800 4150 2800
Wire Wire Line
	4400 2900 4150 2900
Wire Wire Line
	4400 3250 4150 3250
Wire Wire Line
	4400 3350 4150 3350
Text GLabel 6250 2950 0    50   Input ~ 0
HEATER1A
Text GLabel 6250 3050 0    50   Input ~ 0
HEATER1B
Text GLabel 6250 3750 0    50   Input ~ 0
HEATER2A
Text GLabel 6250 3850 0    50   Input ~ 0
HEATER2B
Text GLabel 6250 3350 0    50   Input ~ 0
FAN_RED_VCC
Text GLabel 6250 3450 0    50   Input ~ 0
GNDA
Text GLabel 6250 3650 0    50   Input ~ 0
THERM_EXT3
Text GLabel 6250 3150 0    50   Input ~ 0
THERM_WELL
Wire Wire Line
	6450 2950 6250 2950
Wire Wire Line
	6250 3050 6450 3050
Wire Wire Line
	6250 3750 6450 3750
Wire Wire Line
	6250 3850 6450 3850
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5F2C3C94
P 3950 4200
F 0 "J1" H 4058 4481 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4058 4390 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x02_Pitch2.54mm" H 3950 4200 50  0001 C CNN
F 3 "~" H 3950 4200 50  0001 C CNN
	1    3950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3650 6250 3650
Wire Wire Line
	6450 3550 6250 3550
Wire Wire Line
	6450 3450 6250 3450
Wire Wire Line
	6450 3350 6250 3350
Wire Wire Line
	6450 3250 6250 3250
Wire Wire Line
	6450 3150 6250 3150
Text GLabel 6250 3550 0    50   Input ~ 0
FAN_BLACK_GND2
Text GLabel 4400 3350 2    50   Input ~ 0
FAN_BLACK_GND1
Text GLabel 6250 3250 0    50   Input ~ 0
FAN_BLACK_GND1
Text Notes 5600 3000 0    50   ~ 0
=12V
Text Notes 5450 3400 0    50   ~ 0
=12V
Text Notes 5600 3800 0    50   ~ 0
=12V
$EndSCHEMATC
