#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/time.h>


/*
 * pipes[1] Escribe en el pipe
 * pipes[0] Lee del pipe
 */

int pipes[2];//arreglo de enteros para transmitir los datos entre los hilos.

pthread_t principal, secundario; //Hilos del monitor
struct sched_param prioridadPal, prioridadSecundario; //scheduler para los hilos.


void *lecturaTemp(void *arg)
{
	float tempLeida;
	//mientras haya datos en el canal mágico del otro programa...
	while (read(STDIN_FILENO, &tempLeida, sizeof(float)) > 0) {//lee y guarda en tempLeida

		if (tempLeida > 90.0)//si supera los 90º
			printf(stdout, "Sobrepaso el limite de 90C: %f\n", tempLeida);//Informa el error en la salida standard.
		write(pipes[1], &tempLeida, sizeof(float)); //coloca la temp en el pipe para el hilo menos prioritario

	}
	printf(stdout, "termino la recepcion de datos.\n");
	close(pipes[1]); //avisa que terminó de escribir
	return NULL;
}

void *promedioTemp(void *arg)
{
	float ultimos[3]; //arreglo que guarda las ultimas 3 temperaturas
	float ultimaTemp; //ultima temperatura recibida

	while (read(pipes[0], &ultimaTemp, sizeof(float)) > 0) {//lee la temperatura almacenada
		for (int i = 2; i >0; i--) //hace el corrimiento para descartar la mas vieja
			ultimos[i] = ultimos[i-1];
		ultimos[0] = ultimaTemp; //guarda la ultima temp leida
	}

	float prom=0;
	for (int i = 0; i <3; i++) //suma todas las temperaturas
		prom+=ultimos[i];
	prom = prom / 3.0f; //calcula el promedio

	fprintf(stdout, "el promedio de temperaturas es: %f\n", prom);

	close(pipes[0]);//avisa que terminó de leer

	return NULL;
}

int main()
{

	if (!pipe(pipes)){
		//crea los hilos
		pthread_create(&principal, NULL, lecturaTemp, NULL);
		pthread_create(&secundario, NULL, promedioTemp, NULL);

		//asigna las prioridades
		prioridadPal.sched_priority = 0;
		prioridadSecundario.sched_priority = 2;

		//setea las prioridades
		pthread_setschedparam(principal, SCHED_RR, &prioridadPal);
		pthread_setschedparam(secundario, SCHED_RR, &prioridadSecundario);

		//espera a que los Hilos terminen
		pthread_join(principal, NULL);
		pthread_join(secundario, NULL);

	}
	return 0;
}
