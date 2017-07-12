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
# (the lower the value the more aggresive the rules are)
CheckRule "$SQL >= 8" BLOCK;
CheckRule "$RFI >= 8" BLOCK;
CheckRule "$TRAVERSAL >= 4" BLOCK;
CheckRule "$EVADE >= 4" BLOCK;
CheckRule "$XSS >= 8" BLOCK;
```

`naxsi.rules` has to be loaded per location or server block, ex.:
```
## /etc/nginx/sites-enabled/default

location / {
    # First attempt to server request as file, then as directory,
    # then fall back to displaying a 404
    try_files $uri $uri/ =404;

    # Enable Naxsi on this location
    include /etc/nginx/naxsi.rules;
}
```

`systemctl reload nginx`

More
- https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-naxsi-on-ubuntu-14-04
