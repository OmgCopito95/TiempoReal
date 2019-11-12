#include<stdio.h>
#include<stdlib.h>
#include <sys/time.h>

float temp;
long ns;
char *lectura = NULL;
size_t tamanio;


int main (int argc, char **argv){


	FILE *file = fopen(argv[1], "r");
	if(file!=NULL){
		while (getline(&lectura, &tamanio, file) > 0) {
				sscanf(lectura, "%f\t%ld", &temp, &ns);
				usleep(ns);
				write(STDOUT_FILENO, &temp, sizeof temp);
			}
		free(lectura);
		fclose(file);
	}
	return 0;

}
