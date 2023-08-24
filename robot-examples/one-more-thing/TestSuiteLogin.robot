*** Settings ***
Documentation       Use a external Robot Framework scripts

Library             SeleniumLibrary
Library             CustomScript.py
Resource            StepsByKeywords.robot


*** Variables ***
${Login_Error_Message}      css:.oxd-alert-content--error
${Dashboard_Text}           css:.oxd-topbar-header-breadcrumb-module


*** Test Cases ***
Validate successful Login
    [Tags]    tc-01
    Open the Browser with URL
    Fill the login form    ${valid_username}    ${valid_password}
    Verify Dashboard page opens
    Close Browser Session

Validate Unsuccessful Login
    [Tags]    tc-02
    Open the Browser with URL
    Fill the login form    ${invalid_username}    ${invalid_password}
    Verify error message is correct
    Close Browser Session

Custom Actions
    [Tags]    tc-03
    Concatenate Strings    hello    world


*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    css:.orangehrm-login-button

Verify error message is correct
    Element Text Should Be    ${Login_Error_Message}    Invalid credentials

Verify Dashboard page opens
    Element Text Should Be    ${Dashboard_Text}    Dashboard
