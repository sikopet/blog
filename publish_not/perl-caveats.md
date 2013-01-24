# Perl caveats
###### perl

Perl stuff I'd better remember :).

## Is Perl compiled or interpreted?

Yes. Consequence: Perl reads all the code before execution.

                                  +-------------------+
    +------+     compilation      |(kind of) byte code|
    |source| +------------------> |not kept around    |+---> execution
    |code  |                      |between executions |
    +------+                      +-------------------+

## Naming conventions for scalar variables

* constants are in `$ALL_CAPITAL_LETTERS`
* local variables are in `$lower_case`
* global variables are in `$Title_case`
* words are `$separated_by_uderscores`

## What is truth for scalars

* If a string expression evaluates to the empty string `""` or the string `"0"`, it's false.
* If a numeric expression evaluates to an integer or floating point *zero* (exactly zero, not "nearly zero"), it's false.
* If an expression evaluates as the *undefined* value, it's false.
* Any other value of any kind of expression if true.

## List vs. array in scalar conext

    #!/usr/bin/perl
    use strict;

    #use warnings; # yields a warning if uncommented

    my @array              = qw(one two three);
    my $number_of_elements = @array;              # ARRAY in scalar context
    print "$number_of_elements\n";                # 3

    my $last_element = qw(one two three);         # LIST in scalar context
    print "$last_element\n";                      # three

More: [List value constructors](http://perldoc.perl.org/perldata.html#List-value-constructors), [Scalar and List context in Perl](http://szabgab.com/scalar-and-list-context-in-perl.html).

