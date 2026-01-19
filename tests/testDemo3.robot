*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library          String
Library          Collections
Test Setup       open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource         ../pages/Generic.robot


*** Variables ***
${Error_Message_Login}    css:.alert-danger
*** Test Cases ***
Validate Child window Functionality
    [Tags]    NEWFEATURE
    Select the link of Child window
    Verify the user is switched to child window
    Grab the Email id in the child window
    Switch to parent window and enter the Email


*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep            5
    
Verify the user is switched to child window
    Switch Window    New
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id in the child window
    ${text}=     Get Text    css:.red
    @{words}=    Split String    ${text}    at
    #0-> Please email us
    #1->  mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=    Get From List    ${words}    1
    @{words_2}=    Split String    ${text_split}
    #0->    mentor@rahulshettyacademy.com
    ${email}=    Get From List    ${words_2}    0
    Set Global Variable        ${email}
    
Switch to parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
