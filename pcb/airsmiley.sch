EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Air Smiley"
Date "2021-02-13"
Rev "v1"
Comp "HTL Weiz"
Comment1 "Christoph B. Wurzinger"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 5F920133
P 3400 3550
F 0 "U1" H 3550 2800 50  0000 C CNN
F 1 "WeMos_D1_mini" H 3800 4300 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 3400 2400 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 1550 2400 50  0001 C CNN
	1    3400 3550
	1    0    0    -1  
$EndComp
Text Notes 2450 7200 0    50   ~ 0
http://www.esp8266learning.com/ccs811-digital-gas-sensor-and-esp8266-example.php\nhttp://www.esp8266learning.com/some-neopixel-examples.php\nhttp://www.esp8266learning.com/wemos-mini-dht-pro-example.php\nhttp://www.esp8266learning.com/wemos-oled-shield-example.php
$Comp
L Connector_Generic:Conn_01x05 J_CCS811
U 1 1 5F9238C7
P 6400 2150
F 0 "J_CCS811" H 6480 2192 50  0000 L CNN
F 1 "Conn_01x05" H 6480 2101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 6400 2150 50  0001 C CNN
F 3 "~" H 6400 2150 50  0001 C CNN
	1    6400 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F924736
P 3400 4350
F 0 "#PWR0101" H 3400 4100 50  0001 C CNN
F 1 "GND" H 3405 4177 50  0000 C CNN
F 2 "" H 3400 4350 50  0001 C CNN
F 3 "" H 3400 4350 50  0001 C CNN
	1    3400 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 5F9254F4
P 3500 2750
F 0 "#PWR0102" H 3500 2600 50  0001 C CNN
F 1 "+3V3" H 3515 2923 50  0000 C CNN
F 2 "" H 3500 2750 50  0001 C CNN
F 3 "" H 3500 2750 50  0001 C CNN
	1    3500 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5F925BFC
P 3300 2750
F 0 "#PWR0103" H 3300 2600 50  0001 C CNN
F 1 "+5V" H 3315 2923 50  0000 C CNN
F 2 "" H 3300 2750 50  0001 C CNN
F 3 "" H 3300 2750 50  0001 C CNN
	1    3300 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0104
U 1 1 5F9267B9
P 6200 1950
F 0 "#PWR0104" H 6200 1800 50  0001 C CNN
F 1 "+3V3" H 6215 2123 50  0000 C CNN
F 2 "" H 6200 1950 50  0001 C CNN
F 3 "" H 6200 1950 50  0001 C CNN
	1    6200 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5F926DF3
P 5650 2450
F 0 "#PWR0105" H 5650 2200 50  0001 C CNN
F 1 "GND" H 5655 2277 50  0000 C CNN
F 2 "" H 5650 2450 50  0001 C CNN
F 3 "" H 5650 2450 50  0001 C CNN
	1    5650 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2050 5650 2050
Wire Wire Line
	5650 2050 5650 2350
Wire Wire Line
	6200 2350 5650 2350
Connection ~ 5650 2350
Wire Wire Line
	5650 2350 5650 2450
Text GLabel 6200 2250 0    50   Input ~ 0
SDA
Text GLabel 6200 2150 0    50   Input ~ 0
SCL
Text GLabel 3800 3350 2    50   Input ~ 0
SDA
Text GLabel 3800 3250 2    50   Input ~ 0
SCL
$Comp
L Connector_Generic:Conn_01x03 J_WS2812B_1
U 1 1 5F92D7EE
P 6400 3200
F 0 "J_WS2812B_1" H 6480 3242 50  0000 L CNN
F 1 "Conn_01x03" H 6480 3151 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6400 3200 50  0001 C CNN
F 3 "~" H 6400 3200 50  0001 C CNN
	1    6400 3200
	1    0    0    -1  
