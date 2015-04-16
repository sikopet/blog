Sort running processes by memory use

    ps -eo pmem,pcpu,rss,vsize,args | sort -k 1 -r | less

Find files you might want to backup

    find / -type f ! -path '*/.*' -mtime -30 2>/dev/null | \
    grep -E -v \
    -e '^/proc' \
    -e '^/sys' \
    -e '^/var/(lib|cache|log|spool|mail|backups)' \
    -e '^/tmp' \
    -e '^/run' \
    -e '^/usr' \
    -e '^/lib' \
    -e '^/boot' \
    -e '^/dev'

Check which machines you can login into

    for h in `cat /tmp/hosts`
    do printf "ssh-ing into %20s ... " $h
        if ssh -q -o BatchMode=yes root@$h exit; then
            echo "OK"
        else
            echo "FAIL"
        fi
    done

Count number of cores

    for n in `grep 'cpu cores' /proc/cpuinfo | cut -d: -f2 | sed 's/ //'`; do t=$(($t+$n)); done; echo $t

Compute strings' SHA1 message digests

    $ for name in "jano" "fero" "daniel"; do echo -n $name | sha1sum; done
    b07fe6fe542d2d3b400e59b6e08eab04901148be  -
    792615d815e90d6fdd35e5916b2ce5a8014bd4e1  -
    3d0f3b9ddcacec30c4008c5e030e6c13a478cb4f  -

Find and rename multiple files (`*.log` => `*.LOG`)

    find . -type f -name '*.log ' | grep -v .do-not-touch | while read fname
    do
        echo mv $fname ${fname/.log/.LOG/}
    done

Search inside files; e.g. search MS Word files for "robot" string:

    find /data -type f -iname "*.doc" -print0 | xargs -0 strings -f |  grep -i 'robot' > find.out

* to get just the filenames

        cat find.out | cut -d: -f1 | sort | uniq

See also 

* http://www.commandlinefu.com
