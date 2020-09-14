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
$Comp
L Device:R R?
U 1 1 5F7725FF
P 2100 5050
AR Path="/5F7725FF" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F7725FF" Ref="R?"  Part="1" 
F 0 "R?" V 1893 5050 50  0000 C CNN
F 1 "10k" V 1984 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2030 5050 50  0001 C CNN
F 3 "~" H 2100 5050 50  0001 C CNN
	1    2100 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F772605
P 1650 4800
AR Path="/5F772605" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F772605" Ref="R?"  Part="1" 
F 0 "R?" V 1443 4800 50  0000 C CNN
F 1 "1k" V 1534 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1580 4800 50  0001 C CNN
F 3 "~" H 1650 4800 50  0001 C CNN
	1    1650 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 4800 1850 4800
Wire Wire Line
	1950 5050 1850 5050
Wire Wire Line
	1850 5050 1850 4800
Connection ~ 1850 4800
Wire Wire Line
	1850 4800 1800 4800
$Comp
L power:GND #PWR?
U 1 1 5F772610
P 2500 5150
AR Path="/5F772610" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F772610" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 4900 50  0001 C CNN
F 1 "GND" H 2505 4977 50  0000 C CNN
F 2 "" H 2500 5150 50  0001 C CNN
F 3 "" H 2500 5150 50  0001 C CNN
	1    2500 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5150 2500 5050
Wire Wire Line
	2250 5050 2500 5050
Connection ~ 2500 5050
Wire Wire Line
	2500 5050 2500 5000
Text HLabel 1350 4800 0    50   Input ~ 0
LID_HEATER1
Wire Wire Line
	1350 4800 1500 4800
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F77261C
P 2400 4800
AR Path="/5F77261C" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F77261C" Ref="Q?"  Part="1" 
F 0 "Q?" H 2604 4846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2604 4755 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2600 4900 50  0001 C CNN
F 3 "~" H 2400 4800 50  0001 C CNN
	1    2400 4800
	1    0    0    -1  
$EndComp
Text GLabel 2500 4350 2    50   Input ~ 0
12V
Wire Wire Line
	2500 4450 2500 4600
Text GLabel 4900 5550 0    50   Input ~ 0
BODY_HEATER2A
Text GLabel 4900 5650 0    50   Input ~ 0
BODY_HEATER2B
Text GLabel 2350 4350 0    50   Input ~ 0
LID_HEATER1A
Text GLabel 2350 4450 0    50   Input ~ 0
LID_HEATER1B
Text GLabel 2350 5500 0    50   Input ~ 0
LID_HEATER2A
Text GLabel 2350 5600 0    50   Input ~ 0
LID_HEATER2B
$Comp
L Device:R R?
U 1 1 5F77262A
P 4600 5050
AR Path="/5F77262A" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F77262A" Ref="R?"  Part="1" 
F 0 "R?" V 4393 5050 50  0000 C CNN
F 1 "10k" V 4484 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4530 5050 50  0001 C CNN
F 3 "~" H 4600 5050 50  0001 C CNN
	1    4600 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F772630
P 4150 4800
AR Path="/5F772630" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F772630" Ref="R?"  Part="1" 
F 0 "R?" V 3943 4800 50  0000 C CNN
F 1 "1k" V 4034 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4080 4800 50  0001 C CNN
F 3 "~" H 4150 4800 50  0001 C CNN
	1    4150 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 4800 4350 4800
Wire Wire Line
	4450 5050 4350 5050
Wire Wire Line
	4350 5050 4350 4800
Connection ~ 4350 4800
Wire Wire Line
	4350 4800 4300 4800
$Comp
L power:GND #PWR?
U 1 1 5F77263B
P 5000 5150
AR Path="/5F77263B" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F77263B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5000 4900 50  0001 C CNN
F 1 "GND" H 5005 4977 50  0000 C CNN
F 2 "" H 5000 5150 50  0001 C CNN
F 3 "" H 5000 5150 50  0001 C CNN
	1    5000 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5150 5000 5050
Wire Wire Line
	4750 5050 5000 5050
Connection ~ 5000 5050
Wire Wire Line
	5000 5050 5000 5000
