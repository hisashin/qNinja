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
P 5950 2800
F 0 "U1" H 6269 2411 50  0000 L CNN
F 1 "Conn_02x05" H 6269 2320 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 5750 2900 50  0001 C CNN
F 3 "" H 5750 2900 50  0001 C CNN
	1    5950 2800
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
FAN_VCC
Text GLabel 4400 3350 2    50   Input ~ 0
FAN1
Text GLabel 4400 3700 2    50   Input ~ 0
FAN_VCC
Text GLabel 4400 3800 2    50   Input ~ 0
FAN2
Text GLabel 4400 4100 2    50   Input ~ 0
THERM1
Text GLabel 4400 4300 2    50   Input ~ 0
THERM2
Text GLabel 4400 4200 2    50   Input ~ 0
THERM_GND
Text GLabel 4400 4400 2    50   Input ~ 0
THERM_GND
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
Text GLabel 5550 2800 0    50   Input ~ 0
HEATER1A
Text GLabel 5550 2900 0    50   Input ~ 0
HEATER1B
Text GLabel 5550 3600 0    50   Input ~ 0
HEATER2A
Text GLabel 5550 3700 0    50   Input ~ 0
HEATER2B
Text GLabel 5550 3200 0    50   Input ~ 0
FAN_VCC
Text GLabel 5550 3100 0    50   Input ~ 0
FAN1
Text GLabel 5550 3400 0    50   Input ~ 0
FAN2
Text GLabel 5550 3300 0    50   Input ~ 0
THERM_GND
Text GLabel 5550 3500 0    50   Input ~ 0
THERM2
Text GLabel 5550 3000 0    50   Input ~ 0
THERM1
Wire Wire Line
	5750 2800 5550 2800
Wire Wire Line
	5550 2900 5750 2900
Wire Wire Line
	5550 3600 5750 3600
Wire Wire Line
	5550 3700 5750 3700
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
	5750 3500 5550 3500
Wire Wire Line
	5750 3400 5550 3400
Wire Wire Line
	5750 3300 5550 3300
Wire Wire Line
	5750 3200 5550 3200
Wire Wire Line
	5750 3100 5550 3100
Wire Wire Line
	5750 3000 5550 3000
$EndSCHEMATC
