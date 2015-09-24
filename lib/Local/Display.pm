package Local::Display;
use Text::Autoformat;

use Exporter qw(import);
our @EXPORT = qw(
  make_md_link
  count_lines
);

=head1 NAME

Local::Display - functions used for generating output to be displayed

=head1 FUNCTION/METHODS

=head2 count_lines

Count number of lines in a blog post.

=cut

sub count_lines {
    my $post_file = shift;

    open my $fh, "$post_file" or die "Can't open $post_file: $!";
    my $count = 0;
    while (<$fh>) {
        $count++;
    }
    close $fh;

    return $count;
}

=head2 make_md_link

Create link that can be pasted into README.md under a category.

=cut

sub make_md_link {
    my $post = shift;    # ex. "posts/zfs.md"

    my $title = $1 if $post =~ /\/([^\)]+)/;
    return unless defined $title;
    $title =~ s/\.md//;
    $title = autoformat( $title, { case => 'highlight' } );
    chomp $title;
    chomp $title;
    $title =~ s/[-_]/ /g;

    $link = "[$title]($post)";
    $link =~ s/^/* /;

    my $count = count_lines($post);
    
    return "$link ($count lines)";
}

1;
