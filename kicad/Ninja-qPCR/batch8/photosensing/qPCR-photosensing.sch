EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1300 1400 2    50   Input ~ 0
GNDD
Text GLabel 1300 1500 2    50   Input ~ 0
3V3D
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
3V3D
Text GLabel 2900 1250 0    50   Input ~ 0
GNDD
Text GLabel 2900 1950 0    50   Input ~ 0
GNDA
Text GLabel 2900 2050 0    50   Input ~ 0
3V3A
Text GLabel 2900 2150 0    50   Input ~ 0
I2C_SCL
Text GLabel 2900 2350 0    50   Input ~ 0
I2C_SDA
Text GLabel 2900 2750 0    50   Input ~ 0
3V3A
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
Text GLabel 5050 1050 2    50   Input ~ 0
ADC_DRDY
Text GLabel 5050 1550 2    50   Input ~ 0
GNDD
Text GLabel 1300 2800 2    50   Input ~ 0
THERM_OUT
Text GLabel 1300 2500 2    50   Input ~ 0
ADC_DRDY
Text GLabel 1300 2600 2    50   Input ~ 0
I2C_SCL
Text GLabel 1300 2700 2    50   Input ~ 0
I2C_SDA
Text GLabel 2900 4850 0    50   Input ~ 0
PD_REF_PWM
Text HLabel 2900 4750 0    50   Input ~ 0
AMP_OUT
Text HLabel 5200 4250 2    50   Input ~ 0
PHOTO_OUT_P
Text GLabel 10600 800  0    50   Input ~ 0
3V3D
Text GLabel 10600 1300 0    50   Input ~ 0
GNDD
$Comp
L Device:C C5
U 1 1 5F5B161D
P 10750 1050
F 0 "C5" H 10865 1096 50  0000 L CNN
F 1 "0.1uF" H 10865 1005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10788 900 50  0001 C CNN
F 3 "~" H 10750 1050 50  0001 C CNN
	1    10750 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1300 10750 1300
Wire Wire Line
	10750 1300 10750 1200
Wire Wire Line
	10750 900  10750 800 
Wire Wire Line
	10750 800  10600 800 
Wire Wire Line
	2900 4750 3100 4750
Wire Wire Line
	2900 4850 3100 4850
$Comp
L Ninja-qPCR:ADA2200ARUZ U1
U 1 1 5F7FB45A
P 3100 4250
F 0 "U1" H 4100 4737 60  0000 C CNN
F 1 "ADA2200ARUZ" H 4100 4631 60  0000 C CNN
F 2 "Ninja-qPCR:ADA2200ARUZ" H 4100 4590 60  0001 C CNN
F 3 "" H 3100 4250 60  0000 C CNN
	1    3100 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FDD9D62
P 2750 4250
F 0 "R1" V 2543 4250 50  0000 C CNN
F 1 "10K" V 2634 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2680 4250 50  0001 C CNN
F 3 "~" H 2750 4250 50  0001 C CNN
	1    2750 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5FDDE2F4
P 1800 4450
F 0 "R2" V 1593 4450 50  0000 C CNN
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
Text HLabel 9450 3200 2    50   Input ~ 0
AMP_OUT
Wire Wire Line
	7150 850  7300 850 
Connection ~ 8950 3200
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
L Device:C C1
U 1 1 5FDB9DB9
P 1800 5250
F 0 "C1" V 1548 5250 50  0000 C CNN
F 1 "1uF" V 1639 5250 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1838 5100 50  0001 C CNN
F 3 "~" H 1800 5250 50  0001 C CNN
	1    1800 5250
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 5FDD2096
P 7000 1200
F 0 "C6" V 6748 1200 50  0000 C CNN
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
Wire Wire Line
	6700 1200 6700 850 
$Comp
L Device:C C7
U 1 1 5FDE1D78
P 9250 3350
F 0 "C7" V 8998 3350 50  0000 C CNN
F 1 "0.1uF" V 9089 3350 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9288 3200 50  0001 C CNN
F 3 "~" H 9250 3350 50  0001 C CNN
	1    9250 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 3350 8950 3350
Wire Wire Line
	8950 3350 8950 3200
Wire Wire Line
	9500 3350 9400 3350
