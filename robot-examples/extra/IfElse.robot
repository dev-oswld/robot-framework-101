*** Settings ***
Documentation    ${recipe}
Library          DateTime

*** Variables ***
${recipe}         Robot Framework 4 introduced native IF, ELSE and ELSE IF syntax  
${answer}         42

*** Test Cases ***
Check Basic IF
    IF    ${answer} == 42
        Log    Answer to the Ultimate Question of Life, the Universe, and Everything.
    END

Check ELSE
    ${date} =    Get Current Date    result_format=datetime
    Log    Month = ${date.month}
    IF    ${date.month} < 7
        Log    First Half of Year
    ELSE
        Log    Second Half of Year
    END

Check ELSE IF
    ${date} =    Get Current Date    result_format=datetime
    Log    Hour is ${date.hour}
    IF    ${date.hour} < 12
        Log    Good morning!
    ELSE IF    ${date.hour} < 18
        Log    Good afternoon!
    ELSE
        Log    Good evening!
    END

# Reference https://github.com/adrianyorke/robotframework-cookbook
