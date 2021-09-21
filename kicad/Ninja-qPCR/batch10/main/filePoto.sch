EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1100 3150 2    50   Input ~ 0
GNDD
Text GLabel 1100 2050 2    50   Input ~ 0
3V3D
Text GLabel 1100 2750 2    50   Input ~ 0
ADC_DRDY
Text GLabel 1100 3050 2    50   Input ~ 0
I2C_SCL
Text GLabel 1100 2950 2    50   Input ~ 0
I2C_SDA
Text GLabel 2850 5050 0    50   Input ~ 0
PD_REF_PWM
Text HLabel 2850 4950 0    50   Input ~ 0
AMP_OUT
Text HLabel 5150 4450 2    50   Input ~ 0
PHOTO_OUT_P
Text GLabel 10650 3750 0    50   Input ~ 0
3V3D
Text GLabel 10650 4250 0    50   Input ~ 0
GNDD
$Comp
L Device:C C?
U 1 1 6155CE88
P 10800 4000
F 0 "C?" H 10915 4046 50  0000 L CNN
F 1 "0.1uF" H 10915 3955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10838 3850 50  0001 C CNN
F 3 "~" H 10800 4000 50  0001 C CNN
	1    10800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 4250 10800 4250
Wire Wire Line
	10800 4250 10800 4150
Wire Wire Line
	10800 3850 10800 3750
Wire Wire Line
	10800 3750 10650 3750
Wire Wire Line
	2850 4950 3050 4950
Wire Wire Line
	2850 5050 3050 5050
$Comp
L Ninja-qPCR:ADA2200ARUZ U?
U 1 1 6155CE94
P 3050 4450
F 0 "U?" H 4050 4937 60  0000 C CNN
F 1 "ADA2200ARUZ" H 4050 4831 60  0000 C CNN
F 2 "Ninja-qPCR:ADA2200ARUZ" H 4050 4790 60  0001 C CNN
F 3 "" H 3050 4450 60  0000 C CNN
	1    3050 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6155CE9A
P 2700 4450
F 0 "R?" V 2493 4450 50  0000 C CNN
F 1 "10K" V 2584 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2630 4450 50  0001 C CNN
F 3 "~" H 2700 4450 50  0001 C CNN
	1    2700 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6155CEA0
P 1750 4650
F 0 "R?" V 1543 4650 50  0000 C CNN
F 1 "10K" V 1634 4650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1680 4650 50  0001 C CNN
F 3 "~" H 1750 4650 50  0001 C CNN
	1    1750 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 5150 1700 5150
Wire Wire Line
	3050 4450 2850 4450
Text GLabel 2450 4450 0    50   Input ~ 0
3V3D
Wire Wire Line
	2450 4450 2550 4450
Text GLabel 1700 5150 0    50   Input ~ 0
DEMOD_SPI_SCLK
Text HLabel 9850 3400 2    50   Input ~ 0
AMP_OUT
Wire Wire Line
	7100 1050 7250 1050
Connection ~ 9350 3400
Wire Wire Line
	6800 1050 6650 1050
Wire Wire Line
	3050 4550 2550 4550
Wire Wire Line
	3050 5250 2850 5250
Text GLabel 2550 4550 0    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 2850 5250 0    50   Input ~ 0
DEMOD_SPI_SDIO
Wire Wire Line
	3050 5350 2850 5350
NoConn ~ 2850 5350
$Comp
L Device:C C?
U 1 1 6155CEB5
P 1750 5450
F 0 "C?" V 1600 5300 50  0000 C CNN
F 1 "4.7uF" V 1700 5300 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1788 5300 50  0001 C CNN
F 3 "~" H 1750 5450 50  0001 C CNN
	1    1750 5450
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 6155CEBB
P 6950 1400
F 0 "C?" V 6698 1400 50  0000 C CNN
F 1 "22pF" V 6789 1400 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6988 1250 50  0001 C CNN
F 3 "~" H 6950 1400 50  0001 C CNN
	1    6950 1400
	0    1    -1   0   
$EndComp
Wire Wire Line
	7100 1400 7250 1400
Wire Wire Line
	7250 1400 7250 1050
Wire Wire Line
	6800 1400 6650 1400
