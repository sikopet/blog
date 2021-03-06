# HTTP protocol

## Intro

What for
* used to fetch network resources (documents) based on their hostname and path
* dominant document type - WWW of hypertext documents
* dominant version - HTTP/1.1

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
* line of information (method, resource, protocol, status code) + zero or more of `name:value` headers
* blank line - server/client call `recv()` until `CR-LF-CR-LF` to find out the headers' end
* optional body - its length (framing) is defined by the `Content-Lenght` header
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

The client can't issue another request over the same socket until the response
is finished.

## Methods

* actions; what the server should do

GET
* "read", fetch a resource
* cannot include a body
* can only modify the document being returned (ex. `?q=python` or `?result=10`)

POST
* "write", update resource on a server
* the result of POST can't be cached
* can't be retried automatically if the response does not arrive

## Encoding

HTTP transfer encoding <-> content encoding

Transfer encoding (Content-Length or chunked encoding, raw or compressed)
* wrapper used for data delivery, not a change in the underlying data itself
```
GET / HTTP/1.1
Accept-Encoding: gzip
...

HTTP/1.1 200 OK
Content-Length: 3913
Transfer-Encoding: gzip
...
```

Content type - what format will be selected to represent a given resource
* `application/octet-stream` - a plain sequence of bytes for which server can guarantee no more specific interpretation
* `text/html`

Content encoding - if the format ^ is text, what encoding will be used to turn text code points into bytes
* `charset=utf-8`
```
Content-Type: text/html; charset=utf-8
```

## Authentication and cookies

Basic Auth (HTTP-mediated authentication)
* poor design initially, then fixed by SSL/TLS but still ugly
* still used by simple APIs

TLS/SSL
* server authentication and transfer encryption layer around HTTP

Cookies
* every request is independent of all other requests (from the point of the
    view of the protocol)
* -> authentication info must be carried in every request
* cookie = key-value pair sent by the server and then inserted in all
    further requests:
```
GET /login HTTP/1.1
...

HTTP/1.1 200 OK
Set-Cookie: session-id=d41d8cd98f00b204e9800998ecf8427e; Path=/
...

GET /login HTTP/1.1
Cookie: session-id=d41d8cd98f00b204e9800998ecf8427e
...

```
* cookie should be opaque - random UUID mapped to the username on the
    server or encrypted string that server alone can decrypt
* some servers give you cookie simply for visiting to track how you move
    through the site

## Keep-Alive

* the three-way TCP handshake can be avoided if a connection is already open
* HTTP/1.1 - default to keep HTTP connection open after a request to re-use a
    single TCP connection
* server/client can specify `Connection: close` if they plan on hanging up once
    a request is completed
* web browsers often create four or more simultaneous TCP connections per site
    to get the resources in parallel

## Various

Minimally correct request nowadays (otherwise 404):
```
GET /html/rfc7230 HTTP/1.1
Host: tools.ietf.org
```

Status codes - returned by a server with each response
* 200 - OK
* 3xx - redirects; not expected to carry a body
```
>>> r = urlopen('http://httpbin.org/status/301')
>>> r.status, r.url
(200, 'http://httpbin.org/get')
>>>
>>> r = requests.get('http://httpbin.org/status/301')
>>> (r.status_code, r.url)
(200, 'http://httpbin.org/get')
>>> r.history
[<Response [301]>, <Response [302]>]

```
* 4xx - client request is unintelligible or illegal
* 5xx - server errors
* 502 Bad Gateway - the server is a proxy but it cannot contact the server
    behind it

Caching headers
* allow client to cache and reuse resources locally
* let server skip redelivering an unchanged resource

## Sources

Foundations of Python Network Programming (2014) - [ch. 9](https://www.safaribooksonline.com/library/view/foundations-of-python/9781430258551/9781430258544_Ch09.xhtml)
