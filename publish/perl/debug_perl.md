# Perl debugging
###### perl

There are several ways how to debud a Perl program.

## Print out the variables

The simplest way is to print the contents of the variables, ex.:

    #!/usr/bin/perl
    use strict;
    use warnings;

    # A number between 1 and 100 (both included)
    my $secret = int( 1 + rand 100 );

    # If DEBUG environment variable set, print out the secret number
    print "The secret number is $secret\n"
      if $ENV{DEBUG};

Usage:

    $ perl script.pl

    $ DEBUG=1 perl script.pl
    The secret number is 3

### Data::Dumper, YAML

## Perl debugger