Text HLabel 3850 4800 0    50   Input ~ 0
WELL_HEATER1
Wire Wire Line
	3850 4800 4000 4800
Text GLabel 4900 4450 0    50   Input ~ 0
BODY_HEATER1B
Text GLabel 4900 4350 0    50   Input ~ 0
BODY_HEATER1A
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F772649
P 4900 4800
AR Path="/5F772649" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F772649" Ref="Q?"  Part="1" 
F 0 "Q?" H 5104 4846 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5104 4755 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5100 4900 50  0001 C CNN
F 3 "~" H 4900 4800 50  0001 C CNN
	1    4900 4800
	1    0    0    -1  
$EndComp
Text GLabel 5000 4350 2    50   Input ~ 0
12V
Wire Wire Line
	4900 4450 5000 4450
Wire Wire Line
	5000 4450 5000 4600
Wire Wire Line
	5000 4350 4900 4350
Wire Wire Line
	2500 4450 2350 4450
Wire Wire Line
	2500 4350 2350 4350
$Comp
L Device:R R?
U 1 1 5F772655
P 2100 6200
AR Path="/5F772655" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F772655" Ref="R?"  Part="1" 
F 0 "R?" V 1893 6200 50  0000 C CNN
F 1 "10k" V 1984 6200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2030 6200 50  0001 C CNN
F 3 "~" H 2100 6200 50  0001 C CNN
	1    2100 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F77265B
P 1650 5950
AR Path="/5F77265B" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F77265B" Ref="R?"  Part="1" 
F 0 "R?" V 1443 5950 50  0000 C CNN
F 1 "1k" V 1534 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1580 5950 50  0001 C CNN
F 3 "~" H 1650 5950 50  0001 C CNN
	1    1650 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 5950 1850 5950
Wire Wire Line
	1950 6200 1850 6200
Wire Wire Line
	1850 6200 1850 5950
Connection ~ 1850 5950
Wire Wire Line
	1850 5950 1800 5950
$Comp
L power:GND #PWR?
U 1 1 5F772666
P 2500 6300
AR Path="/5F772666" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F772666" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 6050 50  0001 C CNN
F 1 "GND" H 2505 6127 50  0000 C CNN
F 2 "" H 2500 6300 50  0001 C CNN
F 3 "" H 2500 6300 50  0001 C CNN
	1    2500 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6300 2500 6200
Wire Wire Line
	2250 6200 2500 6200
Connection ~ 2500 6200
Wire Wire Line
	2500 6200 2500 6150
Text HLabel 1350 5950 0    50   Input ~ 0
LID_HEATER2
Wire Wire Line
	1350 5950 1500 5950
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F772672
P 2400 5950
AR Path="/5F772672" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F772672" Ref="Q?"  Part="1" 
F 0 "Q?" H 2604 5996 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2604 5905 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2600 6050 50  0001 C CNN
F 3 "~" H 2400 5950 50  0001 C CNN
	1    2400 5950
	1    0    0    -1  
$EndComp
Text GLabel 2500 5500 2    50   Input ~ 0
12V
Wire Wire Line
	2500 5600 2500 5750
Wire Wire Line
	2500 5600 2350 5600
Wire Wire Line
	2500 5500 2350 5500
$Comp
L Device:R R?
U 1 1 5F77267C
P 4600 6250
AR Path="/5F77267C" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F77267C" Ref="R?"  Part="1" 
F 0 "R?" V 4393 6250 50  0000 C CNN
F 1 "10k" V 4484 6250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4530 6250 50  0001 C CNN
F 3 "~" H 4600 6250 50  0001 C CNN
	1    4600 6250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F772682
P 4150 6000
AR Path="/5F772682" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F772682" Ref="R?"  Part="1" 
F 0 "R?" V 3943 6000 50  0000 C CNN
F 1 "1k" V 4034 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4080 6000 50  0001 C CNN
F 3 "~" H 4150 6000 50  0001 C CNN
	1    4150 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 6000 4350 6000
Wire Wire Line
	4450 6250 4350 6250
Wire Wire Line
	4350 6250 4350 6000
Connection ~ 4350 6000
Wire Wire Line
	4350 6000 4300 6000
