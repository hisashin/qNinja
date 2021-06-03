EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
U 1 1 5F7727EE
P 1350 2700
AR Path="/5F7727EE" Ref="J?"  Part="1" 
AR Path="/5F7093B5/5F7727EE" Ref="J?"  Part="1" 
AR Path="/60AC8F91/5F7727EE" Ref="J3"  Part="1" 
F 0 "J3" H 1407 3017 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1407 2926 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1400 2660 50  0001 C CNN
F 3 "~" H 1400 2660 50  0001 C CNN
	1    1350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7727F5
P 1750 2900
AR Path="/5F7727F5" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F7727F5" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F7727F5" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F7727F5" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 1750 2650 50  0001 C CNN
F 1 "GND" H 1755 2727 50  0000 C CNN
F 2 "" H 1750 2900 50  0001 C CNN
F 3 "" H 1750 2900 50  0001 C CNN
	1    1750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2900 1750 2800
Wire Wire Line
	1750 2800 1650 2800
Wire Wire Line
	1650 2700 1750 2700
Wire Wire Line
	1750 2700 1750 2800
Connection ~ 1750 2800
$Comp
L Ninja-qPCR:IFX1763 U4
U 1 1 5F62E793
P 4050 2500
F 0 "U4" H 4050 2665 50  0000 C CNN
F 1 "IFX1763" H 4050 2574 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8-1EP_3.9x4.9mm_Pitch1.27mm" H 4050 1850 50  0001 C CNN
F 3 "" H 4050 1850 50  0001 C CNN
	1    4050 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F62F251
P 2050 3000
F 0 "C1" H 2165 3046 50  0000 L CNN
F 1 "22uF" H 2165 2955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2088 2850 50  0001 C CNN
F 3 "~" H 2050 3000 50  0001 C CNN
	1    2050 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F62F25B
P 2050 3300
AR Path="/5F62F25B" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F62F25B" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F62F25B" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F62F25B" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 2050 3050 50  0001 C CNN
F 1 "GND" H 2055 3127 50  0000 C CNN
F 2 "" H 2050 3300 50  0001 C CNN
F 3 "" H 2050 3300 50  0001 C CNN
	1    2050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3150 2050 3300
$Comp
L Device:C C3
U 1 1 5F62F266
P 2500 3000
F 0 "C3" H 2615 3046 50  0000 L CNN
F 1 "22uF" H 2615 2955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2538 2850 50  0001 C CNN
F 3 "~" H 2500 3000 50  0001 C CNN
	1    2500 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F62F270
P 2500 3300
AR Path="/5F62F270" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F62F270" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F62F270" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F62F270" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 2500 3050 50  0001 C CNN
F 1 "GND" H 2505 3127 50  0000 C CNN
F 2 "" H 2500 3300 50  0001 C CNN
F 3 "" H 2500 3300 50  0001 C CNN
	1    2500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3150 2500 3300
$Comp
L Device:C C5
U 1 1 5F62F27B
P 2950 3000
F 0 "C5" H 3065 3046 50  0000 L CNN
F 1 "0.1uF" H 3065 2955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2988 2850 50  0001 C CNN
F 3 "~" H 2950 3000 50  0001 C CNN
	1    2950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F62F285
P 2950 3300
AR Path="/5F62F285" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F62F285" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F62F285" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F62F285" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 2950 3050 50  0001 C CNN
F 1 "GND" H 2955 3127 50  0000 C CNN
F 2 "" H 2950 3300 50  0001 C CNN
F 3 "" H 2950 3300 50  0001 C CNN
	1    2950 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3150 2950 3300
$Comp
L Device:C C7
U 1 1 5F62F290
P 3400 3000
F 0 "C7" H 3515 3046 50  0000 L CNN
F 1 "0.01uF" H 3515 2955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3438 2850 50  0001 C CNN
F 3 "~" H 3400 3000 50  0001 C CNN
	1    3400 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F62F29A
P 3400 3300
AR Path="/5F62F29A" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F62F29A" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F62F29A" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F62F29A" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 3400 3050 50  0001 C CNN
F 1 "GND" H 3405 3127 50  0000 C CNN
F 2 "" H 3400 3300 50  0001 C CNN
F 3 "" H 3400 3300 50  0001 C CNN
	1    3400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3150 3400 3300
