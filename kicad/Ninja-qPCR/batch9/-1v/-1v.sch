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
L Ninja-qPCR:TPS63710DRRR U?
U 1 1 61268DE5
P 4150 4000
F 0 "U?" H 4150 4687 60  0000 C CNN
F 1 "TPS63710DRRR" H 4150 4581 60  0000 C CNN
F 2 "DRR0012C" H 4150 2950 60  0001 C CNN
F 3 "" H 4150 4000 60  0000 C CNN
	1    4150 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 612696FF
P 6400 3850
F 0 "J?" H 6508 4231 50  0000 C CNN
F 1 "Conn_01x06_Male" H 6508 4140 50  0000 C CNN
F 2 "" H 6400 3850 50  0001 C CNN
F 3 "~" H 6400 3850 50  0001 C CNN
	1    6400 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 6126A5AF
P 6400 4650
F 0 "J?" H 6508 5031 50  0000 C CNN
F 1 "Conn_01x06_Male" H 6508 4940 50  0000 C CNN
F 2 "" H 6400 4650 50  0001 C CNN
F 3 "~" H 6400 4650 50  0001 C CNN
	1    6400 4650
	1    0    0    -1  
$EndComp
Text HLabel 5000 3600 2    50   Input ~ 0
CP
Text HLabel 5000 3800 2    50   Input ~ 0
SW
Text HLabel 5000 4000 2    50   Input ~ 0
VOUT
Text HLabel 5000 4200 2    50   Input ~ 0
VREF
Text HLabel 5000 4400 2    50   Input ~ 0
FB
Text HLabel 5000 4600 2    50   Input ~ 0
GND
Text HLabel 3300 3600 0    50   Input ~ 0
VIN
Text HLabel 3300 3800 0    50   Input ~ 0
EN
Text HLabel 3300 4000 0    50   Input ~ 0
CAP
Text HLabel 3300 4200 0    50   Input ~ 0
VAUX
Text HLabel 3300 4400 0    50   Input ~ 0
PG
Wire Wire Line
	3300 3600 3450 3600
Wire Wire Line
	3300 3800 3450 3800
Wire Wire Line
	3300 4000 3450 4000
Wire Wire Line
	3300 4200 3450 4200
Wire Wire Line
	3300 4400 3450 4400
Wire Wire Line
	4850 3600 5000 3600
Wire Wire Line
	4850 3800 5000 3800
Wire Wire Line
	4850 4000 5000 4000
Wire Wire Line
	4850 4200 5000 4200
Wire Wire Line
	4850 4400 5000 4400
Wire Wire Line
	4850 4600 4950 4600
Wire Wire Line
	4850 4700 4950 4700
Wire Wire Line
	4950 4700 4950 4600
Connection ~ 4950 4600
Wire Wire Line
	4950 4600 5000 4600
Text HLabel 6800 3650 2    50   Input ~ 0
VAUX
Text HLabel 6800 3750 2    50   Input ~ 0
EN
Text HLabel 6800 3850 2    50   Input ~ 0
PG
Text HLabel 6800 3950 2    50   Input ~ 0
VREF
Text HLabel 6800 4050 2    50   Input ~ 0
FB
Text HLabel 6800 4150 2    50   Input ~ 0
CAP
Text HLabel 6800 4450 2    50   Input ~ 0
VOUT
Text HLabel 6800 4550 2    50   Input ~ 0
SW
Text HLabel 6800 4650 2    50   Input ~ 0
GND
Text HLabel 6800 4850 2    50   Input ~ 0
CP
Text HLabel 6800 4950 2    50   Input ~ 0
VIN
Wire Wire Line
	6600 4950 6800 4950
Wire Wire Line
	6800 4850 6600 4850
Wire Wire Line
	6800 4650 6700 4650
Wire Wire Line
	6600 4750 6700 4750
Wire Wire Line
	6700 4750 6700 4650
Connection ~ 6700 4650
Wire Wire Line
	6700 4650 6600 4650
Wire Wire Line
	6800 4550 6600 4550
Wire Wire Line
	6600 4450 6800 4450
Wire Wire Line
	6800 4150 6600 4150
Wire Wire Line
	6600 4050 6800 4050
Wire Wire Line
	6800 3950 6600 3950
Wire Wire Line
	6600 3850 6800 3850
Wire Wire Line
	6800 3750 6600 3750
Wire Wire Line
	6600 3650 6800 3650
$EndSCHEMATC
