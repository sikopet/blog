#!/usr/bin/perl
use strict;
use warnings;

while (<>) {
    s/\[ \/\*[^\*]+\*\/ \]//g;  # remove Slovak translations (moinmoin comments)
    next if /[^\x00-\x7F]/;     # skip lines with non-ASCII char
    s/^\s*\*\s*//;                                        # remove leading *
    s/\[\[([^\|]+)\|([^\]]+)\]\]/<a href=$1>$2<\/a>/g;    # convert links
    print;
}