$Comp
L Device:C C?
U 1 1 6155CEC4
P 9650 3550
F 0 "C?" V 9398 3550 50  0000 C CNN
F 1 "0.1uF" V 9489 3550 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9688 3400 50  0001 C CNN
F 3 "~" H 9650 3550 50  0001 C CNN
	1    9650 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 3550 9350 3550
Wire Wire Line
	9350 3550 9350 3400
Wire Wire Line
	9900 3550 9800 3550
$Comp
L Connector:Conn_01x04_Male JSPI?
U 1 1 6155CECD
P 2950 6950
F 0 "JSPI?" H 3058 7231 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3058 7140 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02_Pitch2.54mm" H 2950 6950 50  0001 C CNN
F 3 "~" H 2950 6950 50  0001 C CNN
	1    2950 6950
	1    0    0    -1  
$EndComp
Text GLabel 3400 7150 2    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 3400 6850 2    50   Input ~ 0
GNDD
Text GLabel 3400 7050 2    50   Input ~ 0
DEMOD_SPI_SDIO
Wire Wire Line
	3400 6850 3150 6850
Wire Wire Line
	3150 6950 3400 6950
Wire Wire Line
	3400 7050 3150 7050
Wire Wire Line
	3150 7150 3400 7150
Text GLabel 6300 3300 0    50   Input ~ 0
PD_MUX_OUT
$Comp
L Device:R R?
U 1 1 6155CEDB
P 6950 2000
F 0 "R?" V 6743 2000 50  0000 C CNN
F 1 "R" V 6834 2000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" V 6880 2000 50  0001 C CNN
F 3 "~" H 6950 2000 50  0001 C CNN
	1    6950 2000
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 6155CEE1
P 6950 2350
F 0 "C?" V 6698 2350 50  0000 C CNN
F 1 "22pF" V 6789 2350 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6988 2200 50  0001 C CNN
F 3 "~" H 6950 2350 50  0001 C CNN
	1    6950 2350
	0    1    -1   0   
$EndComp
Wire Wire Line
	7100 2350 7250 2350
Wire Wire Line
	7250 2350 7250 2000
Wire Wire Line
	6800 2350 6650 2350
Wire Wire Line
	6650 2350 6650 2000
Text Notes 6450 2800 0    50   ~ 0
SMALL GAIN FOR\nSTRONG SIGNAL
Wire Wire Line
	7250 2000 7100 2000
Wire Wire Line
	6650 2000 6800 2000
Text GLabel 5150 4550 2    50   Input ~ 0
XOUT
Text GLabel 2450 4750 0    50   Input ~ 0
CLKIN
Wire Wire Line
	2450 4750 3050 4750
Text GLabel 8000 3000 0    50   Input ~ 0
3V3D
Text GLabel 7600 3500 0    50   Input ~ 0
GNDA
Wire Wire Line
	7600 3500 7750 3500
Text GLabel 9250 1400 2    50   Input ~ 0
3V3D
Text GLabel 9050 1100 2    50   Input ~ 0
-1V
$Comp
L Device:R R?
U 1 1 6155CEF6
P 9400 2200
F 0 "R?" V 9193 2200 50  0000 C CNN
F 1 "10K" V 9284 2200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9330 2200 50  0001 C CNN
F 3 "~" H 9400 2200 50  0001 C CNN
	1    9400 2200
	0    -1   -1   0   
$EndComp
Text GLabel 9650 2200 2    50   Input ~ 0
-1V
Text Notes 5000 6550 0    50   ~ 0
Debug pins\n(Photo measurement)
Text GLabel 5400 7050 2    50   Input ~ 0
PD_MUX_OUT
Text HLabel 5400 7150 2    50   Input ~ 0
AMP_OUT
Text HLabel 5150 4350 2    50   Input ~ 0
PHOTO_OUT_N
Text HLabel 5400 6850 2    50   Input ~ 0
PHOTO_OUT_N
Text HLabel 5400 6950 2    50   Input ~ 0
PHOTO_OUT_P
Wire Wire Line
	9250 1400 8950 1400
Wire Wire Line
	9150 2000 9150 2200
Wire Wire Line
	9150 2200 9250 2200
Wire Wire Line
	9150 2000 9400 2000
Wire Wire Line
	9650 2200 9550 2200
