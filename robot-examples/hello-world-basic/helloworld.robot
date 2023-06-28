*** Settings ***
Documentation    Example of a simple Robot Framework.
Library          OperatingSystem
Library          SeleniumLibrary

*** Variables ***
${MESSAGE}    Hello world!
${WEBSITE}    https://www.google.com
${BROWSER}    Chrome

*** Test Cases ***
Say welcome in command line
    Log    ${MESSAGE}

Open WebpageWithRobot
    Open Website    ${WEBSITE}

*** Keywords ***
Log
    [Arguments]    ${MESSAGE}
    Log To Console    ${MESSAGE}

Open Website
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
