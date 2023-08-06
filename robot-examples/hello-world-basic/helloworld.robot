*** Settings ***
#Documentation    Example of a simple Robot Framework.
Library          OperatingSystem
Library          SeleniumLibrary
Library          Screenshot     #pip install pillow

*** Variables ***
${MESSAGE}    Hello world!
${WEBSITE}    https://www.google.com
${BROWSER}    Chrome

*** Test Cases ***
Say welcome in command line
    Set Test Documentation    TestCase-01> Message in one line
    [Tags]    Hello
    Log    ${MESSAGE}

Open WebpageWithRobot
    Set Test Documentation    TestCase-02> Other message in one line
    [Tags]    Smoke
    Open Website    ${WEBSITE}

*** Keywords ***
Log
    [Arguments]    ${MESSAGE}
    Log To Console    ${MESSAGE}

Open Website
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    #Important to use the library "Screenshot"  
    Take Screenshot
    Close Browser

# Test Execution using tags>  python -m robot -i Smoke .\helloworld.robot   
