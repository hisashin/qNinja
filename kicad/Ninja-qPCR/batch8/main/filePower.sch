EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
AR Path="/60AC8F91/5F7727F5" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 1750 2650 50  0001 C CNN
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
L Ninja-qPCR:IFX1763 U3
U 1 1 5F62E793
P 4050 2500
F 0 "U3" H 4050 2665 50  0000 C CNN
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
AR Path="/60AC8F91/5F62F25B" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 2050 3050 50  0001 C CNN
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
AR Path="/60AC8F91/5F62F270" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 2500 3050 50  0001 C CNN
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
AR Path="/60AC8F91/5F62F285" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2950 3050 50  0001 C CNN
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
AR Path="/60AC8F91/5F62F29A" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 3400 3050 50  0001 C CNN
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
AR Path="/60AC8F91/5F6658C5" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 4550 2800 50  0001 C CNN
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
AR Path="/60AC8F91/5F69D114" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 5250 3050 50  0001 C CNN
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
AR Path="/60AC8F91/5F69D11E" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 5700 3050 50  0001 C CNN
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
L Ninja-qPCR:CJT1117-3.3 U2
U 1 1 5F634152
P 3750 3900
F 0 "U2" H 3775 4075 50  0000 C CNN
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
AR Path="/60AC8F91/5F63569A" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 2050 4400 50  0001 C CNN
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
AR Path="/60AC8F91/5F6356AF" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 2500 4400 50  0001 C CNN
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
AR Path="/60AC8F91/5F6356C4" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 2950 4400 50  0001 C CNN
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
AR Path="/60AC8F91/5F678E11" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 3250 3900 50  0001 C CNN
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
AR Path="/60AC8F91/5F68709E" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 4350 4400 50  0001 C CNN
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
AR Path="/60AC8F91/5F6870A8" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 4800 4400 50  0001 C CNN
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
$EndSCHEMATC
