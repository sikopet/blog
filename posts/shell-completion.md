# Shell Completion
###### shell, perl

(Created 2013-03-12)

Bash (one of the most popular shells) offers a great feature that makes many people's Tab key pretty worn. It completes the names of commands, directories and files you start to write. The `complete` command (`man bash` => "Programmable Completion") lets users extend the standard completion fucntion.

## Bash Completion

The [Bash Completion](http://bash-completion.alioth.debian.org/) project offers many many completion rules that you can add to `~/.bashrc`. If not already installed:

    aptitude install bash-completion

Then you may need to source it from `/etc/bashrc` or `~/.bashrc`:

    # Use bash-completion, if available
    [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
        . /usr/share/bash-completion/bash_completion

## Bash Completion with Perl

Bash completion project builds on shell scripting which is easy to write but limited. You might prefer to use a more complete language, like Perl. 

### Perl Programs

If you want your Perl applications to complete their options use [Getopt::Complete](https://metacpan.org/module/Getopt::Complete) module:

    #!/usr/bin/perl -w
    # getopt-complete -- sample self-completing script
    use strict;

    use Getopt::Complete(
        'tmpdir' => [ "/tmp",     "$ENV{HOME}/temp", "/var/tmp" ],
        'user'   => [ $ENV{USER}, "root" ],
    );

Add the following to `~/.bashrc`:

    function _getopt_complete () {
        COMPREPLY=($( COMP_CWORD=$COMP_CWORD perl `which ${COMP_WORDS[0]}` ${COMP_WORDS[@]:0} ));
    }
    complete -F _getopt_complete getopt-complete

Then `source ~/.bashrc` or relogin and run:

    ./getopt-complete <TAB>


### Compiled Programs

In case you want to add the completion functionality to a compiled program you can't rewrite, you have to wrap it into an external helper, like Mike Schilli did in [github-helper](https://github.com/jreisinger/varia/blob/master/github-helper). If you want to use this script, put it into your `PATH` and add following to `~/.bashrc`:

    complete -C github-helper -o default git
    
The `-o default` option reverts to shell's completion mechanism if `github-helper` has nothing to offer.
