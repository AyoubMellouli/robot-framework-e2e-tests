*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library          Collections
Library          ../customLibraries/Shop.py
Test Setup       open the browser with the Mortgage payment url
Suite Setup
Suite Teardown    
Test Teardown    Close Browser session
Resource         ../pages/Generic.robot
Resource         ../pages/LandingPage.robot
Resource         ../pages/ShopPage.robot
Resource         ../pages/CheckOutPage.robot
Resource         ../pages/ConfirmationPage.robot


*** Variables ***

@{ListOfProducts}         Blackberry    Nokia Edge
${country_name}           Indonesia

*** Test Cases ***
Validate Successful Login
    [Tags]    SMOKE    REGRESSION
    LandingPage.Fill the login Form    ${username}    ${invalid_password}
    LandingPage.Wait Until Element is located in the page
    LandingPage.verify error message is correct

Validate Cards display in the shopping page
    [Tags]    REGRESSION
    LandingPage.Fill the login Form    ${username}    ${valid_password}
    ShopPage.Wait Until Element is located in the page
    ShopPage.Verify Card titles in the shop page
    Add Items To Cart And Checkout    ${ListOfProducts}
    CheckOutPage.Verify items in the checkout page and proceed
    ConfirmationPage.Enter the country and select the terms    ${country_name}
    ConfirmationPage.Purchase the product and confirm the purchase

Select the Form and navigate to child window
    LandingPage.Fill The Login Details and Login Form







