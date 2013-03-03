# Shell One-Liners
###### shell, perl

See also <http://www.commandlinefu.com>.

## Search inside files 

E.g. search MS Word files for "robot" string:

    find /data -type f -iname "*.doc" -print0 | xargs -0 strings -f |  grep -i 'robot' > find.out

.. to get just the filenames

    cat find.out | cut -d: -f1 | sort | uniq

## Remove comments and compress all consecutive blank lines into one ([more](http://www.catonmat.net/blog/perl-one-liners-explained-part-one/))

    cat <file> | perl -wnle '!/^#/ and print' | perl -00 -pe ''
