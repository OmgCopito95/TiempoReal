#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/time.h>
#include <fcntl.h>
#include <sys/stat.h>

struct sched_param principal, secundario; //scheduler para los hilos.

int archivoPipe;
char* p= "/Escritorio/pipe.txt"; //el archivo de pipe que comparten ambos programas
char buffer[3];
int cola[3]={0}; //variable compartida
int i_cola=0; //indice de la cola
int temperatura;

pthread_mutex_t h_prom=PTHREAD_MUTEX_INITIALIZER; 
pthread_mutex_t sem_cola=PTHREAD_MUTEX_INITIALIZER; //semaforo para la cola

void *lecturaTemp(void *arg){
/*	float *tempLeida;
	//mientras haya datos en el canal mágico del otro programa...
	while (read(pipes[0], tempLeida, sizeof(float)) > 0) {//lee y guarda en tempLeida

		if (*tempLeida > 90.0)//si supera los 90º
			printf("Sobrepaso el limite de 90C: %f\n", *tempLeida);//Informa el error en la salida standard.
		write(pipes[1], tempLeida, sizeof(float)); //coloca la temp en el pipe para el hilo menos prioritario

	}
	printf("termino la recepcion de datos.\n");
	close(pipes[1]); //avisa que terminó de escribir
	return NULL;*/
	while(1){
		if (read(archivoPipe,buffer,sizeof(buffer)>0)){ //leo el archivo
			temperatura = atoi(buffer); //tomo la temperatura
			if (temperatura >90)
				printf("Es mayor a 90 grados");

			pthread_mutex_lock(&sem_cola); //bloqueo para poder guardar temp
				cola[i_cola]=temperatura;
				i_cola=(i_cola+1)%3; //calculo el nuevo indice
			pthread_mutex_unlock(&sem_cola);

			pthread_mutex_unlock(&h_prom); //desbloqueo semaforo del otro hilo
		}
	}
	close(archivoPipe);

}

void *promedioTemp(void *arg){
	int suma=0;
	int cant=0;
	int i;
	while(1){
		pthread_mutex_lock(&h_prom); //bloqueo para comenzar a trabajar
		if (cant<3)
			cant=(cant%3)+1; 
		suma=0; //inicializo variable contador

		pthread_mutex_lock(&sem_cola); //bloqueo la cola
			for(i=0;i<3;i++){
				suma+=cola[i];	//tomo valor de la cola para sumar
			}
		pthread_mutex_lock(&sem_cola); //desbloqueo la cola

		printf("%f\n",((float)suma/cant)); //imprimo promedio
	}

/*
	float ultimos[3]; //arreglo que guarda las ultimas 3 temperaturas
	float ultimaTemp; //ultima temperatura recibida

	while (read(pipes[1], &ultimaTemp, sizeof(float)) > 0) {//lee la temperatura almacenada
		int i;
		for (i = 2; i >0; i--) //hace el corrimiento para descartar la mas vieja
			ultimos[i] = ultimos[i-1];
		ultimos[0] = ultimaTemp; //guarda la ultima temp leida
	}

	float prom=0;
	int i;
	for (i= 0; i <3; i++) //suma todas las temperaturas
		prom+=ultimos[i];
	prom = prom / 3.0f; //calcula el promedio

	printf("el promedio de temperaturas es: %f\n", prom);

	//close(pipes[1]);//avisa que terminó de leer

	return NULL;
*/
}

int main(){

	archivoPipe=open(p,O_RDONLY); //abro solo lectura el pipe
	pthread_t hilos[2]; //hilos del monitor
/*
	if (pipe(pipes)>0){*/
		pthread_mutex_lock(&h_prom); //bloqueo el sem para que no se ejecute el 2do hilo

		//crea los hilos
		pthread_create(&hilos[0], NULL, lecturaTemp, "0");
		pthread_create(&hilos[1], NULL, promedioTemp, "1");

		//asigna las prioridades
		principal.sched_priority = 0;
		secundario.sched_priority = 2;

		//setea las prioridades
		pthread_setschedparam(hilos[0], SCHED_FIFO, &principal);
		pthread_setschedparam(hilos[1], SCHED_FIFO, &secundario);

		//espera a que los Hilos terminen
		pthread_join(hilos[0], NULL);
		pthread_join(hilos[1], NULL);

// prueba para ver buffer
/*close(pipes[1]);
if (pipe(pipes)<0)
	exit(1);
float tempLeida;
read(pipes[0],&tempLeida,sizeof(int));
printf("%f \n",tempLeida);
close(pipes[0]);
*/
	return 0;
}