Connection ~ 2950 2600
Wire Wire Line
	2950 2600 3400 2600
Connection ~ 2500 2600
Wire Wire Line
	2500 2600 2950 2600
Wire Wire Line
	2050 2600 2500 2600
Wire Wire Line
	3400 2600 3550 2600
Connection ~ 3400 2600
Wire Wire Line
	2050 2600 2050 2850
Wire Wire Line
	2500 2600 2500 2850
Wire Wire Line
	2950 2600 2950 2850
Wire Wire Line
	3400 2600 3400 2850
Wire Wire Line
	3650 2600 3550 2600
Wire Wire Line
	3650 2700 3550 2700
Wire Wire Line
	3550 2700 3550 2600
$Comp
L power:GND #PWR?
U 1 1 5F6658C5
P 4550 3050
AR Path="/5F6658C5" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F6658C5" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F6658C5" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F6658C5" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 4550 2800 50  0001 C CNN
F 1 "GND" H 4555 2877 50  0000 C CNN
F 2 "" H 4550 3050 50  0001 C CNN
F 3 "" H 4550 3050 50  0001 C CNN
	1    4550 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2900 4550 2900
Wire Wire Line
	4550 2900 4550 3000
Wire Wire Line
	4450 3000 4550 3000
Connection ~ 4550 3000
Wire Wire Line
	4550 3000 4550 3050
$Comp
L Device:C C10
U 1 1 5F67A813
P 4850 2800
F 0 "C10" H 4965 2846 50  0000 L CNN
F 1 "0.01uF" H 4965 2755 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4888 2650 50  0001 C CNN
F 3 "~" H 4850 2800 50  0001 C CNN
	1    4850 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2800 4650 2800
Wire Wire Line
	4650 2800 4650 3000
Wire Wire Line
	4650 3000 4850 3000
Wire Wire Line
	4850 3000 4850 2950
Wire Wire Line
	4850 2650 4850 2600
Wire Wire Line
	4450 2700 4650 2700
Wire Wire Line
	4650 2700 4650 2600
Connection ~ 4650 2600
Wire Wire Line
	4650 2600 4450 2600
$Comp
L Device:C C11
U 1 1 5F69D100
P 5250 3000
F 0 "C11" H 5365 3046 50  0000 L CNN
F 1 "22uF" H 5365 2955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5288 2850 50  0001 C CNN
F 3 "~" H 5250 3000 50  0001 C CNN
	1    5250 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5F69D10A
P 5700 3000
F 0 "C12" H 5815 3046 50  0000 L CNN
F 1 "820pF" H 5815 2955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5738 2850 50  0001 C CNN
F 3 "~" H 5700 3000 50  0001 C CNN
	1    5700 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F69D114
P 5250 3300
AR Path="/5F69D114" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F69D114" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F69D114" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F69D114" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 5250 3050 50  0001 C CNN
F 1 "GND" H 5255 3127 50  0000 C CNN
F 2 "" H 5250 3300 50  0001 C CNN
F 3 "" H 5250 3300 50  0001 C CNN
	1    5250 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F69D11E
P 5700 3300
AR Path="/5F69D11E" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F69D11E" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F69D11E" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F69D11E" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 5700 3050 50  0001 C CNN
F 1 "GND" H 5705 3127 50  0000 C CNN
F 2 "" H 5700 3300 50  0001 C CNN
F 3 "" H 5700 3300 50  0001 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3150 5700 3300
Wire Wire Line
	5250 3150 5250 3300
Wire Wire Line
	5700 2600 5250 2600
Wire Wire Line
	5700 2600 6050 2600
Connection ~ 5700 2600
Connection ~ 3550 2600
Wire Wire Line
	5700 2600 5700 2850
Wire Wire Line
	5250 2600 5250 2850
$Comp
L Ninja-qPCR:CJT1117-3.3 U3
U 1 1 5F634152
P 3750 3900
F 0 "U3" H 3775 4075 50  0000 C CNN
F 1 "CJT1117-3.3" H 3775 3984 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 3750 3850 50  0001 C CNN
F 3 "" H 3750 3850 50  0001 C CNN
	1    3750 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F63569A
