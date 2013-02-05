# Shell one-liners
###### shell

See also http://www.commandlinefu.com

--

Search inside files - e.g. search MS Word files for "robot" string:

    find /data -type f -iname "*.doc" -print0 | xargs -0 strings -f |  grep -i 'robot' > find.out

to get just the filenames

    cat find.out | cut -d: -f1 | sort | uniq

--
