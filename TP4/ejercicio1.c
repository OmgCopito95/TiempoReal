#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sys/time.h>

#define N 2
#define ITERACIONES 1000

long int  promedios[N];
int ids[N];

void *procesar(void *arg){
    int i;
    long int tiempo = 0;
    struct timeval act, ant;

    for (i=0; i<ITERACIONES; i++){
        //tomo tiempo ant en ms 
        gettimeofday(&ant,NULL);
        usleep(10); //delay de 10ms
        //tomo tiempo act en ms
        gettimeofday(&act,NULL);
//      printf("%d \n",act.tv_sec);
        tiempo+=(act.tv_usec-ant.tv_usec)-10;
    //  printf("%ld \n ",tiempo);
    }
//  printf("cacacaca: %ld \n",(tiempo/ITERACIONES));
//  printf("id: %d",*(int*)arg);
    promedios[*(int*)arg]=tiempo/ITERACIONES;
return NULL;
}

int main(){
//  printf("asdasd");
    pthread_t hilos[N];
    int i;
//  printf("holaasd");
    sleep(4);
    for (i=0;i<N;i++){
       ids[i]=i;
       pthread_create(hilos+i,NULL,procesar,(void*)&ids[i]);
    }
//  printf("jdsfnkjsdf");   
    for(i=0;i<N;i++)
       pthread_join(hilos[i],NULL);
    for(i=0;i<N;i++)
       printf("El promedio del thread %i es %ld milisegundos. \n",i,promedios[i]);

return (0);
}
