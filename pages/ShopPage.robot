*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         Generic.robot
*** Variables ***
${Shop_page_load}         css:.nav-link
*** Keywords ***


Wait Until Element is located in the page
    Generic.Wait Until element passed is located on the page    ${Shop_page_load}

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