$EndComp
Text GLabel 6200 3100 0    50   Input ~ 0
TO_DI
$Comp
L power:GND #PWR0106
U 1 1 5F92ECF7
P 6200 3300
F 0 "#PWR0106" H 6200 3050 50  0001 C CNN
F 1 "GND" H 6205 3127 50  0000 C CNN
F 2 "" H 6200 3300 50  0001 C CNN
F 3 "" H 6200 3300 50  0001 C CNN
	1    6200 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5F92F0C6
P 5600 3200
F 0 "#PWR0107" H 5600 3050 50  0001 C CNN
F 1 "+5V" H 5615 3373 50  0000 C CNN
F 2 "" H 5600 3200 50  0001 C CNN
F 3 "" H 5600 3200 50  0001 C CNN
	1    5600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3200 5700 3200
$Comp
L Connector_Generic:Conn_01x03 J_DHT22
U 1 1 5F92F90E
P 6400 4050
F 0 "J_DHT22" H 6480 4092 50  0000 L CNN
F 1 "Conn_01x03" H 6480 4001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6400 4050 50  0001 C CNN
F 3 "~" H 6400 4050 50  0001 C CNN
	1    6400 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F92FEF9
P 6200 4150
F 0 "#PWR0108" H 6200 3900 50  0001 C CNN
F 1 "GND" H 6205 3977 50  0000 C CNN
F 2 "" H 6200 4150 50  0001 C CNN
F 3 "" H 6200 4150 50  0001 C CNN
	1    6200 4150
	1    0    0    -1  
$EndComp
Text GLabel 3800 3550 2    50   Input ~ 0
DHT
Text GLabel 6200 4050 0    50   Input ~ 0
DHT
Wire Wire Line
	3800 3150 4350 3150
Wire Wire Line
	4350 3150 4350 2300
Wire Wire Line
	4350 2300 3600 2300
Wire Wire Line
	2600 2300 2600 2800
Wire Wire Line
	2600 3150 3000 3150
Text Notes 3150 1950 0    50   ~ 0
low power sleep mode\nsolder jumper (dnp)
$Comp
L power:+3V3 #PWR0109
U 1 1 5F934A6F
P 6200 3950
F 0 "#PWR0109" H 6200 3800 50  0001 C CNN
F 1 "+3V3" H 6215 4123 50  0000 C CNN
F 2 "" H 6200 3950 50  0001 C CNN
F 3 "" H 6200 3950 50  0001 C CNN
	1    6200 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J_OLED_1
U 1 1 5F93F409
P 6400 5000
F 0 "J_OLED_1" H 6480 4992 50  0000 L CNN
F 1 "Conn_01x04" H 6480 4901 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6400 5000 50  0001 C CNN
F 3 "~" H 6400 5000 50  0001 C CNN
	1    6400 5000
	1    0    0    -1  
$EndComp
Text GLabel 6200 5000 0    50   Input ~ 0
SCL
Text GLabel 6200 4900 0    50   Input ~ 0
SDA
$Comp
L power:GND #PWR0110
U 1 1 5F942507
P 6200 5200
F 0 "#PWR0110" H 6200 4950 50  0001 C CNN
F 1 "GND" H 6205 5027 50  0000 C CNN
F 2 "" H 6200 5200 50  0001 C CNN
F 3 "" H 6200 5200 50  0001 C CNN
	1    6200 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0111
U 1 1 5F942DB3
P 5900 4800
F 0 "#PWR0111" H 5900 4650 50  0001 C CNN
F 1 "+3V3" H 5915 4973 50  0000 C CNN
F 2 "" H 5900 4800 50  0001 C CNN
F 3 "" H 5900 4800 50  0001 C CNN
	1    5900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4800 5900 5100
Wire Wire Line
	5900 5100 6200 5100
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5F958F56
P 3500 2100
F 0 "J1" V 3464 1912 50  0000 R CNN
F 1 "Conn_01x02" V 3373 1912 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3500 2100 50  0001 C CNN
F 3 "~" H 3500 2100 50  0001 C CNN
	1    3500 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 2300 2600 2300
