#!/usr/bin/perl
# Create hyperlinks in quotes
use strict;
use warnings;

die "Usage: $0 quotes.txt\n" unless $ARGV[0];

while (<>) {

    # -- TimToady (http://irclog.perlgeek.de/perl6/2013-07-21)
    # ===>
    # -- <a href="http://irclog.perlgeek.de/perl6/2013-07-21">TimToady</a>
    s#--\s{0,3}([^(]+?)\s+\((http:\/\/[^)]+)\)#-- <a href="$2">$1</a>#;
    print;
}
