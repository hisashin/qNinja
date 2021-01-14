EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
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
L Device:R R?
U 1 1 5F760A69
P 3700 2250
AR Path="/5F760A69" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760A69" Ref="R?"  Part="1" 
F 0 "R?" V 3493 2250 50  0000 C CNN
F 1 "10k" V 3584 2250 50  0000 C CNN
F 2 "" V 3630 2250 50  0001 C CNN
F 3 "~" H 3700 2250 50  0001 C CNN
	1    3700 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F760A6F
P 3250 2000
AR Path="/5F760A6F" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760A6F" Ref="R?"  Part="1" 
F 0 "R?" V 3043 2000 50  0000 C CNN
F 1 "1k" V 3134 2000 50  0000 C CNN
F 2 "" V 3180 2000 50  0001 C CNN
F 3 "~" H 3250 2000 50  0001 C CNN
	1    3250 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 2000 3450 2000
Wire Wire Line
	3550 2250 3450 2250
Wire Wire Line
	3450 2250 3450 2000
Connection ~ 3450 2000
Wire Wire Line
	3450 2000 3400 2000
$Comp
L power:GND #PWR?
U 1 1 5F760A7A
P 4100 2350
AR Path="/5F760A7A" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F760A7A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4100 2100 50  0001 C CNN
F 1 "GND" H 4105 2177 50  0000 C CNN
F 2 "" H 4100 2350 50  0001 C CNN
F 3 "" H 4100 2350 50  0001 C CNN
	1    4100 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2350 4100 2250
Wire Wire Line
	3850 2250 4100 2250
Connection ~ 4100 2250
Wire Wire Line
	4100 2250 4100 2200
Text HLabel 2950 2000 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	2950 2000 3100 2000
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F760A86
P 4000 2000
AR Path="/5F760A86" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F760A86" Ref="Q?"  Part="1" 
F 0 "Q?" H 4204 2046 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4204 1955 50  0000 L CNN
F 2 "" H 4200 2100 50  0001 C CNN
F 3 "~" H 4000 2000 50  0001 C CNN
	1    4000 2000
	1    0    0    -1  
$EndComp
Text GLabel 4100 1550 2    50   Input ~ 0
12V
Wire Wire Line
	4100 1650 4100 1800
Text GLabel 4000 5250 0    50   Input ~ 0
BODY_HEATER2A
Text GLabel 4000 5350 0    50   Input ~ 0
BODY_HEATER2B
Text GLabel 3950 1550 0    50   Input ~ 0
LID_HEATER1A
Text GLabel 3950 1650 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 3950 2700 0    50   Input ~ 0
LID_HEATER2A
Text GLabel 3950 2800 0    50   Input ~ 0
LID_HEATER2B
$Comp
L Device:R R?
U 1 1 5F760A94
P 3700 4750
AR Path="/5F760A94" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760A94" Ref="R?"  Part="1" 
F 0 "R?" V 3493 4750 50  0000 C CNN
F 1 "10k" V 3584 4750 50  0000 C CNN
F 2 "" V 3630 4750 50  0001 C CNN
F 3 "~" H 3700 4750 50  0001 C CNN
	1    3700 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F760A9A
P 3250 4500
AR Path="/5F760A9A" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760A9A" Ref="R?"  Part="1" 
F 0 "R?" V 3043 4500 50  0000 C CNN
F 1 "1k" V 3134 4500 50  0000 C CNN
F 2 "" V 3180 4500 50  0001 C CNN
F 3 "~" H 3250 4500 50  0001 C CNN
	1    3250 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 4500 3450 4500
Wire Wire Line
	3550 4750 3450 4750
Wire Wire Line
	3450 4750 3450 4500
Connection ~ 3450 4500
Wire Wire Line
	3450 4500 3400 4500
