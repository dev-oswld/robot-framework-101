# Reference https://docs.robotframework.org/docs/different_libraries/selenium
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NAME}         Robot Framework
${VERSION}      2.0
${ROBOT}        ${NAME} ${VERSION}


*** Test Cases ***
Login with correct Username and Password
   [Documentation]    First row of the documentation
    ...
    ...                Documentation continues here. These rows form
    ...                a paragraph when shown in HTML outputs.    
    [Tags]    login-app

    #Debug mode - only use in your computer
    Set Selenium Speed    1
    # Where are the variables?
    Open Browser    url=https://the-internet.herokuapp.com/login    browser=chrome
    Input Text    username    my
    Input Text    password    SuperSecretPassword!
    Click Button     class:radius
    Element Should Contain    id=flash    You logged into a secure area!
    Click Link    Logout
    Capture Page Screenshot    tc-01-custom-file.png
    Close Browser

Add Tasks And Set To Complete
    [Documentation]
    ...    This list has:
    ...    ${ROBOT}
    ...    - *bold*
    ...    - _italics_
    ...    - link: http://robotframework.org
    ...    
    [Tags]    mvc-app

    Set Selenium Speed    1
    Open Browser    url=https://todomvc.com/examples/angularjs/#/    browser=chrome
    Input Text    class:new-todo    Complete Robot Framework Training
    Press Keys    class:new-todo    RETURN
    Input Text    class:new-todo    Write Automated Tests
    Press Keys    class:new-todo    RETURN
    Input Text    class:new-todo    Take a nap
    Press Keys    class:new-todo    RETURN
    Element Text Should Be    class:todo-count    3 items left
    Click Element    xpath: //*[contains(text(), "Complete Robot Framework Training")]/../input
    Element Text Should Be    class:todo-count    2 items left
    Click Element    xpath: //*[contains(text(), "Write Automated Tests")]/../input
    Element Text Should Be    class:todo-count    1 item left
    Click Element    xpath: //*[contains(text(), "Take a nap")]/../input
    Element Text Should Be    class:todo-count    0 items left
    Capture Page Screenshot    tc-02-custom-file.png
    Close Browser

# Reference https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#setting-background-colors
