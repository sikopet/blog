# Shell One-Liners
###### shell, perl

See also <http://www.commandlinefu.com>.

## Various

* find and rename multiple files (`*.log` => `*.LOG`)

        $ find . -type f -name '*.log ' | grep -v .do-not-touch | while read fname
        > do
        > echo mv $fname ${fname/.log/.LOG/}
        > done

### Search inside files 

E.g. search MS Word files for "robot" string:

    find /data -type f -iname "*.doc" -print0 | xargs -0 strings -f |  grep -i 'robot' > find.out

* to get just the filenames

        cat find.out | cut -d: -f1 | sort | uniq

