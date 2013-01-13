# New Linux server
###### admin

Things I do after installing a fresh Linux machine.

## Mandatory

 1. Disable root logging in with password (i.e. [allow only login with ssh key](http://serverfault.com/a/132583) - scripts using ssh keys can still login): set `PermitRootLogin without-password` in `/etc/ssh/sshd_config` and restart `sshd`

 1. Install `fail2ban` to block ssh brute-force crackers: `aptitude install fail2ban`

 1. Install `ntp` to keep exact time: `aptitude install ntp`

## Optional

 * Setup [firewall](https://github.com/jreisinger/varia/blob/master/iptables.sh) to increase network security.

 * Load some [personalization files](https://github.com/jreisinger/dot-files).

 * Setup `sudo` to increase security - add the following to `/etc/sudoers`:

        # User privilege specification
        root    ALL=(ALL) ALL
        jbond   ALL=(ALL) ALL

 * Set your timezone (ex. to UTC):

        $ sudo cp -p /etc/localtime{,.orig}
        $ sudo ln -sf /usr/share/zoneinfo/UTC /etc/localtime
        $ date
        Wed Feb 17 08:35:29 UTC 2010

### Perl stuff
 * Install `cpanminus` to have a nice installer of [CPAN](https://metacpan.org/) modules (there will be a stable Debian package in the future): `curl -L http://cpanmin.us | perl - --sudo App::cpanminus`
 * Install `Module::Starter` used for building Perl distributions:

        aptitude install make
        cpanm Test::More  ## upgrading Test::More
        cpanm Module::Starter

 * Upgrade all CPAN modules ([source](http://stackoverflow.com/questions/3727795/how-do-i-update-all-my-cpan-module-to-their-latest-versions)) - can take some time (just to get a list of outdated modules [packages]: `cpan-outdated [-p]`):

        aptitude install gcc
        cpanm App::cpanoutdated
        cpan-outdated -p | cpanm
