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
Text GLabel 8800 4650 2    50   Input ~ 0
GND
Text GLabel 8800 4750 2    50   Input ~ 0
+10V
Text GLabel 8800 4850 2    50   Input ~ 0
-10V
Wire Wire Line
	8600 4650 8800 4650
Wire Wire Line
	8800 4750 8600 4750
Wire Wire Line
	8600 4850 8800 4850
Wire Wire Line
	8800 4950 8600 4950
Wire Wire Line
	8600 5050 8800 5050
Wire Wire Line
	8800 5350 8600 5350
Wire Wire Line
	8600 5450 8800 5450
Wire Wire Line
	8800 5550 8600 5550
Wire Wire Line
	8600 5650 8800 5650
Wire Wire Line
	8800 5750 8600 5750
Text GLabel 8800 4950 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 8800 5050 2    50   Input ~ 0
PD_MUX_OUT
Text GLabel 8800 5750 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 8800 5650 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 8800 5550 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 8800 5450 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 8800 5350 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 1350 850  2    50   Input ~ 0
GND
Text GLabel 1350 950  2    50   Input ~ 0
+10V
Text GLabel 1350 1050 2    50   Input ~ 0
-10V
Wire Wire Line
	1150 850  1350 850 
Wire Wire Line
	1350 950  1150 950 
Wire Wire Line
	1150 1050 1350 1050
Wire Wire Line
	1350 1150 1150 1150
Wire Wire Line
	1150 1250 1350 1250
Wire Wire Line
	1350 1350 1150 1350
Wire Wire Line
	1150 1450 1350 1450
Wire Wire Line
	1350 1550 1150 1550
Wire Wire Line
	1150 1650 1350 1650
Wire Wire Line
	1350 1750 1150 1750
Text GLabel 1350 1150 2    50   Input ~ 0
VCC_LOGIC
Text GLabel 1350 1650 2    50   Input ~ 0
PD_MUX_GPIO1
Text GLabel 1350 1550 2    50   Input ~ 0
PD_MUX_GPIO2
Text GLabel 1350 1450 2    50   Input ~ 0
PD_MUX_GPIO3
Text GLabel 1350 1350 2    50   Input ~ 0
PD_MUX_GPIO4
Text GLabel 1350 1250 2    50   Input ~ 0
PD_MUX_GPIO5
Text GLabel 1350 1750 2    50   Input ~ 0
PD_REF_PWM
$Comp
L Ninja-qPCR:ADS1219IPWR U2
U 1 1 5F63A689
P 3100 1050
F 0 "U2" H 4000 1437 60  0000 C CNN
F 1 "ADS1219IPWR" H 4000 1331 60  0000 C CNN
F 2 "Ninja-qPCR:ADS1219IPWR" H 4000 1290 60  0001 C CNN
F 3 "" H 3100 1050 60  0000 C CNN
	1    3100 1050
	1    0    0    -1  
$EndComp
Text GLabel 2900 1050 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2900 1250 0    50   Input ~ 0
GND
Text HLabel 2900 1450 0    50   Input ~ 0
PHOTO_OUT
Text GLabel 2900 1550 0    50   Input ~ 0
THERM_WELL
Text GLabel 2900 1650 0    50   Input ~ 0
THERM_TEST1
Text GLabel 2900 1950 0    50   Input ~ 0
GND
Text GLabel 2900 2050 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 2900 2150 0    50   Input ~ 0
I2C_SCL
Text GLabel 2900 2350 0    50   Input ~ 0
I2C_SDA
Text GLabel 2900 2750 0    50   Input ~ 0
VCC_LOGIC
Wire Wire Line
	3100 2750 3000 2750
Wire Wire Line
	3100 2950 3000 2950
Wire Wire Line
	3000 2950 3000 2750
Connection ~ 3000 2750
Wire Wire Line
	3000 2750 2900 2750
Wire Wire Line
	3100 2350 2900 2350
Wire Wire Line
	3100 2150 2900 2150
Wire Wire Line
	3100 2050 2900 2050
Wire Wire Line
	3100 1950 2900 1950
Wire Wire Line
	3100 1050 2900 1050
Wire Wire Line
	3100 1250 3000 1250
Wire Wire Line
	3100 1350 3000 1350
Wire Wire Line
	3000 1350 3000 1250
