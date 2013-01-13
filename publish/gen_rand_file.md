# Generate random file
###### howto

How to generate a file of a defined size (ex. 100MB) with random content:

data file

```none
$ dd if=/dev/urandom of=file.dat bs=1M count=100
```

text file ([gen-txt-file.pl](https://github.com/jreisinger/audit/blob/master/scripts/gen-txt-file.pl))

```
$ perl gen-txt-file.pl file.txt 100000000
```

 * `gen-txt-file.pl`:

    ```perl
    #!/usr/bin/perl
    # Generate text file of defined size.
    # The size is not very precise, especially for very small files.
    use strict;
    use warnings;
    use autodie;

    my $file = shift;
    my $size = shift;

    die "Usage: $0 file size_in_bytes\n" if not defined $file or not defined $size;

    open my $fh, ">", $file;

    while ( -s $file < $size ) {
        my @words = qw( abcdef ghi jklmno prstuvw xyz );
        print $fh join( " ", @words ), "\n";
    }

    close $fh;
```
