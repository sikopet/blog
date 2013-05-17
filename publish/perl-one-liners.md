# Perl One-Liners
###### perl, shell

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

## Unix tools replacements

* Find lines containing regex (`grep` replacement)

        perl -wnl -e '/<regex>/ and print;'

* In-place editing with backups (`sed` replacement)

        perl -p -i.bak -we 's/colour/color/g' *.txt

* Switch columns (`awk` replacement)

        $ cat birthdays.txt
        03/30/45 Eric Clapton
        11/27/42 Jimi Hendrix
        06/24/44 Jeff Beck
        $ perl -wnla -e '($date, $name)=@F; print "$name $date";' birthdays.txt    ## omitted field is undef

* Convert DOS files to Unix files (`dos2unix` replacement)

        perl -i -pe 's/\r//' <file1> <file2> ...   # dos-to-unix
        perl -i -pe 's/$/\r/' <file1> <file2> ...  # unix-to-dos

## Various

* Remove comments and compress all consecutive blank lines into one ([more](http://www.catonmat.net/blog/perl-one-liners-explained-part-one/))

        cat <file> | perl -wnle '!/^#/ and print' | perl -00 -pe ''

* Create HTML anchor element

        perl -wE 'say "<a href=\"$ARGV[1]\">$ARGV[0]</a>"' 'Link text' URL

* Make squares of numbers from 1 to 10

        perl -w -E 'say for map { $_ * $_  } 1 .. 10'

* Greet user (stolen from [Utilitarian](http://perlmonks.org/?node_id=681898) :-))

        perl -e 'print "Good " . qw(night morning afternoon evening)[(localtime)[2]/6] . ", $ENV{USER}!"'

### Using command line arguments (-s)

While in Git-tracked directory, print the filename followed by its author:

        for f in `find -type f`; do 
                git log -1 --date=iso -- $f |
                grep ^Author |
                perl -wnla -s -F: -e 'print "$file --" . $F[1]' -- -file=$f
        done

### Capitalize titles in blog posts

If you want the titles (first lines) in your [blog posts](https://github.com/jreisinger/blog/tree/master/publish) to be properly capitalized:

    for f in `find publish -type f -iname "*.md"`; do
        perl -wn -i -p -MText::Capitalize -e 'my $new = capitalize_title( $_, PRESERVE_ALLCAPS=>1 ) ; s/(.*)/$new/ if 1 .. 1' $f
    done

Check the changes are ok:

    git diff
    
.. to removes staged and working directory changes:

    git reset --hard

.. to remove untracked files:

    git clean -f -d
