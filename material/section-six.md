# Section 6: Building Real-World Automation Framework
We will dive into building a real-world automation framework using Python and the Robot Framework.

## Content

### Test Data Management
Effective test data management is crucial for automation frameworks. Test data can be managed using data files, databases, or APIs.

- Storing test data in an Excel file

```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    |   ${username}   |   ${password}   |
    |   user1         |   pass1         |
    |   user2         |   pass2         |
``` 

- Retrieving test data from a database or API:        

```robotframework
*** Variables ***
${username}   Retrieve Test Data   ${user_api}   username
${password}   Retrieve Test Data   ${user_api}   password
```

### Test Configuration and Environment Management
Test configuration and environment management involves setting up and configuring the test environment. It includes managing test settings, test data, test resources, and external dependencies.

```robotframework
*** Settings ***
Library  SeleniumLibrary
Resource  Resources/Keywords.robot
Suite Setup  Open Browser  ${url}  ${browser}
Suite Teardown  Close Browser
Test Setup  [Setup]  Test Preparation
Test Teardown  [Teardown]  Test Cleanup
```

### Logging and Reporting
Logging and reporting play a crucial role in providing detailed information about test execution. It helps in debugging, identifying failures, and generating test reports.

```robotframework
*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${url}  chrome
Suite Teardown  Close Browser
Suite Configuration  Suite Configuration
Test Template  Test Template

*** Keywords ***
Suite Configuration
    [Documentation]  Configure the test suite
    Set Global Variable  ${timestamp}  Get Current Date  result_format=%Y%m%d_%H%M%S
    Set Global Variable  ${log_file}  logs/${timestamp}.log
    Set Global Variable  ${report_file}  reports/${timestamp}.html
    Set Log Level  DEBUG
    Create Directory  logs
    Create Directory  reports
    Set Suite Variable  ${log_file}
    Set Suite Variable  ${report_file}

Test Template
    [Documentation]  Test template for test cases
    [Tags]  sanity
    [Timeout]  5 minutes
    Run Keyword And Continue On Failure  Open Browser  ${url}  ${browser}

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  smoke  login
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}
    Page Should Contain  Welcome, ${username}
```

### Error Handling and Retry Mechanism
Error handling and retry mechanism help in handling exceptions and failures during test execution.

```robotframework
*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${url}  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    :FOR  ${i}  IN RANGE  ${max_retries}
    \  Run Keyword And Ignore Error  Input Text  ${username_field}  ${username}
    \  Run Keyword And Ignore Error  Input Password  ${password_field}  ${password}
    \  Run Keyword And Ignore Error  Click Button  ${login_button}
    \  Run Keyword If  '${condition}' == 'True'  Exit For Loop
    Page Should Contain  Welcome, ${username}
```

### Test Case Organization and Modularization
Test case organization and modularization involve structuring test cases into logical groups and reusable modules.
    
```robotframework
*** Settings ***
Suite Setup  Open Browser  ${url}  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Login Test Cases
    [Tags]  login
    Verify Valid Login
    Verify Invalid Login

Logout Test Cases
    [Tags]  logout
    Verify Logout
```

### Data-Driven Testing
Data-driven testing involves executing test cases with different sets of input data.
    
```robotframework
*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  login
    |   ${username}  |   ${password}   |
    |   user1        |   pass1         |
    |   user2        |   pass2         |
    |   user3        |   pass3         |
    |   user4        |   pass4         |
    \   Input Text  ${username_field}  ${username}
    \   Input Password  ${password_field}  ${password}
    \   Click Button  ${login_button}
    \   Page Should Contain  Welcome, ${username}
```

### Test Execution and Continuous Integration
Test execution and continuous integration involve running test suites and integrating them into a continuous integration (CI) pipeline. It ensures that tests are executed regularly and integrated with other development processes.

- Running tests from the command line:
     
```bash
robot --outputdir results/ --log log.html --report report.html tests/
```
        
- Integrating tests with a CI pipeline (e.g., Jenkins, GitLab CI/CD):

```yaml
stages:
    - test

    test:
    image: python:3.9
    script:
        - pip install -r requirements.txt
        - robot --outputdir results/ --log log.html --report report.html tests/
```

### Test Maintenance and Refactoring
Test maintenance and refactoring involve regularly updating and improving test cases to keep them up-to-date and efficient. It helps in reducing test case maintenance effort and ensuring the reliability of automated tests.

```robotframework
# Refactoring a test case to use reusable keywords
*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    Input Text  ${username_field}  ${username}
    Input Password  ${password_field}  ${password}
    Click Button  ${login_button}

*** Test Cases ***
Verify Login
    [Documentation]  Test case to verify login functionality
    [Tags]  login
    Login  ${username}  ${password}
    Page Should Contain  Welcome, ${username}
```

## Referencess
- [Awesome list Robot Framework](https://github.com/fkromer/awesome-robotframework)
- [Robot Framework cookbook](https://github.com/adrianyorke/robotframework-cookbook)

## [Go to home](../README.md)
