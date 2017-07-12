- 3rd party Nginx module providing WAF features (ex. XSS and SQL protection)
- similar to Apache's ModSecurity

Enable Naxsi

/etc/nginx/nginx.conf:
```
http {
...
    include /etc/nginx/nginx.conf
...
```

More
- https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-naxsi-on-ubuntu-14-04
