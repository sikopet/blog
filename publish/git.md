# Git
###### various

*   [First-Time Git Setup](#First-Time Git Setup)
*   [Starting a git repository](#Starting a git repository)
*   [Getting a git repository](#Getting a git repository)
*   [Making changes](#Making changes)
    
[Git](http://git-scm.com/) is a free & open source, distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Every Git clone is a full-fledged [in svk: ucelený, kompletný] repository with complete history and full revision tracking capabilities, not dependent on network access or a central server. Branching and merging are fast and easy to do.

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

## Starting a git repository

    $ mkdir project
    $ cd project
    $ git init

You've now initialized the working directory -- you may notice a new directory created, named `.git`.

Next, tell git to take a snapshot [in svk: momentka] of the contents of all files under the current directory (note the `.`), with git-add:

    $ git add .   # temporary storage (index)

This snapshot is now stored in a *temporary staging area* which git calls the "index". You can permanently store the contents of the index in the repository with git-commit:

    $ git commit  # permanent storage

This will prompt you for a commit message. You've now stored the first version of your project in git.

## Getting a git repository

    ## the Linux kernel (approx. 150MB download):
    $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
    ## any server with ssh and git
    $ git clone ssh://[user@]server.xy/path/to/repo.git/

## Making changes

When dealing with git, it's best to work in small bits. Rule of thumb: **if you can't summarise it in a sentence, you've gone too long without committing**.

The typical working cycle is:

1. Work on your project.
2. Check which files you have changed:
3. 
        $ git status
        
3. Check what the actual changes were:

        $ git diff
        
4. Add any files/folders mentioned in step 2 (or new ones):
        
        $ git add file1 newfile2 newfolder3

5. You are now ready to commit. You can see what is about to be committed using `git-diff` with the `--cached` option:
        
        $ git diff --cached

    (Without `--cached`, `git-diff` will show you any changes that you've made but not yet added to the index.) If you need to make any further adjustments, do so now, and then add any newly modified content to the index. Finally, *commit* your changes with:

        $ git commit

    This will again prompt you for a message describing the change, and then record a new version of the project.

Alternatively, instead of running `git-add` beforehand, you can use

    $ git commit -a -m "commit message"

which will automatically notice any modified (but not new) files, add them to the index, and commit, all in one step.

A note on commit messages: Though not required, it's a good idea to begin the commit message with a single short (less than 50 character) line summarizing the change, followed by a blank line and then a more thorough description. Tools that turn commits into email, for example, use the first line on the `Subject:` line and the rest of the commit in the body.