Text GLabel 5150 4950 2    50   Input ~ 0
GNDD
Text GLabel 1500 4650 0    50   Input ~ 0
3V3D
Wire Wire Line
	1500 4650 1600 4650
Text GLabel 2850 5750 0    50   Input ~ 0
3V3D
Wire Wire Line
	2850 5750 3050 5750
Text GLabel 1450 5450 0    50   Input ~ 0
GNDA
Wire Wire Line
	1450 5450 1600 5450
Wire Wire Line
	1900 5450 3050 5450
Text GLabel 2850 4850 0    50   Input ~ 0
GNDA
Wire Wire Line
	2850 4850 3050 4850
Wire Wire Line
	5400 6850 4950 6850
Wire Wire Line
	5400 6950 4950 6950
Wire Wire Line
	5400 7150 4950 7150
Wire Wire Line
	5400 7050 4950 7050
Text Notes 2750 6550 0    50   ~ 0
ADA2200 SPI debug
Text Notes 550  1350 0    50   ~ 0
Main <-> Photosensing
Wire Wire Line
	9350 3400 9850 3400
$Comp
L Device:R R?
U 1 1 6155CF19
P 6950 1050
F 0 "R?" V 6743 1050 50  0000 C CNN
F 1 "R" V 6834 1050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" V 6880 1050 50  0001 C CNN
F 3 "~" H 6950 1050 50  0001 C CNN
	1    6950 1050
	0    -1   1    0   
$EndComp
Wire Wire Line
	8000 3000 8150 3000
Connection ~ 7250 1400
Text GLabel 6650 5650 0    50   Input ~ 0
CLKIN
$Comp
L Device:R R?
U 1 1 6155CF22
P 7050 5350
F 0 "R?" V 6843 5350 50  0000 C CNN
F 1 "10K" V 6934 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6980 5350 50  0001 C CNN
F 3 "~" H 7050 5350 50  0001 C CNN
	1    7050 5350
	0    1    1    0   
$EndComp
Text GLabel 6650 5350 0    50   Input ~ 0
3V3D
Wire Wire Line
	7250 2350 7250 2650
Connection ~ 7250 2350
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 6155CF2B
P 10050 1450
F 0 "J?" H 10158 1731 50  0000 C CNN
F 1 "Conn_01x04_Male" H 10158 1640 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 10050 1450 50  0001 C CNN
F 3 "~" H 10050 1450 50  0001 C CNN
	1    10050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 1650 10250 1650
Wire Wire Line
	10500 1350 10250 1350
Text GLabel 10500 1450 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10500 1450 10250 1450
Text GLabel 10500 1550 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10500 1550 10250 1550
Text Notes 10050 1100 0    50   ~ 0
External gain resistors
$Comp
L Device:Jumper JP?
U 1 1 6155CF38
P 7050 5650
F 0 "JP?" V 7004 5777 50  0000 L CNN
F 1 "Jumper" V 7095 5777 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 7050 5650 50  0001 C CNN
F 3 "~" H 7050 5650 50  0001 C CNN
	1    7050 5650
	-1   0    0    1   
$EndComp
Text HLabel 7350 1050 2    50   Input ~ 0
GAIN_LARGE
Text HLabel 7350 2650 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10500 1650 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10500 1350 2    50   Input ~ 0
GAIN_LARGE
Text HLabel 9400 2000 2    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 9900 3550 2    50   Input ~ 0
GNDA
Text GLabel 3400 6950 2    50   Input ~ 0
DEMOD_SPI_SCLK
Wire Wire Line
	1900 4650 2000 4650
$Comp
L Device:C C?
U 1 1 6155CF46
P 1750 4900
F 0 "C?" V 1600 4750 50  0000 C CNN
F 1 "4.7uF" V 1700 4750 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1788 4750 50  0001 C CNN
F 3 "~" H 1750 4900 50  0001 C CNN
	1    1750 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 4900 2000 4900
Wire Wire Line
	2000 4900 2000 4650
Connection ~ 2000 4650
Wire Wire Line
	2000 4650 3050 4650
Text GLabel 1500 4900 0    50   Input ~ 0
GNDD
Wire Wire Line
	1500 4900 1600 4900
