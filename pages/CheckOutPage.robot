*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         Generic.robot
*** Variables ***
${Shop_page_load}         css:.nav-link
#${responsive_css}        css:.table-responsive

*** Keywords ***

Verify items in the checkout page and proceed
    Click Element    css:.btn-success

#Verify items in the checkout page and proceed
#    Wait for a long time Until element passed is located on the page    ${responsive_css}
#    Click Element    xpath=//button[normalize-space()='Proceed']
