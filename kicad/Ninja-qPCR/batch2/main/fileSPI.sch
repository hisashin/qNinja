EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 7300 3600 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 7300 4050 2    50   Input ~ 0
SPI_SCLK
Text GLabel 7300 3700 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 7300 4150 2    50   Input ~ 0
PD_MUX_GPIO3
Wire Wire Line
	7300 4150 7050 4150
Wire Wire Line
	7300 4050 7050 4050
Wire Wire Line
	7300 3700 7050 3700
Wire Wire Line
	7300 3600 7050 3600
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5FA60625
P 6850 3700
AR Path="/5FA60625" Ref="J?"  Part="1" 
AR Path="/5FA5D98E/5FA60625" Ref="J?"  Part="1" 
F 0 "J?" H 6958 3981 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6958 3890 50  0000 C CNN
F 2 "" H 6850 3700 50  0001 C CNN
F 3 "~" H 6850 3700 50  0001 C CNN
	1    6850 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5FA6062B
P 6850 4150
AR Path="/5FA6062B" Ref="J?"  Part="1" 
AR Path="/5FA5D98E/5FA6062B" Ref="J?"  Part="1" 
F 0 "J?" H 6958 4431 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6958 4340 50  0000 C CNN
F 2 "" H 6850 4150 50  0001 C CNN
F 3 "~" H 6850 4150 50  0001 C CNN
	1    6850 4150
	1    0    0    -1  
$EndComp
Text GLabel 7300 3800 2    50   Input ~ 0
PD_MUX_GPIO2?
Text GLabel 7300 4250 2    50   Input ~ 0
PD_MUX_GPIO3?
Wire Wire Line
	7300 3800 7050 3800
Wire Wire Line
	7300 4250 7050 4250
$Comp
L Ninja-qPCR:SN74LVC1G04DBVR U?
U 1 1 5FA60638
P 4550 3000
AR Path="/5FA60638" Ref="U?"  Part="1" 
AR Path="/5FA5D98E/5FA60638" Ref="U?"  Part="1" 
F 0 "U?" H 4550 3467 50  0000 C CNN
F 1 "SN74LVC1G04DBVR" H 4550 3376 50  0000 C CNN
F 2 "SOT95P280X145-5N" H 4550 3000 50  0001 L BNN
F 3 "IPC-7351B" H 4550 3000 50  0001 L BNN
F 4 "1.45mm" H 4550 3000 50  0001 L BNN "Field4"
F 5 "AD" H 4550 3000 50  0001 L BNN "Field5"
F 6 "Texas Instruments" H 4550 3000 50  0001 L BNN "Field6"
	1    4550 3000
	1    0    0    -1  
$EndComp
Text GLabel 4000 2800 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 4000 3000 0    50   Input ~ 0
SPI_SWITCH
NoConn ~ 5100 2800
Text HLabel 5100 3000 2    50   Input ~ 0
SPI_SWITCH_INV
Text GLabel 5100 3200 2    50   Input ~ 0
GND
Wire Wire Line
	5100 3200 4950 3200
Wire Wire Line
	5100 3000 4950 3000
Wire Wire Line
	5100 2800 4950 2800
Wire Wire Line
	4150 2800 4000 2800
Wire Wire Line
	4150 3000 4000 3000
$Comp
L Ninja-qPCR:SN74LVC2G66DCUR U?
U 1 1 5FA60648
P 4600 4500
AR Path="/5FA60648" Ref="U?"  Part="1" 
AR Path="/5FA5D98E/5FA60648" Ref="U?"  Part="1" 
F 0 "U?" H 4600 5370 50  0000 C CNN
F 1 "SN74LVC2G66DCUR" H 4600 5279 50  0000 C CNN
F 2 "SOP50P310X90-8N" H 4600 4500 50  0001 L BNN
F 3 "" H 4600 4500 50  0001 C CNN
	1    4600 4500
	1    0    0    -1  
$EndComp
Text GLabel 3750 4100 0    50   Input ~ 0
SPI_SWITCH
Text HLabel 3750 4200 0    50   Input ~ 0
SPI_SWITCH_INV
Text GLabel 3750 4400 0    50   Input ~ 0
SPI_MOSI
Text GLabel 3750 4500 0    50   Input ~ 0
PD_MUX_SPI_MOSI
Text GLabel 3750 4700 0    50   Input ~ 0
SPI_MOSI
Text GLabel 3750 4800 0    50   Input ~ 0
LED_SPI_MOSI
Text GLabel 5450 3900 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 5450 5000 2    50   Input ~ 0
GND
Wire Wire Line
	5450 5000 5300 5000
Wire Wire Line
	5450 3900 5300 3900
Wire Wire Line
	3900 4100 3750 4100
Wire Wire Line
	3900 4200 3750 4200
Wire Wire Line
	3900 4400 3750 4400
Wire Wire Line
	3900 4500 3750 4500
Wire Wire Line
	3900 4700 3750 4700
Wire Wire Line
	3900 4800 3750 4800
$EndSCHEMATC
