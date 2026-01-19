*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library          Collections
Test Setup       open the browser with the Mortgage payment url
#Test Teardown    Close Browser session
Resource         ../pages/Generic.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link

*** Test Cases ***
Validate Successful Login
    [Tags]    SMOKE
    Fill the login Form    ${username}    ${invalid_password}
    Wait Until Element is located in the page    ${Error_Message_Login}
    verify error message is correct

Validate Cards display in the shopping page
    Fill the login Form    ${username}    ${valid_password}
    Wait Until Element is located in the page    ${Shop_page_load}
    Verify Card titles in the shop page
    Select the card    Blackberry


Select the Form and navigate to child window
    Fill The Login Details and Login Form
    Sleep    5s

*** Keywords ***

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

Wait Until Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result}=     Get Text        ${Error_Message_Login}
    Should Be Equal As Strings     ${result}                 Incorrect username/password.
    Element Text Should Be         ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =  Get WebElements       css:.card-title
    @{actualList} =    Create List
    FOR    ${element}    IN    @{elements}
        log    ${element.text}
        Append To List        ${actualList}    ${element.text}

    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the card
    [Arguments]    ${cardName}
    ${elements} =  Get WebElements       css:.card-title
    ${index}=    Set Variable    1
        FOR    ${element}    IN    @{elements}
            Run Keyword If    '${element.text}' == '${cardName}'    Exit For Loop
            ${index}=  Evaluate       ${index} + 1
        END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill The Login Details and Login Form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    123456
    Click Element     css:input[value="user"]
    Wait Until Element Is Visible    css:.modal-body
    Click Button      id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected       terms


