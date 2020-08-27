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
L Connector:Conn_01x08_Male J?
U 1 1 5F47D87C
P 1050 1400
F 0 "J?" H 1158 1881 50  0000 C CNN
F 1 "Conn_01x08_Male" H 1158 1790 50  0000 C CNN
F 2 "" H 1050 1400 50  0001 C CNN
F 3 "~" H 1050 1400 50  0001 C CNN
	1    1050 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Male J?
U 1 1 5F47E862
P 1050 2650
F 0 "J?" H 1158 3331 50  0000 C CNN
F 1 "Conn_01x12_Male" H 1158 3240 50  0000 C CNN
F 2 "" H 1050 2650 50  0001 C CNN
F 3 "~" H 1050 2650 50  0001 C CNN
	1    1050 2650
	1    0    0    -1  
$EndComp
Text GLabel 1450 1100 2    50   Input ~ 0
THERM_MUX_S0
Text GLabel 1450 1200 2    50   Input ~ 0
THERM_MUX_S1
Text GLabel 1450 1300 2    50   Input ~ 0
THERM_MUX_S2
Text GLabel 1450 1400 2    50   Input ~ 0
THERM_MUX_S3
Text GLabel 1450 1500 2    50   Input ~ 0
3V3
Text GLabel 1450 1600 2    50   Input ~ 0
GND
Text GLabel 1450 1700 2    50   Input ~ 0
THERM_GND
Text GLabel 1450 1800 2    50   Input ~ 0
THERM_OUT
Text GLabel 1450 2150 2    50   Input ~ 0
BODY_HEATER1A
Text GLabel 1450 2250 2    50   Input ~ 0
BODY_HEATER1B
Text GLabel 1450 2350 2    50   Input ~ 0
FAN_VCC
Text GLabel 1450 2450 2    50   Input ~ 0
FAN1
Text GLabel 1450 2550 2    50   Input ~ 0
FAN2
Text GLabel 1450 2650 2    50   Input ~ 0
BODY_HEATER2A
Text GLabel 1450 2750 2    50   Input ~ 0
BODY_HEATER2B
Text GLabel 1450 2850 2    50   Input ~ 0
LID_HEATER1A
Text GLabel 1450 2950 2    50   Input ~ 0
LID_HEATER1B
Text GLabel 1450 3050 2    50   Input ~ 0
LID_HEATER2A
Text GLabel 1450 3150 2    50   Input ~ 0
LID_HEATER2B
Wire Wire Line
	1450 1100 1250 1100
Wire Wire Line
	1250 1200 1450 1200
Wire Wire Line
	1250 1300 1450 1300
Wire Wire Line
	1450 1400 1250 1400
Wire Wire Line
	1250 1500 1450 1500
Wire Wire Line
	1450 1600 1250 1600
Wire Wire Line
	1250 1700 1450 1700
Wire Wire Line
	1450 1800 1250 1800
$EndSCHEMATC
