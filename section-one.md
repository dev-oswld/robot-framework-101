# Section 1: Introduction to Python
Python is a high-level, general-purpose, interpreted, object-oriented programming language with dynamic semantics. Python is often described as a *“batteries included”* language due to its comprehensive standard library.

## Core Concepts

### Variables
Variables are used to store data in Python. We can assign values to variables using the assignment operator (=).

```python
name = "John"
```

### Data Types
Python supports various data types such as strings, numbers, booleans, lists, tuples, and dictionaries.

```python
message = "Hello, World!" #string
age = 25 #number
is_student = True #boolean
fruits = ["apple", "banana", "orange"] #list
coordinates = (10, 20) #tuple
person = {"name": "John", "age": 30} #dictionary
```

### Operators
Operators are used to perform operations on variables and values.
- Arithmetic operators: `+, -, *, /, %`
- Comparison operators: `==, !=, >, <, >=, <=`
- Logical operators: `and, or, not`
- Assignment operators: `=, +=, -=, *=, /=`

### Control Flow
Control flow allows us to control the flow of program execution based on conditions.

- if statement
```python
    if age >= 18:
        print("You are an adult")
    else:
        print("You are a minor")
```

- for loop:
```python
    for fruit in fruits:
        print(fruit)
```

- while loop:
```python
    i = 0
    while i < 5:
        print(i)
        i += 1
```

### Functions
Functions are reusable blocks of code that perform specific tasks. We can define our own functions or use built-in functions.

```python
    def greet(name):
        print("Hello, " + name)
    greet("John")
```

### Modules
Modules are files containing Python code that can be reused in different programs. We can import modules to access their functions and variables.

```python
    import math
    print(math.sqrt(25))
```

## References
- [What is Python?](https://www.python.org/doc/essays/blurb/)
- [Python Crash Course, 2nd Edition](https://www.oreilly.com/library/view/python-crash-course/9781492071266/)
- [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/)
