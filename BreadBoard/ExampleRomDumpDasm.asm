; f9dasm: M6800/1/2/3/8/9 / H6309 Binary/OS9/FLEX9 Disassembler V1.83
; Loaded binary file ExampleRomDump.bin

;****************************************************
;* Used Labels                                      *
;****************************************************

ACIA_CNTRL EQU $8040
ACIA_STATUS EQU $8040
ACIA_SEND EQU $8041
ACIA_RECV EQU $8041
ACIA_RST EQU $03

CR EQU $0D
NL EQU $0A
SPACE EQU $20
TAB EQU $09
COLON EQU $3A


RAM_START EQU $7FFE

;****************************************************
;* Program Code / Data Areas                        *
;****************************************************

        ORG     $1000

start
        LDS #RAM_START 
        LDA #ACIA_RST 
        STA ACIA_CNTRL 
        LDA #$16 
        STA ACIA_CNTRL 
        LDX #STARTUP_MSG 
        JSR send_string_x 

main_loop
        JSR recv_a 
        JSR send_a 
        JMP main_loop 



send_a
        LDB ACIA_STATUS 
        ANDB #$02 
        BEQ send_a 
        STA ACIA_SEND 
        RTS 


send_string_x
1
        LDA ,X+ 
        BEQ 2F 
        JSR send_a 
        JMP 1B 
2
        RTS 


recv_a
1
        LDB ACIA_CNTRL 
        ANDB #$01 
        BEQ 1B
        LDA ACIA_RECV 
        RTS 


ALL_YOUR_BASE FCB "All your base are belong to us", CR, NL, 0