Connection ~ 3000 1250
Wire Wire Line
	3000 1250 2900 1250
Wire Wire Line
	3100 1450 2900 1450
Wire Wire Line
	3100 1550 2900 1550
Wire Wire Line
	3100 1650 2900 1650
Wire Wire Line
	3100 1750 2900 1750
Text GLabel 5100 1050 2    50   Input ~ 0
ADC_DRDY
Text GLabel 5100 1450 2    50   Input ~ 0
GND
Wire Wire Line
	5100 1050 4900 1050
Wire Wire Line
	5100 1450 5000 1450
Wire Wire Line
	4900 1550 5000 1550
Wire Wire Line
	5000 1550 5000 1450
Connection ~ 5000 1450
Wire Wire Line
	5000 1450 4900 1450
Text GLabel 1350 2550 2    50   Input ~ 0
THERM_TEST1
Text GLabel 1350 1850 2    50   Input ~ 0
ADC_DRDY
Text GLabel 1350 1950 2    50   Input ~ 0
I2C_SCL
Text GLabel 1350 2050 2    50   Input ~ 0
I2C_SDA
Wire Wire Line
	1350 1850 1150 1850
Wire Wire Line
	1350 1950 1150 1950
Wire Wire Line
	1350 2050 1150 2050
Text GLabel 1350 2150 2    50   Input ~ 0
THERM_WELL
Wire Wire Line
	1350 2150 1150 2150
Text GLabel 7100 3500 3    50   Input ~ 0
GND
Connection ~ 7800 850 
Wire Wire Line
	6300 850  7800 850 
Wire Wire Line
	6300 2400 6300 850 
Wire Wire Line
	7250 2400 6300 2400
Wire Wire Line
	7800 850  7950 850 
Wire Wire Line
	7800 1150 7800 850 
Wire Wire Line
	9900 1150 7800 1150
Wire Wire Line
	10200 850  10450 850 
Connection ~ 10200 850 
Wire Wire Line
	10200 1150 10200 850 
Wire Wire Line
	10200 1550 10200 1900
Connection ~ 10200 1550
Wire Wire Line
	9900 1550 10200 1550
Wire Wire Line
	9900 1450 9900 1550
Connection ~ 10200 1900
Wire Wire Line
	10200 1450 10200 1550
$Comp
L Device:C C?
U 1 1 5F581541
P 10200 1300
AR Path="/5F4A628B/5F581541" Ref="C?"  Part="1" 
AR Path="/5F581541" Ref="C12"  Part="1" 
AR Path="/5F620C27/5F581541" Ref="C?"  Part="1" 
F 0 "C12" H 10315 1346 50  0000 L CNN
F 1 "0.22uF" H 10315 1255 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 10238 1150 50  0001 C CNN
F 3 "~" H 10200 1300 50  0001 C CNN
	1    10200 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F581547
P 9900 1300
AR Path="/5F4A628B/5F581547" Ref="C?"  Part="1" 
AR Path="/5F581547" Ref="C11"  Part="1" 
AR Path="/5F620C27/5F581547" Ref="C?"  Part="1" 
F 0 "C11" H 10015 1346 50  0000 L CNN
F 1 "0.22uF" H 10015 1255 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9938 1150 50  0001 C CNN
F 3 "~" H 9900 1300 50  0001 C CNN
	1    9900 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 1900 10200 2200
Wire Wire Line
	10050 1900 10200 1900
Wire Wire Line
	10200 2700 10200 2500
Text GLabel 10200 2700 3    50   Input ~ 0
GND
$Comp
L Device:R R?
U 1 1 5F581551
P 10200 2350
AR Path="/5F4A628B/5F581551" Ref="R?"  Part="1" 
AR Path="/5F581551" Ref="R8"  Part="1" 
AR Path="/5F620C27/5F581551" Ref="R?"  Part="1" 
F 0 "R8" H 10270 2396 50  0000 L CNN
F 1 "560" H 10270 2305 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 10130 2350 50  0001 C CNN
F 3 "~" H 10200 2350 50  0001 C CNN
	1    10200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 2000 9050 2000
Wire Wire Line
	10450 850  10450 2000
Wire Wire Line
	8250 850  10200 850 
