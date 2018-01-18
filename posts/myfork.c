// gcc -Wall -o myfork myfork.c
// ./myfork
// https://www.root.cz/clanky/jak-nikdy-nespoustet-sluzbu-aneb-kdo-posila-tajemny-sigkill/

#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char* argv[]) {
    pid_t pid = fork();

    if (pid == -1) {
        fprintf(stderr, "Fork failed\n");
        return 1;
    } else if (pid == 0) {
        printf("Child: pid %d\n", getpid());
        execl("/bin/echo", "/bin/echo", "Child: Hello, world!", NULL);
        return 42; // Never executed
    } else {
        printf("Parent: pid %d, child %d\n", getpid(), pid);
        int status;
        waitpid(pid, &status, 0);
        printf("Parent: child exited %d\n", status);
    }
}