$Comp
L power:GND #PWR?
U 1 1 5F77268D
P 5000 6350
AR Path="/5F77268D" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F77268D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5000 6100 50  0001 C CNN
F 1 "GND" H 5005 6177 50  0000 C CNN
F 2 "" H 5000 6350 50  0001 C CNN
F 3 "" H 5000 6350 50  0001 C CNN
	1    5000 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6350 5000 6250
Wire Wire Line
	4750 6250 5000 6250
Connection ~ 5000 6250
Wire Wire Line
	5000 6250 5000 6200
Text HLabel 3850 6000 0    50   Input ~ 0
WELL_HEATER2
Wire Wire Line
	3850 6000 4000 6000
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F772699
P 4900 6000
AR Path="/5F772699" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F772699" Ref="Q?"  Part="1" 
F 0 "Q?" H 5104 6046 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5104 5955 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5100 6100 50  0001 C CNN
F 3 "~" H 4900 6000 50  0001 C CNN
	1    4900 6000
	1    0    0    -1  
$EndComp
Text GLabel 5000 5550 2    50   Input ~ 0
12V
Wire Wire Line
	4900 5650 5000 5650
Wire Wire Line
	5000 5650 5000 5800
Wire Wire Line
	5000 5550 4900 5550
$Comp
L Ninja-qPCR:LTC3260EMSE-TRPBF U?
U 1 1 5F7726A3
P 4300 2800
AR Path="/5F78C568/5F7726A3" Ref="U?"  Part="1" 
AR Path="/5F7726A3" Ref="U?"  Part="1" 
F 0 "U?" H 5100 3187 60  0000 C CNN
F 1 "LTC3260EMSE-TRPBF" H 5100 3081 60  0000 C CNN
F 2 "Ninja-qPCR:LTC3260EMSE-TRPBF" H 5100 3040 60  0001 C CNN
F 3 "" H 4300 2800 60  0000 C CNN
	1    4300 2800
	1    0    0    -1  
$EndComp
Text GLabel 4150 2800 0    50   Input ~ 0
+15V
Text Label 4150 2900 2    50   ~ 0
RT
Wire Wire Line
	4150 2900 4300 2900
Text Label 4150 3000 2    50   ~ 0
BYP-
Wire Wire Line
	4150 3000 4300 3000
Text Label 4150 3100 2    50   ~ 0
ADJ-
Text Label 4150 3200 2    50   ~ 0
LDO-
Text GLabel 4150 3300 0    50   Input ~ 0
-15V
$Comp
L Device:C C?
U 1 1 5F7726B1
P 5150 3950
AR Path="/5F78C568/5F7726B1" Ref="C?"  Part="1" 
AR Path="/5F7726B1" Ref="C?"  Part="1" 
F 0 "C?" V 5402 3950 50  0000 C CNN
F 1 "C" V 5311 3950 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5188 3800 50  0001 C CNN
F 3 "~" H 5150 3950 50  0001 C CNN
	1    5150 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 3100 4300 3100
Wire Wire Line
	4300 3200 4150 3200
Wire Wire Line
	4150 3300 4300 3300
Wire Wire Line
	4300 3400 4150 3400
Wire Wire Line
	4150 3400 4150 3950
Wire Wire Line
	4150 3950 5000 3950
Wire Wire Line
	5900 3500 6050 3500
Wire Wire Line
	6050 3500 6050 3950
Wire Wire Line
	6050 3950 5300 3950
Text Label 6050 2900 0    50   ~ 0
BYP+
Wire Wire Line
	6050 2900 5900 2900
Text Label 6050 3000 0    50   ~ 0
ADJ+
Text GLabel 6050 3200 2    50   Input ~ 0
+15V
Wire Wire Line
	6050 3200 5900 3200
Text Label 6050 3300 0    50   ~ 0
LDO+
Wire Wire Line
	6050 3000 5900 3000
Wire Wire Line
	6050 3300 5900 3300
Text Label 6050 3400 0    50   ~ 0
VIN
Wire Wire Line
	6050 3400 5900 3400