$Comp
L Device:R R?
U 1 1 5F58155A
P 8100 850
AR Path="/5F4A628B/5F58155A" Ref="R?"  Part="1" 
AR Path="/5F58155A" Ref="R5"  Part="1" 
AR Path="/5F620C27/5F58155A" Ref="R?"  Part="1" 
F 0 "R5" V 7893 850 50  0000 C CNN
F 1 "1800" V 7984 850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 8030 850 50  0001 C CNN
F 3 "~" H 8100 850 50  0001 C CNN
	1    8100 850 
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 2000 7250 2000
Connection ~ 6950 2000
Wire Wire Line
	6950 2100 6950 2000
Wire Wire Line
	7250 2100 6950 2100
Wire Wire Line
	9250 1250 9600 1250
Connection ~ 9250 1250
Wire Wire Line
	9250 1450 9250 1250
Wire Wire Line
	9600 1250 9600 1450
Wire Wire Line
	9000 1250 9250 1250
Wire Wire Line
	9250 1900 9050 1900
Connection ~ 9250 1900
Wire Wire Line
	9250 1750 9250 1900
Wire Wire Line
	9600 1900 9250 1900
Connection ~ 9600 1900
Wire Wire Line
	9600 1750 9600 1900
$Comp
L Device:C C?
U 1 1 5F58156F
P 9600 1600
AR Path="/5F4A628B/5F58156F" Ref="C?"  Part="1" 
AR Path="/5F58156F" Ref="C10"  Part="1" 
AR Path="/5F620C27/5F58156F" Ref="C?"  Part="1" 
F 0 "C10" H 9715 1646 50  0000 L CNN
F 1 "10pF" H 9715 1555 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9638 1450 50  0001 C CNN
F 3 "~" H 9600 1600 50  0001 C CNN
	1    9600 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F581575
P 9250 1600
AR Path="/5F4A628B/5F581575" Ref="R?"  Part="1" 
AR Path="/5F581575" Ref="R6"  Part="1" 
AR Path="/5F620C27/5F581575" Ref="R?"  Part="1" 
F 0 "R6" H 9320 1646 50  0000 L CNN
F 1 "1.1M" H 9320 1555 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9180 1600 50  0001 C CNN
F 3 "~" H 9250 1600 50  0001 C CNN
	1    9250 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 1900 9600 1900
$Comp
L Device:R R?
U 1 1 5F58157C
P 9900 1900
AR Path="/5F4A628B/5F58157C" Ref="R?"  Part="1" 
AR Path="/5F58157C" Ref="R7"  Part="1" 
AR Path="/5F620C27/5F58157C" Ref="R?"  Part="1" 
F 0 "R7" V 9693 1900 50  0000 C CNN
F 1 "560" V 9784 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9830 1900 50  0001 C CNN
F 3 "~" H 9900 1900 50  0001 C CNN
	1    9900 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	9150 3000 9150 2800
Text GLabel 9150 3000 3    50   Input ~ 0
GND
Wire Wire Line
	9150 2400 9050 2400
Connection ~ 9150 2400
Wire Wire Line
	9150 2500 9150 2400
$Comp
L Device:C C?
U 1 1 5F581587
P 9150 2650
AR Path="/5F4A628B/5F581587" Ref="C?"  Part="1" 
AR Path="/5F581587" Ref="C9"  Part="1" 
AR Path="/5F620C27/5F581587" Ref="C?"  Part="1" 
F 0 "C9" H 9265 2696 50  0000 L CNN
F 1 "0.1uF" H 9265 2605 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9188 2500 50  0001 C CNN
F 3 "~" H 9150 2650 50  0001 C CNN
	1    9150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2000 6950 2000
Text GLabel 6700 2000 0    50   Input ~ 0
GND
Wire Wire Line
	7100 2800 7250 2800
Connection ~ 7100 2800
Wire Wire Line
	7100 2900 7100 2800
$Comp
L Device:C C?
U 1 1 5F581592
P 7100 3050
AR Path="/5F4A628B/5F581592" Ref="C?"  Part="1" 
AR Path="/5F581592" Ref="C7"  Part="1" 
AR Path="/5F620C27/5F581592" Ref="C?"  Part="1" 
F 0 "C7" H 7215 3096 50  0000 L CNN
F 1 "0.1uF" H 7215 3005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7138 2900 50  0001 C CNN
F 3 "~" H 7100 3050 50  0001 C CNN
	1    7100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2800 7100 2800
