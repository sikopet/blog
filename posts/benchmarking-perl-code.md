(Up-to-date [source](https://github.com/jreisinger/blog/blob/master/posts/benchmarking-perl-code.md) of this post.)

Sometimes my code takes a really long time and I'd like to know which of the
alternatives run faster.

In this example I compare two sorting subroutines; a "naive" approach and "The
Schwartzian Transform". The former subroutine just compares all files' sizes to
each other, while the latter first precomputes the size of each file and then
does the comparisons.

    use Benchmark qw(timethese);

    chdir;    # change to my home directory
    my @files = glob '*';

    timethese(
        -2,
        {
            naive => sub {
                my @sorted = sort { -s $a <=> -s $b } @files;
            },
            schwartzian => sub {
                my @sorted =
                  map  { $_->[0] }
                  sort { $a->[1] <=> $b->[1] }
                  map  { [ $_, -s $_ ] } @files;
            },
        }
    );

The program's output:

    Benchmark: running naive, schwartzian for at least 2 CPU seconds...
         naive:  2 wallclock secs ( 0.58 usr +  1.49 sys =  2.07 CPU) @ 11661.84/s (n=24140)
    schwartzian:  2 wallclock secs ( 1.57 usr +  0.59 sys =  2.16 CPU) @ 21200.00/s (n=45792)

The output says that the Schwartzian Transform is much faster (the function ran more times in 2 seconds). The
reason is that we don't ask for the file size each time we want to compare two
files sizes; we ask just once for each file size.

## See Also

* http://perldoc.perl.org/Benchmark.html
* Intermediate Perl, 2nd, p. 144
