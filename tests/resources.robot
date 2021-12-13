*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}               www.saucedemo.com
${BROWSER}              chrome
${DELAY}                0
${VALID USER}           standard_user
${LOCKED OUT USER}      locked_out_user
${VALID PASSWORD}       secret_sauce
${LOGIN URL}            https://${SERVER}/
${HOME URL}             https://${SERVER}/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element     login-button

Product Page Should Be Open
    Element Text Should Be      class:title     PRODUCTS

Error Message
    Element Text Should Be     css:div#root h3     Epic sadface: Sorry, this user has been locked out.

Input Username
    [Arguments]     ${username}
    Input Text      user-name    ${username}

Input Pass
    [Arguments]     ${password}
    Input Password      password    ${password}
    
Submit Credentials
    Click Button    login-button

Closed Browser
    Close Browser