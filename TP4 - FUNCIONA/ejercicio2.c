#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/time.h>
#include <time.h>

int tuberia1[2]; //pipe
int tuberia2[2]; //promedio
int arrtemp[3]={0,0,0};
int pos=0;


void *hilo_sensor(void *arg) {
    int tiempo, temperatura;

	FILE *archtemp;
	archtemp = fopen ( "temperaturas.txt", "r" );
	//if (archtemp==NULL) {fputs ("File error ",stderr); exit (1);}
//  printf("asdasd");
    while(!feof(archtemp)){
        fscanf(archtemp,"%d %d", &tiempo, &temperatura);
        usleep(tiempo*1000);//el tiempo en milisegundos
        write(tuberia1[1], &temperatura, sizeof(temperatura));
        printf("temp: %d %d \n", tiempo, temperatura);
    }

	fclose ( archtemp );
//  printf("asdasd");
}

void *hilo_temp(void *arg) {
    int temp;
    sleep(1);
	while (read(tuberia1[0], &temp, sizeof(temp)) > 0) { //0 cuando no lee mas nada
        if (temp<90){
            printf("temperatura:%d  \n", temp); 
	//mando temp por pipe
            write(tuberia2[1], &temp, sizeof(temp));
        }else{
            printf("la temp supera 90 grados \n");
        }
        usleep(10000);
	}
}

void *hilo_promedio(void *arg) {
    int temp=10;
    int i;
    int tot=0;
    float promedio=0;
    sleep(2);
    printf("calcular promedio\n");
    while (read(tuberia2[0], &temp, sizeof(temp)) > 0){
        arrtemp[pos]=temp;
        pos= (pos+1)% 3;
//  printf("asdasd");
        for(i=0;i<3;i++){
            tot= tot+arrtemp[i];
        }
        promedio= tot/3;
        //printf("Los valores: %d %d %d \n", arrtemp[0], arrtemp[1],arrtemp[2]);
	printf("promedio: %f \n", promedio);
        tot=0; promedio=0;
        usleep(10000);
    }
}

int main(int argc, char** argv){
//DOS PIPE PARA LA LECTURA Y ESCRITURA
    pipe(tuberia1);
    pipe(tuberia2);
//  printf("asdasd");
    pthread_t mythread1, mythread2, mythread3;
//CREA LOS HILOS
    pthread_create (&mythread1, NULL, hilo_sensor, NULL);
   pthread_create (&mythread2,NULL,hilo_temp, NULL);
	pthread_create (&mythread3,NULL,hilo_promedio, NULL);	
//ESPERA QUE TERMINEN
	pthread_join ( mythread1, NULL) ;
	pthread_join ( mythread2, NULL) ;
	pthread_join ( mythread3, NULL);
		
//  printf("asdasd");
	exit(0);
}