Wire Wire Line
	9250 2400 9150 2400
Text GLabel 9250 2400 2    50   Input ~ 0
-10V
Text GLabel 6900 2800 0    50   Input ~ 0
+10V
$Comp
L Ninja-qPCR:LME49721MAX_NOPB U?
U 1 1 5F58159C
P 7250 2000
AR Path="/5F4A628B/5F58159C" Ref="U?"  Part="1" 
AR Path="/5F58159C" Ref="U3"  Part="1" 
AR Path="/5F620C27/5F58159C" Ref="U?"  Part="1" 
F 0 "U3" H 8150 2487 60  0000 C CNN
F 1 "LME49721MAX_NOPB" H 8150 2381 60  0000 C CNN
F 2 "Ninja-qPCR:LME49721MAX&slash_NOPB" H 8150 2340 60  0001 C CNN
F 3 "" H 7250 2000 60  0000 C CNN
	1    7250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3500 7100 3200
Text HLabel 10650 2000 2    50   Input ~ 0
AMP_OUT
Wire Wire Line
	10650 2000 10450 2000
Connection ~ 10450 2000
Text HLabel 6900 2300 0    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	6900 2300 7250 2300
Text HLabel 9000 1250 0    50   Input ~ 0
PD_MUX_OUT
$Comp
L Ninja-qPCR:AD630ARZ U1
U 1 1 5F58E32E
P 2650 5050
F 0 "U1" H 4350 5537 60  0000 C CNN
F 1 "AD630ARZ" H 4350 5431 60  0000 C CNN
F 2 "Ninja-qPCR:AD630ARZ" H 4350 5390 60  0001 C CNN
F 3 "" H 2650 5050 60  0000 C CNN
	1    2650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6050 2100 6050
NoConn ~ 2450 5550
NoConn ~ 2450 5650
Wire Wire Line
	2450 5650 2650 5650
Wire Wire Line
	2650 5550 2450 5550
NoConn ~ 6200 5450
NoConn ~ 6200 5550
Wire Wire Line
	6050 5550 6200 5550
Wire Wire Line
	6050 5450 6200 5450
NoConn ~ 6200 5250
Wire Wire Line
	6050 5250 6200 5250
NoConn ~ 2450 5150
Wire Wire Line
	2650 5150 2450 5150
Wire Wire Line
	2650 5750 2100 5750
Wire Wire Line
	2100 5750 2100 6050
$Comp
L Device:R R3
U 1 1 5F58E343
P 6350 4250
F 0 "R3" V 6143 4250 50  0000 C CNN
F 1 "10k" V 6234 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6280 4250 50  0001 C CNN
F 3 "~" H 6350 4250 50  0001 C CNN
	1    6350 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 4250 6150 4250
Wire Wire Line
	6150 4250 6150 4950
Wire Wire Line
	6150 4950 6050 4950
Wire Wire Line
	6150 4250 2300 4250
Wire Wire Line
	2300 4250 2300 5350
Wire Wire Line
	2300 5350 2650 5350
Connection ~ 6150 4250
NoConn ~ 2450 5250
Wire Wire Line
	2650 5250 2450 5250
Wire Wire Line
	2650 5950 2200 5950
Wire Wire Line
	2200 5950 2200 5050
Wire Wire Line
	2200 5050 2650 5050
Wire Wire Line
	6050 5150 6250 5150
Wire Wire Line
	6250 5150 6250 4450
Wire Wire Line
	6250 4450 2200 4450
Wire Wire Line
	2200 4450 2200 5050
Connection ~ 2200 5050
Text GLabel 2500 5850 0    50   Input ~ 0
GND
Wire Wire Line
	2650 5850 2500 5850
Text GLabel 6200 5750 2    50   Input ~ 0
PD_REF_PWM
Wire Wire Line
	6200 5750 6050 5750
Text GLabel 2100 6550 0    50   Input ~ 0
-10V
Wire Wire Line
	2650 6550 2400 6550
$Comp
L Device:C C3
U 1 1 5F58E360
P 2400 6800
F 0 "C3" H 2515 6846 50  0000 L CNN
F 1 "0.1uF" H 2515 6755 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2438 6650 50  0001 C CNN
F 3 "~" H 2400 6800 50  0001 C CNN
	1    2400 6800
	1    0    0    -1  
