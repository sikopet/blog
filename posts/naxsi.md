- 3rd party Nginx module providing WAF features (ex. XSS and SQL protection)
- similar to Apache's ModSecurity

Enable Naxsi
------------

/etc/nginx/nginx.conf:
```
http {
...
    include /etc/nginx/naxsi_core.rules
...
```

/etc/nginx/naxsi.rules:
```
# Sample rules file for default vhost ..
# . no requests will be blocked just logged
LearningMode;
# . enable Naxsi for a server block/location
SecRulesEnabled;
#SecRulesDisabled;
# . sent denied requests to this url
DeniedUrl "/50x.html";

# . set the threshold for different counters
# (the lower the value the more aggresive the rule is)
CheckRule "$SQL >= 8" BLOCK;
CheckRule "$RFI >= 8" BLOCK;
CheckRule "$TRAVERSAL >= 4" BLOCK;
CheckRule "$EVADE >= 4" BLOCK;
CheckRule "$XSS >= 8" BLOCK;
```

`naxsi.rules` has to be loaded per location or server block, ex. /etc/nginx/sites-enabled/default:
```
location / {
    # First attempt to server request as file, then as directory,
    # then fall back to displaying a 404
    try_files $uri $uri/ =404;

    # Enable Naxsi on this location
    include /etc/nginx/naxsi.rules;
}
```

`systemctl reload nginx`

Naxsi rules
-----------

(1) main rules (`MainRule`)

- generic signatures for detecting malicious activities
- applied globally for the server (are part of `http` block)

/etc/nginx/naxsi_core.rules:
```
MainRule "str:--" "msg:mysql comment (--)" "mz:BODY|URL|ARGS|$HEADERS_VAR:Cookie" "s:$SQL:4" id:1007;
```
- `MainRule` directive to begin the rule with
- `str:` the signature will be a plain string (other option is `rx`)
- `msg:` comment
- `mz:` match zone, or which part of the request will be inspected
- `s:` the score which will be assigned when the signature is found. Scores are
   added to different counters `SQL` (SQL attacks), `RFI` (remote file inclusion
   attacks), ...

(2) basic rules (`BasicRule`)

- used mainly for whitelisting false positive signatures and rules
- applied per location

Whitelisting rules
------------------

The default Naxsi rules will almost certainly block some legitimate traffic.

/etc/nginx/naxsi_whitelist.rules

    BasicRule wl:1007 "mz:URL";

- `wl` whitelist
- `1007` rule ID

/etc/nginx/sites-enabled/default:
```
location / {
    # First attempt to server request as file, then as directory,
    # then fall back to displaying a 404
    try_files $uri $uri/ =404;

    # Enable Naxsi on this location
    include /etc/nginx/naxsi.rules;
    include /etc/nginx/naxsi_whitelist.rules;
}
```

`systemctl reload nginx`

More
- https://github.com/nbs-system/naxsi
- https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-naxsi-on-ubuntu-14-04