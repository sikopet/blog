The C compiler doesn't know enough about your system to create a useful program
all by itself. You need libraries to build complete programs.

C library - *precompiled* function that can be built into your program.

The two standard directories on Linux containing libraries are `/lib` and
`/usr/lib`. `/lib` should not contain static libraries.

Static libraries
----------------

When you link a program against a static library, the linker copies machine
code from the library file into your executable.

Advantages:
* the final executable does not need the original libraries to run
* the executable's behavior never changes

Disadvantages:
* waste of disk space and memory
* you need to recompile the executable if a library is found inadequate or
    insecure

Shared libraries
----------------

When you run a program linked against a shared library, the system loads the
library's code into the process memory space only when necessary.

Advantages:
* many processes can share the same library code in memory
* if you need to (slightly) modify the library code, no executable 
    recompilation is (usually) needed 

Disadvantages:
* library management
* missing libraries

Executables know just the names of shared libraries (performance and
flexibility reasons). A small program `ld.so` (runtime dynamic linked/loader)
finds and loads shared libraries for a program at runtime. To list the needed
shared libraries:

    $ ldd /bin/bash
        linux-vdso.so.1 =>  (0x00007ffe221ce000)
        libtinfo.so.5 => /lib64/libtinfo.so.5 (0x00007f2fb72df000)
        libdl.so.2 => /lib64/libdl.so.2 (0x00007f2fb70db000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f2fb6d46000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f2fb7506000)

* `<library name> => <where to find it>`
* the last line is the location of `ld.so`
* `so` - shared object

More
* http://jreisinger.duckdns.org/Linux1/InstalaciaLinuxuSpravaBalikov/ZdielaneKniznice
* How Linux Works, 2nd: Ch. 15
