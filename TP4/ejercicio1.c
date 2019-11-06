#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>


#define N 2 // numero de hilos
#define ITERACIONES 1000 // cantidad de veces que se ejecutan

#define FREQ 100
// 1000000000L = 1 segundo en nanosegundo
#define PERIODO (1000000000L / FREQ) // centesima de segundo

long long promedios[N]; // array para guardar los promedios de cada hilo

void *procesar(void *arg){ // procesos de los hilos

    long tiempo = 0;

    struct timespec tiempo_dormido, ant, act;
    tiempo_dormido.tv_sec = 0;
    tiempo_dormido.tv_nsec = PERIODO;

    // me guardo el tiempo del principio
    clock_gettime(CLOCK_MONOTONIC, &ant); // uso clock_monotonic porque no varia por el sistema

    for (int i = 0; i < ITERACIONES; i++) { // para que se ejecuten 1000 veces
        
        if (nanosleep(&tiempo_dormido, NULL)) // si devuelve cero se durmio bien y no entra
            die();        

        clock_gettime(CLOCK_MONOTONIC, &act); // me guardo el tiempo actual
        tiempo += ((act.tv_nsec - ant.tv_nsec + (act.tv_sec - ant.tv_sec) * 1000000000L) - PERIODO);        
        memcpy(&ant, &act, sizeof(struct timespec)); // actualiza informacion del struct
    }
    // termino de ejecutarse el hilo
    promedios[] = tiempo / ITERACIONES; // <--- cual es la posicion??
}

void main(){

    // declaro array de hilos N=2
    pthread_t hilos[N];

    // creo los hilos
    for (int i = 0; i < N; i++)
        pthread_create(hilos + i, NULL, procesar, promedios + i)            
    
    // espero que terminen los hilos
    for (int i = 0; i < N; i++)
        pthread_join(hilos[i], NULL)
    
    // imprimo promedios
    for (int i = 0; i < N; i++)
        printf("El promedio del thread %i es %lld nanosegundos.\n", i, promedios[i]);

}