P 2050 4650
AR Path="/5F63569A" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F63569A" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F63569A" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F63569A" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 2050 4400 50  0001 C CNN
F 1 "GND" H 2055 4477 50  0000 C CNN
F 2 "" H 2050 4650 50  0001 C CNN
F 3 "" H 2050 4650 50  0001 C CNN
	1    2050 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4500 2050 4650
$Comp
L Device:C C4
U 1 1 5F6356A5
P 2500 4350
F 0 "C4" H 2615 4396 50  0000 L CNN
F 1 "22uF" H 2615 4305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2538 4200 50  0001 C CNN
F 3 "~" H 2500 4350 50  0001 C CNN
	1    2500 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6356AF
P 2500 4650
AR Path="/5F6356AF" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F6356AF" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F6356AF" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F6356AF" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 2500 4400 50  0001 C CNN
F 1 "GND" H 2505 4477 50  0000 C CNN
F 2 "" H 2500 4650 50  0001 C CNN
F 3 "" H 2500 4650 50  0001 C CNN
	1    2500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4500 2500 4650
$Comp
L Device:C C6
U 1 1 5F6356BA
P 2950 4350
F 0 "C6" H 3065 4396 50  0000 L CNN
F 1 "0.1uF" H 3065 4305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2988 4200 50  0001 C CNN
F 3 "~" H 2950 4350 50  0001 C CNN
	1    2950 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6356C4
P 2950 4650
AR Path="/5F6356C4" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F6356C4" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F6356C4" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F6356C4" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2950 4400 50  0001 C CNN
F 1 "GND" H 2955 4477 50  0000 C CNN
F 2 "" H 2950 4650 50  0001 C CNN
F 3 "" H 2950 4650 50  0001 C CNN
	1    2950 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4500 2950 4650
$Comp
L Device:CP C2
U 1 1 5F6356F9
P 2050 4350
F 0 "C2" H 2168 4396 50  0000 L CNN
F 1 "100uF" H 2168 4305 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_6.3x5.8" H 2088 4200 50  0001 C CNN
F 3 "~" H 2050 4350 50  0001 C CNN
	1    2050 4350
	1    0    0    -1  
$EndComp
Connection ~ 2500 3950
Wire Wire Line
	2500 3950 2950 3950
Wire Wire Line
	2050 3950 2500 3950
Wire Wire Line
	2050 3950 2050 4200
Wire Wire Line
	2500 3950 2500 4200
Wire Wire Line
	2950 3950 2950 4200
Wire Wire Line
	3350 3950 2950 3950
Connection ~ 2950 3950
$Comp
L power:GND #PWR?
U 1 1 5F678E11
P 3250 4150
AR Path="/5F678E11" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F678E11" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F678E11" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F678E11" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 3250 3900 50  0001 C CNN
F 1 "GND" H 3255 3977 50  0000 C CNN
F 2 "" H 3250 4150 50  0001 C CNN
F 3 "" H 3250 4150 50  0001 C CNN
	1    3250 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4050 3250 4050
Wire Wire Line
	3250 4050 3250 4150
$Comp
L Device:C C8
U 1 1 5F68708A
P 4350 4350
F 0 "C8" H 4465 4396 50  0000 L CNN
F 1 "22uF" H 4465 4305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4388 4200 50  0001 C CNN
F 3 "~" H 4350 4350 50  0001 C CNN
	1    4350 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5F687094
P 4800 4350
F 0 "C9" H 4915 4396 50  0000 L CNN
F 1 "0.1uF" H 4915 4305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4838 4200 50  0001 C CNN
F 3 "~" H 4800 4350 50  0001 C CNN
	1    4800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F68709E
P 4350 4650
AR Path="/5F68709E" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F68709E" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F68709E" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F68709E" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 4350 4400 50  0001 C CNN
F 1 "GND" H 4355 4477 50  0000 C CNN
F 2 "" H 4350 4650 50  0001 C CNN
F 3 "" H 4350 4650 50  0001 C CNN
	1    4350 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6870A8
P 4800 4650
AR Path="/5F6870A8" Ref="#PWR?"  Part="1" 
AR Path="/5F7519D0/5F6870A8" Ref="#PWR?"  Part="1" 
AR Path="/5F7093B5/5F6870A8" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/5F6870A8" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 4800 4400 50  0001 C CNN
F 1 "GND" H 4805 4477 50  0000 C CNN
F 2 "" H 4800 4650 50  0001 C CNN
F 3 "" H 4800 4650 50  0001 C CNN
	1    4800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4500 4800 4650