$Comp
L Connector:Conn_01x04_Male JSPI1
U 1 1 5FDD1B56
P 3000 6750
F 0 "JSPI1" H 3108 7031 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3108 6940 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x02_Pitch2.54mm" H 3000 6750 50  0001 C CNN
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
Text GLabel 1300 2400 2    50   Input ~ 0
PD_REF_PWM
Text GLabel 6150 3300 0    50   Input ~ 0
PD_MUX_OUT
$Comp
L Device:R R6
U 1 1 5FE329AB
P 7000 1800
F 0 "R6" V 6793 1800 50  0000 C CNN
F 1 "R" V 6884 1800 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 6930 1800 50  0001 C CNN
F 3 "~" H 7000 1800 50  0001 C CNN
	1    7000 1800
	0    -1   1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5FE329B3
P 7000 2150
F 0 "C4" V 6748 2150 50  0000 C CNN
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
Text GLabel 1300 1800 2    50   Input ~ 0
3V3A
Text GLabel 5200 4350 2    50   Input ~ 0
XOUT
Text GLabel 1800 6700 2    50   Input ~ 0
XOUT
Text GLabel 2500 4550 0    50   Input ~ 0
CLKIN
Wire Wire Line
	2500 4550 3100 4550
Text GLabel 1800 6600 2    50   Input ~ 0
CLKIN
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 606F1692
P 1400 6600
F 0 "J3" H 1508 6781 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1508 6690 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 1400 6600 50  0001 C CNN
F 3 "~" H 1400 6600 50  0001 C CNN
	1    1400 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6600 1800 6600
Wire Wire Line
	1800 6700 1600 6700
Text GLabel 6850 3900 0    50   Input ~ 0
3V3D
Wire Wire Line
	8600 3200 8950 3200
Text GLabel 6850 3200 0    50   Input ~ 0
GNDA
Wire Wire Line
	6850 3200 7000 3200
Wire Wire Line
	6300 3300 7000 3300
Text GLabel 9200 1400 2    50   Input ~ 0
3V3D
Text GLabel 1300 1600 2    50   Input ~ 0
-1V
Text GLabel 7600 2000 0    50   Input ~ 0
-1V
$Comp
L Device:R R5
U 1 1 606BE3B5
P 9300 1800
F 0 "R5" V 9093 1800 50  0000 C CNN
F 1 "10K" V 9184 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9230 1800 50  0001 C CNN
F 3 "~" H 9300 1800 50  0001 C CNN
	1    9300 1800
	0    -1   -1   0   
$EndComp
Text GLabel 9550 1800 2    50   Input ~ 0
-1V
Wire Wire Line
	6150 3300 6300 3300
Connection ~ 6300 3300
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
Text HLabel 2900 1750 0    50   Input ~ 0
PHOTO_OUT_P
Text HLabel 2900 1650 0    50   Input ~ 0
PHOTO_OUT_N
Wire Wire Line
	2900 1650 3100 1650
Wire Wire Line
	3100 1750 2900 1750
Text GLabel 2900 1550 0    50   Input ~ 0
THERM_OUT
Wire Wire Line
	2900 1450 3100 1450
$Comp
L Ninja-qPCR:TS5A9411DCKR U4
U 1 1 606C0A32
P 8300 1700
F 0 "U4" H 8300 2388 60  0000 C CNN
F 1 "TS5A9411DCKR" H 8300 2282 60  0000 C CNN
F 2 "Ninja-qPCR:TS5A9411DCKR" H 8300 1640 60  0001 C CNN
F 3 "" H 8300 1700 60  0000 C CNN
	1    8300 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7700 1800 7300 1800
Connection ~ 7300 1800
Wire Wire Line
	9200 1400 8900 1400
Wire Wire Line
	6700 1800 6300 1800
Connection ~ 6700 1800
Wire Wire Line
	6300 1800 6300 3300
Wire Wire Line
	7700 1600 7300 1600
Wire Wire Line
	9050 1600 9050 1800
Wire Wire Line
	9050 1800 9150 1800
Wire Wire Line
	9050 1600 9300 1600
Wire Wire Line
	9550 1800 9450 1800
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
	8950 3200 8950 1800
Wire Wire Line
	8950 1800 8900 1800
Wire Wire Line
	9050 1600 8900 1600
Connection ~ 9050 1600
Text Notes 8850 1200 0    50   ~ 0
IN=High : COM<->NO (Low gain)\nIN=Low : COM<->NC (High gain)
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
Text Notes 1200 6350 0    50   ~ 0
ADA2200 Clock\n(For external X’tal circuit)
Text Notes 750  900  0    50   ~ 0
Main <-> Photosensing
Wire Wire Line
	8950 3200 9450 3200
