# Generate random file
###### howto

How to generate a file of a defined size (ex. 100MB) with random content:

data file

    $ dd if=/dev/urandom of=file.dat bs=1M count=100


text file ([gen-txt-file.pl](https://github.com/jreisinger/blog/blob/master/code/gen-txt-file.pl))

    $ perl gen-txt-file.pl file.txt 100000000