$Comp
L power:GND #PWR?
U 1 1 5F7726CA
P 6450 3100
AR Path="/5F78C568/5F7726CA" Ref="#PWR?"  Part="1" 
AR Path="/5F7726CA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6450 2850 50  0001 C CNN
F 1 "GND" H 6455 2927 50  0000 C CNN
F 2 "" H 6450 3100 50  0001 C CNN
F 3 "" H 6450 3100 50  0001 C CNN
	1    6450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3100 6450 3100
Wire Wire Line
	5900 2800 6450 2800
Wire Wire Line
	6450 2800 6450 3100
Connection ~ 6450 3100
Text GLabel 3450 2800 2    50   Input ~ 0
VCC
Text GLabel 3300 2800 0    50   Input ~ 0
3V3
Wire Wire Line
	3300 2800 3450 2800
$Comp
L Connector:Conn_01x02_Male J_12V?
U 1 1 5F7726D7
P 2750 1800
AR Path="/5F78C568/5F7726D7" Ref="J_12V?"  Part="1" 
AR Path="/5F7726D7" Ref="J_12V?"  Part="1" 
F 0 "J_12V?" H 2858 1981 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2858 1890 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 2750 1800 50  0001 C CNN
F 3 "~" H 2750 1800 50  0001 C CNN
	1    2750 1800
	1    0    0    -1  
$EndComp
Text GLabel 3100 1800 2    50   Input ~ 0
12V
Text GLabel 3100 1900 2    50   Input ~ 0
GND
Wire Wire Line
	3100 1800 2950 1800
Wire Wire Line
	2950 1900 3100 1900
$Comp
L power:GND #PWR?
U 1 1 5F7726E1
P 6300 3600
AR Path="/5F78C568/5F7726E1" Ref="#PWR?"  Part="1" 
AR Path="/5F7726E1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6300 3350 50  0001 C CNN
F 1 "GND" H 6305 3427 50  0000 C CNN
F 2 "" H 6300 3600 50  0001 C CNN
F 3 "" H 6300 3600 50  0001 C CNN
	1    6300 3600
	1    0    0    -1  
$EndComp
Text GLabel 6450 3450 2    50   Input ~ 0
GND
Wire Wire Line
	6450 3450 6300 3450
Wire Wire Line
	6300 3450 6300 3600
Wire Wire Line
	6950 4100 6800 4100
Text GLabel 6950 4100 2    50   Input ~ 0
GND
Text GLabel 6800 4100 0    50   Input ~ 0
THERM_GND
Text GLabel 9400 3350 2    50   Input ~ 0
+10V
Text Label 8000 2700 0    50   ~ 0
RT
Text Label 8000 2900 0    50   ~ 0
BYP-
Text Label 8000 3100 0    50   ~ 0
ADJ-
Text Label 8000 3550 0    50   ~ 0
LDO-
Text Label 8600 2700 2    50   ~ 0
BYP+
Text Label 8600 2900 2    50   ~ 0
ADJ+
Text Label 8600 3350 2    50   ~ 0
LDO+
Text Label 8600 3550 2    50   ~ 0
VIN
$Comp
L Device:R R?
U 1 1 5F7726F6
P 7700 2700
AR Path="/5F78C568/5F7726F6" Ref="R?"  Part="1" 
AR Path="/5F7726F6" Ref="R?"  Part="1" 
F 0 "R?" V 7493 2700 50  0000 C CNN
F 1 "R" V 7584 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7630 2700 50  0001 C CNN
F 3 "~" H 7700 2700 50  0001 C CNN
	1    7700 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 2700 8000 2700
$Comp
L Device:C C?
U 1 1 5F7726FD
P 7700 2900
AR Path="/5F78C568/5F7726FD" Ref="C?"  Part="1" 
AR Path="/5F7726FD" Ref="C?"  Part="1" 
F 0 "C?" V 7448 2900 50  0000 C CNN
F 1 "C" V 7539 2900 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7738 2750 50  0001 C CNN
F 3 "~" H 7700 2900 50  0001 C CNN
	1    7700 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 2900 8000 2900
Wire Wire Line
	7500 2700 7500 2900
Wire Wire Line
	7500 2900 7550 2900
Wire Wire Line
	7500 2700 7550 2700