$Comp
L power:GND #PWR?
U 1 1 5F760AA5
P 4100 4850
AR Path="/5F760AA5" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F760AA5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4100 4600 50  0001 C CNN
F 1 "GND" H 4105 4677 50  0000 C CNN
F 2 "" H 4100 4850 50  0001 C CNN
F 3 "" H 4100 4850 50  0001 C CNN
	1    4100 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4850 4100 4750
Wire Wire Line
	3850 4750 4100 4750
Connection ~ 4100 4750
Wire Wire Line
	4100 4750 4100 4700
Text HLabel 2950 4500 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	2950 4500 3100 4500
Text GLabel 4000 4150 0    50   Input ~ 0
BODY_HEATER1B
Text GLabel 4000 4050 0    50   Input ~ 0
BODY_HEATER1A
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F760AB3
P 4000 4500
AR Path="/5F760AB3" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F760AB3" Ref="Q?"  Part="1" 
F 0 "Q?" H 4204 4546 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4204 4455 50  0000 L CNN
F 2 "" H 4200 4600 50  0001 C CNN
F 3 "~" H 4000 4500 50  0001 C CNN
	1    4000 4500
	1    0    0    -1  
$EndComp
Text GLabel 4100 4050 2    50   Input ~ 0
12V
Wire Wire Line
	4000 4150 4100 4150
Wire Wire Line
	4100 4150 4100 4300
Wire Wire Line
	4100 4050 4000 4050
Wire Wire Line
	4100 1650 3950 1650
Wire Wire Line
	4100 1550 3950 1550
$Comp
L Device:R R?
U 1 1 5F760ABF
P 3700 3400
AR Path="/5F760ABF" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760ABF" Ref="R?"  Part="1" 
F 0 "R?" V 3493 3400 50  0000 C CNN
F 1 "10k" V 3584 3400 50  0000 C CNN
F 2 "" V 3630 3400 50  0001 C CNN
F 3 "~" H 3700 3400 50  0001 C CNN
	1    3700 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F760AC5
P 3250 3150
AR Path="/5F760AC5" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760AC5" Ref="R?"  Part="1" 
F 0 "R?" V 3043 3150 50  0000 C CNN
F 1 "1k" V 3134 3150 50  0000 C CNN
F 2 "" V 3180 3150 50  0001 C CNN
F 3 "~" H 3250 3150 50  0001 C CNN
	1    3250 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 3150 3450 3150
Wire Wire Line
	3550 3400 3450 3400
Wire Wire Line
	3450 3400 3450 3150
Connection ~ 3450 3150
Wire Wire Line
	3450 3150 3400 3150
$Comp
L power:GND #PWR?
U 1 1 5F760AD0
P 4100 3500
AR Path="/5F760AD0" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F760AD0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4100 3250 50  0001 C CNN
F 1 "GND" H 4105 3327 50  0000 C CNN
F 2 "" H 4100 3500 50  0001 C CNN
F 3 "" H 4100 3500 50  0001 C CNN
	1    4100 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3500 4100 3400
Wire Wire Line
	3850 3400 4100 3400
Connection ~ 4100 3400
Wire Wire Line
	4100 3400 4100 3350
Text HLabel 2950 3150 0    50   Input ~ 0
LID_HEATER2
Wire Wire Line
	2950 3150 3100 3150
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F760ADC
P 4000 3150
AR Path="/5F760ADC" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F760ADC" Ref="Q?"  Part="1" 
F 0 "Q?" H 4204 3196 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4204 3105 50  0000 L CNN
F 2 "" H 4200 3250 50  0001 C CNN
F 3 "~" H 4000 3150 50  0001 C CNN
	1    4000 3150
	1    0    0    -1  
$EndComp
Text GLabel 4100 2700 2    50   Input ~ 0
12V
Wire Wire Line
	4100 2800 4100 2950
Wire Wire Line
	4100 2800 3950 2800
Wire Wire Line
	4100 2700 3950 2700
