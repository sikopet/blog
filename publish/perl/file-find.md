# Processing Files Recursively (File::Find)
###### perl

Sometimes you need to do something to many/all files within certain directory:

    use File::Find;
    sub process_file {
        # do something;
    }
    find(\&process_file, @DIRLIST);

.. `find` function from `File::Find` scans directories in `@DIRLIST` recursively and for each file calls the referenced function (coderef) `process_file`

.. before calling your function `find` by default changes to the directory being scanned and sets the following variables:

* `$File::Find::dir` -- visited directory path relative to the starting directory
* `$_` -- basename of the file being visited
* `$File::Find::name` -- full path of the file being visited

## Find the largest file

    #!/usr/bin/perl
    use strict;
    use warnings;
    use File::Find;

    @ARGV = qw(.) unless @ARGV;
    my ($biggest_size, $biggest_name) = (-1, "");

    sub biggest {
        return unless -f && -s _ > $biggest_size;
        $biggest_size = -s _;
        $biggest_name = $File::Find::name;
    }

    find(\&biggest, @ARGV);
    print "Biggest file $biggest_name in @ARGV is $biggest_size bytes long.\n";

.. `_` -- virtual filehandle that uses info from the last file lookup (`stat` - an expensive operation) that a file test operator (`-f`) performed

## Find the most recently changed file

    my ($age, $name);
    sub youngest {
        return if defined $age && $age > (stat($_))[9];
        $age = (stat($_))[9];
        $name = $File::Find::name;
    }

## More

* [Beginners guide to File::Find](http://www.perlmonks.org/?node_id=217166)
* [File::Find](http://perldoc.perl.org/File/Find.html)
* Perl Cookbook, Recipe 9.7
