*** Settings ***
Documentation   A test suite with a single test for valid login
...             
...             This test follows the example using keywords from
...             the SeleniumLibrary
Resource        resources.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Pass  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    # close browser
    [Teardown]      Close Browser

Locked Out Login
    Open Browser To Login Page
    # input username
    Input Username  ${LOCKED OUT USER} 
    # input password
    Input Pass  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # Error Message is "Epic sadface: SOrry, this user has been locked out."
    Error Message
    # close browser
    [Teardown]      Close Browser