#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(){

int pid1,pid2;
//char buffer[10];  // Buffer to store PID as string

printf("Task manager (PID %d) started\n", getpid());

pid1=fork();

if(pid1==0){
	printf("CPU monitor (PID %d, Parent PID %d) executing mpstat..\n", getpid(), getppid());
	char* arg_ptr[] = {"/usr/bin/mpstat","1","2",NULL}; // run for 2 seconds so that ps can have time to capture it
	execv(arg_ptr[0],arg_ptr);
	return 1;
}
else if(pid1 < 0){
	printf("forking failed for cpu monitor\n");
	return 1;
}

pid2=fork();

if(pid2==0){
	printf("Process monitor (PID %d, Parent PID %d) executing ps...\n", getpid(), getppid());
	char* arg_ptr[] = {"/bin/ps",NULL};
	execv(arg_ptr[0],arg_ptr);
	return 1;
}
else if(pid2 < 0){
	printf("forking failed for process monitor\n");
	return 1;
}

wait(NULL);
wait(NULL);
/*
printf("\nProcess Tree:\n");
sprintf(buffer, "%d", getpid());  // Convert PID to string
execlp("pstree", "pstree", "-p", buffer, NULL);

//execlp("pstree", "pstree", "-p", NULL); //responsible for printing the current processes tree

*/
printf("Task manager (PID %d) has finished execution \n", getpid());

return 0;
}
