# Generate Random File

How to generate a file of a defined size (ex. 100MB) with random content

binary file:
------------

    dd if=/dev/urandom of=file.dat bs=1M count=100

or

    dd if=/dev/urandom of=file.dat bs=`echo $((100*1024*1024))` count=1
    dd if=/dev/urandom of=file.dat bs=1024 count=`echo $((100*1024))`

* `bs` -- block size in bytes

text file:
----------

    base64 /dev/urandom | dd of=file.txt bs=1M count=100 iflag=fullblock
    
* `base64` represents (encodes) binary data using printable ASCII characters

empty file:
-----------

    dd if=/dev/zero of=file.dat bs=1M count=100
