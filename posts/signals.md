Signal - a message from the kernel to a process.

To ask the kernel to a send a signal:

    kill [-SIGNAL] PID  # default signal is TERM

Signal types:

* TERM - terminate the process
* KILL - terminate the process and remove it forcibly from memory
* STOP - freeze the process (stays in memory ready to continue where it left
    off)
* CONT - continue running the process
* INT - interrupt (CTRL-C)

Source:

* How Linux Works, 2nd
