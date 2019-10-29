opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877
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
	FNCALL	_timerHandler,_convertir
	FNCALL	_timerHandler,_mostrarNumero
	FNCALL	_mostrarNumero,___lwmod
	FNCALL	_mostrarNumero,___lwdiv
	FNCALL	_convertir,___lmul
	FNCALL	_convertir,___lldiv
	FNCALL	intlevel1,_timerHandler
	global	intlevel1
	FNROOT	intlevel1
	global	_valor
	global	_ADCON0
psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_ADIF
_ADIF	set	102
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	250
	global	_PEIE
_PEIE	set	94
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_ADIE
_ADIE	set	1126
	file	"C:\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_valor:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_timerHandler
?_timerHandler:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x8
	ds	1
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x9
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_convertir
??_convertir:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_convertir
?_convertir:	; 2 bytes @ 0x0
	global	convertir@n
convertir@n:	; 2 bytes @ 0x0
	ds	2
	global	convertir@tmp
convertir@tmp:	; 4 bytes @ 0x2
	ds	4
	global	convertir@res
convertir@res:	; 2 bytes @ 0x6
	ds	2
	global	?_mostrarNumero
?_mostrarNumero:	; 0 bytes @ 0x8
	global	mostrarNumero@n
mostrarNumero@n:	; 2 bytes @ 0x8
	ds	2
	global	??_mostrarNumero
??_mostrarNumero:	; 0 bytes @ 0xA
	ds	1
	global	mostrarNumero@l
mostrarNumero@l:	; 1 bytes @ 0xB
	ds	1
	global	mostrarNumero@h
mostrarNumero@h:	; 1 bytes @ 0xC
	ds	1
	global	??_timerHandler
??_timerHandler:	; 0 bytes @ 0xD
	ds	8
	global	??_main
??_main:	; 0 bytes @ 0x15
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     21      23
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_convertir	unsigned short  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _timerHandler in COMMON
;;
;;   _convertir->___lldiv
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _timerHandler in BANK0
;;
;;   _timerHandler->_mostrarNumero
;;   _mostrarNumero->_convertir
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _timerHandler in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _timerHandler in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _timerHandler in BANK2
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
;; (1) _timerHandler                                         8     8      0     914
;;                                             13 BANK0      8     8      0
;;                          _convertir
;;                      _mostrarNumero
;; ---------------------------------------------------------------------------------
;; (2) _mostrarNumero                                        5     3      2     570
;;                                              8 BANK0      5     3      2
;;                            ___lwmod
;;                            ___lwdiv
;;                          _convertir (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _convertir                                            8     6      2     344
;;                                              0 BANK0      8     6      2
;;                             ___lmul
;;                            ___lldiv
;; ---------------------------------------------------------------------------------
;; (3) ___lldiv                                             14     6      8     162
;;                                              0 COMMON    14     6      8
;; ---------------------------------------------------------------------------------
;; (3) ___lmul                                              13     5      8      92
;;                                              0 COMMON    13     5      8
;; ---------------------------------------------------------------------------------
;; (3) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (3) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _timerHandler (ROOT)
;;   _convertir
;;     ___lmul
;;     ___lldiv
;;   _mostrarNumero
;;     ___lwmod
;;     ___lwdiv
;;     _convertir (ARG)
;;       ___lmul
;;       ___lldiv
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       6       2        0.0%
;;ABS                  0      0      25       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     15      17       5       28.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      2B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 35 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
	line	35
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2]
	line	37
	