$Comp
L Device:R R?
U 1 1 5F772707
P 7450 3100
AR Path="/5F78C568/5F772707" Ref="R?"  Part="1" 
AR Path="/5F772707" Ref="R?"  Part="1" 
F 0 "R?" V 7243 3100 50  0000 C CNN
F 1 "R" V 7334 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7380 3100 50  0001 C CNN
F 3 "~" H 7450 3100 50  0001 C CNN
	1    7450 3100
	0    1    1    0   
$EndComp
Text GLabel 7150 3550 0    50   Input ~ 0
-10V
$Comp
L Device:C C?
U 1 1 5F77270E
P 8900 2700
AR Path="/5F78C568/5F77270E" Ref="C?"  Part="1" 
AR Path="/5F77270E" Ref="C?"  Part="1" 
F 0 "C?" V 8648 2700 50  0000 C CNN
F 1 "C" V 8739 2700 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8938 2550 50  0001 C CNN
F 3 "~" H 8900 2700 50  0001 C CNN
	1    8900 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 2700 8600 2700
$Comp
L Device:R R?
U 1 1 5F772715
P 9100 2900
AR Path="/5F78C568/5F772715" Ref="R?"  Part="1" 
AR Path="/5F772715" Ref="R?"  Part="1" 
F 0 "R?" V 8893 2900 50  0000 C CNN
F 1 "R" V 8984 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9030 2900 50  0001 C CNN
F 3 "~" H 9100 2900 50  0001 C CNN
	1    9100 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F77271B
P 8800 3100
AR Path="/5F78C568/5F77271B" Ref="R?"  Part="1" 
AR Path="/5F77271B" Ref="R?"  Part="1" 
F 0 "R?" H 8730 3054 50  0000 R CNN
F 1 "R" H 8730 3145 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8730 3100 50  0001 C CNN
F 3 "~" H 8800 3100 50  0001 C CNN
	1    8800 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 2900 8800 2900
Wire Wire Line
	8800 2950 8800 2900
Connection ~ 8800 2900
Wire Wire Line
	8800 2900 8600 2900
Wire Wire Line
	9400 3350 8800 3350
Wire Wire Line
	8800 3250 8800 3350
Connection ~ 8800 3350
Wire Wire Line
	8800 3350 8600 3350
Wire Wire Line
	7600 3100 7700 3100
$Comp
L Device:R R?
U 1 1 5F77272A
P 7700 3300
AR Path="/5F78C568/5F77272A" Ref="R?"  Part="1" 
AR Path="/5F77272A" Ref="R?"  Part="1" 
F 0 "R?" H 7630 3254 50  0000 R CNN
F 1 "R" H 7630 3345 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7630 3300 50  0001 C CNN
F 3 "~" H 7700 3300 50  0001 C CNN
	1    7700 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	7150 3550 7700 3550
Wire Wire Line
	7700 3150 7700 3100
Connection ~ 7700 3100
Wire Wire Line
	7700 3100 8000 3100
Wire Wire Line
	7700 3450 7700 3550
Connection ~ 7700 3550
Wire Wire Line
	7700 3550 8000 3550
Text GLabel 9400 3550 2    50   Input ~ 0
12V
Wire Wire Line
	9400 3550 9050 3550
$Comp
L Device:C C?
U 1 1 5F772739
P 9050 3800
AR Path="/5F78C568/5F772739" Ref="C?"  Part="1" 
AR Path="/5F772739" Ref="C?"  Part="1" 
F 0 "C?" H 8935 3754 50  0000 R CNN
F 1 "C" H 8935 3845 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9088 3650 50  0001 C CNN
F 3 "~" H 9050 3800 50  0001 C CNN
	1    9050 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9050 3650 9050 3550
Connection ~ 9050 3550
Wire Wire Line
	9050 3550 8600 3550
Wire Wire Line
	9050 3950 9050 4050
$Comp
L power:GND #PWR?
U 1 1 5F772743
P 9050 4050
AR Path="/5F78C568/5F772743" Ref="#PWR?"  Part="1" 
AR Path="/5F772743" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9050 3800 50  0001 C CNN
F 1 "GND" H 9055 3877 50  0000 C CNN
F 2 "" H 9050 4050 50  0001 C CNN
F 3 "" H 9050 4050 50  0001 C CNN
	1    9050 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F772749