Wire Wire Line
	4350 4500 4350 4650
Wire Wire Line
	4800 3950 4350 3950
Wire Wire Line
	4800 3950 5150 3950
Connection ~ 4800 3950
Wire Wire Line
	4800 3950 4800 4200
Wire Wire Line
	4350 3950 4350 4200
Wire Wire Line
	4350 3950 4200 3950
Connection ~ 4350 3950
Connection ~ 2050 2600
Wire Wire Line
	4650 2600 4850 2600
Connection ~ 5250 2600
Connection ~ 4850 2600
Wire Wire Line
	4850 2600 5250 2600
Wire Wire Line
	2050 3950 1750 3950
Connection ~ 2050 3950
Text GLabel 2000 2450 2    50   Input ~ 0
12V
Text GLabel 5150 3950 2    50   Input ~ 0
3V3D
Text GLabel 6050 2600 2    50   Input ~ 0
3V3A
Text GLabel 1750 3950 0    50   Input ~ 0
12V
Text Notes 3800 3250 0    50   ~ 0
500mA LDO
Wire Wire Line
	1650 2600 1850 2600
Wire Wire Line
	2000 2450 1850 2450
Wire Wire Line
	1850 2450 1850 2600
Connection ~ 1850 2600
Wire Wire Line
	1850 2600 2050 2600
Wire Wire Line
	10150 4300 10400 4300
Wire Wire Line
	10150 3900 10150 4300
Wire Wire Line
	10050 3900 10150 3900
Connection ~ 9550 3800
Wire Wire Line
	10400 3800 9550 3800
Wire Wire Line
	10650 4050 10550 4050
$Comp
L Jumper:Jumper_3_Open JP1
U 1 1 60C7FCB0
P 10400 4050
F 0 "JP1" V 10354 4137 50  0000 L CNN
F 1 "Jumper_3_Open" V 10445 4137 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P2.0mm_Open_TrianglePad1.0x1.5mm" H 10400 4050 50  0001 C CNN
F 3 "~" H 10400 4050 50  0001 C CNN
	1    10400 4050
	0    -1   1    0   
$EndComp
Connection ~ 6600 3950
Wire Wire Line
	6400 3950 6600 3950
Text GLabel 6400 3950 0    50   Input ~ 0
3V3D
Wire Wire Line
	8650 4400 8650 4450
Wire Wire Line
	9100 4400 9100 4450
Wire Wire Line
	9550 4400 9550 4450
Wire Wire Line
	7050 4400 7050 4450
Wire Wire Line
	6600 4400 6600 4450
Text GLabel 10650 4050 2    50   Input ~ 0
-1V
Wire Wire Line
	9550 3900 9550 4100
Connection ~ 9550 3900
Wire Wire Line
	9750 3900 9550 3900
Wire Wire Line
	9550 3800 9550 3900
Wire Wire Line
	7050 3650 7200 3650
Connection ~ 7050 3650
Wire Wire Line
	7050 3800 7050 3650
Wire Wire Line
	7200 3800 7050 3800
Wire Wire Line
	6950 3650 7050 3650
$Comp
L power:GND #PWR?
U 1 1 60B7110D
P 6950 3650
AR Path="/60B0344A/60B7110D" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B7110D" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 6950 3400 50  0001 C CNN
F 1 "GND" V 6955 3522 50  0000 R CNN
F 2 "" H 6950 3650 50  0001 C CNN
F 3 "" H 6950 3650 50  0001 C CNN
	1    6950 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R FB?
U 1 1 60B710F8
P 9900 3900
AR Path="/60B0344A/60B710F8" Ref="FB?"  Part="1" 
AR Path="/60AC8F91/60B710F8" Ref="FB1"  Part="1" 
F 0 "FB1" V 9700 3900 50  0000 C CNN
F 1 "120@100MHz" V 9800 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9830 3900 50  0001 C CNN
F 3 "~" H 9900 3900 50  0001 C CNN
	1    9900 3900
	0    1    1    0   
$EndComp
Connection ~ 9100 3800
Wire Wire Line
	9550 3800 9100 3800
