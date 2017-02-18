A process is an OS abstraction for a running program. It contains the program
and related information like the PID. Modern OSs can run multiple processes at
the same time - multitasking. On a multi-CPU system the processes are really
running simultaneously. On a single-CPU computer the OS switches between
different processes quickly so it seems like they are running at the same time.

The processes can be cloned using the `fork()` function - this is the
traditional approach multi-process approach. Another way to split the work
between multiple entities is using the lighter weight *threads* which means
multiple execution threads within a single process.

Forking a process:

    print "Parent before fork(): PID=$$", ", PPID=", getppid, "\n";

    my $child = fork();
    die "Can't fork: $!" unless defined $child;

    if ( $child > 0 ) {    # parent
        print "Parent after fork(): PID=$$", ", PPID=", getppid, "\n";
    } else {               # in the child process
        print "Child: PID=$$", ", PPID=", getppid, "\n";
    }

