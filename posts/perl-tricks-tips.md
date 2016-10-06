Reading a directory
-------------------

    opendir DIR, $dir or die "Cannot open $dir: $!\n";
    my @names = readdir DIR;
    closedir DIR;
    for my $name (@names) {
        next if $name eq '.' or $name eq '..';
        # do something with the $name
    }

Sending an email
----------------

Using the `mail` command (you might need to setup something like [ssmtp](http://jreisinger.blogspot.sk/2014/02/fixing-email-aliases-when-using-ssmtp.html)):

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
