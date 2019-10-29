#include <Arduino.h>
#include <Arduino_FreeRTOS.h>
#include <task.h>
#include <semphr.h>

// -------------------------- CONSTANTES y VARIABLES --------------------- //

#define MAX_TAREAS 3 //cantidad maxima de tareas a crear

static volatile char input = 0;

static SemaphoreHandle_t semaforo[MAX_TAREAS] = { //creo un arreglo de semaforo
    xSemaphoreCreateBinary(),
    xSemaphoreCreateBinary(),
    xSemaphoreCreateBinary()
};

static SemaphoreHandle_t listo = xSemaphoreCreateCounting(1, 0);

// -------------------------- FUNCIONES ---------------------------------- //

void controladorTarea(void *args){ //no recibe nada por parametro. Sirve para soncronizar
    if (input == 'a'){
        while(1){
            xSemaphoreGive(semaforo[0]); //tarea 1 // ---> V()
            xSemaphoreTake(listo, portMAX_DELAY); // -----> P()
            xSemaphoreGive(semaforo[2]); // tarea 3
            xSemaphoreTake(listo, portMAX_DELAY);
            xSemaphoreGive(semaforo[1]); // tarea 2
            xSemaphoreTake(listo, portMAX_DELAY);
        }
    }else{
        if (input == 'b'){
            while(1){
                xSemaphoreGive(semaforo[1]);
                xSemaphoreTake(listo, portMAX_DELAY);
                xSemaphoreGive(semaforo[1]);
                xSemaphoreTake(listo, portMAX_DELAY);
                xSemaphoreGive(semaforo[2]);
                xSemaphoreTake(listo, portMAX_DELAY);
                xSemaphoreGive(semaforo[0]);
                xSemaphoreTake(listo, portMAX_DELAY);
            }
    }else{
        if(input == 'c') {
            while(1) {
                xSemaphoreGive(semaforo[2]);
                xSemaphoreTake(listo, portMAX_DELAY);
                xSemaphoreGive(semaforo[2]);
                xSemaphoreTake(listo, portMAX_DELAY);
                xSemaphoreGive(semaforo[2]);
                xSemaphoreTake(listo, portMAX_DELAY);
                xSemaphoreGive(semaforo[0]);
                xSemaphoreTake(listo, portMAX_DELAY);
                xSemaphoreGive(semaforo[1]);
                xSemaphoreTake(listo, portMAX_DELAY);
            }
        }
    }
    }
} // cierra funcion

void tarea(int i){
    while(1) {
        xSemaphoreTake(semaforo[i], portMAX_DELAY);
        int a = i+1;
        Serial.println(a);
        vTaskDelay(10);
        Serial.println("Tarea: "); //le sumo 1 para que escriba de 1 a 3    
        vTaskDelay(50);
        xSemaphoreGive(listo);
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

    input = 'c';
    Serial.println(input);
    
    //tarea que se va a sincronizar con la interrupcion. Alta prioridad asi corre al toque
    xTaskCreate(controladorTarea, "ControladorTarea", 128, NULL, 1, NULL);
    
    // tareas que van a estar periodicamente haciendo interrupciones de sw
    for (int i = 0; i < MAX_TAREAS; i++){
        xTaskCreate(tarea, "Tarea ", 128, i, 1, NULL);
    }

    // creo el scheduler para que las tareas creadas empiecen a correr
    vTaskStartScheduler();

    while(1){}
}


// ----------------------- LOOP -------------------------------------------- //
void loop(){
    
}