$EndComp
Text GLabel 2400 7100 3    50   Input ~ 0
GND
Wire Wire Line
	2400 6650 2400 6550
Connection ~ 2400 6550
Wire Wire Line
	2400 6550 2100 6550
Wire Wire Line
	2400 6950 2400 7100
$Comp
L Device:C C1
U 1 1 5F58E36B
P 1500 6800
F 0 "C1" H 1615 6846 50  0000 L CNN
F 1 "0.1uF" H 1615 6755 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1538 6650 50  0001 C CNN
F 3 "~" H 1500 6800 50  0001 C CNN
	1    1500 6800
	1    0    0    -1  
$EndComp
Text GLabel 1500 7100 3    50   Input ~ 0
GND
Wire Wire Line
	1500 6950 1500 7100
Text GLabel 1350 6550 0    50   Input ~ 0
+10V
Wire Wire Line
	1500 6650 1500 6550
Wire Wire Line
	1500 6550 1350 6550
Wire Wire Line
	2650 6450 1500 6450
Wire Wire Line
	1500 6450 1500 6550
Connection ~ 1500 6550
$Comp
L Device:R R2
U 1 1 5F58E379
P 1500 6200
F 0 "R2" H 1570 6246 50  0000 L CNN
F 1 "6.2k" H 1570 6155 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1430 6200 50  0001 C CNN
F 3 "~" H 1500 6200 50  0001 C CNN
	1    1500 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6350 1500 6450
Connection ~ 1500 6450
$Comp
L Device:R R1
U 1 1 5F58E381
P 1500 5700
F 0 "R1" H 1570 5746 50  0000 L CNN
F 1 "1k" H 1570 5655 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1430 5700 50  0001 C CNN
F 3 "~" H 1500 5700 50  0001 C CNN
	1    1500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5850 1500 5950
Wire Wire Line
	6050 5850 6050 7350
Wire Wire Line
	6050 7350 1000 7350
Wire Wire Line
	1000 7350 1000 5950
Wire Wire Line
	1000 5950 1500 5950
Connection ~ 1500 5950
Wire Wire Line
	1500 5950 1500 6050
Wire Wire Line
	2650 6150 1800 6150
Wire Wire Line
	1800 6150 1800 5400
Wire Wire Line
	1800 5400 1500 5400
Wire Wire Line
	1500 5400 1500 5550
Text GLabel 1400 5400 0    50   Input ~ 0
GND
Wire Wire Line
	1500 5400 1400 5400
Connection ~ 1500 5400
$Comp
L Device:C C6
U 1 1 5F58E395
P 6600 4500
F 0 "C6" H 6715 4546 50  0000 L CNN
F 1 "0.47uF" H 6715 4455 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6638 4350 50  0001 C CNN
F 3 "~" H 6600 4500 50  0001 C CNN
	1    6600 4500
	1    0    0    -1  
$EndComp
Text GLabel 6600 4750 3    50   Input ~ 0
GND
Wire Wire Line
	6600 4650 6600 4750
Wire Wire Line
	6500 4250 6600 4250
Wire Wire Line
	6600 4250 6600 4350
$Comp
L Device:R R4
U 1 1 5F58E39F
P 6900 4250
F 0 "R4" H 6970 4296 50  0000 L CNN
F 1 "10k" H 6970 4205 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6830 4250 50  0001 C CNN
F 3 "~" H 6900 4250 50  0001 C CNN
	1    6900 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C8
U 1 1 5F58E3A5
P 7200 4500
F 0 "C8" V 6948 4500 50  0000 C CNN
F 1 "0.47uF" V 7039 4500 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7238 4350 50  0001 C CNN
F 3 "~" H 7200 4500 50  0001 C CNN
	1    7200 4500
	-1   0    0    1   
$EndComp
Text GLabel 7200 4750 3    50   Input ~ 0
GND
Text HLabel 1950 6050 0    50   Input ~ 0
AMP_OUT
Wire Wire Line
	2100 6050 1950 6050
Connection ~ 2100 6050
Wire Wire Line
	6600 4250 6750 4250
Connection ~ 6600 4250
Wire Wire Line
	7050 4250 7200 4250
