opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F84A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNROOT	_main
	FNCALL	intlevel1,_manejador
	global	intlevel1
	FNROOT	intlevel1
	global	_INTCON
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_INTCON	set	11
	global	_PORTB
_PORTB	set	6
	global	_TMR0
_TMR0	set	1
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_PSA
_PSA	set	1035
	global	_T0CS
_T0CS	set	1037
	file	"C:\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 2\ejercicio2.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_main
??_main:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_manejador
?_manejador:	; 0 bytes @ 0x0
	global	??_manejador
??_manejador:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	4
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      4       4

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _manejador in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _manejador in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _manejador                                            4     4      0       0
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _manejador (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            0      0       0       0        0.0%
;;EEDATA              40      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
;;BANK0               42      4       4       3        6.1%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 16 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 2\ejercicio2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 2\ejercicio2.c"
	line	16
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2]
	line	19
	
l1341:	
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	20
	movlw	(0CFh)
	movwf	(134)^080h	;volatile
	line	23
	
l1343:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	24
	
l1345:	
	bsf	(53/8),(53)&7
	line	29
	
l1347:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1035/8)^080h,(1035)&7
	line	31
	
l1349:	
	movf	(129)^080h,w
	andlw	0FEh
	iorlw	07h
	movwf	(129)^080h	;volatile
	line	33
	
l1351:	
	bcf	(1037/8)^080h,(1037)&7
	goto	l1353
	line	38
	
l170:	
	line	39
	
l1353:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(40/8),(40)&7
	goto	u2161
	goto	u2160
u2161:
	goto	l1357
u2160:
	
l1355:	
	btfsc	(41/8),(41)&7
	goto	u2171
	goto	u2170
u2171:
	goto	l1353
u2170:
	goto	l1357
	
l173:	
	line	44
	
l1357:	
	movlw	(0A0h)
	movwf	(11)	;volatile
	goto	l1353
	line	45
	
l171:	
	goto	l1353
	line	47
	
l174:	
	line	38
	goto	l1353
	
l175:	
	line	50
	
l176:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_manejador
psect	text108,local,class=CODE,delta=2
global __ptext108
__ptext108:

;; *************** function _manejador *****************
;; Defined at:
;;		line 8 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 2\ejercicio2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       4
;;      Totals:         0       4
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text108
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 2\ejercicio2.c"
	line	8
	global	__size_of_manejador
	__size_of_manejador	equ	__end_of_manejador-_manejador
	
_manejador:	
	opt	stack 7
; Regs used in _manejador: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_manejador+0)
	movf	fsr0,w
	movwf	(??_manejador+1)
	movf	pclath,w
	movwf	(??_manejador+2)
	movf	btemp+1,w
	movwf	(??_manejador+3)
	ljmp	_manejador
psect	text108
	line	9
	
i1l1335:	
	comf	(6),f	;volatile
	line	10
	
i1l1337:	
	movlw	(0FAh)
	movwf	(1)	;volatile
	line	11
	
i1l1339:	
	bcf	(90/8),(90)&7
	line	12
	
i1l167:	
	movf	(??_manejador+3),w
	movwf	btemp+1
	movf	(??_manejador+2),w
	movwf	pclath
	movf	(??_manejador+1),w
	movwf	fsr0
	swapf	(??_manejador+0)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_manejador
	__end_of_manejador:
;; =============== function _manejador ends ============

	signat	_manejador,88
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
