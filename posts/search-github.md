# Searching Your Github
###### various, perl

I have some code and wikis hosted on GitHub and I sometimes need to search through all these data.

## Clone repos and wikis locally

Use [clone_all_github_repos.pl](https://github.com/jreisinger/varia/blob/master/clone_all_github_repos.pl) or ([github-backup.pl](https://github.com/jreisinger/varia/blob/master/github-backup.pl)):

    mkdir /tmp/jreisinger && cd /tmp/jreisinger
    perl ~/git/varia/clone_all_github_repos.pl

## Search through the data

Look for files:

    find /tmp/jreisinger -type f -iname "*back*"

Search inside files:

    grep --color -R backup /tmp/jreisinger/