l2024:	
	movlw	(085h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	38
	movlw	(081h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	40
	movlw	(09h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	41
	
l2026:	
	clrf	(136)^080h	;volatile
	line	42
	
l2028:	
	clrf	(134)^080h	;volatile
	line	44
	
l2030:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(102/8),(102)&7
	line	45
	
l2032:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1126/8)^080h,(1126)&7
	line	46
	
l2034:	
	bsf	(94/8),(94)&7
	line	47
	
l2036:	
	bsf	(95/8),(95)&7
	line	49
	
l2038:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	goto	l656
	line	50
	
l655:	
	
l656:	
	goto	l656
	
l657:	
	line	51
	
l658:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_timerHandler
psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:

;; *************** function _timerHandler *****************
;; Defined at:
;;		line 53 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       8       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_convertir
;;		_mostrarNumero
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text177
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
	line	53
	global	__size_of_timerHandler
	__size_of_timerHandler	equ	__end_of_timerHandler-_timerHandler
	
_timerHandler:	
	opt	stack 5
; Regs used in _timerHandler: [wreg+status,2+status,0+btemp+1+pclath+cstack]
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
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_timerHandler+4)
	movf	fsr0,w
	movwf	(??_timerHandler+5)
	movf	pclath,w
	movwf	(??_timerHandler+6)
	movf	btemp+1,w
	movwf	(??_timerHandler+7)
	ljmp	_timerHandler
psect	text177
	line	55
	
i1l2040:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_timerHandler+0)+0
	clrf	(??_timerHandler+0)+0+1
	movf	(30),w	;volatile
	movwf	(??_timerHandler+2)+0
	clrf	(??_timerHandler+2)+0+1
	movf	(??_timerHandler+2)+0,w
	movwf	(??_timerHandler+2)+1
	clrf	(??_timerHandler+2)+0
	movf	0+(??_timerHandler+0)+0,w
	iorwf	0+(??_timerHandler+2)+0,w
	movwf	(_valor)
	movf	1+(??_timerHandler+0)+0,w
	iorwf	1+(??_timerHandler+2)+0,w
	movwf	1+(_valor)
	line	57
	
i1l2042:	
	movf	(_valor+1),w	;volatile
	clrf	(?_convertir+1)
	addwf	(?_convertir+1)
	movf	(_valor),w	;volatile
	clrf	(?_convertir)
	addwf	(?_convertir)

	fcall	_convertir
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_convertir)),w
	clrf	(?_mostrarNumero+1)
	addwf	(?_mostrarNumero+1)
	movf	(0+(?_convertir)),w
	clrf	(?_mostrarNumero)
	addwf	(?_mostrarNumero)

	fcall	_mostrarNumero
	line	58
	
i1l2044:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	59
	
i1l661:	
	movf	(??_timerHandler+7),w
	movwf	btemp+1
	movf	(??_timerHandler+6),w
	movwf	pclath
	movf	(??_timerHandler+5),w
	movwf	fsr0
	swapf	(??_timerHandler+4)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_timerHandler
	__end_of_timerHandler:
;; =============== function _timerHandler ends ============

	signat	_timerHandler,88
	global	_mostrarNumero
psect	text178,local,class=CODE,delta=2
global __ptext178
__ptext178:

;; *************** function _mostrarNumero *****************
;; Defined at:
;;		line 16 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
;; Parameters:    Size  Location     Type
;;  n               2    8[BANK0 ] unsigned short 
;; Auto vars:     Size  Location     Type
;;  h               1   12[BANK0 ] unsigned char 
;;  l               1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwmod
;;		___lwdiv
;; This function is called by:
;;		_timerHandler
;; This function uses a non-reentrant model
;;
psect	text178
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
	line	16
	global	__size_of_mostrarNumero
	__size_of_mostrarNumero	equ	__end_of_mostrarNumero-_mostrarNumero
	
_mostrarNumero:	
	opt	stack 5
; Regs used in _mostrarNumero: [wreg+status,2+status,0+pclath+cstack]
	line	19
	
