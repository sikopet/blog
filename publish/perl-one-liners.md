# Perl one-liners
###### perl, howto

`perl` command line switches (see [perlrun](http://perldoc.perl.org/perlrun.html) for more):

 * `-w` -- enable warnings
 * `-n` -- loop through lines, reading them but not printing
 * `-l` -- print a newline after each line of output
 * `-e '<code>'` -- execute `<code>`
 * `-i [ <.ext> ]` -- create backup file with `<.ext>` extention if defined
 * `-p` -- loop through lines, reading and printing them (in-script equivalent: `while (<>) { print; }`)

----

Find lines containing pattern (`grep` replacement): `perl -wnl -e '/<regex>/ and print;'`

----

Convert DOS files to Unix files (`dos2unix` replacement):

    perl -i -pe 's/\r//' <file1> <file2> ...   # dos-to-unix
    perl -i -pe 's/$/\r/' <file1> <file2> ...  # unix-to-dos

----

In-place editing with backups (better `sed` replacement): `perl -p -i.bak -we 's/colour/color/g' *.txt`

----

Switch columns (`awk` replacement):

    $ cat birthdays.txt
    03/30/45 Eric Clapton
    11/27/42 Jimi Hendrix
    06/24/44 Jeff Beck
    $ perl -wnla -e '($date, $name)=@F; print "$name $date";' birthdays.txt    ## omitted field is undef
