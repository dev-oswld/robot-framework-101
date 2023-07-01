# Section 4: Introduction to Robot Framework
We will introduce the Robot Framework, a popular framework for test automation and robotic process automation.

## Content

### Test Cases and Test Suites
Test cases are the individual units of testing that validate specific functionalities or scenarios. Test suites are collections of test cases organized together.

```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke
    Open Browser  ${url}  chrome
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}

*** Test Suites ***
Smoke Tests
    Verify Login
```

### Keywords
Keywords are reusable components that perform specific actions or verifications in a test case. They abstract the implementation details and enhance test case readability.

```robotframework
*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    
Verify Welcome Message
    [Arguments]  ${username}
    Page Should Contain  Welcome, ${username}

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke
    Open Browser  ${url}  chrome
    Login  ${username}  ${password}
    Verify Welcome Message  ${username}
```

### Test Data and Variables
Test data provides input values and expected outcomes for test cases. Variables allow storing and reusing values within the test suite.

```robotframework
*** Variables ***
${url}              https://www.example.com
${username_field}   id=username
${password_field}   id=password
${login_button}     xpath=//button[@id='login']

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke
    Open Browser  ${url}  chrome
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}
```

### Test Setup and Teardown
Test setup and teardown are special sections that execute before and after test cases, respectively. They help prepare the system or environment for testing and perform necessary cleanup.
    
```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke
    [Setup]  Open Browser  ${url}  chrome
    [Teardown]  Close Browser
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}
```
    

### Test Tags and Test Execution
Test tags provide metadata to categorize and organize test cases. Test execution allows running specific test cases or test suites based on tags or patterns.
    
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

*** Test Cases ***
Verify Logout
    [Documentation]  Test case to verify logout functionality
    [Tags]  Smoke  Logout
    Login  ${username}  ${password}
    Click Link  Logout
    Page Should Contain  Login
```

### Test Documentation and Reporting
Test documentation provides descriptive information about test cases, helping users understand their purpose and requirements. Reporting generates detailed test execution reports, including the test results, status, and any errors or failures encountered.

```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke
    [Documentation]  This test case verifies that a user can successfully log in to the system.
    [Setup]  Open Browser  ${url}  chrome
    [Teardown]  Close Browser
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}  
```

### Data-Driven Testing

Data-driven testing allows executing the same test case with multiple sets of input data. It helps cover different scenarios and increase test coverage.
    
```robotframework
*** Test Cases ***
Verify Login With Multiple Users
    [Documentation]  Test case to verify login functionality with multiple users
    [Tags]  Smoke
    [Setup]  Open Browser  ${url}  chrome
    [Teardown]  Close Browser
    :FOR  ${user}  IN  @{users}
    \  Input Text  ${username_field}  ${user['username']}
    \  Input Password  ${password_field}  ${user['password']}
    \  Click Button  ${login_button}
    \  Page Should Contain  Welcome, ${user['username']}
    
*** Variables ***
@{users}  Create List  ${user1}  ${user2}  ${user3}
${user1}  Create Dictionary  username=user1  password=password1
${user2}  Create Dictionary  username=user2  password=password2
${user3}  Create Dictionary  username=user3  password=password3
```

### Resource Files and Libraries
Resource files allow defining reusable keywords, variables, and settings that can be imported and used in multiple test suites. Libraries provide additional functionality by importing and utilizing external libraries or modules.

```robotframework
*** Settings ***
Resource  common_resources.robot
Library  SeleniumLibrary
Library  OperatingSystem

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke
    [Setup]  Open Browser  ${url}  chrome
    [Teardown]  Close Browser
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}
```

### Handling Test Failures and Exceptions
Robot Framework provides mechanisms to handle test failures and exceptions. It allows specifying expected failures, handling exceptions, and defining custom actions on failure.
  
```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  Smoke
    [Setup]  Open Browser  ${url}  chrome
    [Teardown]  Close Browser
    Login  ${username}  ${password}
    Run Keyword And Expect Error  Page Should Contain  Invalid credentials
    Capture Page Screenshot  login_failure.png  # Capture screenshot on failure
```

### Test Case Organization and Reusability
Organizing test cases and making them reusable is crucial for effective test development and maintenance. Grouping test cases by functionality, using keywords and resource files, and leveraging variable-driven testing are key practices.

```robotframework
*** Test Cases ***
Login Tests
    Verify Login With Valid Credentials
    Verify Login With Invalid Credentials

Account Management Tests
    Create New Account
    Update Account Information
```

## [Go to home](../README.md)
