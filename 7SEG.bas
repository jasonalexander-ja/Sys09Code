10 ' A 74xx574 shift register connected to address 0x8000 (32768) 
20 ' With a 7 segment display connected on the output with LEDs A-G
30 ' connected to bots 0-7 respectively 

40 ' Codes for different characters
50 CA = 136: CB = 131: CC = 167: CD = 161: CE = 134: CF = 142: CG = 144: CH = 137: CI = 249: CJ = 241
60 CL = 199: CN = 171: CO = 163: CP = 140: CQ = 152: CR = 175: CS = 146: CT = 135: CU = 227: CY = 145 
70 C0 = 192: C1 = 249: C2 = 164: C3 = 176: C4 = 153: C5 = 146: C6 = 130: C7 = 248: C8 = 128: C9 = 152: BL = 255

80 ' The 7 segment address 
90 SG = 32832


100 ' The message array length and message array to print
110 ML = 24
120 DIM MS(24)
130 ' "Raspberry Pi 4th Birthday"
140 MS(0) = CR: MS(1) = CA: MS(2) = CS: MS(3) = CP: MS(4) = CB
150 MS(5) = CE: MS(6) = CR: MS(7) = CR: MS(8) = CY: MS(9) = BL
160 MS(10) = CP: MS(11) = CI: MS(12) = BL: MS(13) = C4: MS(14) = CT
170 MS(15) = CH: MS(16) = BL: MS(17) = CB: MS(18) = CI: MS(19) = CR
180 MS(20) = CT: MS(21) = CH: MS(22) = CD: MS(23) = CA: MS(24) = CY

990 ' Message print loop 
1000 FOR K = 0 TO ML
1010 POKE SG, MS(K)
1020 DL = 400: GOSUB 10000
1030 POKE SG, BL
1040 DL = 150: GOSUB 10000
1050 NEXT


1060 DL = 400: GOSUB 10000
1070 POKE SG, 254
1080 DL = 400: GOSUB 10000
1090 POKE SG, 191
1100 DL = 400: GOSUB 10000
1110 POKE SG, 247
1120 DL = 400: GOSUB 10000
1130 POKE SG, BL
1140 DL = 150: GOSUB 10000
1150 GOTO 1000


9990 ' Simple delay subroutine
10000 FOR I = 0 TO DL
10010 NEXT
10020 RETURN