$Comp
L power:GND #PWR?
U 1 1 60B710EF
P 9550 4450
AR Path="/60B0344A/60B710EF" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B710EF" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 9550 4200 50  0001 C CNN
F 1 "GND" H 9555 4277 50  0000 C CNN
F 2 "" H 9550 4450 50  0001 C CNN
F 3 "" H 9550 4450 50  0001 C CNN
	1    9550 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60B710E9
P 9550 4250
AR Path="/60B0344A/60B710E9" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B710E9" Ref="C21"  Part="1" 
F 0 "C21" H 9435 4204 50  0000 R CNN
F 1 "DNP" H 9435 4295 50  0000 R CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9588 4100 50  0001 C CNN
F 3 "~" H 9550 4250 50  0001 C CNN
	1    9550 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 3800 9100 4100
Wire Wire Line
	8950 3650 8850 3650
Wire Wire Line
	8950 3250 8850 3250
Connection ~ 8450 3650
Wire Wire Line
	8450 3650 8200 3650
$Comp
L power:GND #PWR?
U 1 1 60B710DE
P 8950 3250
AR Path="/60B0344A/60B710DE" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B710DE" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 8950 3000 50  0001 C CNN
F 1 "GND" V 8955 3122 50  0000 R CNN
F 2 "" H 8950 3250 50  0001 C CNN
F 3 "" H 8950 3250 50  0001 C CNN
	1    8950 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B710D8
P 8950 3650
AR Path="/60B0344A/60B710D8" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B710D8" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 8950 3400 50  0001 C CNN
F 1 "GND" V 8955 3522 50  0000 R CNN
F 2 "" H 8950 3650 50  0001 C CNN
F 3 "" H 8950 3650 50  0001 C CNN
	1    8950 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 3650 8550 3650
Wire Wire Line
	8450 3250 8450 3650
Wire Wire Line
	8550 3250 8450 3250
Wire Wire Line
	8350 3950 8200 3950
Wire Wire Line
	8350 4100 8350 3950
Wire Wire Line
	8650 3800 8200 3800
Connection ~ 8650 3800
Wire Wire Line
	8650 4100 8650 3800
Wire Wire Line
	9100 3800 8650 3800
$Comp
L power:GND #PWR?
U 1 1 60B710C7
P 9100 4450
AR Path="/60B0344A/60B710C7" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B710C7" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 9100 4200 50  0001 C CNN
F 1 "GND" H 9105 4277 50  0000 C CNN
F 2 "" H 9100 4450 50  0001 C CNN
F 3 "" H 9100 4450 50  0001 C CNN
	1    9100 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B710C1
P 8650 4450
AR Path="/60B0344A/60B710C1" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B710C1" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 8650 4200 50  0001 C CNN
F 1 "GND" H 8655 4277 50  0000 C CNN
F 2 "" H 8650 4450 50  0001 C CNN
F 3 "" H 8650 4450 50  0001 C CNN
	1    8650 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B710BB
P 8350 4100
AR Path="/60B0344A/60B710BB" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B710BB" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 8350 3850 50  0001 C CNN
F 1 "GND" H 8355 3927 50  0000 C CNN
F 2 "" H 8350 4100 50  0001 C CNN
F 3 "" H 8350 4100 50  0001 C CNN
	1    8350 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60B710B5
P 9100 4250
AR Path="/60B0344A/60B710B5" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B710B5" Ref="C20"  Part="1" 
F 0 "C20" H 8985 4204 50  0000 R CNN
F 1 "22uF" H 8985 4295 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9138 4100 50  0001 C CNN
F 3 "~" H 9100 4250 50  0001 C CNN
	1    9100 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 60B710AF
P 8650 4250
AR Path="/60B0344A/60B710AF" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B710AF" Ref="C17"  Part="1" 
F 0 "C17" H 8535 4204 50  0000 R CNN
F 1 "470nF" H 8535 4295 50  0000 R CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 8688 4100 50  0001 C CNN
F 3 "~" H 8650 4250 50  0001 C CNN
	1    8650 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 60B710A9
