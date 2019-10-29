#include <Arduino_FreeRTOS.h>

void setup() {
 
  Serial.begin(115200);
  delay(1000);
 
  xTaskCreate(
                    tareaUno,          /* funcion de la tarea */
                    "TareaUno",        /* nombre de la tarea */
                    128,            /* tamaño de la pila en bytes */
                    NULL,             /* parametro de entrada en la tarea */
                    1,                /* prioridad de la tarea */
                    NULL);            /* manejador */
 
  xTaskCreate(
                    tareaDos,          /* funcion de la tarea */
                    "TareaDos",        /* nombre de la tarea */
                    128,            /* tamaño de la pila en bytes */
                    NULL,             /* parametro de entrada en la tarea */
                    1,                /* prioridad de la tarea */
                    NULL);            /* manejador */

    xTaskCreate(
                    tareaTres,          /* funcion de la tarea */
                    "TareaTres",        /* nombre de la tarea */
                    128,            /* tamaño de la pila en bytes */
                    NULL,             /* parametro de entrada en la tarea */
                    1,                /* prioridad de la tarea */
                    NULL);            /* manejador */
 
}

void loop() {
   delay(1000);
}

void tareaUno(){
 
    for( int i = 0;i<10;i++ ){ 
        Serial.println("Tarea 1");
        delay(1000);
    } 
    Serial.println("Fin Tarea 1");
    vTaskDelete( NULL ); 
}
 
void tareaDos(){
 
    for( int i = 0;i<10;i++ ){ 
        Serial.println("Tarea 2");
        delay(1000);
    }
    Serial.println("Fin Tarea 2");
    vTaskDelete(NULL); 
}

void tareaTres(){
 
    for( int i = 0;i<10;i++ ){ 
        Serial.println("Tarea 3");
        delay(1000);
    }
    Serial.println("Fin Tarea 3");
    vTaskDelete(NULL); 
}