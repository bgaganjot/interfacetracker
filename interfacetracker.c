#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <netinet/in.h>
/*#include <uci.h>

char *getConfigString(){
	char path[] = "interfacetracker.default.reply";
//	char *buffer = malloc(80);
	struct uci_ptr ptr;
	struct uci_context *c = uci_alloc_context();

	if(!c) return 1;

	if((uci_lookup_ptr(c, &ptr, path, true) != UCI_OK) || (ptr.o == NULL || ptr.o->v.string==NULL)){
		uci_free_context(c);
		return 2;
	}
	char *buf = NULL;
	if(ptr.flags & UCI_LOOKUP_COMPLETE){
		int len = strlen(ptr.o->v.string);
		buf = malloc(len+1);

		strncpy(buf, ptr.o->v.string, len);
		buf[len] = '\0';
		printf("%s\n", buf);
	}

	uci_free_context(c);
	
	return buf;
}*/

int main(int argc, char **argv){
	int BUFLEN = 1024;
	while(1){
		int pipe_arr[2];
		char buf[BUFLEN];
	
		//Create pipe - pipe_arr[0] is "reading end", pipe_arr[1] is "writing end"
		pipe(pipe_arr);
	
		if(fork() == 0) //child
		{
//			dup2(pipe_arr[1], STDOUT_FILENO);
//			dup2(pipe_arr[1], STDERR_FILENO);
			execl("/bin/ping", "ping", "8.8.8.8", (char*)NULL);	
		}
		else //parent
		{
			wait(NULL);
			printf("parent\n");
			read(pipe_arr[0], buf, BUFLEN);
			printf("%s\n", buf);

		}

		close(pipe_arr[0]);
		close(pipe_arr[1]);
		sleep(1);
	}

	return 0;
}
