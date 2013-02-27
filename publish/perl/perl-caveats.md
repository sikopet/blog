# Perl Caveats
###### perl

Perl stuff I'd better remember :).

## Is Perl compiled or interpreted?

Yes:

                                  +-------------------+
    +------+     compilation      |(kind of) byte code|
    |source| +------------------> |not kept around    |+---> execution
    |code  |                      |between executions |
    +------+                      +-------------------+

Consequence: Perl reads all the code before execution.

## Naming conventions for scalar variables

* constants are in `$ALL_CAPITAL_LETTERS`
* local variables are in `$lower_case`
* global variables are in `$Title_case`
* words are `$separated_by_uderscores`

See also [perlstyle](http://perldoc.perl.org/perlstyle.html).

## What is truth for scalars

* If a string expression evaluates to the empty string `""` or the string `"0"`, it's false.
* If a numeric expression evaluates to an integer or floating point *zero* (exactly zero, not "nearly zero"), it's false.
* If an expression evaluates as the *undefined* value, it's false.
* Any other value of any kind of expression is true.

## List vs. array in scalar conext

    #!/usr/bin/perl
    use strict;

    #use warnings; # yields a warning if uncommented

    my @array              = qw(one two three);
    my $number_of_elements = @array;              # ARRAY in scalar context
    print "$number_of_elements\n";                # 3

    my $last_element = qw(one two three);         # LIST in scalar context
    print "$last_element\n";                      # three

More: [List value constructors](http://perldoc.perl.org/perldata.html#List-value-constructors), [Scalar and List context in Perl](http://szabgab.com/scalar-and-list-context-in-perl.html).

## split() function

<table cellspacing='4'><tbody valign='top'><tr class="cb_msg even-row chatfrom_898593"><td><span class='cb_sq_br'>&#91;</span><span class='cb_author' title="Feb 15, 2013 at 09:56&nbsp;CET"><a href="http://perlmonks.org/?node_id=898593">j0se</a></span><span class='cb_sq_br'>&#93;</span></td><td><span title="Hi, why this doesn&#39;t split on &quot;|&quot;? &lt;c&gt;perl -w -E &#39;my $line = &quot;one | two | three&quot; ; say &quot;&#91;$_&#93;&quot; for split &quot;|&quot;, $line&#39;&lt;/c&gt;">Hi, why this doesn't split on "|"? <tt>perl -w -E &#39;my $line = &quot;one | two | three&quot; ; say &quot;&#91;$_&#93;&quot; for split &quot;|&quot;, $line&#39;</tt></span></td></tr><tr class="cb_msg odd-row chatfrom_832495"><td><span class='cb_sq_br'>&#91;</span><span class='cb_author' title="Feb 15, 2013 at 09:57&nbsp;CET"><a href="http://perlmonks.org/?node_id=832495">choroba</a></span><span class='cb_sq_br'>&#93;</span></td><td><span title="&#91;doc://split&#93; takes a regular expression as its first argument. &lt;c&gt;|&lt;/c&gt; is special in regexes"><a href="http://perldoc.perl.org/functions/split.html">split</a> takes a regular expression as its first argument. <tt>|</tt> is special in regexes</span></td></tr><tr class="cb_msg even-row chatfrom_832495"><td><span class='cb_sq_br'>&#91;</span><span class='cb_author' title="Feb 15, 2013 at 09:58&nbsp;CET"><a href="http://perlmonks.org/?node_id=832495">choroba</a></span><span class='cb_sq_br'>&#93;</span></td><td><span title="use &lt;c&gt;split /\|/&lt;/c&gt; for literal vertical bar">use <tt>split /\|/</tt> for literal vertical bar</span></td></tr><tr class="cb_msg odd-row chatfrom_898593"><td><span class='cb_sq_br'>&#91;</span><span class='cb_author' title="Feb 15, 2013 at 10:01&nbsp;CET"><a href="http://perlmonks.org/?node_id=898593">j0se</a></span><span class='cb_sq_br'>&#93;</span></td><td><span title="I see, thanks! So even if I don&#39;t use // for &lt;c&gt;split&lt;/c&gt;&#39;s first argument, it&#39;s considered a regex.">I see, thanks! So even if I don't use // for <tt>split</tt>'s first argument, it's considered a regex.</span></td></tr><tr class="cb_msg even-row chatfrom_832495"><td><span class='cb_sq_br'>&#91;</span><span class='cb_author' title="Feb 15, 2013 at 10:04&nbsp;CET"><a href="http://perlmonks.org/?node_id=832495">choroba</a></span><span class='cb_sq_br'>&#93;</span></td><td><span title="&#91;j0se&#93;: Yes. The only exception is &lt;c&gt;&#39; &#39;&lt;/c&gt; which has a special meaning in &lt;c&gt;split&lt;/c&gt;"><a href="http://perlmonks.org/?node=j0se">j0se</a>: Yes. The only exception is <tt>&#39; &#39;</tt> which has a special meaning in <tt>split</tt></span></td></tr></tbody></table></p>