P 9450 3000
AR Path="/5F78C568/5F772749" Ref="#PWR?"  Part="1" 
AR Path="/5F772749" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9450 2750 50  0001 C CNN
F 1 "GND" H 9455 2827 50  0000 C CNN
F 2 "" H 9450 3000 50  0001 C CNN
F 3 "" H 9450 3000 50  0001 C CNN
	1    9450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 2700 9450 2700
Wire Wire Line
	9450 2700 9450 2900
Wire Wire Line
	9250 2900 9450 2900
Connection ~ 9450 2900
Wire Wire Line
	9450 2900 9450 3000
$Comp
L power:GND #PWR?
U 1 1 5F772754
P 7050 3200
AR Path="/5F78C568/5F772754" Ref="#PWR?"  Part="1" 
AR Path="/5F772754" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7050 2950 50  0001 C CNN
F 1 "GND" H 7055 3027 50  0000 C CNN
F 2 "" H 7050 3200 50  0001 C CNN
F 3 "" H 7050 3200 50  0001 C CNN
	1    7050 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2700 7050 2700
Wire Wire Line
	7050 2700 7050 3100
Connection ~ 7500 2700
Wire Wire Line
	7300 3100 7050 3100
Connection ~ 7050 3100
Wire Wire Line
	7050 3100 7050 3200
$Comp
L Device:R R?
U 1 1 5F772760
P 2100 7350
AR Path="/5F772760" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F772760" Ref="R?"  Part="1" 
F 0 "R?" V 1893 7350 50  0000 C CNN
F 1 "10k" V 1984 7350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2030 7350 50  0001 C CNN
F 3 "~" H 2100 7350 50  0001 C CNN
	1    2100 7350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F772766
P 1650 7100
AR Path="/5F772766" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F772766" Ref="R?"  Part="1" 
F 0 "R?" V 1443 7100 50  0000 C CNN
F 1 "1k" V 1534 7100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1580 7100 50  0001 C CNN
F 3 "~" H 1650 7100 50  0001 C CNN
	1    1650 7100
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 7100 1850 7100
Wire Wire Line
	1950 7350 1850 7350
Wire Wire Line
	1850 7350 1850 7100
Connection ~ 1850 7100
Wire Wire Line
	1850 7100 1800 7100
$Comp
L power:GND #PWR?
U 1 1 5F772771
P 2500 7450
AR Path="/5F772771" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F772771" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 7200 50  0001 C CNN
F 1 "GND" H 2505 7277 50  0000 C CNN
F 2 "" H 2500 7450 50  0001 C CNN
F 3 "" H 2500 7450 50  0001 C CNN
	1    2500 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 7450 2500 7350
Wire Wire Line
	2250 7350 2500 7350
Connection ~ 2500 7350
Wire Wire Line
	2500 7350 2500 7300
Text HLabel 1350 7100 0    50   Input ~ 0
FAN1
Wire Wire Line
	1350 7100 1500 7100
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F77277D
P 2400 7100
AR Path="/5F77277D" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F77277D" Ref="Q?"  Part="1" 
F 0 "Q?" H 2604 7146 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 2604 7055 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 2600 7200 50  0001 C CNN
F 3 "~" H 2400 7100 50  0001 C CNN
	1    2400 7100
	1    0    0    -1  
$EndComp
Text GLabel 2500 6650 2    50   Input ~ 0
12V
Wire Wire Line
	2400 6750 2500 6750
Wire Wire Line
	2500 6750 2500 6900
Wire Wire Line
	2500 6650 2400 6650
Text GLabel 2400 6650 0    50   Input ~ 0
FAN_RED_VCC
Text GLabel 2400 6750 0    50   Input ~ 0
FAN_BLACK_GND1
$Comp
L Device:R R?
U 1 1 5F772789
P 4550 7350
AR Path="/5F772789" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F772789" Ref="R?"  Part="1" 
F 0 "R?" V 4343 7350 50  0000 C CNN
F 1 "10k" V 4434 7350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4480 7350 50  0001 C CNN
F 3 "~" H 4550 7350 50  0001 C CNN
	1    4550 7350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F77278F
