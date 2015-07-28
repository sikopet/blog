#!/usr/bin/perl
use strict;
use warnings;

while (<>) {
    next if /^## page was renamed from/;    # skip comments about page renaming
    next if /[^\x00-\x7F]/;                 # skip lines with non-ASCII char

    s/\[ \/\*[^\*]+\*\/ \]//g;  # remove Slovak translations (moinmoin comments)
    s/^\s+\*(.*)$/*$1/;         # remove leading whites space before '*'

    # Convert links: [[http://www.perl.org/|Perl]] => [Perl](http://www.perl.org/)
    s {
    \[\[
    (?<url>[^\|]+)
    \|
    (?<link_name>[^\]]+)
    \]\]
    }
    {[$+{url}]($+{link_name})}gx;

    print;
}
