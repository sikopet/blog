# Get password from user
###### perl

Sometimes you need to use a password in your command line script. One of the ways how to get it, is to ask the user:

    sub get_passwd {
        my $user = shift;

        system "stty -echo";               # turn off input echoing
        print "Enter password for '$user'> ";
        chomp( my $pass = <STDIN> );

        return $pass;
    }

Use can use this function likes this:

    my $pass = get_passwd($user);