$Comp
L Device:R R4
U 1 1 606CEB7F
P 7000 850
F 0 "R4" V 6793 850 50  0000 C CNN
F 1 "R" V 6884 850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_1x02_Pitch2.54mm" V 6930 850 50  0001 C CNN
F 3 "~" H 7000 850 50  0001 C CNN
	1    7000 850 
	0    -1   1    0   
$EndComp
Wire Wire Line
	6850 3900 7000 3900
$Comp
L Ninja-qPCR:AD8605ARTZ-R2 U3
U 1 1 606B7AFD
P 7000 3200
F 0 "U3" H 7800 3587 60  0000 C CNN
F 1 "AD8605ARTZ-R2" H 7800 3481 60  0000 C CNN
F 2 "Ninja-qPCR:AD8605ARTZ-R2" H 7800 3440 60  0001 C CNN
F 3 "" H 7000 3200 60  0000 C CNN
	1    7000 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1600 7300 1200
Connection ~ 7300 1200
Text GLabel 8450 5250 2    50   Input ~ 0
GNDD
Text GLabel 8450 5150 2    50   Input ~ 0
3V3D
Text GLabel 6700 5450 0    50   Input ~ 0
CLKIN
$Comp
L Device:R R3
U 1 1 606F3DDA
P 7100 5150
F 0 "R3" V 6893 5150 50  0000 C CNN
F 1 "10K" V 6984 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7030 5150 50  0001 C CNN
F 3 "~" H 7100 5150 50  0001 C CNN
	1    7100 5150
	0    1    1    0   
$EndComp
Text GLabel 6700 5150 0    50   Input ~ 0
3V3D
Wire Wire Line
	7600 2000 7700 2000
Wire Wire Line
	7300 2150 7300 2450
Wire Wire Line
	7300 2450 7600 2450
Connection ~ 7300 2150
Wire Wire Line
	7300 850  7600 850 
Connection ~ 7300 850 
Wire Wire Line
	6300 1800 6300 850 
Wire Wire Line
	6300 850  6700 850 
Connection ~ 6300 1800
Connection ~ 6700 850 
$Comp
L Connector:Conn_01x04_Male J8
U 1 1 6070474E
P 9800 2650
F 0 "J8" H 9908 2931 50  0000 C CNN
F 1 "Conn_01x04_Male" H 9908 2840 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04_Pitch2.54mm" H 9800 2650 50  0001 C CNN
F 3 "~" H 9800 2650 50  0001 C CNN
	1    9800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2850 10000 2850
Wire Wire Line
	10250 2550 10000 2550
Text GLabel 10250 2650 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10250 2650 10000 2650
Text GLabel 10250 2750 2    50   Input ~ 0
PD_MUX_OUT
Wire Wire Line
	10250 2750 10000 2750
Text Notes 9800 2300 0    50   ~ 0
External gain resistors
$Comp
L Device:Jumper JP1
U 1 1 606E3CBF
P 7100 5450
F 0 "JP1" V 7054 5577 50  0000 L CNN
F 1 "Jumper" V 7145 5577 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 7100 5450 50  0001 C CNN
F 3 "~" H 7100 5450 50  0001 C CNN
	1    7100 5450
	-1   0    0    1   
$EndComp
Text HLabel 7600 850  2    50   Input ~ 0
GAIN_LARGE
Text HLabel 7600 2450 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10250 2850 2    50   Input ~ 0
GAIN_SMALL
Text HLabel 10250 2550 2    50   Input ~ 0
GAIN_LARGE
Text HLabel 1300 2900 2    50   Input ~ 0
AMP_GAIN_SW
Text HLabel 9300 1600 2    50   Input ~ 0
AMP_GAIN_SW
Text GLabel 9500 3350 2    50   Input ~ 0
GNDA
Text GLabel 3450 6750 2    50   Input ~ 0
DEMOD_SPI_SCLK
Wire Wire Line
	1950 4450 2050 4450