P 4100 7100
AR Path="/5F77278F" Ref="R?"  Part="1" 
AR Path="/5F7519D0/5F77278F" Ref="R?"  Part="1" 
F 0 "R?" V 3893 7100 50  0000 C CNN
F 1 "1k" V 3984 7100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4030 7100 50  0001 C CNN
F 3 "~" H 4100 7100 50  0001 C CNN
	1    4100 7100
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 7100 4300 7100
Wire Wire Line
	4400 7350 4300 7350
Wire Wire Line
	4300 7350 4300 7100
Connection ~ 4300 7100
Wire Wire Line
	4300 7100 4250 7100
$Comp
L power:GND #PWR?
U 1 1 5F77279A
P 4950 7450
AR Path="/5F77279A" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F77279A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4950 7200 50  0001 C CNN
F 1 "GND" H 4955 7277 50  0000 C CNN
F 2 "" H 4950 7450 50  0001 C CNN
F 3 "" H 4950 7450 50  0001 C CNN
	1    4950 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 7450 4950 7350
Wire Wire Line
	4700 7350 4950 7350
Connection ~ 4950 7350
Wire Wire Line
	4950 7350 4950 7300
Text HLabel 3800 7100 0    50   Input ~ 0
FAN2
Wire Wire Line
	3800 7100 3950 7100
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F7727A6
P 4850 7100
AR Path="/5F7727A6" Ref="Q?"  Part="1" 
AR Path="/5F7519D0/5F7727A6" Ref="Q?"  Part="1" 
F 0 "Q?" H 5054 7146 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5054 7055 50  0000 L CNN
F 2 "Ninja-qPCR:SOT95P240X112-3N" H 5050 7200 50  0001 C CNN
F 3 "~" H 4850 7100 50  0001 C CNN
	1    4850 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 6750 4950 6750
Wire Wire Line
	4950 6750 4950 6900
Text GLabel 4850 6750 0    50   Input ~ 0
FAN_BLACK_GND2
$Comp
L Connector:ATX-24 J?
U 1 1 5F7727AF
P 1600 1400
F 0 "J?" H 1600 2067 50  0000 C CNN
F 1 "ATX-24" H 1600 1976 50  0000 C CNN
F 2 "Connectors_Molex:Molex_MiniFit-JR-5556-24A_2x12x4.20mm_Straight" H 1600 1300 50  0001 C CNN
F 3 "https://www.intel.com/content/dam/www/public/us/en/documents/guides/power-supply-design-guide-june.pdf#page=33" H 4000 850 50  0001 C CNN
	1    1600 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7727B5
P 1600 2150
AR Path="/5F7727B5" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F7727B5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1600 1900 50  0001 C CNN
F 1 "GND" H 1605 1977 50  0000 C CNN
F 2 "" H 1600 2150 50  0001 C CNN
F 3 "" H 1600 2150 50  0001 C CNN
	1    1600 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2000 1600 2150
Text GLabel 2200 1200 2    50   Input ~ 0
12V
Wire Wire Line
	2100 1200 2200 1200
$Comp
L power:GND #PWR?
U 1 1 5F7727BE
P 1000 1100
AR Path="/5F7727BE" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F7727BE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1000 850 50  0001 C CNN
F 1 "GND" H 1005 927 50  0000 C CNN
F 2 "" H 1000 1100 50  0001 C CNN
F 3 "" H 1000 1100 50  0001 C CNN
	1    1000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1000 1000 1000
Wire Wire Line
	1000 1000 1000 1100
$Comp
L Ninja-qPCR:DIN4_PWR U?
U 1 1 5F7727C6
P 1600 3050
F 0 "U?" H 1600 3475 50  0000 C CNN
F 1 "DIN4_PWR" H 1600 3384 50  0000 C CNN
F 2 "Ninja-qPCR:DN4_PWR" H 1800 3100 50  0001 C CNN
F 3 "" H 1800 3100 50  0001 C CNN
	1    1600 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7727CC
