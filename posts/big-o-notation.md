(Up-to-date [source](https://github.com/jreisinger/blog/blob/master/posts/big-o-notation.md) of this post.)

* a mathematical way of describing *scaling*
* used to classify a system based on how it responds to changes in input size
* *O* is used because the growth rate of an algorithm's run-time is known as its
    *order*

Sub-linear scaling
* O(1) - **constant** - no matter the scale of the input, performance of the system
    does not change; ex. hash-table lookup in RAM (such algorithms are rare)
* O(log n) - logarithmic; ex. [binary search](https://github.com/jreisinger/algorithms-with-perl/blob/master/binary-search) grows slower as the size of the corpus being searched grows; it's growth is less than linear

Linear scaling
* O(n) **linear** - ex. twice as much data requires twice as much processing time

Super-linear scaling
* O(n^m) - exponential - as input size grows the system slows down
    disproportionately
* O(n^2) - quadratic (but everybody says **exponential** when they mean quadratic)

Resources

* PoCSA, Appendix C

See also

* http://bigocheatsheet.com/