$Comp
L Device:C C2
U 1 1 60786D85
P 1800 4700
F 0 "C2" V 1548 4700 50  0000 C CNN
F 1 "10uF" V 1639 4700 50  0000 C CNN
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
$Comp
L Ninja-qPCR:COM1305-0.032768-EXT-T-TR U5
U 1 1 607778D7
P 7500 5150
F 0 "U5" H 7925 5415 50  0000 C CNN
F 1 "COM1305-0.032768-EXT-T-TR" H 7925 5324 50  0000 C CNN
F 2 "Ninja-qPCR:COM1305-0.032768-EXT-T-TR" H 7500 5150 50  0001 C CNN
F 3 "" H 7500 5150 50  0001 C CNN
	1    7500 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5150 8350 5150
Wire Wire Line
	8450 5250 8350 5250
Wire Wire Line
	7500 5250 7450 5250
Wire Wire Line
	7450 5250 7450 5450
Wire Wire Line
	7450 5450 7400 5450
Wire Wire Line
	7250 5150 7500 5150
Wire Wire Line
	6950 5150 6700 5150
Wire Wire Line
	6800 5450 6700 5450
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 6084E5A5
P 4800 6750
F 0 "J4" H 4908 7031 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4908 6940 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04_Pitch2.54mm" H 4800 6750 50  0001 C CNN
F 3 "~" H 4800 6750 50  0001 C CNN
	1    4800 6750
	1    0    0    -1  
$EndComp
Text GLabel 6850 3800 0    50   Input ~ 0
-1V
$Sheet
S 750  7300 1650 350 
U 60AF0518
F0 "Sheet60AF0517" 50
F1 "fileMUX.sch" 50
$EndSheet
Text GLabel 1300 1700 2    50   Input ~ 0
GNDA
Text GLabel 1300 1900 2    50   Input ~ 0
MUX_S3
Text GLabel 1300 2000 2    50   Input ~ 0
MUX_S2
Text GLabel 1300 2100 2    50   Input ~ 0
MUX_S1
Text GLabel 1300 2200 2    50   Input ~ 0
MUX_S0
Wire Wire Line
	2900 1550 3100 1550
Text GLabel 2900 1450 0    50   Input ~ 0
GNDA
Text GLabel 5050 1450 2    50   Input ~ 0
GNDA
Wire Wire Line
	2900 2750 3100 2750
Text GLabel 2900 2950 0    50   Input ~ 0
3V3D
Wire Wire Line
	2900 2950 3100 2950
Text Notes 2150 1350 0    50   ~ 0
I2C Address\n100 0000
Wire Wire Line
	6850 3800 7000 3800
$Comp
L Connector:Conn_01x16_Male J?
U 1 1 60AFBF87
P 950 2100
F 0 "J?" H 1058 2981 50  0000 C CNN
F 1 "Conn_01x16_Male" H 1058 2890 50  0000 C CNN
F 2 "" H 950 2100 50  0001 C CNN
F 3 "~" H 950 2100 50  0001 C CNN
	1    950  2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1400 1150 1400
Wire Wire Line
	1300 1500 1150 1500
Wire Wire Line
	1300 1600 1150 1600
Wire Wire Line
	1300 1700 1150 1700
Wire Wire Line
	1300 1800 1150 1800
Wire Wire Line
	1300 1900 1150 1900
Wire Wire Line
	1300 2000 1150 2000
Wire Wire Line
	1300 2100 1150 2100
Wire Wire Line
	1300 2200 1150 2200
Wire Wire Line
	1300 2300 1150 2300
Wire Wire Line
	1300 2400 1150 2400
Wire Wire Line
	1300 2500 1150 2500
Wire Wire Line
	1300 2600 1150 2600
Wire Wire Line
	1300 2700 1150 2700
Wire Wire Line
	1300 2800 1150 2800
Wire Wire Line
	1300 2900 1150 2900
Text Notes 3950 3250 0    50   ~ 0
ADC
Text Notes 8050 2300 0    50   ~ 0
Gain Switch
Text Notes 7650 4200 0    50   ~ 0
OpAmp
Wire Wire Line
	5200 4150 5100 4150
Wire Wire Line
	5200 4250 5100 4250
Wire Wire Line
	5200 4350 5100 4350
Wire Wire Line
	5200 4750 5100 4750
Wire Wire Line
	5050 1050 4900 1050
Wire Wire Line
	5050 1450 4900 1450
Wire Wire Line
	5050 1550 4900 1550
Text GLabel 1300 2300 2    50   Input ~ 0
MUX_SELECT
$EndSCHEMATC
