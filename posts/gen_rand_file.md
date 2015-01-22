# Generate Random File

How to generate a file of a defined size (ex. 100MB) with random content:

binary file

    dd if=/dev/urandom of=file.dat bs=1M count=100

* `bs` -- block size

text file ([gen-txt-file.pl](https://github.com/jreisinger/blog/blob/master/code/gen-txt-file.pl) script)

    perl gen-txt-file.pl file.txt 100000000

