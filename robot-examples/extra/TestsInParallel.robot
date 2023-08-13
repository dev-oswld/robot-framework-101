# 🚩 Skip
*** Settings ***
Documentation    
...              You want to reduce the overall test execution time by running all test cases
...              within a test suite in parallel using parallel executor (pabot).
...              This recipe has the following external dependencies:
...              pip install robotframework-pabot

Library    pabot
Test Tags    Multithread

*** Variables ***
${DELAY}          15

*** Test Cases ***
Test Case 1
    Log      Starting Test Case 1 using delay ${DELAY}
    Sleep    ${DELAY}

Test Case 2
    Log      Starting Test Case 2 using delay ${DELAY}
    Sleep    ${DELAY}
    Run Keyword And Ignore Error    Should Be Equal    foo    bar

Test Case 3
    Log      Starting Test Case 3 using delay ${DELAY}
    Sleep    ${DELAY}

Test Case 4
    Log      Starting Test Case 4 using delay ${DELAY}
    Sleep    ${DELAY}
    Run Keyword And Ignore Error    Should Be Equal    foo    bar

# python -m pabot.pabot TestsInParallel.robot
# Reference https://github.com/adrianyorke/robotframework-cookbook
# Docs https://pabot.org/
