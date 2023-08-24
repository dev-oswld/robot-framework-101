*** Settings ***
Documentation       First row of the documentation
...
...                 Use a external Robot Framework script

Library             SeleniumLibrary
Library             DateTime


*** Variables ***
${valid_username}       Admin
${valid_password}       admin123

${invalid_username}     nimda
${invalid_password}     321nimda

${browser_}             edge
${url}                  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Keywords ***
Open the Browser with URL
    Set Selenium Speed    1
    Open Browser    ${url}    ${browser_}
    Maximize Browser Window

Close Browser Session
    Set Selenium Implicit Wait    5
    Capture Page Screenshot    test-case-evidence.png
    Close Browser
