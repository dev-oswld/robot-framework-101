# Section 5: Advanced Robot Framework Concepts
We will delve into advanced concepts of the Robot Framework.

## Content

### Test Variables and Argument Files
Test variables allow storing dynamic values that can be accessed and used within test cases. Argument files provide a mechanism for passing data to test cases from external files.
    
```robotframework
*** Variables ***
${url}   https://www.example.com

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    Open Browser  ${url}  chrome

Verify Registration
    [Documentation]  Test case to verify registration functionality
    Open Browser  ${url}  firefox
```

### Test Setup and Teardown at Suite Level
Test setup and teardown can be defined at the suite level to apply to all test cases within the suite. It helps in preparing the system or environment before running any test case and performing necessary cleanup afterward.
    
```robotframework
*** Settings ***
Suite Setup    Open Browser    ${url}    chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}

Verify Logout
    [Documentation]  Test case to verify logout functionality
    Click Button  ${logout_button}
    Page Should Contain  Login
```

### Tags and Tag-based Execution
Tags allow categorizing test cases and selectively executing them based on specific tags. It helps in organizing and running tests targeted at specific areas or functionalities.
    
```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke  Login
    Open Browser  ${url}  chrome
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}

Verify Logout
    [Documentation]  Test case to verify logout functionality
    [Tags]  Logout
    Open Browser  ${url}  chrome
    Click Link  Logout
    Page Should Contain  Login
```

### Test Template and Template Keywords
Test templates provide a way to create reusable test case patterns with placeholders for arguments. Template keywords allow defining generic keyword implementations that can be used within test cases.

```robotframework
*** Settings ***
Test Template    Login Template

*** Keywords ***
Login Template
    [Arguments]    ${username}    ${password}
    Input Text    ${username_field}    ${username}
    Input Password    ${password_field}    ${password}
    Click Button    ${login_button}
    Page Should Contain    Welcome, ${username}

*** Test Cases ***
Verify Login
    [Documentation]    Test case to verify login functionality
    [Tags]    Smoke  Login
    Login Template    ${username}    ${password}
```

### Creating Custom Keywords and Libraries
Robot Framework allows creating custom keywords and libraries to encapsulate reusable functionality. Custom keywords provide a way to extend the built-in keywords and create domain-specific keywords.

```robotframework
*** Keywords ***
Custom Login Keyword
    [Arguments]    ${username}    ${password}
    Input Text    ${username_field}    ${username}
    Input Password    ${password_field}    ${password}
    Click Button    ${login_button}

*** Test Cases ***
Verify Login
    [Documentation]    Test case to verify login functionality
    [Tags]    Smoke  Login
    Custom Login Keyword    ${username}    ${password}
```

### Handling Test Data with Data Tables
Data tables allow organizing and managing test data in a tabular format within test cases. It helps in providing structured input data and expected output data for test cases.
    
```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    |   ${username}  |   ${password}   |
    |   user1        |   pass1         |
    |   user2        |   pass2         |
    |   user3        |   pass3         |
    |   user4        |   pass4         |
    |   user5        |   pass5         |
    |   user6        |   pass6         |
    |   user7        |   pass7         |
    |   user8        |   pass8         |
    |   user9        |   pass9         |
    |   user10       |   pass10        |
    Open Browser  ${url}  chrome
    :FOR  ${row}  IN RANGE  1  11
    \  ${username}=  Get Table Cell  Verify Login  ${row}  1
    \  ${password}=  Get Table Cell  Verify Login  ${row}  2
    \  Input Text  ${username_field}  ${username}
    \  Input Password  ${password_field}  ${password}
    \  Click Button  ${login_button}
    \  Page Should Contain  Welcome, ${username}
```

### Working with Test Suites and Suite Setup/Teardown
Test suites allow organizing and managing multiple test cases together. Suite setup and teardown are special test cases that are executed before and after the test cases in a suite, respectively.

```robotframework
*** Settings ***
Suite Setup  Open Browser  ${url}  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}

Verify Logout
    [Documentation]  Test case to verify logout functionality
    Click Link  Logout
    Page Should Contain  Login
```  

### Importing and Using External Libraries
Robot Framework allows importing and using external libraries to extend its functionality. These libraries provide additional keywords and capabilities to perform specific tasks.

```robotframework
*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Library  RESTLibrary

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    Open Browser  ${url}  chrome
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username} 
```

### Robot Framework Variables and Variable Files
Robot Framework supports variables that can be used to store and access values throughout the test suite. Variable files provide a way to define and manage variables in external files.

```robotframework
*** Variables ***
${url}   https://www.example.com
${username}   user1
${password}   pass1

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    Open Browser  ${url}  chrome
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}
```

### Handling Test Execution Flow with Keywords
Keywords provide a way to define reusable steps that can be executed within test cases. They help in structuring the test execution flow and improving test case readability.

```robotframework
*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    Open Browser  ${url}  chrome
    Login  ${username}  ${password}
    Page Should Contain  Welcome, ${username}
```

## References
- [Awesome list Robot Framework](https://github.com/fkromer/awesome-robotframework)
- [Robot Framework cookbook](https://github.com/adrianyorke/robotframework-cookbook)

## [Go to home](../README.md)