Wire Wire Line
	7450 5450 7400 5450
Wire Wire Line
	7400 5450 7400 5650
Wire Wire Line
	7400 5650 7350 5650
Wire Wire Line
	6900 5350 6650 5350
Wire Wire Line
	6750 5650 6650 5650
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 6155CF57
P 4750 6950
F 0 "J?" H 4858 7231 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4858 7140 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 4750 6950 50  0001 C CNN
F 3 "~" H 4750 6950 50  0001 C CNN
	1    4750 6950
	1    0    0    -1  
$EndComp
Text GLabel 8000 3800 0    50   Input ~ 0
-1V
Text GLabel 6550 4150 0    50   Input ~ 0
3V3A
Text GLabel 1100 2450 2    50   Input ~ 0
MUX_S3
Text GLabel 1100 2350 2    50   Input ~ 0
MUX_S2
Text GLabel 1100 2650 2    50   Input ~ 0
MUX_S1
Text GLabel 1100 2550 2    50   Input ~ 0
MUX_S0
Text GLabel 5250 2950 2    50   Input ~ 0
GNDA
Wire Wire Line
	8000 3800 8150 3800
Wire Wire Line
	1100 1950 950  1950
Wire Wire Line
	1100 2050 950  2050
Wire Wire Line
	1100 2250 950  2250
Wire Wire Line
	1100 2350 950  2350
Wire Wire Line
	1100 2450 950  2450
Wire Wire Line
	1100 2550 950  2550
Wire Wire Line
	1100 2650 950  2650
Wire Wire Line
	1100 2750 950  2750
Wire Wire Line
	1100 2950 950  2950
Wire Wire Line
	1100 3050 950  3050
Wire Wire Line
	1100 3150 950  3150
Wire Wire Line
	1100 3250 950  3250
Wire Wire Line
	5150 4350 5050 4350
Wire Wire Line
	5150 4450 5050 4450
Wire Wire Line
	5150 4550 5050 4550
Wire Wire Line
	5150 4950 5050 4950
Text GLabel 1100 2850 2    50   Input ~ 0
MUX_SELECT
Text GLabel 1100 2250 2    50   Input ~ 0
VCC_LED
Wire Wire Line
	1100 2150 950  2150
Wire Wire Line
	1100 2850 950  2850
Text GLabel 1100 3250 2    50   Input ~ 0
THERM_R_SWITCH
Text GLabel 1100 2150 2    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 5250 7500 0    50   Input ~ 0
GNDD
Text GLabel 5650 7500 2    50   Input ~ 0
GNDA
$Comp
L Ninja-qPCR:ADS122C04IPWR U?
U 1 1 6155CF7D
P 3850 2550
F 0 "U?" H 3850 3438 60  0000 C CNN
F 1 "ADS122C04IPWR" H 3850 3332 60  0000 C CNN
F 2 "Ninja-qPCR:ADS122C04IPWR" H 3850 2490 60  0001 C CNN
F 3 "" H 3850 2550 60  0000 C CNN
	1    3850 2550
	1    0    0    -1  
$EndComp
Text GLabel 2350 2250 0    50   Input ~ 0
3V3D
Text GLabel 5050 2350 2    50   Input ~ 0
GNDD
Text GLabel 2650 3150 0    50   Input ~ 0
GNDA
Text GLabel 2350 1850 0    50   Input ~ 0
3V3A
Text GLabel 5050 2150 2    50   Input ~ 0
I2C_SCL
Text GLabel 5050 2050 2    50   Input ~ 0
I2C_SDA
Text GLabel 2650 2950 0    50   Input ~ 0
3V3A
Wire Wire Line
	4850 2050 5050 2050
Wire Wire Line
	4850 2150 5050 2150
Wire Wire Line
	2850 3150 2650 3150
Wire Wire Line
	4850 2350 4950 2350
Wire Wire Line
	4850 2450 4950 2450
Wire Wire Line
	4950 2450 4950 2350
Connection ~ 4950 2350
Wire Wire Line
	4950 2350 5050 2350
Text HLabel 2650 2750 0    50   Input ~ 0
PHOTO_OUT_P
Text HLabel 2650 2650 0    50   Input ~ 0
PHOTO_OUT_N
Wire Wire Line
	2850 2750 2650 2750
