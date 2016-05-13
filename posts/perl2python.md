Going from Perl to Python ...

Data types:

    Perl     Python             Example
    ----     ------             -------
    list  -> tuple (immutable)  ( 10, 20, 30 ) 
    array -> list               [ 1, 3.4, 'hello' ]
    hash  -> dictionary         { 'a': 3, 'b': 42 }

File I/O
--------

Process every line in a file
	
    for line in file('filename.txt'):  # or open("filename.txt")
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

Write to a file

    f = open("out", "w")
    while year <= numyears:
        principal = principal * (1 + rate)
        # or f.write("%3d %0.2f" % (year, principal))
        print >>f, "%3d %0.2f" % (year, principal)
        year += 1
    f.close()

Error handling
--------------

Perl

    my @filenames = qw(README.md y empty);

    for my $file (@filenames) {
        my $fh;
        unless ( open $fh, $file ) {
            warn "$file: could not be opened: $!\n";
            next;
        }
        warn "$file: is empty\n" unless readline $fh;
    }

Python

    class EmptyFileError(Exception):
        pass

    filenames = [ "README.md", "y", "empty" ]

    for file in filenames:
        try:
            f = open(file, "r")
            line = f.readline()
            if line == "":
                f.close()
                raise EmptyFileError("%s: is empty" % file)
        except IOError as error:
            print("%s: could not be opened: %s" % (file, error.strerror))
        except EmptyFileError as error:
            print(error)

map() => list comprehension
---------------------------

Perl

    perl -we '@a_list = qw(1 2 3 5); print map { $_ * 2 } @a_list'

Python

    >>> a_list = [1, 2, 3, 5]
    >>> a_list
    [1, 2, 3, 5]
    >>> [ elem * 2 for elem in a_list ]
    [2, 4, 6, 10]

Resources:

* http://everythingsysadmin.com/perl2python.html
* Python: Essential Reference
* The Quick Python Book
