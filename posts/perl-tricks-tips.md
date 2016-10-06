Reading a directory

    opendir DIR, $dir or die "Cannot open $dir: $!\n";
    my @names = readdir DIR;
    closedir DIR;
    for my $name (@names) {
        next if $name eq '.' or $name eq '..';
        # do something with the $name
    }