Text GLabel 2650 2450 0    50   Input ~ 0
GNDA
Wire Wire Line
	2650 2950 2850 2950
Text Notes 5700 2450 2    50   ~ 0
I2C Addr\n100 0000
Text GLabel 2650 2550 0    50   Input ~ 0
THERM_MUX_OUT
Text GLabel 5000 2550 2    50   Input ~ 0
ADC_DRDY
Text GLabel 5250 3400 2    50   Input ~ 0
GNDD
Wire Wire Line
	5000 2550 4850 2550
Wire Wire Line
	5250 3400 5100 3400
Wire Wire Line
	2650 2550 2850 2550
Wire Wire Line
	2650 2450 2850 2450
Wire Wire Line
	2650 2650 2850 2650
Text GLabel 5000 2750 2    50   Input ~ 0
3V3D
Wire Wire Line
	5000 2750 4850 2750
Wire Wire Line
	6650 2000 6450 2000
Wire Wire Line
	6450 2000 6450 3300
Connection ~ 6650 2000
Wire Wire Line
	6650 1050 6650 1400
Connection ~ 6650 1400
Wire Wire Line
	6650 1400 6650 2000
Text Notes 9000 1400 0    50   ~ 0
V+
Wire Wire Line
	8550 3400 9050 3400
Wire Wire Line
	7250 1600 7250 1400
Wire Wire Line
	9050 1100 9000 1100
$Comp
L Ninja-qPCR:TS12A12511DCNR U?
U 1 1 6155CFAC
P 8950 2000
F 0 "U?" H 9750 713 60  0000 C CNN
F 1 "TS12A12511DCNR" H 9750 819 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-8" H 9750 2240 60  0001 C CNN
F 3 "" H 8950 2000 60  0000 C CNN
	1    8950 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	9050 1800 8950 1800
Wire Wire Line
	9050 1800 9050 3400
Wire Wire Line
	9150 2000 8950 2000
Connection ~ 9150 2000
Wire Wire Line
	7350 1050 7250 1050
Connection ~ 7250 1050
Wire Wire Line
	7350 2650 7250 2650
Connection ~ 9050 3400
Wire Wire Line
	9050 3400 9350 3400
Wire Wire Line
	7250 1600 7350 1600
Wire Wire Line
	7250 2000 7350 2000
Connection ~ 7250 2000
Text Notes 7900 2300 0    50   ~ 0
GAIN SWITCH
$Comp
L Ninja-qPCR:LMP7717MF_NOPB U?
U 1 1 6155CFBF
P 7950 3200
F 0 "U?" H 8594 3053 60  0000 L CNN
F 1 "LMP7717MF_NOPB" H 8594 2947 60  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 8570 3050 60  0001 C CNN
F 3 "" H 7950 3200 60  0000 C CNN
	1    7950 3200
	1    0    0    -1  
$EndComp
Text Notes 8750 3500 0    50   ~ 0
OUT
Wire Wire Line
	7750 3300 6450 3300
Connection ~ 6450 3300
Wire Wire Line
	6300 3300 6450 3300
$Comp
L Device:C C?
U 1 1 6155CFC9
P 2500 2050
F 0 "C?" H 2615 2096 50  0000 L CNN
F 1 "0.1uF" H 2615 2005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2538 1900 50  0001 C CNN
F 3 "~" H 2500 2050 50  0001 C CNN
	1    2500 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2250 2850 2250
Wire Wire Line
	2350 2250 2500 2250
Connection ~ 2500 2250
Wire Wire Line
	2500 2200 2500 2250
Wire Wire Line
	2500 1900 2500 1850
Wire Wire Line
	2350 1850 2500 1850
$Comp
L Device:C C?
U 1 1 6155CFD5
P 5100 3200
F 0 "C?" H 5215 3246 50  0000 L CNN
F 1 "0.1uF" H 5215 3155 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5138 3050 50  0001 C CNN
F 3 "~" H 5100 3200 50  0001 C CNN
	1    5100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2950 5100 2950
Wire Wire Line
	5100 3050 5100 2950
Connection ~ 5100 2950
Wire Wire Line
	5100 2950 5250 2950
Wire Wire Line
	5100 3400 5100 3350