i1l2002:	
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(mostrarNumero@n+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(mostrarNumero@n),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_mostrarNumero+0)+0
	movf	(??_mostrarNumero+0)+0,w
	movwf	(mostrarNumero@l)
	line	20
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(mostrarNumero@n+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(mostrarNumero@n),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(mostrarNumero@n+1)
	addwf	(mostrarNumero@n+1)
	movf	(0+(?___lwdiv)),w
	clrf	(mostrarNumero@n)
	addwf	(mostrarNumero@n)

	line	21
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(mostrarNumero@n+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(mostrarNumero@n),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_mostrarNumero+0)+0
	movf	(??_mostrarNumero+0)+0,w
	movwf	(mostrarNumero@h)
	line	22
	
i1l2004:	
	movlw	(040h)
	movwf	(8)	;volatile
	line	23
	
i1l2006:	
	movf	(mostrarNumero@h),w
	movwf	(??_mostrarNumero+0)+0
	movlw	(04h)-1
u218_25:
	clrc
	rlf	(??_mostrarNumero+0)+0,f
	addlw	-1
	skipz
	goto	u218_25
	clrc
	rlf	(??_mostrarNumero+0)+0,w
	iorwf	(mostrarNumero@l),w
	movwf	(6)	;volatile
	line	24
	
i1l2008:	
	opt asmopt_off
movlw	8
movwf	(??_mostrarNumero+0)+0,f
u245_27:
decfsz	(??_mostrarNumero+0)+0,f
	goto	u245_27
opt asmopt_on

	line	26
	
i1l2010:	
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(mostrarNumero@n+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(mostrarNumero@n),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(mostrarNumero@n+1)
	addwf	(mostrarNumero@n+1)
	movf	(0+(?___lwdiv)),w
	clrf	(mostrarNumero@n)
	addwf	(mostrarNumero@n)

	line	27
	
i1l2012:	
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(mostrarNumero@n+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(mostrarNumero@n),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_mostrarNumero+0)+0
	movf	(??_mostrarNumero+0)+0,w
	movwf	(mostrarNumero@l)
	line	28
	
i1l2014:	
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(mostrarNumero@n+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(mostrarNumero@n),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(mostrarNumero@n+1)
	addwf	(mostrarNumero@n+1)
	movf	(0+(?___lwdiv)),w
	clrf	(mostrarNumero@n)
	addwf	(mostrarNumero@n)

	line	29
	
i1l2016:	
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(mostrarNumero@n+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(mostrarNumero@n),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_mostrarNumero+0)+0
	movf	(??_mostrarNumero+0)+0,w
	movwf	(mostrarNumero@h)
	line	30
	
i1l2018:	
	movlw	(080h)
	movwf	(8)	;volatile
	line	31
	
i1l2020:	
	movf	(mostrarNumero@h),w
	movwf	(??_mostrarNumero+0)+0
	movlw	(04h)-1
u219_25:
	clrc
	rlf	(??_mostrarNumero+0)+0,f
	addlw	-1
	skipz
	goto	u219_25
	clrc
	rlf	(??_mostrarNumero+0)+0,w
	iorwf	(mostrarNumero@l),w
	movwf	(6)	;volatile
	line	32
	
i1l2022:	
	opt asmopt_off
movlw	8
movwf	(??_mostrarNumero+0)+0,f
u246_27:
decfsz	(??_mostrarNumero+0)+0,f
	goto	u246_27
opt asmopt_on

	line	33
	
i1l652:	
	return
	opt stack 0
GLOBAL	__end_of_mostrarNumero
	__end_of_mostrarNumero:
;; =============== function _mostrarNumero ends ============

	signat	_mostrarNumero,4216
	global	_convertir
psect	text179,local,class=CODE,delta=2
global __ptext179
__ptext179:

;; *************** function _convertir *****************
;; Defined at:
;;		line 9 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[BANK0 ] unsigned short 
;; Auto vars:     Size  Location     Type
;;  tmp             4    2[BANK0 ] unsigned long 
;;  res             2    6[BANK0 ] unsigned short 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lmul
;;		___lldiv
;; This function is called by:
;;		_timerHandler
;; This function uses a non-reentrant model
;;
psect	text179
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio Opcional\opcional.c"
	line	9
	global	__size_of_convertir
	__size_of_convertir	equ	__end_of_convertir-_convertir
	
_convertir:	
	opt	stack 5
; Regs used in _convertir: [wreg+status,2+status,0+pclath+cstack]
	line	11
	
i1l1992:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(convertir@n),w
	movwf	(?___lmul)
	movf	(convertir@n+1),w
	movwf	((?___lmul))+1
	clrf	2+((?___lmul))
	clrf	3+((?___lmul))
	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	0
	movwf	2+(?___lmul)+04h
	movlw	0
	movwf	1+(?___lmul)+04h
	movlw	07Bh
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(3+(?___lmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(convertir@tmp+3)
	movf	(2+(?___lmul)),w
	movwf	(convertir@tmp+2)
	movf	(1+(?___lmul)),w
	movwf	(convertir@tmp+1)
	movf	(0+(?___lmul)),w
	movwf	(convertir@tmp)

	line	12
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	0
	movwf	(?___lldiv+1)
	movlw	019h
	movwf	(?___lldiv)

	movf	(convertir@tmp+3),w
	movwf	3+(?___lldiv)+04h
	movf	(convertir@tmp+2),w
	movwf	2+(?___lldiv)+04h
	movf	(convertir@tmp+1),w
	movwf	1+(?___lldiv)+04h
	movf	(convertir@tmp),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(convertir@res+1)
	addwf	(convertir@res+1)
	movf	0+(((0+(?___lldiv)))),w
	clrf	(convertir@res)
	addwf	(convertir@res)

	line	13
	
i1l1994:	
	movlw	high(01389h)
	subwf	(convertir@res+1),w
	movlw	low(01389h)
	skipnz
	subwf	(convertir@res),w
	skipnc
	goto	u217_21
	goto	u217_20
u217_21:
	goto	i1l1998
u217_20:
	
i1l1996:	
	movf	(convertir@res+1),w
	clrf	(?_convertir+1)
	addwf	(?_convertir+1)
	movf	(convertir@res),w
	clrf	(?_convertir)
	addwf	(?_convertir)

	goto	i1l649
	
i1l646:	
	
i1l1998:	
	movlw	low(01388h)
	movwf	(?_convertir)
	movlw	high(01388h)
	movwf	((?_convertir))+1
	goto	i1l649
	
i1l648:	
	goto	i1l649
	
i1l2000:	
	line	14
	
i1l649:	
	return
	opt stack 0
GLOBAL	__end_of_convertir
	__end_of_convertir:
;; =============== function _convertir ends ============

	signat	_convertir,4218
	global	___lldiv
psect	text180,local,class=CODE,delta=2
global __ptext180
__ptext180:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] unsigned long 
;;  dividend        4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    9[COMMON] unsigned long 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         5       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        14       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_convertir
;; This function uses a non-reentrant model
;;
psect	text180
	file	"C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 5
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
i1l2108:	
	movlw	0
	movwf	(___lldiv@quotient+3)
	movlw	0
	movwf	(___lldiv@quotient+2)
	movlw	0
	movwf	(___lldiv@quotient+1)
	movlw	0
	movwf	(___lldiv@quotient)

	line	10
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l2128
u238_20:
	line	11
	
i1l2110:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	i1l2114
	
i1l844:	
	line	13
	
i1l2112:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u239_25:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u239_25
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	i1l2114
	line	15
	
i1l843:	
	line	12
	
i1l2114:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l2112
u240_20:
	goto	i1l2116
	
i1l845:	
	goto	i1l2116
	line	16
	
i1l846:	
	line	17
	
i1l2116:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u241_25:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u241_25
	line	18
	
i1l2118:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u242_25
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u242_25
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u242_25
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u242_25:
	skipc
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l2124
u242_20:
	line	19
	
i1l2120:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	20
	
i1l2122:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	i1l2124
	line	21
	
i1l847:	
	line	22
	
i1l2124:	
	movlw	01h
u243_25:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u243_25

	line	23
	
i1l2126:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l2116
u244_20:
	goto	i1l2128
	
i1l848:	
	goto	i1l2128
	line	24
	
i1l842:	
	line	25
	
i1l2128:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	i1l849
	
i1l2130:	
	line	26
	
i1l849:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___lmul
psect	text181,local,class=CODE,delta=2
global __ptext181
__ptext181:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMMON] unsigned long 
;;  multiplicand    4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        13       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_convertir
;; This function uses a non-reentrant model
;;
psect	text181
	file	"C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
i1l2094:	
	movlw	0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	i1l2096
	line	6
	
i1l745:	
	line	7
	
i1l2096:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u233_21
	goto	u233_20
u233_21:
	goto	i1l2100
u233_20:
	line	8
	
i1l2098:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u234_21
	addwf	(___lmul@product+1),f
u234_21:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u234_22
	addwf	(___lmul@product+2),f
u234_22:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u234_23
	addwf	(___lmul@product+3),f
u234_23:

	goto	i1l2100
	
i1l746:	
	line	9
	
i1l2100:	
	movlw	01h
	movwf	(??___lmul+0)+0
u235_25:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u235_25
	line	10
	
i1l2102:	
	movlw	01h
u236_25:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u236_25

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u237_21
	goto	u237_20
u237_21:
	goto	i1l2096
u237_20:
	goto	i1l2104
	
i1l747:	
	line	12
	
i1l2104:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	i1l748
	
i1l2106:	
	line	13
	
i1l748:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___lwmod
psect	text182,local,class=CODE,delta=2
global __ptext182
__ptext182:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_mostrarNumero
;; This function uses a non-reentrant model
;;
psect	text182
	file	"C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l2072:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u227_21
	goto	u227_20
u227_21:
	goto	i1l2090
u227_20:
	line	9
	
i1l2074:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l2080
	
i1l688:	
	line	11
	
i1l2076:	
	movlw	01h
	
u228_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u228_25
	line	12
	
i1l2078:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l2080
	line	13
	
i1l687:	
	line	10
	
i1l2080:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u229_21
	goto	u229_20
u229_21:
	goto	i1l2076
u229_20:
	goto	i1l2082
	
i1l689:	
	goto	i1l2082
	line	14
	
i1l690:	
	line	15
	
i1l2082:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u230_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u230_25:
	skipc
	goto	u230_21
	goto	u230_20
u230_21:
	goto	i1l2086
u230_20:
	line	16
	
i1l2084:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l2086
	
i1l691:	
	line	17
	
i1l2086:	
	movlw	01h
	
u231_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u231_25
	line	18
	
i1l2088:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u232_21
	goto	u232_20
u232_21:
	goto	i1l2082
u232_20:
	goto	i1l2090
	
i1l692:	
	goto	i1l2090
	line	19
	
i1l686:	
	line	20
	
i1l2090:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l693
	
i1l2092:	
	line	21
	
i1l693:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text183,local,class=CODE,delta=2
global __ptext183
__ptext183:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_mostrarNumero
;; This function uses a non-reentrant model
;;
psect	text183
	file	"C:\PROGRA~2\HI-TEC~1\PICC\9.81\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l2046:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l2048:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u220_21
	goto	u220_20
u220_21:
	goto	i1l2068
u220_20:
	line	11
	
i1l2050:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l2056
	
i1l678:	
	line	13
	
i1l2052:	
	movlw	01h
	
u221_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u221_25
	line	14
	
i1l2054:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l2056
	line	15
	
i1l677:	
	line	12
	
i1l2056:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l2052
u222_20:
	goto	i1l2058
	
i1l679:	
	goto	i1l2058
	line	16
	
i1l680:	
	line	17
	
i1l2058:	
	movlw	01h
	
u223_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u223_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u224_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u224_25:
	skipc
	goto	u224_21
	goto	u224_20
u224_21:
	goto	i1l2064
u224_20:
	line	19
	
i1l2060:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l2062:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l2064
	line	21
	
i1l681:	
	line	22
	
i1l2064:	
	movlw	01h
	
u225_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u225_25
	line	23
	
i1l2066:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u226_21
	goto	u226_20
u226_21:
	goto	i1l2058
u226_20:
	goto	i1l2068
	
i1l682:	
	goto	i1l2068
	line	24
	
i1l676:	
	line	25
	
i1l2068:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l683
	
i1l2070:	
	line	26
	
i1l683:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
psect	text184,local,class=CODE,delta=2
global __ptext184
__ptext184:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
