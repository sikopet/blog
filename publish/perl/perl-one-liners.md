# Perl one-liners
###### perl

Perl one-liners are small Perl programs that are run directly from a command line (ex. on Unix/Linux, Cygwin). For a deeper dive see [Famous Perl One-Liners Explained](http://www.catonmat.net/blog/perl-one-liners-explained-part-one/). If you want a book, have a look at [Minimal Perl for UNIX and Linux People](http://www.amazon.com/Minimal-Perl-UNIX-Linux-People/dp/1932394508/ref=sr_1_1?ie=UTF8&qid=1358096838&sr=8-1&keywords=minimal+perl+for+unix).


## Perl command line switches 

* `-w` -- enable warnings (generally advisable)
* `-p` -- loop through lines, reading and printing them (in-script equivalent: `while (<>) { print; }`)
* `-n` -- loop through lines, reading but not printing them
* `-l` -- print a newline after each line of output
* `-e '<code>'` -- execute `<code>`
* `-E '<code>'` -- execute `<code>` enabling feature bundle (like `use 5.010`) for your version of Perl ([more](http://perldoc.perl.org/feature.html#IMPLICIT-LOADING))
* `-i [ <.ext> ]` -- create backup file (with `<.ext>` extension if defined)
* `-a` -- split the `$_` into `@F` (space is the default separator, change it with `-F`, ex. `-F:`)

See [perlrun](http://perldoc.perl.org/perlrun.html) for more.

## Find lines containing pattern (regex)

(`grep` replacement)

    perl -wnl -e '/<regex>/ and print;'

## Convert DOS files to Unix files 

(`dos2unix` replacement)

    perl -i -pe 's/\r//' <file1> <file2> ...   # dos-to-unix
    perl -i -pe 's/$/\r/' <file1> <file2> ...  # unix-to-dos

## In-place editing with backups 

(`sed` replacement)

    perl -p -i.bak -we 's/colour/color/g' *.txt

## Switch columns

(`awk` replacement)

    $ cat birthdays.txt
    03/30/45 Eric Clapton
    11/27/42 Jimi Hendrix
    06/24/44 Jeff Beck
    $ perl -wnla -e '($date, $name)=@F; print "$name $date";' birthdays.txt    ## omitted field is undef

## Make squares of numbers from 1 to 10

    perl -w -E 'say for map { $_ * $_  } 1 .. 10'


## Greet user :)

    perl -e 'print "Good " . qw(night morning afternoon evening)[(localtime)[2]/6] . ", $ENV{USER}!"'
    
Stolen from [Utilitarian](http://perlmonks.org/?node_id=681898).
