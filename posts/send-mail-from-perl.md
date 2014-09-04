Using the mail command:

    sub send_mail {
        my $recipient = shift;
        my $subject   = shift;
        my $body      = shift;

        my $mailexe = '/usr/bin/mail';

        open my $MAIL, "|$mailexe -s '$subject' '$recipient'"
            or die "Can't send mail: $!\n";

        print $MAIL $body;
    }
    
Other ways

* http://learn.perl.org/examples/email.html
* http://perldoc.perl.org/Net/SMTP.html
* http://www.phpdeveloper.org.uk/sending-email-in-perl/
* see Perl Cookbook
