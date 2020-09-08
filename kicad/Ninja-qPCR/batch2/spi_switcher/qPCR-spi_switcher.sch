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
L Connector:Conn_01x06_Male J?
U 1 1 5F534D6C
P 4800 2650
F 0 "J?" H 4908 3031 50  0000 C CNN
F 1 "Conn_01x06_Male" H 4908 2940 50  0000 C CNN
F 2 "" H 4800 2650 50  0001 C CNN
F 3 "~" H 4800 2650 50  0001 C CNN
	1    4800 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F535D28
P 6750 2650
F 0 "J?" H 6722 2624 50  0000 R CNN
F 1 "Conn_01x06_Male" H 6722 2533 50  0000 R CNN
F 2 "" H 6750 2650 50  0001 C CNN
F 3 "~" H 6750 2650 50  0001 C CNN
	1    6750 2650
	-1   0    0    -1  
$EndComp
Text GLabel 5200 2550 2    50   Input ~ 0
VCC
Text GLabel 5200 2450 2    50   Input ~ 0
GND
Text GLabel 5200 2650 2    50   Input ~ 0
SPI_MOSI_SWITCH
Text GLabel 5200 2950 2    50   Input ~ 0
SCK
Text GLabel 5200 2850 2    50   Input ~ 0
MISO
Text GLabel 5200 2750 2    50   Input ~ 0
MOSI
Wire Wire Line
	5200 2450 5000 2450
Wire Wire Line
	5200 2550 5000 2550
Wire Wire Line
	5200 2650 5000 2650
Wire Wire Line
	5200 2750 5000 2750
Wire Wire Line
	5200 2850 5000 2850
Wire Wire Line
	5200 2950 5000 2950
Text GLabel 6400 2650 0    50   Input ~ 0
SCK
Text GLabel 6400 2550 0    50   Input ~ 0
MISO
Text GLabel 6400 2950 0    50   Input ~ 0
SCK
Text GLabel 6400 2850 0    50   Input ~ 0
MISO
Text GLabel 6400 2450 0    50   Input ~ 0
MOSI1
Text GLabel 6400 2750 0    50   Input ~ 0
MOSI2
Wire Wire Line
	6550 2450 6400 2450
Wire Wire Line
	6550 2550 6400 2550
Wire Wire Line
	6550 2650 6400 2650
Wire Wire Line
	6550 2750 6400 2750
Wire Wire Line
	6550 2850 6400 2850
Wire Wire Line
	6550 2950 6400 2950
$Comp
L Ninja-qPCR:SN74LVC1G04DBVR U?
U 1 1 5F541971
P 4550 4250
F 0 "U?" H 4550 4717 50  0000 C CNN
F 1 "SN74LVC1G04DBVR" H 4550 4626 50  0000 C CNN
F 2 "SOT95P280X145-5N" H 4550 4250 50  0001 L BNN
F 3 "IPC-7351B" H 4550 4250 50  0001 L BNN
F 4 "1.45mm" H 4550 4250 50  0001 L BNN "Field4"
F 5 "AD" H 4550 4250 50  0001 L BNN "Field5"
F 6 "Texas Instruments" H 4550 4250 50  0001 L BNN "Field6"
	1    4550 4250
	1    0    0    -1  
$EndComp
Text GLabel 3950 4250 0    50   Input ~ 0
SPI_MOSI_SWITCH
Text GLabel 3950 4050 0    50   Input ~ 0
VCC
Text GLabel 5150 4450 2    50   Input ~ 0
GND
NoConn ~ 5150 4050
Text HLabel 5150 4250 2    50   Input ~ 0
INV
Wire Wire Line
	4950 4250 5150 4250
Wire Wire Line
	4950 4450 5150 4450
Wire Wire Line
	5150 4050 4950 4050
Wire Wire Line
	4150 4050 3950 4050
Wire Wire Line
	4150 4250 3950 4250
$Comp
L Ninja-qPCR:SN74LVC2G66DCUR U?
U 1 1 5F51B522
P 7200 4400
F 0 "U?" H 7200 5270 50  0000 C CNN
F 1 "SN74LVC2G66DCUR" H 7200 5179 50  0000 C CNN
F 2 "SOP50P310X90-8N" H 7200 4400 50  0001 L BNN
F 3 "" H 7200 4400 50  0001 C CNN
	1    7200 4400
	1    0    0    -1  
$EndComp
Text GLabel 6300 4000 0    50   Input ~ 0
SPI_MOSI_SWITCH
Text HLabel 6300 4100 0    50   Input ~ 0
INV
Text GLabel 6300 4300 0    50   Input ~ 0
MOSI
Text GLabel 6300 4600 0    50   Input ~ 0
MOSI
Text GLabel 6300 4400 0    50   Input ~ 0
MOSI1
Text GLabel 6300 4700 0    50   Input ~ 0
MOSI2
Text GLabel 8100 3800 2    50   Input ~ 0
VCC
Text GLabel 8100 4900 2    50   Input ~ 0
GND
Wire Wire Line
	8100 3800 7900 3800
Wire Wire Line
	8100 4900 7900 4900
Wire Wire Line
	6500 4000 6300 4000
Wire Wire Line
	6500 4100 6300 4100
Wire Wire Line
	6500 4300 6300 4300
Wire Wire Line
	6500 4400 6300 4400
Wire Wire Line
	6500 4600 6300 4600
Wire Wire Line
	6500 4700 6300 4700
$EndSCHEMATC