P 8700 3650
AR Path="/60B0344A/60B710A9" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B710A9" Ref="C19"  Part="1" 
F 0 "C19" V 8448 3650 50  0000 C CNN
F 1 "4.7uF" V 8539 3650 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8738 3500 50  0001 C CNN
F 3 "~" H 8700 3650 50  0001 C CNN
	1    8700 3650
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60B710A3
P 8700 3250
AR Path="/60B0344A/60B710A3" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B710A3" Ref="C18"  Part="1" 
F 0 "C18" V 8448 3250 50  0000 C CNN
F 1 "DNP" V 8539 3250 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 8738 3100 50  0001 C CNN
F 3 "~" H 8700 3250 50  0001 C CNN
	1    8700 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 3000 8350 2550
Connection ~ 8350 3000
Wire Wire Line
	7850 3000 8350 3000
Wire Wire Line
	7050 3000 7050 2550
Connection ~ 7050 3000
Wire Wire Line
	7550 3000 7050 3000
Wire Wire Line
	7050 2550 7550 2550
Wire Wire Line
	7050 3500 7050 3000
Wire Wire Line
	7200 3500 7050 3500
Wire Wire Line
	8350 2550 7850 2550
Wire Wire Line
	8350 3500 8350 3000
Wire Wire Line
	8200 3500 8350 3500
Wire Wire Line
	7050 3950 6600 3950
Connection ~ 7050 3950
Wire Wire Line
	7050 4100 7050 3950
Wire Wire Line
	6600 3950 6600 4100
Wire Wire Line
	7200 3950 7050 3950
$Comp
L power:GND #PWR?
U 1 1 60B7108A
P 7050 4450
AR Path="/60B0344A/60B7108A" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B7108A" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 7050 4200 50  0001 C CNN
F 1 "GND" H 7055 4277 50  0000 C CNN
F 2 "" H 7050 4450 50  0001 C CNN
F 3 "" H 7050 4450 50  0001 C CNN
	1    7050 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B71084
P 6600 4450
AR Path="/60B0344A/60B71084" Ref="#PWR?"  Part="1" 
AR Path="/60AC8F91/60B71084" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 6600 4200 50  0001 C CNN
F 1 "GND" H 6605 4277 50  0000 C CNN
F 2 "" H 6600 4450 50  0001 C CNN
F 3 "" H 6600 4450 50  0001 C CNN
	1    6600 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60B7107E
P 7050 4250
AR Path="/60B0344A/60B7107E" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B7107E" Ref="C14"  Part="1" 
F 0 "C14" H 6935 4204 50  0000 R CNN
F 1 "10uF" H 6935 4295 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7088 4100 50  0001 C CNN
F 3 "~" H 7050 4250 50  0001 C CNN
	1    7050 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 60B71078
P 6600 4250
AR Path="/60B0344A/60B71078" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B71078" Ref="C13"  Part="1" 
F 0 "C13" H 6485 4204 50  0000 R CNN
F 1 "10uF" H 6485 4295 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6638 4100 50  0001 C CNN
F 3 "~" H 6600 4250 50  0001 C CNN
	1    6600 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 60B7106C
P 7700 2550
AR Path="/60B0344A/60B7106C" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B7106C" Ref="C15"  Part="1" 
F 0 "C15" V 7448 2550 50  0000 C CNN
F 1 "DNP" V 7539 2550 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7738 2400 50  0001 C CNN
F 3 "~" H 7700 2550 50  0001 C CNN
	1    7700 2550
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60B71066
P 7700 3000
AR Path="/60B0344A/60B71066" Ref="C?"  Part="1" 
AR Path="/60AC8F91/60B71066" Ref="C16"  Part="1" 
F 0 "C16" V 7448 3000 50  0000 C CNN
F 1 "4.7uF" V 7539 3000 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7738 2850 50  0001 C CNN
F 3 "~" H 7700 3000 50  0001 C CNN
	1    7700 3000
	0    1    1    0   
$EndComp
$Comp
L Ninja-qPCR:LM7705MMX_NOPB U?
U 1 1 60B71060
P 7200 3500
AR Path="/60B0344A/60B71060" Ref="U?"  Part="1" 
AR Path="/60AC8F91/60B71060" Ref="U5"  Part="1" 
F 0 "U5" H 7700 3787 60  0000 C CNN
F 1 "LM7705MMX_NOPB" H 7700 3681 60  0000 C CNN
F 2 "Ninja-qPCR:LM7705MMX-NOPB" H 7700 3140 60  0001 C CNN
F 3 "" H 7700 3200 60  0000 C CNN
	1    7200 3500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
