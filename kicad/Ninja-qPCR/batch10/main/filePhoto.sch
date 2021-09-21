EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 2900 4850 0    50   Input ~ 0
PD_REF_PWM
Text HLabel 2900 4750 0    50   Input ~ 0
AMP_OUT
Text HLabel 5200 4250 2    50   Input ~ 0
PHOTO_OUT_P
Text GLabel 10700 3550 0    50   Input ~ 0
3V3D
Text GLabel 10700 4050 0    50   Input ~ 0
GNDD
$Comp
L Device:C C9
U 1 1 614DBA0B
P 10850 3800
F 0 "C9" H 10965 3846 50  0000 L CNN
F 1 "0.1uF" H 10965 3755 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10888 3650 50  0001 C CNN
F 3 "~" H 10850 3800 50  0001 C CNN
	1    10850 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 4050 10850 4050
Wire Wire Line
	10850 4050 10850 3950
Wire Wire Line
	10850 3650 10850 3550
Wire Wire Line
	10850 3550 10700 3550
Wire Wire Line
	2900 4750 3100 4750
Wire Wire Line
	2900 4850 3100 4850
$Comp
L Ninja-qPCR:ADA2200ARUZ U1
U 1 1 614DBA17
P 3100 4250
F 0 "U1" H 4100 4737 60  0000 C CNN
F 1 "ADA2200ARUZ" H 4100 4631 60  0000 C CNN
F 2 "Ninja-qPCR:ADA2200ARUZ" H 4100 4590 60  0001 C CNN
F 3 "" H 3100 4250 60  0000 C CNN
	1    3100 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 614DBA1D
P 2750 4250
F 0 "R11" V 2543 4250 50  0000 C CNN
F 1 "10K" V 2634 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2680 4250 50  0001 C CNN
F 3 "~" H 2750 4250 50  0001 C CNN
	1    2750 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 614DBA23
P 1800 4450
F 0 "R10" V 1593 4450 50  0000 C CNN
F 1 "10K" V 1684 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1730 4450 50  0001 C CNN
F 3 "~" H 1800 4450 50  0001 C CNN
	1    1800 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 4950 1750 4950
Wire Wire Line
	3100 4250 2900 4250
Text GLabel 2500 4250 0    50   Input ~ 0
3V3D
Wire Wire Line
	2500 4250 2600 4250
Text GLabel 1750 4950 0    50   Input ~ 0
DEMOD_SPI_SCLK
Text HLabel 9900 3200 2    50   Input ~ 0
AMP_OUT
Wire Wire Line
	7150 850  7300 850 
Connection ~ 9400 3200
Wire Wire Line
	6850 850  6700 850 
Wire Wire Line
	3100 4350 2600 4350
Wire Wire Line
	3100 5050 2900 5050
Text GLabel 2600 4350 0    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 2900 5050 0    50   Input ~ 0
DEMOD_SPI_SDIO
Wire Wire Line
	3100 5150 2900 5150
NoConn ~ 2900 5150
$Comp
L Device:C C2
U 1 1 614DBA38
P 1800 5250
F 0 "C2" V 1650 5100 50  0000 C CNN
F 1 "4.7uF" V 1750 5100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1838 5100 50  0001 C CNN
F 3 "~" H 1800 5250 50  0001 C CNN
	1    1800 5250
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 614DBA3E
P 7000 1200
F 0 "C5" V 6748 1200 50  0000 C CNN
F 1 "22pF" V 6839 1200 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7038 1050 50  0001 C CNN
F 3 "~" H 7000 1200 50  0001 C CNN
	1    7000 1200
	0    1    -1   0   
$EndComp
Wire Wire Line
	7150 1200 7300 1200
Wire Wire Line
	7300 1200 7300 850 
Wire Wire Line
	6850 1200 6700 1200
$Comp
L Device:C C8
U 1 1 614DBA47
P 9700 3350
F 0 "C8" V 9448 3350 50  0000 C CNN
F 1 "0.1uF" V 9539 3350 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9738 3200 50  0001 C CNN
F 3 "~" H 9700 3350 50  0001 C CNN
	1    9700 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	9550 3350 9400 3350
Wire Wire Line
	9400 3350 9400 3200
Wire Wire Line
	9950 3350 9850 3350
$Comp
L Connector:Conn_01x04_Male JSPI1
U 1 1 614DBA50
P 3000 6750
F 0 "JSPI1" H 3108 7031 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3108 6940 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02_Pitch2.54mm" H 3000 6750 50  0001 C CNN
F 3 "~" H 3000 6750 50  0001 C CNN
	1    3000 6750
	1    0    0    -1  
