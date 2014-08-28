#!/usr/bin/perl
# Show posts that are not listed in README.md
# Usage: blog$ ./bin/displayed_posts.pl
use strict;
use warnings;
use 5.010;
use autodie;
use File::Find;
use Text::Autoformat;

my @posts;
find( sub { push @posts, $File::Find::name if -f }, 'posts' );

my @links;
open my $fh, "<", "README.md";
while (<$fh>) {
    push @links, $1 if /\((posts\/[^\)]+)\)/;
}

say "Posts that are not displayed in README.md:";
for my $post ( sort @posts ) {
    say make_md_link($post) unless grep $post eq $_, @links;
}

# Create link that can be pasted into README under a category
sub make_md_link {
    $_ = shift;
    my $title = $1 if /\/([^\)]+)/;
    return unless defined $title;
    $title =~ s/\.md//;
    $title = autoformat( $title, { case => 'highlight' } );
    chomp $title;
    chomp $title;
    $_ = "[$title]($_)";
    $title =~ s/[-_]/ /g;
    s/^/* /;
    return $_;
}
