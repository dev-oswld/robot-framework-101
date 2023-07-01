# Section 2: Object-Oriented Programming in Python
We will explore the core concepts of object-oriented programming (OOP) in Python; classes and objects, inheritance, encapsulation, polymorphism, and abstraction.

## Core Concepts

### Classes and Objects
Classes are blueprints or templates that define the properties and behaviors of objects. Objects are instances of a class, representing real-world entities.

```python
class Car:
    def __init__(self, brand, color):
        self.brand = brand
        self.color = color

    def start_engine(self):
        print("The car's engine is starting.")
    
my_car = Car("Toyota", "red")
my_car.start_engine()
```

### Inheritance
Inheritance allows a class to inherit properties and methods from another class, called the superclass or base class. It helps create a hierarchy of classes with shared attributes and behaviors.

```python
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        print("The animal makes a sound.")

class Dog(Animal):
    def speak(self):
        print("The dog barks.")
    
my_dog = Dog("Buddy")
my_dog.speak()
```

### Encapsulation
Encapsulation is the process of bundling data and methods together within a class, hiding the internal details from outside. It provides data protection and allows controlled access to the internal state of an object.

```python
class BankAccount:
    def __init__(self, account_number, balance):
        self.__account_number = account_number
        self.__balance = balance

    def get_balance(self):
        return self.__balance

my_account = BankAccount("123456789", 1000)
print(my_account.get_balance())    
```

### Polymorphism
Polymorphism allows objects of different classes to be treated as objects of a common superclass. It enables the use of a single interface to represent different forms or types.

```python
class Shape:
    def area(self):
        pass

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
         return self.width * self.height
    
class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    
    def area(self):
        return 3.14 * self.radius ** 2
    
shapes = [Rectangle(4, 5), Circle(3)]
for shape in shapes:
    print(shape.area())    
```

### Abstraction
Abstraction focuses on the essential features of an object, hiding the unnecessary details. It allows us to create abstract classes with abstract methods that provide a common interface for subclasses.

```python
from abc import ABC, abstractmethod
    
class Animal(ABC):
    @abstractmethod
    def speak(self):
        pass
    
class Dog(Animal):
    def speak(self):
        print("The dog barks.")
    
my_dog = Dog()
my_dog.speak()
```

## References
- [What is Python?](https://www.python.org/doc/essays/blurb/)
- [Python Crash Course, 2nd Edition](https://www.oreilly.com/library/view/python-crash-course/9781492071266/)
- [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/)

## [Go to home](../README.md)