$EndComp
Text GLabel 3450 6950 2    50   Input ~ 0
DEMOD_SPI_CS
Text GLabel 3450 6650 2    50   Input ~ 0
GNDD
Text GLabel 3450 6850 2    50   Input ~ 0
DEMOD_SPI_SDIO
Wire Wire Line
	3450 6650 3200 6650
Wire Wire Line
	3200 6750 3450 6750
Wire Wire Line
	3450 6850 3200 6850
Wire Wire Line
	3200 6950 3450 6950
Text GLabel 6350 3100 0    50   Input ~ 0
PD_MUX_OUT
$Comp
L Device:R R13
U 1 1 614DBA5E
P 7000 1800
F 0 "R13" V 6793 1800 50  0000 C CNN
F 1 "1M" V 6884 1800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" V 6930 1800 50  0001 C CNN
F 3 "~" H 7000 1800 50  0001 C CNN
	1    7000 1800
	0    -1   1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 614DBA64
P 7000 2150
F 0 "C6" V 6748 2150 50  0000 C CNN
F 1 "22pF" V 6839 2150 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7038 2000 50  0001 C CNN
F 3 "~" H 7000 2150 50  0001 C CNN
	1    7000 2150
	0    1    -1   0   
$EndComp
Wire Wire Line
	7150 2150 7300 2150
Wire Wire Line
	7300 2150 7300 1800
Wire Wire Line
	6850 2150 6700 2150
Wire Wire Line
	6700 2150 6700 1800
Text Notes 6500 2600 0    50   ~ 0
SMALL GAIN FOR\nSTRONG SIGNAL
Wire Wire Line
	7300 1800 7150 1800
Wire Wire Line
	6700 1800 6850 1800
Text GLabel 5200 4350 2    50   Input ~ 0
XOUT
Text GLabel 2500 4550 0    50   Input ~ 0
CLKIN
Wire Wire Line
	2500 4550 3100 4550
Text GLabel 8050 2800 0    50   Input ~ 0
3V3D
Text GLabel 7650 3300 0    50   Input ~ 0
GNDA
Wire Wire Line
	7650 3300 7800 3300
Text GLabel 9300 1200 2    50   Input ~ 0
3V3D
Text GLabel 9100 900  2    50   Input ~ 0
-1V
$Comp
L Device:R R15
U 1 1 614DBA79
P 9450 2000
F 0 "R15" V 9243 2000 50  0000 C CNN
F 1 "10K" V 9334 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9380 2000 50  0001 C CNN
F 3 "~" H 9450 2000 50  0001 C CNN
	1    9450 2000
	0    -1   -1   0   
$EndComp
Text GLabel 9700 2000 2    50   Input ~ 0
-1V
Text Notes 5050 6350 0    50   ~ 0
Debug pins\n(Photo measurement)
Text GLabel 5450 6850 2    50   Input ~ 0
PD_MUX_OUT
Text HLabel 5450 6950 2    50   Input ~ 0
AMP_OUT
Text HLabel 5200 4150 2    50   Input ~ 0
PHOTO_OUT_N
Text HLabel 5450 6650 2    50   Input ~ 0
PHOTO_OUT_N
Text HLabel 5450 6750 2    50   Input ~ 0
PHOTO_OUT_P
Wire Wire Line
	9300 1200 9000 1200
Wire Wire Line
	9200 1800 9200 2000
Wire Wire Line
	9200 2000 9300 2000
Wire Wire Line
	9200 1800 9450 1800
Wire Wire Line
	9700 2000 9600 2000
Text GLabel 5200 4750 2    50   Input ~ 0
GNDD
Text GLabel 1550 4450 0    50   Input ~ 0
3V3D
Wire Wire Line
	1550 4450 1650 4450
Text GLabel 2900 5550 0    50   Input ~ 0
3V3D
Wire Wire Line
	2900 5550 3100 5550
Text GLabel 1500 5250 0    50   Input ~ 0
GNDA
Wire Wire Line
	1500 5250 1650 5250
Wire Wire Line
	1950 5250 3100 5250
Text GLabel 2900 4650 0    50   Input ~ 0
GNDA
Wire Wire Line
	2900 4650 3100 4650
Wire Wire Line
	5450 6650 5000 6650
Wire Wire Line
	5450 6750 5000 6750
Wire Wire Line
	5450 6950 5000 6950
Wire Wire Line
	5450 6850 5000 6850
Text Notes 2800 6350 0    50   ~ 0
ADA2200 SPI debug
Wire Wire Line
	9400 3200 9900 3200
