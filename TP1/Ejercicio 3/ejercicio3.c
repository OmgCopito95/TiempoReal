// --chip=16F877

#include <htc.h>

#define _XTAL_FREQ 1000000	

#define LE_LO 6
#define LE_HI 7

static volatile unsigned short valor;

static void mostrar_numero(unsigned short n){
	PORTB = n;
	RD6 = 1;
	RD6 = 0;
	PORTB = n >> 8;
	RD7 = 1;
	RD7 = 0;

	/*PORTD = (1 << LE_LO); // corrimiento del 1 LE_LO bits para la izq
	PORTB = 0b11111111 & n; 
	__delay_us(20);
	PORTD = (1 << LE_HI); // corrimiento del 1 LE_HI bits para la izq
	PORTB = n >> 8; // 8 bits para la derecha al numero 
	__delay_us(20);*/
}

void main(){
	
	// registro de control 0, configura la operacion del modulo A/D
	ADCON1 = 0b10001110; // ADCS1:ADCS0=0 (OSC/8), CHS2:CHS0=0 (canal 0), GO=0, ADON=1 (activa modulo)
	
	// registro de control 1, configura la funcion de los pines del puerto
	ADCON0 = 0b01000001; // ADFM=1 (ADRESH:ADRESL 2:8 bit), xxx, PCFG3:PCFG0 =14 (AN0 con VDD)
	
	ADIE = 0; // sin interrupciones

	// si se configura en ADCON0 con el pin RA0 y RA3 este tiene que ser de entrada 
	TRISA = TRISA | 1; // AN0 entrada

	// puerto D y B como salidas
	TRISD = 0x00;
	TRISB = 0x00;

	while (1){
        GO = 1; // inicia la conversion 
        //__delay_us(20);
		while (GO){}
		valor = ADRESH << 8 | ADRESL; // lee A/D asumiendo formato ADRES 2:8
		//mostrar_numero(valor);
		/*ADCON = ADCON | 0b00000100;
		while (ADCON & 0b00000100){}
		valor = ADRESH << 8 | ADRESL; // lee A/D asumiendo formato ADRES 2:8*/
		mostrar_numero(valor);
		//_delay(50000);
	}
}