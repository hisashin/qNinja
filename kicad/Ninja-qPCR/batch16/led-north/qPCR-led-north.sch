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
L Device:LED D16
U 1 1 5ECD166D
P 2050 5000
F 0 "D16" V 2089 4882 50  0000 R CNN
F 1 "LED" V 1998 4882 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 5000 50  0001 C CNN
F 3 "~" H 2050 5000 50  0001 C CNN
	1    2050 5000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D15
U 1 1 5ECD240F
P 2050 4600
F 0 "D15" V 2089 4482 50  0000 R CNN
F 1 "LED" V 1998 4482 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 4600 50  0001 C CNN
F 3 "~" H 2050 4600 50  0001 C CNN
	1    2050 4600
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D14
U 1 1 5ECD2AA7
P 2050 4200
F 0 "D14" V 2089 4082 50  0000 R CNN
F 1 "LED" V 1998 4082 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 4200 50  0001 C CNN
F 3 "~" H 2050 4200 50  0001 C CNN
	1    2050 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D13
U 1 1 5ECD30CB
P 2050 3850
F 0 "D13" V 2089 3732 50  0000 R CNN
F 1 "LED" V 1998 3732 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 3850 50  0001 C CNN
F 3 "~" H 2050 3850 50  0001 C CNN
	1    2050 3850
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D12
U 1 1 5ECD720E
P 2050 3500
F 0 "D12" V 2089 3382 50  0000 R CNN
F 1 "LED" V 1998 3382 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 3500 50  0001 C CNN
F 3 "~" H 2050 3500 50  0001 C CNN
	1    2050 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D11
U 1 1 5ECD7218
P 2050 3100
F 0 "D11" V 2089 2982 50  0000 R CNN
F 1 "LED" V 1998 2982 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 3100 50  0001 C CNN
F 3 "~" H 2050 3100 50  0001 C CNN
	1    2050 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D10
U 1 1 5ECD7222
P 2050 2700
F 0 "D10" V 2089 2582 50  0000 R CNN
F 1 "LED" V 1998 2582 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 2700 50  0001 C CNN
F 3 "~" H 2050 2700 50  0001 C CNN
	1    2050 2700
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D9
U 1 1 5ECD722C
P 2050 2350
F 0 "D9" V 2089 2232 50  0000 R CNN
F 1 "LED" V 1998 2232 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 2050 2350 50  0001 C CNN
F 3 "~" H 2050 2350 50  0001 C CNN
	1    2050 2350
	-1   0    0    1   
$EndComp
$Comp
L Device:C C1
U 1 1 5ED07E21
P 2900 2250
F 0 "C1" H 3015 2296 50  0000 L CNN
F 1 "C" H 3015 2205 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2938 2100 50  0001 C CNN
F 3 "~" H 2900 2250 50  0001 C CNN
	1    2900 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2100 2900 2050
$Comp
L power:GND #PWR02
U 1 1 5ED0A1D5
P 2900 2500
F 0 "#PWR02" H 2900 2250 50  0001 C CNN
F 1 "GND" H 2905 2327 50  0000 C CNN
F 2 "" H 2900 2500 50  0001 C CNN
F 3 "" H 2900 2500 50  0001 C CNN
	1    2900 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2400 2900 2450
Wire Wire Line
	1900 5000 1700 5000
Wire Wire Line
	1700 5000 1700 4600
Wire Wire Line
	1900 2350 1700 2350
Connection ~ 1700 2350
Wire Wire Line
	1900 2700 1700 2700
Connection ~ 1700 2700
Wire Wire Line
	1700 2700 1700 2350
Wire Wire Line
	1900 3100 1700 3100
Connection ~ 1700 3100
Wire Wire Line
	1700 3100 1700 2700
Wire Wire Line
	1900 3500 1700 3500
Connection ~ 1700 3500
Wire Wire Line
	1700 3500 1700 3100
Wire Wire Line
	1900 3850 1700 3850
Connection ~ 1700 3850
Wire Wire Line
	1700 3850 1700 3500
Wire Wire Line
	1900 4200 1700 4200
Connection ~ 1700 4200
Wire Wire Line
	1700 4200 1700 3850
Wire Wire Line
	1900 4600 1700 4600
Connection ~ 1700 4600
Wire Wire Line
	1700 4600 1700 4200