$Comp
L Device:R R12
U 1 1 614DBA9C
P 7000 850
F 0 "R12" V 6793 850 50  0000 C CNN
F 1 "10M" V 6884 850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" V 6930 850 50  0001 C CNN
F 3 "~" H 7000 850 50  0001 C CNN
	1    7000 850 
	0    -1   1    0   
$EndComp
Wire Wire Line
	8050 2800 8200 2800
Connection ~ 7300 1200
Text GLabel 8950 5250 2    50   Input ~ 0
GNDD
Text GLabel 8950 5150 2    50   Input ~ 0
3V3D
Text GLabel 6700 5450 0    50   Input ~ 0
CLKIN
$Comp
L Device:R R14
U 1 1 614DBAA7
P 7100 5150
F 0 "R14" V 6893 5150 50  0000 C CNN
F 1 "10K" V 6984 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7030 5150 50  0001 C CNN
F 3 "~" H 7100 5150 50  0001 C CNN
	1    7100 5150
	0    1    1    0   
$EndComp
Text GLabel 6700 5150 0    50   Input ~ 0
3V3D
Wire Wire Line
	7300 2150 7300 2450
Connection ~ 7300 2150
$Comp
L Connector:Conn_01x04_Male J12
U 1 1 614DBAB0
P 10100 1250
F 0 "J12" H 10208 1531 50  0000 C CNN
F 1 "Conn_01x04_Male" H 10208 1440 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 10100 1250 50  0001 C CNN
F 3 "~" H 10100 1250 50  0001 C CNN
	1    10100 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1450 10300 1450
Wire Wire Line
	10550 1150 10300 1150
Text GLabel 10550 1250 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10550 1250 10300 1250
Text GLabel 10550 1350 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10550 1350 10300 1350
Text Notes 10100 900  0    50   ~ 0
External gain resistors
Text HLabel 7400 850  2    50   Input ~ 0
GAIN_LARGE
Text HLabel 7400 2450 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10550 1450 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10550 1150 2    50   Input ~ 0
GAIN_LARGE
Text HLabel 9450 1800 2    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 9950 3350 2    50   Input ~ 0
GNDA
Text GLabel 3450 6750 2    50   Input ~ 0
DEMOD_SPI_SCLK
Wire Wire Line
	1950 4450 2050 4450
$Comp
L Device:C C1
U 1 1 614DBACB
P 1800 4700
F 0 "C1" V 1650 4550 50  0000 C CNN
F 1 "4.7uF" V 1750 4550 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1838 4550 50  0001 C CNN
F 3 "~" H 1800 4700 50  0001 C CNN
	1    1800 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 4700 2050 4700
Wire Wire Line
	2050 4700 2050 4450
Connection ~ 2050 4450
Wire Wire Line
	2050 4450 3100 4450
Text GLabel 1550 4700 0    50   Input ~ 0
GNDD
Wire Wire Line
	1550 4700 1650 4700
Wire Wire Line
	7500 5250 7450 5250
Wire Wire Line
	7450 5250 7450 5450
Wire Wire Line
	6950 5150 6700 5150
$Comp
L Connector:Conn_01x04_Male J11
U 1 1 614DBADC
P 4800 6750
F 0 "J11" H 4908 7031 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4908 6940 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 4800 6750 50  0001 C CNN
F 3 "~" H 4800 6750 50  0001 C CNN
	1    4800 6750
	1    0    0    -1  
$EndComp
Text GLabel 8050 3600 0    50   Input ~ 0
-1V
Text GLabel 6600 3950 0    50   Input ~ 0
3V3A
Text GLabel 5300 2750 2    50   Input ~ 0
GNDA
Wire Wire Line
	8050 3600 8200 3600
Wire Wire Line
	5200 4150 5100 4150
Wire Wire Line
	5200 4250 5100 4250
Wire Wire Line
	5200 4350 5100 4350
Wire Wire Line
	5200 4750 5100 4750
Text GLabel 5300 7300 0    50   Input ~ 0
GNDD
Text GLabel 5700 7300 2    50   Input ~ 0
GNDA
Text Notes 200  7750 0    50   ~ 0
Use AGND and DGND  https://www.zuken.co.jp/club_Z/z/product/BD/019/pro_130221_1.html?fbclid=IwAR0Fud5uWcRWMC9uykssyA-G8J9CSF2g4TS7U_EDWa5E4txVfpM9rxRD7ok
$Comp
L Ninja-qPCR:ADS122C04IPWR U2
U 1 1 614DBB03
P 3900 2350
F 0 "U2" H 3900 3238 60  0000 C CNN
F 1 "ADS122C04IPWR" H 3900 3132 60  0000 C CNN
F 2 "Ninja-qPCR:ADS122C04IPWR" H 3900 2290 60  0001 C CNN
F 3 "" H 3900 2350 60  0000 C CNN
	1    3900 2350
	1    0    0    -1  
