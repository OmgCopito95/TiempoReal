// --chip=16f84a

#include <htc.h>

#define _XTAL_FREQ 1000000

void main(){

    // registros de control de entrada/salida
    TRISA = 0b11111111; //configuro  puerto A como entrada (1)
    TRISB = 0b11001111; //configura los bits de los led como salida (1)

    //manda un uno a los bit de los leds para que comiencen prendidos
    RB4 = 1; 
    RB5 = 1;

    while (1){
        // chequeo el estado de los botones. 
        // cuando presiono algun boton, recibe un cero.
        if ((RA0 == 0) || (RA1 == 0)){ 
            while(1){
                // cambio el estado del puerto
                PORTB = PORTB | 0b00110000; 
                __delay_ms(250);
                PORTB = PORTB & 0b11001111;
                __delay_ms(250);
            }
        }
    }

}