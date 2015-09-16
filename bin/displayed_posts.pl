#!/usr/bin/perl
# Show posts (posts/*.md) that are not listed in README.md
# Usage: blog$ ./bin/displayed_posts.pl
use strict;
use warnings;
use 5.010;
use autodie;
use File::Find;
use Text::Autoformat;
use File::Basename;

my @posts;
find( sub { push @posts, $File::Find::name if -f && /\.md$/ }, 'posts' );

my @links;
open my $fh, "<", "README.md";
while (<$fh>) {
    push @links, $1 if /\((posts\/[^\)]+)\)/;
}

say "Posts that are not displayed in README.md:";
for my $post ( sort @posts ) {

    if ( -l $post ) {

        # convert symlink to basename of its value
        $post = basename( readlink $post );
    } else {
        warn "WARN: $post is not symlinked within any subdirectory\n"
          unless symlink_exists($post);
    }

    my $link = make_md_link($post) unless grep $post eq $_, @links;
    say $link if $link;
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
    $title =~ s/[-_]/ /g;
    $_ = "[$title]($_)";
    s/^/* /;
    return $_;
}

# Is there at least one symlink, i.e. category, for this post?
sub symlink_exists {
    my $post = shift;

    my @symlinks;
    find( sub { push @symlinks, $File::Find::name if -l && /\.md$/ }, 'posts' );

    for my $link (@symlinks) {
        return 1 if basename($link) eq basename($post);
    }

    return;
}