$EndComp
Text GLabel 2400 2050 0    50   Input ~ 0
3V3D
Text GLabel 5100 2150 2    50   Input ~ 0
GNDD
Text GLabel 2700 2950 0    50   Input ~ 0
GNDA
Text GLabel 2400 1650 0    50   Input ~ 0
3V3A
Text GLabel 5100 1950 2    50   Input ~ 0
I2C_SCL
Text GLabel 5100 1850 2    50   Input ~ 0
I2C_SDA
Text GLabel 2700 2750 0    50   Input ~ 0
3V3A
Wire Wire Line
	4900 1850 5100 1850
Wire Wire Line
	4900 1950 5100 1950
Wire Wire Line
	2900 2950 2700 2950
Wire Wire Line
	4900 2150 5000 2150
Wire Wire Line
	4900 2250 5000 2250
Wire Wire Line
	5000 2250 5000 2150
Connection ~ 5000 2150
Wire Wire Line
	5000 2150 5100 2150
Text HLabel 2700 2550 0    50   Input ~ 0
PHOTO_OUT_P
Text HLabel 2700 2450 0    50   Input ~ 0
PHOTO_OUT_N
Wire Wire Line
	2900 2550 2700 2550
Text GLabel 2700 2250 0    50   Input ~ 0
GNDA
Wire Wire Line
	2700 2750 2900 2750
Text Notes 5750 2250 2    50   ~ 0
I2C Addr\n100 0000
Text GLabel 2700 2350 0    50   Input ~ 0
THERM_MUX_OUT
Text GLabel 5050 2350 2    50   Input ~ 0
ADC_DRDY
Text GLabel 5300 3200 2    50   Input ~ 0
GNDD
Wire Wire Line
	5050 2350 4900 2350
Wire Wire Line
	5300 3200 5150 3200
Wire Wire Line
	2700 2350 2900 2350
Wire Wire Line
	2700 2250 2900 2250
Wire Wire Line
	2700 2450 2900 2450
Text GLabel 5050 2550 2    50   Input ~ 0
3V3D
Wire Wire Line
	5050 2550 4900 2550
Wire Wire Line
	6700 1800 6500 1800
Wire Wire Line
	6500 1800 6500 3100
Connection ~ 6700 1800
Wire Wire Line
	6700 850  6700 1200
Connection ~ 6700 1200
Wire Wire Line
	6700 1200 6700 1800
Text Notes 9050 1200 0    50   ~ 0
V+
Wire Wire Line
	8600 3200 9100 3200
Wire Wire Line
	7300 1400 7300 1200
Wire Wire Line
	9100 900  9050 900 
$Comp
L Ninja-qPCR:TS12A12511DCNR U5
U 1 1 614DBB32
P 9000 1800
F 0 "U5" H 9800 513 60  0000 C CNN
F 1 "TS12A12511DCNR" H 9800 619 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-8" H 9800 2040 60  0001 C CNN
F 3 "" H 9000 1800 60  0000 C CNN
	1    9000 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 1600 9000 1600
Wire Wire Line
	9100 1600 9100 3200
Wire Wire Line
	9200 1800 9000 1800
Connection ~ 9200 1800
Wire Wire Line
	7400 850  7300 850 
Connection ~ 7300 850 
Wire Wire Line
	7400 2450 7300 2450
Connection ~ 9100 3200
Wire Wire Line
	9100 3200 9400 3200
Wire Wire Line
	7300 1400 7400 1400
Wire Wire Line
	7300 1800 7400 1800
Connection ~ 7300 1800
Text Notes 7950 2100 0    50   ~ 0
GAIN SWITCH
$Comp
L Ninja-qPCR:LMP7717MF_NOPB U4
U 1 1 614DBB45
P 8000 3000
F 0 "U4" H 8644 2853 60  0000 L CNN
F 1 "LMP7717MF_NOPB" H 8644 2747 60  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 8620 2850 60  0001 C CNN
F 3 "" H 8000 3000 60  0000 C CNN
	1    8000 3000
	1    0    0    -1  
$EndComp
Text Notes 8800 3300 0    50   ~ 0
OUT
Wire Wire Line
	7800 3100 6500 3100
Connection ~ 6500 3100
Wire Wire Line
	6350 3100 6500 3100
$Comp
L Device:C C3
U 1 1 614DBB4F
P 2550 1850
F 0 "C3" H 2665 1896 50  0000 L CNN
F 1 "0.1uF" H 2665 1805 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2588 1700 50  0001 C CNN
F 3 "~" H 2550 1850 50  0001 C CNN
	1    2550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2050 2900 2050
