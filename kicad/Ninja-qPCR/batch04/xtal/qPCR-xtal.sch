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
L Ninja-qPCR:COM1305-0.032768-EXT-T-TR U1
U 1 1 602DF21F
P 5100 3800
F 0 "U1" H 5525 4065 50  0000 C CNN
F 1 "COM1305-0.032768-EXT-T-TR" H 5525 3974 50  0000 C CNN
F 2 "Ninja-qPCR:COM1305-0.032768-EXT-T-TR" H 5100 3800 50  0001 C CNN
F 3 "" H 5100 3800 50  0001 C CNN
	1    5100 3800
	1    0    0    -1  
$EndComp
Text GLabel 5700 4450 2    50   Input ~ 0
CLKIN
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 602E11E5
P 5300 4550
F 0 "J1" H 5408 4831 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5408 4740 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03_Pitch2.54mm" H 5300 4550 50  0001 C CNN
F 3 "~" H 5300 4550 50  0001 C CNN
	1    5300 4550
	1    0    0    -1  
$EndComp
Text GLabel 5700 4650 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 602E1C2A
P 5300 4950
F 0 "J2" H 5408 5131 50  0000 C CNN
F 1 "Conn_01x01_Male" H 5408 5040 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 5300 4950 50  0001 C CNN
F 3 "~" H 5300 4950 50  0001 C CNN
	1    5300 4950
	1    0    0    -1  
$EndComp
Text GLabel 5700 4950 2    50   Input ~ 0
3V3
Wire Wire Line
	5700 4950 5500 4950
Wire Wire Line
	5700 4650 5500 4650
Wire Wire Line
	5700 4450 5500 4450
Text GLabel 4950 3900 0    50   Input ~ 0
CLKIN
Text GLabel 6100 3800 2    50   Input ~ 0
3V3
Text GLabel 4950 3800 0    50   Input ~ 0
3V3
Text GLabel 6100 3900 2    50   Input ~ 0
GND
Wire Wire Line
	6100 3900 5950 3900
Wire Wire Line
	6100 3800 5950 3800
Wire Wire Line
	5100 3800 4950 3800
Wire Wire Line
	5100 3900 4950 3900
$EndSCHEMATC
