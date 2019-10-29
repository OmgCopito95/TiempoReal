#include <Arduino.h>
#include <Arduino_FreeRTOS.h>
#include <task.h>
#include <semphr.h>

// -------------------------- CONSTANTES y VARIABLES --------------------- //

#define MAX_TAREAS 3 //cantidad maxima de tareas a crear

static volatile char input = 0;

SemaphoreHandle_t s_tarea1;
SemaphoreHandle_t s_tarea2;
SemaphoreHandle_t s_tarea3;

static SemaphoreHandle_t sc_tarea2 = xSemaphoreCreateCounting(2, 0);
static SemaphoreHandle_t sc_tarea3 = xSemaphoreCreateCounting(3, 0);
// -------------------------- FUNCIONES ---------------------------------- //


void tarea1(int i){
    while(1){
    xSemaphoreTake(s_tarea1, portMAX_DELAY);
        Serial.println(i); //le sumo 1 para que escriba de 1 a 3    
        vTaskDelay(50);
        if (input == 'a')
            xSemaphoreGive(s_tarea3);
        else if (input == 'b')
            xSemaphoreGive(sc_tarea2);
        else if (input == 'c')
            xSemaphoreGive(s_tarea2);
    }
}
void tarea2(int i){
    while(1){
        xSemaphoreTake(sc_tarea2, portMAX_DELAY);
        Serial.println(i); //le sumo 1 para que escriba de 1 a 3    
        vTaskDelay(50);
        if (input == 'a')
            xSemaphoreGive(s_tarea1);
        else if (input == 'b'){
            if(xSemaphoreGetCount(sc_tarea2)==0){ //si se ejecutó 2 veces libera la tarea 3
               xSemaphoreGive(s_tarea3);
               sc_tarea2 = xSemaphoreCreateCounting(2, 0); //reinicia el contador? de alguna manera tiene que hacerlo
            }
            else
              xSemaphoreGive(sc_tarea2); //sino, se libera para volver a ejecutarse
        }
        else if (input == 'c')
            xSemaphoreGive(sc_tarea3);

    }
}


void tarea3(int i){
    while(1){
        xSemaphoreTake(s_tarea3, portMAX_DELAY);        
        Serial.println(i); //le sumo 1 para que escriba de 1 a 3    
        vTaskDelay(50);
        if (input == 'a')
            xSemaphoreGive(s_tarea2);
        
        else if (input == 'b')
            xSemaphoreGive(s_tarea1);
            
        else if (input == 'c'){
            if(xSemaphoreGetCount(sc_tarea3)==0){
                xSemaphoreGive(sc_tarea1); //libero la tarea 1
                sc_tarea3 = xSemaphoreCreateCounting(3, 0); //reinicio el contador de la tarea 3
            }
            else
                xSemaphoreGive(s_tarea3);
        }
    }
}


// ------------------------ SETUP ----------------------------------------- //
void setup(){
    Serial.begin(115200);
    Serial.println("Ingrese secuencia (a - b - c): ");

    /*while(!input){
        while(!Serial.available());
        char input = Serial.read(); //leo lo que se ingresa desde teclado
    }*/
    delay(1000);
    input = 'a';

    s_tarea1 = xSemaphoreCreateBinary();
    s_tarea2 = xSemaphoreCreateBinary();
    s_tarea3 = xSemaphoreCreateBinary();

    if(input == 'a'){
        xSemaphoreGive(s_tarea1);
    }else if (input == 'b')
            xSemaphoreGive(sc_tarea2);
        else if (input == 'c')
            xSemaphoreGive(sc_tarea3);

    // tareas que van a estar periodicamente haciendo interrupciones de sw
    xTaskCreate(tarea1, "Tarea 1", 128, 0, 1, NULL);
    xTaskCreate(tarea2, "Tarea 2", 128, 1, 1, NULL);
    xTaskCreate(tarea3, "Tarea 3 ", 128, 2, 1, NULL);

    vTaskStartScheduler();


}


// ----------------------- LOOP -------------------------------------------- //
void loop(){
    
}
