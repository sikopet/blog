- "universal encoding"
- 32 bits to encode a character
- problem: wasted space since 8 bits are often enough for enconding a char
- solution: "Unicode Transformation Format 8 bits" (UTF-8) - encodes most
  common characters using 8 bits, and then "escapes" into larger numbers when
  needed

```
>>> raw_bytes = b'\xe6\x96\x80'
>>> raw_bytes.decode()
'斀'
>>> utf_string = '斀'
>>> utf_string.encode()
b'\xe6\x96\x80'
```
