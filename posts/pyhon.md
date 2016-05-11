Variables

* types are associated with objects, not variables
* variables are not checked for type at compile time
* Python variables are more like labels that reference various objects
    (integers, strings, class instances, ...)

        x = "2"     # x is string
        x = int(x)  # x is now integer

* don't have to be declared
* can have any built-in data type, user-defined object, function, or module
    assigned to them

Synopsis

* built-in data types can be manipulated with operators, built-in functions,
    library functions, or a data type's own methods
* all Python objects are instances of one class or another

Built-in data types

* numbers
* lists

        []
        [1]
        [1, "two", (3, 4), ["a", "b"]]

 * built-in functions: len, max, min
 * operators: in, +, * (create new list, original unchanged)
 * statements: del
 * methods: append, count, extend, index, insert, pop, remove, reverse, sort

* tuples (immutable lists)
* strings

        >>> x = "Do not meddle    in \the affairs of \nwizards"
        >>> x2 = x.replace("\the", "the")
        >>> import re
        >>> regex = re.compile(r"[\t ]+")
        >>> regex.sub(" ", x2)
        'Do not meddle in the affairs of \nwizards'

* dictionaries (associative array functionality implemented using hash tables)

        { 1: "one", 2: "two" }

 * keys must be of an immutable type (numbers, strings, tuples)

* sets (an unordered collection of objects)

        >>> x = set([1, 2, 3])
        >>> 1 in x
        True
        >>> 4 in x
        False

 * when membership and uniqueness in the set are important
 * likes dictionary keys without values

* file objects

        f = open("myfile", "r")
        line1 = f.readline()
        f.close()

Sources

* The Quick Python Books
