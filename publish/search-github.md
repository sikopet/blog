# Searching your GitHub
###### var, perl

I have some code and wikis hosted on GitHub and I sometimes need to search through all these data.

## Clone repos and wikis locally

Use [github-backup.pl](https://github.com/jreisinger/varia/blob/master/github-backup.pl) (or [clone_all_github_repos.pl](https://github.com/jreisinger/varia/blob/master/clone_all_github_repos.pl)):

    ./github-backup.pl --nomirror --wiki <username> /tmp/

## Search through the data

Look for files:

    find /tmp/<username>/ -type f -iname "*back*"

Search insinde files:

    grep --color -R backup /tmp/<username>/