Text GLabel 2350 2350 2    50   Input ~ 0
OUT9
Text GLabel 2350 2700 2    50   Input ~ 0
OUT10
Text GLabel 2350 3100 2    50   Input ~ 0
OUT11
Text GLabel 2350 3500 2    50   Input ~ 0
OUT12
Text GLabel 2350 3850 2    50   Input ~ 0
OUT13
Text GLabel 2350 4200 2    50   Input ~ 0
OUT14
Text GLabel 2350 4600 2    50   Input ~ 0
OUT15
Text GLabel 2350 5000 2    50   Input ~ 0
OUT16
Wire Wire Line
	2350 5000 2200 5000
Wire Wire Line
	2350 4600 2200 4600
Wire Wire Line
	2350 4200 2200 4200
Wire Wire Line
	2350 3850 2200 3850
Wire Wire Line
	2350 3500 2200 3500
Wire Wire Line
	2350 3100 2200 3100
Wire Wire Line
	2350 2700 2200 2700
Wire Wire Line
	2350 2350 2200 2350
Wire Wire Line
	1700 1850 1700 2050
Connection ~ 1700 1850
Wire Wire Line
	1800 1850 1700 1850
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5ED6E161
P 1800 1850
F 0 "#FLG01" H 1800 1925 50  0001 C CNN
F 1 "PWR_FLAG" V 1800 1978 50  0000 L CNN
F 2 "" H 1800 1850 50  0001 C CNN
F 3 "~" H 1800 1850 50  0001 C CNN
	1    1800 1850
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5ECF15DE
P 1700 1700
F 0 "#PWR01" H 1700 1550 50  0001 C CNN
F 1 "VCC" H 1715 1873 50  0000 C CNN
F 2 "" H 1700 1700 50  0001 C CNN
F 3 "" H 1700 1700 50  0001 C CNN
	1    1700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1700 1700 1850
Wire Wire Line
	1700 2050 1700 2350
Connection ~ 1700 2050
Wire Wire Line
	1700 2050 2900 2050
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5F158C6E
P 2900 2450
F 0 "#FLG02" H 2900 2525 50  0001 C CNN
F 1 "PWR_FLAG" V 2900 2578 50  0000 L CNN
F 2 "" H 2900 2450 50  0001 C CNN
F 3 "~" H 2900 2450 50  0001 C CNN
	1    2900 2450
	0    1    1    0   
$EndComp
Connection ~ 2900 2450
Wire Wire Line
	2900 2450 2900 2500
Text GLabel 4050 3200 0    50   Input ~ 0
OUT9
Text GLabel 4050 3300 0    50   Input ~ 0
OUT10
Text GLabel 4050 3400 0    50   Input ~ 0
OUT11
Text GLabel 4050 3500 0    50   Input ~ 0
OUT12
Text GLabel 4050 3600 0    50   Input ~ 0
OUT13
Text GLabel 4050 3700 0    50   Input ~ 0
OUT14
Text GLabel 4050 3800 0    50   Input ~ 0
OUT15
Text GLabel 4050 3900 0    50   Input ~ 0
OUT16
$Comp
L Ninja-qPCR:Conn_02x05 U1
U 1 1 5F22415F
P 4450 3900
F 0 "U1" H 4769 3511 50  0000 L CNN
F 1 "Conn_02x05" H 4769 3420 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x10_Pitch2.54mm" H 4250 4000 50  0001 C CNN
F 3 "" H 4250 4000 50  0001 C CNN
	1    4450 3900
	1    0    0    1   
$EndComp
Wire Wire Line
	4050 3000 4250 3000
Wire Wire Line
	4050 3100 4250 3100
Wire Wire Line
	4050 3300 4250 3300
Wire Wire Line
	4050 3600 4250 3600
Wire Wire Line
	4050 3700 4250 3700
Wire Wire Line
	4050 3800 4250 3800
Wire Wire Line
	4050 3900 4250 3900
Wire Wire Line
	4250 3400 4050 3400
Wire Wire Line
	4250 3200 4050 3200
Wire Wire Line
	4250 3500 4050 3500
Text GLabel 4050 3100 0    50   Input ~ 0
VCC
Text GLabel 4050 3000 0    50   Input ~ 0
GND
$EndSCHEMATC