Wire Wire Line
	7200 4250 7200 4350
Connection ~ 7200 4250
Wire Wire Line
	7200 4250 7400 4250
Wire Wire Line
	7200 4650 7200 4750
Text HLabel 7400 4250 2    50   Input ~ 0
PHOTO_OUT
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 5F591AD7
P 8400 4850
F 0 "J3" H 8508 5231 50  0000 C CNN
F 1 "Conn_01x05_Male" H 8508 5140 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 8400 4850 50  0001 C CNN
F 3 "~" H 8400 4850 50  0001 C CNN
	1    8400 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J4
U 1 1 5F59281D
P 8400 5550
F 0 "J4" H 8508 5931 50  0000 C CNN
F 1 "Conn_01x05_Male" H 8508 5840 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 8400 5550 50  0001 C CNN
F 3 "~" H 8400 5550 50  0001 C CNN
	1    8400 5550
	1    0    0    -1  
$EndComp
Text GLabel 2100 3500 0    50   Input ~ 0
+10V
Text GLabel 2850 3500 0    50   Input ~ 0
-10V
Text GLabel 2100 4000 0    50   Input ~ 0
GND
Text GLabel 2850 4000 0    50   Input ~ 0
GND
Text GLabel 3850 3500 0    50   Input ~ 0
VCC_LOGIC
Text GLabel 3850 4000 0    50   Input ~ 0
GND
$Comp
L Device:C C2
U 1 1 5F5B08B9
P 2250 3750
F 0 "C2" H 2365 3796 50  0000 L CNN
F 1 "0.1uF?" H 2365 3705 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2288 3600 50  0001 C CNN
F 3 "~" H 2250 3750 50  0001 C CNN
	1    2250 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5F5B10F8
P 3000 3750
F 0 "C4" H 3115 3796 50  0000 L CNN
F 1 "0.1uF?" H 3115 3705 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3038 3600 50  0001 C CNN
F 3 "~" H 3000 3750 50  0001 C CNN
	1    3000 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5F5B161D
P 4000 3750
F 0 "C5" H 4115 3796 50  0000 L CNN
F 1 "0.1uF?" H 4115 3705 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4038 3600 50  0001 C CNN
F 3 "~" H 4000 3750 50  0001 C CNN
	1    4000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4000 4000 4000
Wire Wire Line
	4000 4000 4000 3900
Wire Wire Line
	4000 3600 4000 3500
Wire Wire Line
	4000 3500 3850 3500
Wire Wire Line
	2850 4000 3000 4000
Wire Wire Line
	3000 4000 3000 3900
Wire Wire Line
	3000 3600 3000 3500
Wire Wire Line
	3000 3500 2850 3500
Wire Wire Line
	2250 3600 2250 3500
Wire Wire Line
	2250 3500 2100 3500
Wire Wire Line
	2100 4000 2250 4000
Wire Wire Line
	2250 3900 2250 4000
$Comp
L Connector:Conn_01x14_Male J1
U 1 1 5F5FEB48
P 950 1450
F 0 "J1" H 1058 2231 50  0000 C CNN
F 1 "Conn_01x14_Male" H 1058 2140 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x14_Pitch2.54mm" H 950 1450 50  0001 C CNN
F 3 "~" H 950 1450 50  0001 C CNN
	1    950  1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5F602441
P 950 2550
F 0 "J2" H 1058 2731 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1058 2640 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 950 2550 50  0001 C CNN
F 3 "~" H 950 2550 50  0001 C CNN
	1    950  2550
	1    0    0    -1  
$EndComp
Text GLabel 1350 2650 2    50   Input ~ 0
THERM_TEST2
Wire Wire Line
	1350 2550 1150 2550
Wire Wire Line
	1350 2650 1150 2650
Text GLabel 2900 1750 0    50   Input ~ 0
THERM_TEST2
$Comp
L Ninja-qPCR:ADA2200ARUZ U?
U 1 1 5F7FB45A
P 9900 3650
F 0 "U?" H 10900 4137 60  0000 C CNN
F 1 "ADA2200ARUZ" H 10900 4031 60  0000 C CNN
F 2 "RU_16_ADI" H 10900 3990 60  0001 C CNN
F 3 "" H 9900 3650 60  0000 C CNN
	1    9900 3650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
