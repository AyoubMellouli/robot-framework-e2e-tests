*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    DataDriver    file=resources/data.csv    encoding=utf_8    dialect=unix
Test Teardown    Close Browser
Resource         ../pages/Generic.robot
Test Template    Validate UnSuccessful Login


*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}        xzy    123456

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct
    
Fill the login Form
    [Arguments]        ${username}    ${password}
    Input Text        id:username    ${username}    10s
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.