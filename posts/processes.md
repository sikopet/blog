A process is the (Unix) OS abstraction for a running program. The process
object allows for management of program's use of memory, processor's time and
I/O resources. A process contains the program, libraries and a kernel data
structure with information like the process's address space map, status (ex.
sleeping, stopped, runnable), owner, PID. 

Modern OSs can run multiple processes at the same time - multitasking. On a
multi-CPU/multi-core system the processes are really running simultaneously. On
a single-CPU computer the OS switches between different processes quickly so it
seems like they are running at the same time.

The processes can be cloned using the `fork()` function - this is the
traditional approach. Another way to split the work between multiple entities
is using the lighter weight *threads* which means multiple execution threads
within a single process.

This is how you clone a process in Perl:

    printf "%20s, PID=%s, PPID=%s, PGRP=%s\n",
        "Parent before fork()", $$, getppid(), getpgrp();

    my $pid = fork();
    die "Can't fork: $!" unless defined $pid;

    if ( $pid > 0 ) {    # parent process
        printf "%-20s, PID=%s, PPID=%s, PGRP=%s\n", 
            "Parent after fork()", $$, getppid(), getpgrp();
    } else {             # child process
        printf "%-20s, PID=%s, PPID=%s, PGRP=%s\n",
            "Child", $$, getppid(), getpgrp();
    }

Sources:
* ULSAH
* Network Programming with Perl
