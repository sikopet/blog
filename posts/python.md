Variables

* types are associated with objects, not variables
* variables are not checked for type at compile time
* Python variables are more like labels that reference various objects
    (integers, strings, class instances, ...)

        x = "2"     # x is string
        x = int(x)  # x is now integer

* don't have to be declared
* can have any built-in data type, user-defined object, function, or module
    assigned to them

Python synopsis

* built-in data types can be manipulated with operators, built-in functions,
    library functions, or a data type's own methods
* all Python objects are instances of one class or another

Built-in data types

* numbers
* lists

        []
        [1]
        [1, "two", (3, 4), ["a", "b"]]

 * built-in functions: len, max, min
 * operators: in, +, * (create new list, original unchanged)
 * statements: del
 * methods: append, count, extend, index, insert, pop, remove, reverse, sort

* tuples (immutable lists)
* strings

        >>> x = "Do not meddle    in \the affairs of \nwizards"
        >>> x2 = x.replace("\the", "the")
        >>> import re
        >>> regex = re.compile(r"[\t ]+")
        >>> regex.sub(" ", x2)
        'Do not meddle in the affairs of \nwizards'

* dictionaries (associative array functionality implemented using hash tables)

        { 1: "one", 2: "two" }

 * keys must be of an immutable type (numbers, strings, tuples)

* sets (an unordered collection of objects)

        >>> x = set([1, 2, 3])
        >>> 1 in x
        True
        >>> 4 in x
        False

 * when membership and uniqueness in the set are important
 * like dictionary keys without values

* file objects

        f = open("myfile", "r")
        line1 = f.readline()
        f.close()

Control flow structures

* `False` (boolean constant), `0`, `None` (Python nil value) and empty values (ex. `[ ]`, `""`)
    are taken as `False`
* `True` and everything else are considered `True`

Exceptions (errors)

* handled using the `try-except-finally-else` compound statement
* any uncaught exception will cause the program to exit

Calling to System

1) `os` library (module)

    import os
    os.getcwd()
    os.getenv('PATH')
    os.system('ls -la')

2) `subprocess` module

    from subprocess import call
    call(['ls', '-la'])

Threading

    #!/usr/bin/env python3

    import threading
    import time

    class aThread(threading.Thread):
        def __init__(self, num, val):
            threading.Thread.__init__(self)
            self.threadNum=num
            self.loopCount=val

        def run(self):
            print("Starting to run thread: ", self.threadNum)
            myfunc(self.threadNum, self.loopCount)

    def myfunc(num, val):
        count=0
        while count < val:
            print(num, " : ", val*count)
            count=count+1
            #time.sleep(1)

    t1=aThread(1, 15)
    t2=aThread(2, 20)
    t3=aThread(3, 30)

    t1.start()
    t2.start()
    t3.start()

    threads = []
    threads.append(t1)
    threads.append(t2)
    threads.append(t3)

    # wait for all threads to complete by entering them
    for t in threads:
        t.join()

Argument parsing and error handling

    #!/usr/bin/env python3

    import argparse

    parser = argparse.ArgumentParser(description="This program's description")
    parser.add_argument('-f', type=str, help='Name of file to open', required=True)

    cmdargs = parser.parse_args()
    f = cmdargs.f

    try:
        fh = open(f)
        line = fh.readline()
    # generic exception; more specific exceptions could be caught before
    except Exception as e: 
        print("There was an error: ", e)
        exit(1)  # like tchrist said
    else:
        print("1st line from", f, "is", line, end="")
        fh.close()

Classes and instances

    #!/usr/bin/env python

    class me:
        def __init__(self, foo):
            self.myvar = foo

        def getval(self):
            return self.myvar

        def setval(self, bar):
            self.myvar = bar

    x = me('bla')
    y = x.getval()
    z = me('baz')
    print(y)
    x.setval('ble')
    print x.getval()
    print z.getval()

---

Sources

* The Quick Python Books
* Mastering Python (Safari video)