P 1150 3450
AR Path="/5F7727CC" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F7727CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1150 3200 50  0001 C CNN
F 1 "GND" H 1155 3277 50  0000 C CNN
F 2 "" H 1150 3450 50  0001 C CNN
F 3 "" H 1150 3450 50  0001 C CNN
	1    1150 3450
	1    0    0    -1  
$EndComp
Text GLabel 2150 2850 2    50   Input ~ 0
12V
$Comp
L power:GND #PWR?
U 1 1 5F7727D3
P 2050 3450
AR Path="/5F7727D3" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F7727D3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2050 3200 50  0001 C CNN
F 1 "GND" H 2055 3277 50  0000 C CNN
F 2 "" H 2050 3450 50  0001 C CNN
F 3 "" H 2050 3450 50  0001 C CNN
	1    2050 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3050 1150 3050
Wire Wire Line
	1150 3050 1150 3150
Wire Wire Line
	1250 3350 1150 3350
Connection ~ 1150 3350
Wire Wire Line
	1150 3350 1150 3450
Wire Wire Line
	1250 3250 1150 3250
Connection ~ 1150 3250
Wire Wire Line
	1150 3250 1150 3350
Wire Wire Line
	1250 3150 1150 3150
Connection ~ 1150 3150
Wire Wire Line
	1150 3150 1150 3250
Wire Wire Line
	2150 2850 2050 2850
Wire Wire Line
	1950 2950 2050 2950
Wire Wire Line
	2050 2950 2050 2850
Connection ~ 2050 2850
Wire Wire Line
	2050 2850 1950 2850
Wire Wire Line
	1950 3150 2050 3150
Wire Wire Line
	2050 3150 2050 3250
Wire Wire Line
	1950 3250 2050 3250
Connection ~ 2050 3250
Wire Wire Line
	2050 3250 2050 3450
$Comp
L Connector:Barrel_Jack_Switch J?
U 1 1 5F7727EE
P 2850 1100
F 0 "J?" H 2907 1417 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 2907 1326 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 2900 1060 50  0001 C CNN
F 3 "~" H 2900 1060 50  0001 C CNN
	1    2850 1100
	1    0    0    -1  
$EndComp
Text GLabel 3300 1000 2    50   Input ~ 0
12V
$Comp
L power:GND #PWR?
U 1 1 5F7727F5
P 3250 1300
AR Path="/5F7727F5" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F7727F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3250 1050 50  0001 C CNN
F 1 "GND" H 3255 1127 50  0000 C CNN
F 2 "" H 3250 1300 50  0001 C CNN
F 3 "" H 3250 1300 50  0001 C CNN
	1    3250 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1000 3150 1000
Wire Wire Line
	3250 1300 3250 1200
Wire Wire Line
	3250 1200 3150 1200
Wire Wire Line
	3150 1100 3250 1100
Wire Wire Line
	3250 1100 3250 1200
Connection ~ 3250 1200
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 5F772801
P 4100 1000
F 0 "J?" H 4208 1181 50  0000 C CNN
F 1 "Conn_01x01_Male" H 4208 1090 50  0000 C CNN
F 2 "" H 4100 1000 50  0001 C CNN
F 3 "~" H 4100 1000 50  0001 C CNN
	1    4100 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 5F772807
P 4100 1250
F 0 "J?" H 4208 1431 50  0000 C CNN
F 1 "Conn_01x01_Male" H 4208 1340 50  0000 C CNN
F 2 "" H 4100 1250 50  0001 C CNN
F 3 "~" H 4100 1250 50  0001 C CNN
	1    4100 1250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 5F77280D
P 4100 1500
F 0 "J?" H 4208 1681 50  0000 C CNN
F 1 "Conn_01x01_Male" H 4208 1590 50  0000 C CNN
F 2 "" H 4100 1500 50  0001 C CNN
F 3 "~" H 4100 1500 50  0001 C CNN
	1    4100 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J?
U 1 1 5F772813
P 4100 1750
F 0 "J?" H 4208 1931 50  0000 C CNN
F 1 "Conn_01x01_Male" H 4208 1840 50  0000 C CNN
F 2 "" H 4100 1750 50  0001 C CNN
F 3 "~" H 4100 1750 50  0001 C CNN
	1    4100 1750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
