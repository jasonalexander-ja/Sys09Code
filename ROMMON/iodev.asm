;; Definitions for I/O devices

;; Constant values for register offsets, control/status bits, etc.

	INCLUDE "acia.asm"

;; Addresses of hardware device registers

;; MC6850 ACIA (UART) (uses ~IODEV2)
PORT_ACIA_BASE   EQU $8040
PORT_ACIA_CTRL   EQU (PORT_ACIA_BASE + 0)
PORT_ACIA_STATUS EQU (PORT_ACIA_BASE + 0)
PORT_ACIA_SEND   EQU (PORT_ACIA_BASE + 1)
PORT_ACIA_RECV   EQU (PORT_ACIA_BASE + 1)
