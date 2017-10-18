create an object from the class, ex.

```
class Eyes(object):

    def __init__(self, color='brown'):
        self.color = color

    def print_color(self):
        print("Eyes are", self.color)

eyes_obj = Eyes(color='blue')  # instantiation
```