Wire Wire Line
	2400 2050 2550 2050
Connection ~ 2550 2050
Wire Wire Line
	2550 2000 2550 2050
Wire Wire Line
	2550 1700 2550 1650
Wire Wire Line
	2400 1650 2550 1650
$Comp
L Device:C C4
U 1 1 614DBB5B
P 5150 3000
F 0 "C4" H 5265 3046 50  0000 L CNN
F 1 "0.1uF" H 5265 2955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5188 2850 50  0001 C CNN
F 3 "~" H 5150 3000 50  0001 C CNN
	1    5150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2750 5150 2750
Wire Wire Line
	5150 2850 5150 2750
Connection ~ 5150 2750
Wire Wire Line
	5150 2750 5300 2750
Wire Wire Line
	5150 3200 5150 3150
Wire Wire Line
	5150 3200 4950 3200
Wire Wire Line
	4950 3200 4950 2950
Wire Wire Line
	4950 2950 4900 2950
Connection ~ 5150 3200
Wire Wire Line
	2550 1650 2850 1650
Wire Wire Line
	2850 1650 2850 1850
Wire Wire Line
	2850 1850 2900 1850
Connection ~ 2550 1650
$Comp
L Device:C C7
U 1 1 614DBB6E
P 8600 5450
F 0 "C7" V 8450 5300 50  0000 C CNN
F 1 "0.1uF" V 8550 5300 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8638 5300 50  0001 C CNN
F 3 "~" H 8600 5450 50  0001 C CNN
	1    8600 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 5250 8400 5250
Wire Wire Line
	8450 5450 8400 5450
Wire Wire Line
	8400 5450 8400 5250
Connection ~ 8400 5250
Wire Wire Line
	8750 5450 8850 5450
Wire Wire Line
	8850 5450 8850 5150
Connection ~ 8850 5150
Wire Wire Line
	8850 5150 8950 5150
Wire Wire Line
	9000 1100 9050 1100
Wire Wire Line
	9050 1100 9050 900 
Connection ~ 9050 900 
Wire Wire Line
	9050 900  9000 900 
$Comp
L Ninja-qPCR:COM1305-0.032768-EXT-T-TR U3
U 1 1 614DBB80
P 7500 5150
F 0 "U3" H 7925 5415 50  0000 C CNN
F 1 "COM1305-0.032768-EXT-T-TR" H 7925 5324 50  0000 C CNN
F 2 "Ninja-qPCR:COM1305-0.032768-EXT-T-TR" H 7500 5150 50  0001 C CNN
F 3 "" H 7500 5150 50  0001 C CNN
	1    7500 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 5150 8850 5150
Wire Wire Line
	8400 5250 8950 5250
Wire Wire Line
	7250 5150 7500 5150
$Comp
L Jumper:SolderJumper_2_Bridged JP1
U 1 1 614DBB8F
P 5500 7300
F 0 "JP1" H 5500 7505 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 5500 7414 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5500 7300 50  0001 C CNN
F 3 "~" H 5500 7300 50  0001 C CNN
	1    5500 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 7300 5650 7300
Wire Wire Line
	5300 7300 5350 7300
Text GLabel 7250 3950 2    50   Input ~ 0
PD_TH1
Text GLabel 7250 4250 2    50   Input ~ 0
PD_TH2
$Comp
L Device:R R_TH1
U 1 1 614DBB9B
P 6950 3950
F 0 "R_TH1" V 6743 3950 50  0000 C CNN
F 1 "10K" V 6834 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6880 3950 50  0001 C CNN
F 3 "~" H 6950 3950 50  0001 C CNN
	1    6950 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R_TH2
U 1 1 614DBBA1
P 6950 4250
F 0 "R_TH2" V 6743 4250 50  0000 C CNN
F 1 "10K" V 6834 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6880 4250 50  0001 C CNN
F 3 "~" H 6950 4250 50  0001 C CNN
	1    6950 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	7250 3950 7100 3950
Wire Wire Line
	7250 4250 7100 4250
Wire Wire Line
	6600 3950 6700 3950
Wire Wire Line
	6800 4250 6700 4250
Wire Wire Line
	6700 4250 6700 3950
Connection ~ 6700 3950
Wire Wire Line
	6700 3950 6800 3950
Text Notes 1300 700  0    50   ~ 0
NOTE : U10 pad was too big and shorten / Update footprint of U11 (smaller)
Wire Wire Line
	6700 5450 7450 5450
$EndSCHEMATC