Text GLabel 2400 3450 0    50   Input ~ 0
TO_DI
Text Notes 7100 2200 0    50   ~ 0
I2C Addr: 0x5A or 0x5B
Text Notes 6650 5450 0    50   ~ 0
For the SSD1306, the slave\naddress is either “b0111100” or “b0111101” by changing the SA0 to LOW or HIGH\n0x3C or 0x3D
$Comp
L Mechanical:MountingHole H1
U 1 1 5F98DBB4
P 3000 5500
F 0 "H1" H 3100 5546 50  0000 L CNN
F 1 "MountingHole" H 3100 5455 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3000 5500 50  0001 C CNN
F 3 "~" H 3000 5500 50  0001 C CNN
	1    3000 5500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F98F425
P 3000 5700
F 0 "H2" H 3100 5746 50  0000 L CNN
F 1 "MountingHole" H 3100 5655 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3000 5700 50  0001 C CNN
F 3 "~" H 3000 5700 50  0001 C CNN
	1    3000 5700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5F98F70A
P 3000 5900
F 0 "H3" H 3100 5946 50  0000 L CNN
F 1 "MountingHole" H 3100 5855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3000 5900 50  0001 C CNN
F 3 "~" H 3000 5900 50  0001 C CNN
	1    3000 5900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5F98FA6A
P 3000 6100
F 0 "H4" H 3100 6146 50  0000 L CNN
F 1 "MountingHole" H 3100 6055 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3000 6100 50  0001 C CNN
F 3 "~" H 3000 6100 50  0001 C CNN
	1    3000 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5FBF07C9
P 2650 3450
F 0 "R1" V 2454 3450 50  0000 C CNN
F 1 "470" V 2545 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2650 3450 50  0001 C CNN
F 3 "~" H 2650 3450 50  0001 C CNN
	1    2650 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 3450 3000 3450
Wire Wire Line
	2550 3450 2400 3450
$Comp
L Device:C_Small C1
U 1 1 5FBF4B67
P 5700 3350
F 0 "C1" H 5792 3396 50  0000 L CNN
F 1 "1000u" H 5792 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D10.0mm_H12.5mm_P5.00mm" H 5700 3350 50  0001 C CNN
F 3 "~" H 5700 3350 50  0001 C CNN
	1    5700 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3250 5700 3200
$Comp
L power:GND #PWR0112
U 1 1 5FBF5C7A
P 5700 3450
F 0 "#PWR0112" H 5700 3200 50  0001 C CNN
F 1 "GND" H 5705 3277 50  0000 C CNN
F 2 "" H 5700 3450 50  0001 C CNN
F 3 "" H 5700 3450 50  0001 C CNN
	1    5700 3450
	1    0    0    -1  
$EndComp
Connection ~ 5700 3200
Wire Wire Line
	5700 3200 6200 3200
NoConn ~ 3000 3550
NoConn ~ 3800 3650
NoConn ~ 3800 3750
NoConn ~ 3800 3850
NoConn ~ 3800 3950
NoConn ~ 3800 3450
NoConn ~ 3800 3050
$Comp
L Connector_Generic:Conn_01x02 J_RST_1
U 1 1 6027AC57
P 2200 2900
F 0 "J_RST_1" H 2280 2942 50  0000 L CNN
F 1 "Conn_01x02" H 2280 2851 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2200 2900 50  0001 C CNN
F 3 "~" H 2200 2900 50  0001 C CNN
	1    2200 2900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6027CA7F
P 2400 2900
F 0 "#PWR01" H 2400 2650 50  0001 C CNN
F 1 "GND" H 2405 2727 50  0000 C CNN
F 2 "" H 2400 2900 50  0001 C CNN
F 3 "" H 2400 2900 50  0001 C CNN
	1    2400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2800 2600 2800
Connection ~ 2600 2800
Wire Wire Line
	2600 2800 2600 3150
$EndSCHEMATC
