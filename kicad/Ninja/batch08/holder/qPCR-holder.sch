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
L power:GND #PWR01
U 1 1 60DA6D30
P 4750 4400
F 0 "#PWR01" H 4750 4150 50  0001 C CNN
F 1 "GND" H 4755 4227 50  0000 C CNN
F 2 "" H 4750 4400 50  0001 C CNN
F 3 "" H 4750 4400 50  0001 C CNN
	1    4750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4400 4750 4350
$Comp
L Jumper:Jumper_2_Bridged JP1
U 1 1 60DA7283
P 4550 4100
F 0 "JP1" H 4550 4295 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 4550 4204 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged2Bar_Pad1.0x1.5mm" H 4550 4100 50  0001 C CNN
F 3 "~" H 4550 4100 50  0001 C CNN
	1    4550 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4350 4350 4350
Connection ~ 4750 4350
Wire Wire Line
	4750 4100 4750 4350
Wire Wire Line
	4350 4100 4350 4350
$Comp
L Mechanical:Fiducial FID1
U 1 1 60DA829F
P 5000 4150
F 0 "FID1" H 5085 4196 50  0000 L CNN
F 1 "Fiducial" H 5085 4105 50  0000 L CNN
F 2 "Fiducials:Fiducial_0.5mm_Dia_1mm_Outer" H 5000 4150 50  0001 C CNN
F 3 "~" H 5000 4150 50  0001 C CNN
	1    5000 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
