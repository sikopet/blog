# Perl caveats
###### perl

Perl stuff I'd better remember :).

## List vs. array in scalar conext

    #!/usr/bin/perl
    use strict;

    #use warnings; # outputs warning

    my @array              = qw(one two three);
    my $number_of_elements = @array;              # ARRAY in scalar context
    print "$number_of_elements\n";                # 3

    my $last_element = qw(one two three);         # LIST in scalar context
    print "$last_element\n";                      # three

More: [List value constructors](http://perldoc.perl.org/perldata.html#List-value-constructors), [Scalar and List context in Perl](http://szabgab.com/scalar-and-list-context-in-perl.html).

