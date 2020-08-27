## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property LOC W5 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform 0 5 [get_ports clk]
 
## Switches
set_property LOC V17 [get_ports sw[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[0]]
set_property LOC V16 [get_ports sw[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[1]]
set_property LOC W16 [get_ports sw[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[2]]
set_property LOC W17 [get_ports sw[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[3]]
set_property LOC W15 [get_ports sw[4]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[4]]
set_property LOC V15 [get_ports sw[5]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[5]]
set_property LOC W14 [get_ports sw[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[6]]
set_property LOC W13 [get_ports sw[7]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[7]]
set_property LOC V2 [get_ports sw[8]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[8]]
set_property LOC T3 [get_ports sw[9]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[9]]
set_property LOC T2 [get_ports sw[10]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[10]]
set_property LOC R3 [get_ports sw[11]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[11]]
set_property LOC W2 [get_ports sw[12]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[12]]
set_property LOC U1 [get_ports sw[13]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[13]]
set_property LOC T1 [get_ports sw[14]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[14]]
set_property LOC R2 [get_ports sw[15]]					
set_property IOSTANDARD LVCMOS33 [get_ports sw[15]]
 

## LEDs
set_property LOC U16 [get_ports led[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[0]]
set_property LOC E19 [get_ports led[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[1]]
set_property LOC U19 [get_ports led[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[2]]
set_property LOC V19 [get_ports led[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[3]]
set_property LOC W18 [get_ports led[4]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[4]]
set_property LOC U15 [get_ports led[5]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[5]]
set_property LOC U14 [get_ports led[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[6]]
set_property LOC V14 [get_ports led[7]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[7]]
set_property LOC V13 [get_ports led[8]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[8]]
set_property LOC V3 [get_ports led[9]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[9]]
set_property LOC W3 [get_ports led[10]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[10]]
set_property LOC U3 [get_ports led[11]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[11]]
set_property LOC P3 [get_ports led[12]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[12]]
set_property LOC N3 [get_ports led[13]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[13]]
set_property LOC P1 [get_ports led[14]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[14]]
set_property LOC L1 [get_ports led[15]]					
set_property IOSTANDARD LVCMOS33 [get_ports led[15]]
	
	
##7 segment display
set_property LOC W7 [get_ports seg[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports seg[0]]
set_property LOC W6 [get_ports seg[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports seg[1]]
set_property LOC U8 [get_ports seg[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports seg[2]]
set_property LOC V8 [get_ports seg[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports seg[3]]
set_property LOC U5 [get_ports seg[4]]					
set_property IOSTANDARD LVCMOS33 [get_ports seg[4]]
set_property LOC V5 [get_ports seg[5]]					
set_property IOSTANDARD LVCMOS33 [get_ports seg[5]]
set_property LOC U7 [get_ports seg[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports seg[6]]

set_property LOC V7 [get_ports dp]							
set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property LOC U2 [get_ports an[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports an[0]]
set_property LOC U4 [get_ports an[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports an[1]]
set_property LOC V4 [get_ports an[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports an[2]]
set_property LOC W4 [get_ports an[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports an[3]]


##Buttons
set_property LOC U18 [get_ports btnC]						
set_property IOSTANDARD LVCMOS33 [get_ports btnC]
set_property LOC T18 [get_ports btnU]						
set_property IOSTANDARD LVCMOS33 [get_ports btnU]
set_property LOC W19 [get_ports btnL]						
set_property IOSTANDARD LVCMOS33 [get_ports btnL]
set_property LOC T17 [get_ports btnR]						
set_property IOSTANDARD LVCMOS33 [get_ports btnR]
set_property LOC U17 [get_ports btnD]						
set_property IOSTANDARD LVCMOS33 [get_ports btnD]
 


##Pmod Header JA
##Sch name = JA1
set_property LOC J1 [get_ports JA[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[0]]
##Sch name = JA2
set_property LOC L2 [get_ports JA[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[1]]
##Sch name = JA3
set_property LOC J2 [get_ports JA[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[2]]
##Sch name = JA4
set_property LOC G2 [get_ports JA[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[3]]
##Sch name = JA7
set_property LOC H1 [get_ports JA[4]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[4]]
##Sch name = JA8
set_property LOC K2 [get_ports JA[5]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[5]]
##Sch name = JA9
set_property LOC H2 [get_ports JA[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[6]]
##Sch name = JA10
set_property LOC G3 [get_ports JA[7]]					
set_property IOSTANDARD LVCMOS33 [get_ports JA[7]]



##Pmod Header JB
##Sch name = JB1
set_property LOC A14 [get_ports JB[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[0]]
##Sch name = JB2
set_property LOC A16 [get_ports JB[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[1]]
##Sch name = JB3
set_property LOC B15 [get_ports JB[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[2]]
##Sch name = JB4
set_property LOC B16 [get_ports JB[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[3]]
##Sch name = JB7
set_property LOC A15 [get_ports JB[4]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[4]]
##Sch name = JB8
set_property LOC A17 [get_ports JB[5]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[5]]
##Sch name = JB9
set_property LOC C15 [get_ports JB[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[6]]
##Sch name = JB10 
set_property LOC C16 [get_ports JB[7]]					
set_property IOSTANDARD LVCMOS33 [get_ports JB[7]]
 


##Pmod Header JC
##Sch name = JC1
set_property LOC K17 [get_ports JC[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[0]]
##Sch name = JC2
set_property LOC M18 [get_ports JC[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[1]]
##Sch name = JC3
set_property LOC N17 [get_ports JC[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[2]]
##Sch name = JC4
set_property LOC P18 [get_ports JC[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[3]]
##Sch name = JC7
set_property LOC L17 [get_ports JC[4]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[4]]
##Sch name = JC8
set_property LOC M19 [get_ports JC[5]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[5]]
##Sch name = JC9
set_property LOC P17 [get_ports JC[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[6]]
##Sch name = JC10
set_property LOC R18 [get_ports JC[7]]					
set_property IOSTANDARD LVCMOS33 [get_ports JC[7]]


##Pmod Header JXADC
##Sch name = XA1_P
set_property LOC J3 [get_ports JXADC[0]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[0]]
##Sch name = XA2_P
set_property LOC L3 [get_ports JXADC[1]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[1]]
##Sch name = XA3_P
set_property LOC M2 [get_ports JXADC[2]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[2]]
##Sch name = XA4_P
set_property LOC N2 [get_ports JXADC[3]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[3]]
##Sch name = XA1_N
set_property LOC K3 [get_ports JXADC[4]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[4]]
##Sch name = XA2_N
set_property LOC M3 [get_ports JXADC[5]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[5]]
##Sch name = XA3_N
set_property LOC M1 [get_ports JXADC[6]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[6]]
##Sch name = XA4_N
set_property LOC N1 [get_ports JXADC[7]]				
set_property IOSTANDARD LVCMOS33 [get_ports JXADC[7]]



##VGA Connector
set_property LOC G19 [get_ports vgaRed[0]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaRed[0]]
set_property LOC H19 [get_ports vgaRed[1]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaRed[1]]
set_property LOC J19 [get_ports vgaRed[2]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaRed[2]]
set_property LOC N19 [get_ports vgaRed[3]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaRed[3]]
set_property LOC N18 [get_ports vgaBlue[0]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaBlue[0]]
set_property LOC L18 [get_ports vgaBlue[1]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaBlue[1]]
set_property LOC K18 [get_ports vgaBlue[2]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaBlue[2]]
set_property LOC J18 [get_ports vgaBlue[3]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaBlue[3]]
set_property LOC J17 [get_ports vgaGreen[0]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaGreen[0]]
set_property LOC H17 [get_ports vgaGreen[1]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaGreen[1]]
set_property LOC G17 [get_ports vgaGreen[2]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaGreen[2]]
set_property LOC D17 [get_ports vgaGreen[3]]				
set_property IOSTANDARD LVCMOS33 [get_ports vgaGreen[3]]
set_property LOC P19 [get_ports Hsync]						
set_property IOSTANDARD LVCMOS33 [get_ports Hsync]
set_property LOC R19 [get_ports Vsync]						
set_property IOSTANDARD LVCMOS33 [get_ports Vsync]


##USB-RS232 Interface
set_property LOC B18 [get_ports RsRx]						
set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
set_property LOC A18 [get_ports RsTx]						
set_property IOSTANDARD LVCMOS33 [get_ports RsTx]


##USB HID (PS/2)
set_property LOC C17 [get_ports PS2Clk]						
set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
set_property PULLUP true [get_ports PS2Clk]
set_property LOC B17 [get_ports PS2Data]					
set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]	
set_property PULLUP true [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
set_property LOC D18 [get_ports QspiDB[0]]				
set_property IOSTANDARD LVCMOS33 [get_ports QspiDB[0]]
set_property LOC D19 [get_ports QspiDB[1]]				
set_property IOSTANDARD LVCMOS33 [get_ports QspiDB[1]]
set_property LOC G18 [get_ports QspiDB[2]]				
set_property IOSTANDARD LVCMOS33 [get_ports QspiDB[2]]
set_property LOC F18 [get_ports QspiDB[3]]				
set_property IOSTANDARD LVCMOS33 [get_ports QspiDB[3]]
set_property LOC K19 [get_ports QspiCSn]					
set_property IOSTANDARD LVCMOS33 [get_ports QspiCSn]

