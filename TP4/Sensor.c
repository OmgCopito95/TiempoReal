#include <stdio.h>
#include <stdlib.h>
//#include <sys/time.h>
//#include <unistd.h>
#include <string.h>
#include <fcntl.h>
//#include <sys/stat.h>

FILE *archivo; // archivo que guarda las temperaturas
int archivoPipe; //para manejar el pipe
char* tiempo; //tiempo que lee
char* temp; //temperatura que lee
char* p = "pipe.txt"; //donde esta guardado el pipe
long int tiempoInt; //tiempo para esperar
char linea[20]; //linea del archivo temperaturas

int main (){

	sleep(2);
	archivo = fopen("temp.txt", "r"); //abro archivo temperaturas
	mkfifo(p,0666); // crea el pipe
	archivoPipe=open(p,O_WRONLY); // abro el pipe para escribir

	if (archivo!=NULL){
		sscanf(linea, "%ld\t%c", &tiempoInt, &temp);
		sleep(tiempoInt); //tiempo de espera
		write(archivoPipe,temp,sizeof(char)*4); //escribo en el pipe
		printf("%s - %s", tiempo, temp); //imprimo tiempo y temp	
	}

	close(archivoPipe);
	unlink(p);
	fclose(archivo);
	printf("se cerro");

return 0;

}