Wire Wire Line
	5100 3400 4900 3400
Wire Wire Line
	4900 3400 4900 3150
Wire Wire Line
	4900 3150 4850 3150
Connection ~ 5100 3400
Wire Wire Line
	2500 1850 2800 1850
Wire Wire Line
	2800 1850 2800 2050
Wire Wire Line
	2800 2050 2850 2050
Connection ~ 2500 1850
$Comp
L Device:C C?
U 1 1 6155CFE8
P 8550 5650
F 0 "C?" V 8400 5500 50  0000 C CNN
F 1 "0.1uF" V 8500 5500 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8588 5500 50  0001 C CNN
F 3 "~" H 8550 5650 50  0001 C CNN
	1    8550 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 5450 8350 5450
Wire Wire Line
	8400 5650 8350 5650
Wire Wire Line
	8350 5650 8350 5450
Connection ~ 8350 5450
Wire Wire Line
	8700 5650 8800 5650
Wire Wire Line
	8800 5650 8800 5350
Connection ~ 8800 5350
Wire Wire Line
	8800 5350 8900 5350
Wire Wire Line
	8950 1300 9000 1300
Wire Wire Line
	9000 1300 9000 1100
Connection ~ 9000 1100
Wire Wire Line
	9000 1100 8950 1100
$Comp
L Ninja-qPCR:COM1305-0.032768-EXT-T-TR U?
U 1 1 6155CFFA
P 7450 5350
F 0 "U?" H 7875 5615 50  0000 C CNN
F 1 "COM1305-0.032768-EXT-T-TR" H 7875 5524 50  0000 C CNN
F 2 "Ninja-qPCR:COM1305-0.032768-EXT-T-TR" H 7450 5350 50  0001 C CNN
F 3 "" H 7450 5350 50  0001 C CNN
	1    7450 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5350 8800 5350
Wire Wire Line
	8350 5450 8900 5450
Wire Wire Line
	7200 5350 7450 5350
$Comp
L Connector:Conn_01x20_Male J?
U 1 1 6155D003
P 750 2250
F 0 "J?" H 858 3331 50  0000 C CNN
F 1 "Conn_01x20_Male" H 858 3240 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x10_Pitch1.27mm" H 750 2250 50  0001 C CNN
F 3 "~" H 750 2250 50  0001 C CNN
	1    750  2250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 6155D009
P 5450 7500
F 0 "JP?" H 5450 7705 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 5450 7614 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5450 7500 50  0001 C CNN
F 3 "~" H 5450 7500 50  0001 C CNN
	1    5450 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 7500 5600 7500
Wire Wire Line
	5250 7500 5300 7500
Text GLabel 7200 4150 2    50   Input ~ 0
PD_TH1
Text GLabel 7200 4450 2    50   Input ~ 0
PD_TH2
Wire Wire Line
	950  1750 1100 1750
Wire Wire Line
	950  1850 1100 1850
$Comp
L Device:R R_TH?
U 1 1 6155D015
P 6900 4150
F 0 "R_TH?" V 6693 4150 50  0000 C CNN
F 1 "10K" V 6784 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6830 4150 50  0001 C CNN
F 3 "~" H 6900 4150 50  0001 C CNN
	1    6900 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R_TH?
U 1 1 6155D01B
P 6900 4450
F 0 "R_TH?" V 6693 4450 50  0000 C CNN
F 1 "10K" V 6784 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6830 4450 50  0001 C CNN
F 3 "~" H 6900 4450 50  0001 C CNN
	1    6900 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 4150 7050 4150
Wire Wire Line
	7200 4450 7050 4450
Wire Wire Line
	6550 4150 6650 4150
Wire Wire Line
	6750 4450 6650 4450
Wire Wire Line
	6650 4450 6650 4150
Connection ~ 6650 4150
Wire Wire Line
	6650 4150 6750 4150
Text GLabel 1100 1950 2    50   Input ~ 0
3V3A
Text GLabel 1100 1750 2    50   Input ~ 0
PD_TH1
Text GLabel 1100 1850 2    50   Input ~ 0
PD_TH2
Text Notes 1250 900  0    50   ~ 0
NOTE : U10 pad was too big and shorten / Update footprint of U11 (smaller)
$EndSCHEMATC
