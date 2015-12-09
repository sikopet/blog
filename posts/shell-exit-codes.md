When a Unix program finishes, it leaves an exit code (stored in `$?` special
shell variable) for its parent process. The exit code is a small integer and
it's also called *error code* or *exit value*.

Zero *always* means success, non zero exit status usually means error:

    $ ls / > /dev/null && echo ok || echo error
    ok

    $ grep root /etc/passwd > /dev/null && echo ok || echo error
    ok

Note that some programs, like `grep` and `diff`, use non zero exit codes to
indicate normal conditions:

    ## grep returns 0 if it finds a match and 1 if it doesn't
    $ grep blabla /etc/passwd > /dev/null && echo ok || echo error
    error

Search for "exit" or "diagnostics" in man pages if not sure.

Resources:

* How Linux Works, 2nd
