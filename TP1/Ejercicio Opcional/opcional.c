#include <htc.h>

#define _XTAL_FREQ 1000000
#define LE_LO 6
#define LE_HI 7

static volatile unsigned short valor;

static unsigned short convertir(unsigned short n){

	unsigned long tmp = (unsigned long) n * 123;
	unsigned short res = (tmp) / 25;
	return (res > 5000) ? 5000 : res;
}

static void mostrarNumero(unsigned short n){
	
	unsigned char l, h;
	l = n % 10;
	n /= 10;	
	h = n % 10;
	PORTD = (1 << LE_LO);
	PORTB = h << 4 | l;
	__delay_us(100);

	n /= 10;	
	l = n % 10;
	n /= 10;	
	h = n % 10;
	PORTD = (1 << LE_HI);
	PORTB = h << 4 | l;
	__delay_us(100);
}

void main(){

	ADCON1 = 0b10000101;
	ADCON0 = 0b10000001;

	TRISA = 0b001001;
	TRISD = 0x00;
	TRISB = 0x00;
	
	ADIF = 0; // dice que termina la conversion 
	ADIE = 1; // habilita la int cuando termina la conversion 
	PEIE = 1; // interrupciones de perifericos
	GIE = 1; // interrupciones generales

	GO = 1; // conversion
	while (1);
}

void interrupt timerHandler(){

	valor = (ADRESH << 8) | ADRESL;
	//mostrarNumero(valor);
	mostrarNumero(convertir(valor));
	GO = 1;
}