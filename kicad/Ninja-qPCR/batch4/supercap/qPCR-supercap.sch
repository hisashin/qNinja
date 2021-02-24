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
L Connector:Barrel_Jack_Switch J?
U 1 1 602DFE9F
P 1750 2100
F 0 "J?" H 1807 2417 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1807 2326 50  0000 C CNN
F 2 "" H 1800 2060 50  0001 C CNN
F 3 "~" H 1800 2060 50  0001 C CNN
	1    1750 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 602E04E9
P 2200 2900
F 0 "#PWR?" H 2200 2650 50  0001 C CNN
F 1 "GND" H 2205 2727 50  0000 C CNN
F 2 "" H 2200 2900 50  0001 C CNN
F 3 "" H 2200 2900 50  0001 C CNN
	1    2200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2200 2200 2200
Wire Wire Line
	2050 2100 2200 2100
Wire Wire Line
	2200 2100 2200 2200
Text GLabel 3150 2000 2    50   Input ~ 0
VIN
$Comp
L Device:D_Schottky D?
U 1 1 602E0F58
P 2400 2350
F 0 "D?" V 2354 2430 50  0000 L CNN
F 1 "D_Schottky" V 2445 2430 50  0000 L CNN
F 2 "" H 2400 2350 50  0001 C CNN
F 3 "~" H 2400 2350 50  0001 C CNN
	1    2400 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 602E1EA6
P 2950 2650
F 0 "R?" H 3020 2696 50  0000 L CNN
F 1 "R" H 3020 2605 50  0000 L CNN
F 2 "" V 2880 2650 50  0001 C CNN
F 3 "~" H 2950 2650 50  0001 C CNN
	1    2950 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 602E22C6
P 2950 2900
F 0 "#PWR?" H 2950 2650 50  0001 C CNN
F 1 "GND" H 2955 2727 50  0000 C CNN
F 2 "" H 2950 2900 50  0001 C CNN
F 3 "" H 2950 2900 50  0001 C CNN
	1    2950 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2000 2400 2000
Wire Wire Line
	2950 2800 2950 2900
Text GLabel 3150 2450 2    50   Input ~ 0
SENSE
Wire Wire Line
	2200 2200 2200 2600
Connection ~ 2200 2200
Wire Wire Line
	2400 2500 2400 2600
Wire Wire Line
	2400 2600 2200 2600
Connection ~ 2200 2600
Wire Wire Line
	2200 2600 2200 2900
Wire Wire Line
	2400 2200 2400 2000
Wire Wire Line
	2400 2000 2950 2000
Connection ~ 2400 2000
Wire Wire Line
	3150 2000 2950 2000
Connection ~ 2950 2000
Wire Wire Line
	3150 2450 2950 2450
Connection ~ 2950 2450
Wire Wire Line
	2950 2450 2950 2500
Wire Wire Line
	2950 2400 2950 2450
Wire Wire Line
	2950 2100 2950 2000
$Comp
L Device:R R?
U 1 1 602E1A4A
P 2950 2250
F 0 "R?" H 3020 2296 50  0000 L CNN
F 1 "R" H 3020 2205 50  0000 L CNN
F 2 "" V 2880 2250 50  0001 C CNN
F 3 "~" H 2950 2250 50  0001 C CNN
	1    2950 2250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
