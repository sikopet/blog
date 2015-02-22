#!/usr/bin/env perl
use strict;
use warnings;
use File::Basename;

sub data_for_path {
    my $path = shift;

    if ( -f $path or -l $path )    # base case
    {
        return undef;
    }
    if ( -d $path )                # enters recursion
    {
        my %dir;
        for my $item ( glob "$path/*" )    # ignore hidden files
        {
            $item = basename $item;
            $dir{$item} = data_for_path("$path/$item");
        }
        return \%dir;
    }

    warn "'$path' is neither a file or a directory\n";
    return undef;
}

my $dir = shift or die "Usage: $0 DIR\n";

use Data::Dumper;
print Dumper data_for_path($dir);
