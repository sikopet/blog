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

    my $pgrp = getpgrp();
    print "PID=$$, PGRP=$pgrp\n";

    my $pid = fork();
    die "Can't fork: $!" unless defined $pid;

    if ( $pid > 0 ) {    # parent process
        my ( $ppid, $pgrp ) = ( getppid, getpgrp );
        print "Parent process: PID=$$, PGRP=$pgrp, child=$pid\n";
    } else {             # child process
        my ( $ppid, $pgrp ) = ( getppid, getpgrp );
        print "Child process:  PID=$$, PGRP=$pgrp, parent=$ppid\n";
    }

Another way to create a subprocess in Perl is to use `system()` or `exec()`
functions. system() executes cmd and waits for it to exit. Return code (rc) 0
means success. Non-zero exit code indicates and error whose description can be
found in `$?`.

    # string will be passed to the shell for interpretation
    $rc = system('cmd and args');
    # shell won't get used but also you can't use shell metachars (ex. >)
    $rc = system('cmd', 'and', 'args');

The `exec()` is like the system() but *replaces* the current process with the
cmd. The new process will have the same PID and will share the same STDIN,
STDOUT, and STDERR.

    my $child = fork();
    die "Can't fork: $!" unless defined $child;
    if ($child == 0) { # we are in the child now
        # reopen STDOUT onto a file
        open(STDOUT, ">", "log.txt") || die "open() error: $!";
        # execute ls in the background
        exec('ls', '-l');
        die "exec() error: $!"; # shouldn't get here
    }

Sources:
* ULSAH
* Network Programming with Perl