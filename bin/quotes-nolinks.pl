#!/usr/bin/perl
# Convert hyperlinks to TXT in quotes
use strict;
use warnings;

die "Usage: $0 quotes.txt\n" unless $ARGV[0];

while (<>) {

    # -- <a href="http://irclog.perlgeek.de/perl6/2013-07-21">TimToady</a>
    # ===>
    # -- TimToady (http://irclog.perlgeek.de/perl6/2013-07-21)
    s#<a href="([^"]+)">([^<]+)</a>#$2 ($1)#;
    print;
}
