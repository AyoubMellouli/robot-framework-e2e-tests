*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         Generic.robot
*** Variables ***
${Shop_page_load}         css:.nav-link
${country_location}       //a[text()='Indonesia']
*** Keywords ***

Enter the country and select the terms
    [Arguments]    ${country_name}
#    Wait Until Element Is Visible    id:country    20s
#    Click Element    id:country
    Input Text       id:country    ${country_name}
    Wait Until Page Contains Element    //a[text()='${country_name}']    20s
    Click Element    xpath=//a[normalize-space()='${country_name}']
#    Click Element    xpath=//a[normalize-space()='${country_name}']
    Sleep           2
    Click Element    css:.checkbox label


Purchase the product and confirm the purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!