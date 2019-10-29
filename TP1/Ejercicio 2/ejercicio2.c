// --chip=16f84a

#include <htc.h>

#define _XTAL_FREQ 1000000


void interrupt manejador(void){ //interrupcion
	PORTB =~ PORTB; // cambio el estado del puerto que tiene los leds
	TMR0 = 250; // tiempo que tarda en ejecutarse de nuevo la int
	T0IF=0; //si no limpio el flag no genera mas int de TMR0
}



void main(){

// registros de control de entrada/salida
TRISA = 0b11111111; //configuro  puerto A como entrada (1)
TRISB = 0b11001111; //configura los bits de los led como salida (0)

//manda un uno a los bit de los leds para que comiencen prendidos
RB4 = 1; 
RB5 = 1;

// ------------- CONFIGURO TIMER0 ------------------

//selecciona prescaler para TIMER0
PSA = 0; 
//prescaler divide por 256 => PS2:PS1:PS0=0b111
OPTION_REG = (OPTION_REG & 0b11111110) | 0b111; 
//Timer0 funciona como temporizador
T0CS = 0;

// ------------- FIN CONFIGURO TIMER0 ------------------


while (1){
	if ((RA0 == 0) || (RA1 == 0)){ 
					
		//habilita la interrupcion general y de timer cuando se presionan los botones
		// bit 7 en uno para habilitar las interrupciones
    	// bit 5 en uno habilita interrupciones del timer0
		INTCON=0b10100000;
	}

}


}