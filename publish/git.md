# Git
###### various

[Git](http://git-scm.com/) is a free & open source, distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Every Git clone is a full-fledged repository with complete history and full revision tracking capabilities, not dependent on network access or a central server. Branching and merging are fast and easy to do.

## First-Time Git Setup

Introduce yourself to git with your name and public email address before doing any operation:

    git config --global user.name "Jeffrey Lebowski"
    git config --global user.email "jeffrey.lebowski@dude.com"

Other useful things is to add some colors, alias(es), your editor and diff tool:

    git config --global color.ui true
    git config alias.lol 'log --pretty=oneline --abbrev-commit --graph --decorate'
    git config --global core.editor vim
    git config --global merge.tool vimdiff

You only need to do this *once*.

You can see your configuration like this:

    $ git config --list # output depends on whether you're in a git repo directory or not

or

    $ cat ~/.gitconfig

To start using git, you can either create a new project or get one from the Internet and start working on it.
