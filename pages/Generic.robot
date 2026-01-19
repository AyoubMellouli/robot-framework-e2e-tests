*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              The System specific keywords created here form our own domain specific language. 
...              They utilize keywords provided by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}           rahulshettyacademy
${invalid_password}    123456
${valid_password}      Learning@830$3mK2
${url}                 https://rahulshettyacademy.com/loginpagePractise/
#${browser_name}        Chrome

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}

#open the browser with the url
#    Create Webdriver    ${browser_name}    executable_path=resources/${browser_name}
#    Go To    ${url}

    
Close Browser session
    Close Browser

Wait Until element passed is located on the page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}

Wait for a long time Until element passed is located on the page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}    timeout=20s