$Comp
L Device:R R?
U 1 1 5F760AE6
P 3700 5950
AR Path="/5F760AE6" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760AE6" Ref="R?"  Part="1" 
F 0 "R?" V 3493 5950 50  0000 C CNN
F 1 "10k" V 3584 5950 50  0000 C CNN
F 2 "" V 3630 5950 50  0001 C CNN
F 3 "~" H 3700 5950 50  0001 C CNN
	1    3700 5950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F760AEC
P 3250 5700
AR Path="/5F760AEC" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F760AEC" Ref="R?"  Part="1" 
F 0 "R?" V 3043 5700 50  0000 C CNN
F 1 "1k" V 3134 5700 50  0000 C CNN
F 2 "" V 3180 5700 50  0001 C CNN
F 3 "~" H 3250 5700 50  0001 C CNN
	1    3250 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 5700 3450 5700
Wire Wire Line
	3550 5950 3450 5950
Wire Wire Line
	3450 5950 3450 5700
Connection ~ 3450 5700
Wire Wire Line
	3450 5700 3400 5700
$Comp
L power:GND #PWR?
U 1 1 5F760AF7
P 4100 6050
AR Path="/5F760AF7" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F760AF7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4100 5800 50  0001 C CNN
F 1 "GND" H 4105 5877 50  0000 C CNN
F 2 "" H 4100 6050 50  0001 C CNN
F 3 "" H 4100 6050 50  0001 C CNN
	1    4100 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6050 4100 5950
Wire Wire Line
	3850 5950 4100 5950
Connection ~ 4100 5950
Wire Wire Line
	4100 5950 4100 5900
Text HLabel 2950 5700 0    50   Input ~ 0
WELL_HEATER2
Wire Wire Line
	2950 5700 3100 5700
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F760B03
P 4000 5700
AR Path="/5F760B03" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F760B03" Ref="Q?"  Part="1" 
F 0 "Q?" H 4204 5746 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 4204 5655 50  0000 L CNN
F 2 "" H 4200 5800 50  0001 C CNN
F 3 "~" H 4000 5700 50  0001 C CNN
	1    4000 5700
	1    0    0    -1  
$EndComp
Text GLabel 4100 5250 2    50   Input ~ 0
12V
Wire Wire Line
	4000 5350 4100 5350
Wire Wire Line
	4100 5350 4100 5500
Wire Wire Line
	4100 5250 4000 5250
Text GLabel 6600 1550 2    50   Input ~ 0
FAN_PWM
Text GLabel 6300 1550 0    50   Input ~ 0
FAN_BLUE_FREQ
Text GLabel 6300 1450 0    50   Input ~ 0
FAN_RED_VCC
Text GLabel 6300 2000 0    50   Input ~ 0
FAN_BLACK_GND
Text GLabel 6600 1450 2    50   Input ~ 0
12V
$Comp
L power:GND #PWR?
U 1 1 5F4DA3C3
P 6850 2050
AR Path="/5F4DA3C3" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F4DA3C3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6850 1800 50  0001 C CNN
F 1 "GND" H 6855 1877 50  0000 C CNN
F 2 "" H 6850 2050 50  0001 C CNN
F 3 "" H 6850 2050 50  0001 C CNN
	1    6850 2050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6600 1550 6350 1550
Wire Wire Line
	6300 1450 6600 1450
$Comp
L Device:R R?
U 1 1 5F4E35DA
P 6550 1800
F 0 "R?" V 6343 1800 50  0000 C CNN
F 1 "10k" V 6434 1800 50  0000 C CNN
F 2 "" V 6480 1800 50  0001 C CNN
F 3 "~" H 6550 1800 50  0001 C CNN
	1    6550 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 1550 6350 1800
Wire Wire Line
	6350 1800 6400 1800
Connection ~ 6350 1550
Wire Wire Line
	6350 1550 6300 1550
Wire Wire Line
	6700 1800 6850 1800
Wire Wire Line
	6850 1800 6850 2000
Wire Wire Line
	6300 2000 6850 2000
Connection ~ 6850 2000
Wire Wire Line
	6850 2000 6850 2050
$EndSCHEMATC