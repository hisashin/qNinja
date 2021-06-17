EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
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
AR Path="/5FA5D98E/5FA60625" Ref="J10"  Part="1" 
AR Path="/60AC9047/5FA60625" Ref="J10"  Part="1" 
F 0 "J10" H 6958 3981 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6958 3890 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6850 3700 50  0001 C CNN
F 3 "~" H 6850 3700 50  0001 C CNN
	1    6850 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5FA6062B
P 6850 4150
AR Path="/5FA6062B" Ref="J?"  Part="1" 
AR Path="/5FA5D98E/5FA6062B" Ref="J11"  Part="1" 
AR Path="/60AC9047/5FA6062B" Ref="J11"  Part="1" 
F 0 "J11" H 6958 4431 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6958 4340 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6850 4150 50  0001 C CNN
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
L Ninja-qPCR:TS5A9411DCKR U?
U 1 1 60B0A674
P 4500 3900
F 0 "U?" H 4500 4588 60  0000 C CNN
F 1 "TS5A9411DCKR" H 4500 4482 60  0000 C CNN
F 2 "DCK0006A_N" H 4500 3840 60  0001 C CNN
F 3 "" H 4500 3900 60  0000 C CNN
	1    4500 3900
	1    0    0    -1  
$EndComp
Text Notes 4100 3100 0    50   ~ 0
IN=High : COM <-> NO\nIN=Low : COM <-> NC
Text GLabel 3700 3800 0    50   Input ~ 0
SPI_SWITCH
Wire Wire Line
	3700 3800 3900 3800
$Comp
L Jumper:Jumper_3_Open JP?
U 1 1 60B0BB93
P 5500 4350
F 0 "JP?" H 5500 4481 50  0000 C CNN
F 1 "Jumper_3_Open" H 5500 4572 50  0000 C CNN
F 2 "" H 5500 4350 50  0001 C CNN
F 3 "~" H 5500 4350 50  0001 C CNN
	1    5500 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 4200 5100 4200
$Comp
L power:GND #PWR?
U 1 1 60B0F061
P 5050 4600
F 0 "#PWR?" H 5050 4350 50  0001 C CNN
F 1 "GND" H 5055 4427 50  0000 C CNN
F 2 "" H 5050 4600 50  0001 C CNN
F 3 "" H 5050 4600 50  0001 C CNN
	1    5050 4600
	1    0    0    -1  
$EndComp
Text GLabel 5900 4350 2    50   Input ~ 0
-1V
Wire Wire Line
	5900 4350 5750 4350
Wire Wire Line
	5250 4350 5050 4350
Wire Wire Line
	5050 4350 5050 4600
Text GLabel 3700 4000 0    50   Input ~ 0
SPI_MOSI
Wire Wire Line
	3700 4000 3900 4000
Text GLabel 3700 3600 0    50   Input ~ 0
VCC_LOGIC
Wire Wire Line
	3700 3600 3900 3600
Text GLabel 5300 4000 2    50   Input ~ 0
PD_MUX_SPI_MOSI
Wire Wire Line
	5300 4000 5100 4000
Text GLabel 5300 3800 2    50   Input ~ 0
LED_SPI_MOSI
Wire Wire Line
	5300 3800 5100 3800
$EndSCHEMATC
