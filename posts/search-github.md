# Searching Your Github

I have some code and documetation hosted on GitHub and I sometimes need to search through all these data.

## Clone repos locally

Use [gitmeta](https://github.com/jreisinger/gitmeta) to clone the desired repos.

## Search through the data

Look for files:

    find /tmp/jreisinger -type f -iname "*back*"

Search inside files:

    grep --color -R backup /tmp/jreisinger/
