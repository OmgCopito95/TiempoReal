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
	FNCALL	_main,_mostrar_numero
	FNROOT	_main
	global	_valor
	global	_ADCON0
psect	text60,local,class=CODE,delta=2
global __ptext60
__ptext60:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTB
_PORTB	set	6
	global	_GO
_GO	set	250
	global	_RD6
_RD6	set	70
	global	_RD7
_RD7	set	71
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
	file	"C:\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 3\ejercicio3.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_valor:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_mostrar_numero
?_mostrar_numero:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	mostrar_numero@n
mostrar_numero@n:	; 2 bytes @ 0x0
	ds	2
	global	??_mostrar_numero
??_mostrar_numero:	; 0 bytes @ 0x2
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	4
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       8
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_mostrar_numero
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0      30
;;                                              2 COMMON     4     4      0
;;                     _mostrar_numero
;; ---------------------------------------------------------------------------------
;; (1) _mostrar_numero                                       2     0      2      30
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _mostrar_numero
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       8       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       9      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 28 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 3\ejercicio3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_mostrar_numero
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 3\ejercicio3.c"
	line	28
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	31
	
l1799:	
	movlw	(08Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	34
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	36
	
l1801:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1126/8)^080h,(1126)&7
	line	39
	
l1803:	
	movf	(133)^080h,w	;volatile
	iorlw	01h
	movwf	(133)^080h	;volatile
	line	42
	clrf	(136)^080h	;volatile
	line	43
	clrf	(134)^080h	;volatile
	goto	l1805
	line	45
	
l646:	
	line	46
	
l1805:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	48
	goto	l647
	
l648:	
	
l647:	
	btfsc	(250/8),(250)&7
	goto	u2141
	goto	u2140
u2141:
	goto	l647
u2140:
	goto	l1807
	
l649:	
	line	49
	
l1807:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_main+2)+0
	clrf	(??_main+2)+0+1
	movf	(??_main+2)+0,w
	movwf	(??_main+2)+1
	clrf	(??_main+2)+0
	movf	0+(??_main+0)+0,w
	iorwf	0+(??_main+2)+0,w
	movwf	(_valor)
	movf	1+(??_main+0)+0,w
	iorwf	1+(??_main+2)+0,w
	movwf	1+(_valor)
	line	54
	
l1809:	
	movf	(_valor+1),w	;volatile
	clrf	(?_mostrar_numero+1)
	addwf	(?_mostrar_numero+1)
	movf	(_valor),w	;volatile
	clrf	(?_mostrar_numero)
	addwf	(?_mostrar_numero)

	fcall	_mostrar_numero
	goto	l1805
	line	56
	
l650:	
	line	45
	goto	l1805
	
l651:	
	line	57
	
l652:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_mostrar_numero
psect	text61,local,class=CODE,delta=2
global __ptext61
__ptext61:

;; *************** function _mostrar_numero *****************
;; Defined at:
;;		line 12 in file "..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 3\ejercicio3.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text61
	file	"..\..\..\..\..\..\..\Users\july-\Desktop\Tiempo Real\TP1\Ejercicio 3\ejercicio3.c"
	line	12
	global	__size_of_mostrar_numero
	__size_of_mostrar_numero	equ	__end_of_mostrar_numero-_mostrar_numero
	
_mostrar_numero:	
	opt	stack 7
; Regs used in _mostrar_numero: [wreg+status,2]
	line	13
	
l1021:	
	movf	(mostrar_numero@n),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	14
	
l1023:	
	bsf	(70/8),(70)&7
	line	15
	
l1025:	
	bcf	(70/8),(70)&7
	line	16
	
l1027:	
	movf	(mostrar_numero@n+1),w
	movwf	(6)	;volatile
	line	17
	
l1029:	
	bsf	(71/8),(71)&7
	line	18
	
l1031:	
	bcf	(71/8),(71)&7
	line	26
	
l643:	
	return
	opt stack 0
GLOBAL	__end_of_mostrar_numero
	__end_of_mostrar_numero:
;; =============== function _mostrar_numero ends ============

	signat	_mostrar_numero,4216
psect	text62,local,class=CODE,delta=2
global __ptext62
__ptext62:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
