# Section 3: Python Libraries for Automation
We will explore various Python libraries that are commonly used for automation purposes.

## Content

### Web Automation Libraries
Web automation libraries, such as Selenium and BeautifulSoup, allow us to automate interactions with web applications. Selenium enables automated browser testing and web scraping. BeautifulSoup provides a convenient way to parse and extract data from HTML or XML documents.

- Selenium

```python
from selenium import webdriver

driver = webdriver.Chrome()
driver.get("https://www.example-url.com")

element = driver.find_element_by_id("username")
element.send_keys("my_username")
```

### API Automation with requests Library
The requests library simplifies sending HTTP requests and interacting with APIs. It enables automation of API interactions, such as making GET, POST, PUT, DELETE requests and handling responses.

```python
import requests

response = requests.get("https://api.example.com/users")

if response.status_code == 200:
    users = response.json()
    for user in users:
        print(user['name'])
```

### Data Manipulation and Analysis
Pandas is a powerful library for data manipulation and analysis. It provides data structures (e.g., DataFrame) and functions for cleaning, transforming, and analyzing structured data.

```python
import pandas as pd

data = {'Name': ['John', 'Alice', 'Bob'],
        'Age': [25, 30, 35],
        'Country': ['USA', 'Canada', 'UK']}

df = pd.DataFrame(data)
print(df.head())
```

### Interacting with Databases using SQL Alchemy
SQL Alchemy is a library that simplifies database interactions in Python. It provides an Object-Relational Mapping (ORM) layer for working with databases using Python classes and objects.

```python
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine('sqlite:///my_database.db')
Base = declarative_base()

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    name = Column(String)

Session = sessionmaker(bind=engine)
session = Session()

user = User(name='John')
session.add(user)
session.commit()
```

### Unit Testing
The unittest library provides a framework for writing and executing unit tests in Python. It allows us to define test cases, test fixtures, and assertions to verify the behavior of functions or classes.

```python
import unittest

def add_numbers(a, b):
    return a + b

class TestMathFunctions(unittest.TestCase):
    def test_add_numbers(self):
        result = add_numbers(2, 3)
        self.assertEqual(result, 5)

    if __name__ == '__main__':
        unittest.main()
```

### Working with Files and Directories
Python provides built-in libraries for file and directory operations, such as reading, writing, and manipulating files and directories.

```python
# Reading a file
with open('myfile.txt', 'r') as file:
content = file.read()
print(content)
```

### Logging with the logging Library
The logging library enables logging messages to various outputs, such as the console or a file.

```python
import logging

logging.basicConfig(level=logging.DEBUG, filename='app.log', filemode='w')

logging.debug('This is a debug message')
logging.info('This is an info message')
logging.warning('This is a warning message')
```

### Working with Dates and Times using the datetime Library
The datetime library allows working with dates, times, and intervals in Python.

```python
from datetime import datetime

current_time = datetime.now()
print(current_time)
```

### Regular Expressions
The re library provides support for regular expressions in Python. Regular expressions are powerful patterns used to match and manipulate text.

```python
import re

text = 'Hello, my email is john@example.com'
pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
matches = re.findall(pattern, text)
print(matches)
```

### Working with Excel
The openpyxl library enables reading and writing Excel files in Python.

```python
from openpyxl import Workbook

workbook = Workbook()
sheet = workbook.active
sheet['A1'] = 'Hello'
sheet['B1'] = 'World'
workbook.save('myfile.xlsx')
```

## [Go to home](../README.md)
