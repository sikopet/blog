Going from Perl to Python ...

Data types:

	list  -> tuple (immutable)
    array -> list
    hash  -> dictionary

File I/O
--------

Process every line in a file
	
    for line in file('filename.txt'):
        print line

Process every line in a file on command line or stdio if no file

    while (<>) { 
		print $_;
	}

	import fileinput
	for line in fileinput.input():
		print line

Access stdin directly

    import sys
    for line in sys.stdin:
        print line

Slurp the whole file/stdin

    # in a string
    contents = file('filename.txt').read()
    all_input = sys.stdin.read()

    # one string per line, newlines removed
    list_of_strings = file('filename.txt').readlines()
    all_input_as_list = sys.stdin.readlines()

Resources:

* http://everythingsysadmin.com/perl2python.html
