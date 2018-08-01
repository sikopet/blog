Signal -- a message from the kernel to a process. Used for:
* errors (kernel saying: "You can't touch that area of memory!")
* events (death of a child, interrupt with Ctrl-C)

To ask the kernel to a send a signal:

    kill [-SIGNAL] PID  # default signal is TERM

Selected signal types:
* TERM (15) - terminate the process (polite request to die, i.e. can be caught or blocked)
* KILL (9) - terminate the process and remove it forcibly from memory (cannot be caught nor blocked)
* INT (2) - interrupt (`Ctrl-C`). Simple programs usually just die, more important ones (ex. shells, editors) stop long-running operations.
* STOP - freeze the process (stays in memory ready to continue where it left
    off)
* CONT - continue running the STOPed process
* QUIT - generate core dump (`Ctrl-\`)
* CHLD - one of the child processes stopped running - or, more likely, exited
* [HUP](http://world.std.com/~swmcd/steven/tech/daemon.html)
* TSTP - pressing `Ctrl-Z` sends TSTP to a process

Each process has a default disposition (what to do) for each possible signal. You may install your own handler or otherwise change the disposition of most signals. Only SIGKILL and SIGSTOP cannot be changed. The rest you can:
* ignore
* trap
* block (blocked signal is pending until it is later unblocked, i.e. removed from the signal mask)

Source:
* How Linux Works, 2nd
* Perl Cookbook, 2nd
* The Linux Programming Interface
* `man 7 signal` - overview of signals
