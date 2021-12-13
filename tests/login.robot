*** Settings ***
Documentation   A test suite with a multiple test for login
...             
...             This test follows the example using keywords from
...             the SeleniumLibrary
Resource        resources.robot

*** Test Cases ***
Successful User Log In
    Open Browser To Login Page
    # input username
    Input Username      ${VALID USER}
    # input password
    Input Pass      ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    # close browser
    [Teardown]      Close Browser

Unsuccessful User Log In By A Locked Out User
    Open Browser To Login Page
    # input username
    Input Username      ${LOCKED OUT USER} 
    # input password
    Input Pass      ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # Error Message is "Epic sadface: Sorry, this user has been locked out."
    Error Message       Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]      Close Browser

Wrong Password Message
    Open Browser To Login Page
    # input username
    Input Username      ${VALID USER} 
    # input password
    Input Pass      ${INVALID PASSWORD}
    # click login button
    Submit Credentials
    # Error Message is "Epic sadface: Username and password do not match any user in this service"
    Error Message       Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]      Close Browser

Logged In As Problem User And Sees A Broken Inventory Page
    Open Browser To Login Page
    # input username
    Input Username      ${PROBLEM USER}
    # input password
    Input Pass      ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    # should contain a certain image
    Page Should Contain Image       ${PROBLEM USER IMAGE}
    # close browser
    [Teardown]      Close Browser