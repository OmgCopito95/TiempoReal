#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>


#define N 2 // numero de hilos
#define ITERACIONES 1000 // cantidad de veces que se ejecutan

long long promedios[N]; // array para guardar los promedios de cada hilo

void *procesar(void *arg){ // procesos de los hilos
	
}

int main(){

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

	return 0;
}
