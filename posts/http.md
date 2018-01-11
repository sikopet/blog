# HTTP protocol

What for
* used to fetch network resources (documents) based on their hostname and path
* dominant document type - WWW of hypertext documents
* domminant version - HTTP/1.1

Python libraries
* `urllib` - client in Standard Library, for simple use
```
from urllib.request import urlopen
import urllib.error
r = urlopen('http://httpbin.org/headers')
# you need to instruct urllib how to turn raw bytes into text
print(r.read().decode('ascii'))
```
* `requests` - the go-to tool 
```
import requests
r = requests.get('http://httpbin.org/headers')
print(r.text)
```

HTTP message format (both request `>` and response `<`)
* line of information (method, resource, protocol, status code) + name:value headers
* blank line
* optional body
```
$ curl reisinge.net -v
* Rebuilt URL to: reisinge.net/
*   Trying 109.230.20.210...
* Connected to reisinge.net (109.230.20.210) port 80 (#0)
> GET / HTTP/1.1
> Host: reisinge.net
> User-Agent: curl/7.47.0
> Accept: */*
>
< HTTP/1.1 302 Moved Temporarily
< Server: nginx/1.12.2
< Date: Thu, 11 Jan 2018 07:51:16 GMT
< Content-Type: text/html
< Content-Length: 161
< Connection: keep-alive
< Location: http://jreisinger.github.io
<
<html>
<head><title>302 Found</title></head>
<body bgcolor="white">
<center><h1>302 Found</h1></center>
<hr><center>nginx/1.12.2</center>
</body>
</html>
* Connection #0 to host reisinge.net left intact
```

Methods (actions, what to do)
* GET - "read", fetch a resource
* POST - "write", update resource on a server

Status codes - returned by a server with each response
* 200 - OK
* 3xx - redirects
* 4xx - client errors
* 5xx - server errors

Caching headers
* allow client to cache and reuse resources locally
* let server skip redelivering an unchanged resource

Content negotiation
* tailor data formats and human languages for the client, has issues

Authentication and encryption
* Basic Auth - poor design
* TLS (SSL) - server authentication and transfer encryption layer around HTTP

Source
* Foundations of Python Network Programming (2014) - ch. 9
