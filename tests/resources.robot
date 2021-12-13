*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}                             www.saucedemo.com
${BROWSER}                            chrome
${DELAY}                              0
${VALID USER}                         standard_user
${LOCKED OUT USER}                    locked_out_user
${PROBLEM USER}                       problem_user
${VALID PASSWORD}                     secret_sauce
${INVALID PASSWORD}                   secret_saucer
${LOGIN URL}                          https://${SERVER}/
${HOME URL}                           https://${SERVER}/inventory.html
${A TO Z}                             az
${Z TO A}                             za
${LOW TO HIGH}                        lohi
${HIGH TO LOW}                        hilo
${A TO Z First Product}               Sauce Labs Backpack
${Z TO A First Product}               Test.allTheThings() T-Shirt (Red)
${LOW TO HIGH First Product}          Sauce Labs Onesie
${HIGH TO LOW First Product}          Sauce Labs Fleece Jacket
${PROBLEM USER IMAGE}                 /static/media/sl-404.168b1cce.jpg

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
    [Arguments]     ${error}
    Element Text Should Be     css:*[data-test="error"]    ${error}

Input Username
    [Arguments]     ${username}
    Input Text      user-name    ${username}

Input Pass
    [Arguments]     ${password}
    Input Password      password    ${password}

Selected Filter
    [Arguments]     ${filter}
    List Selection Should Be     css:*[data-test="product_sort_container"]        ${filter}

Choose Filter
    [Arguments]     ${filter}
    Select From List By Value    css:*[data-test="product_sort_container"]       ${filter}

Check First Product
    [Arguments]     ${product}
    Element Should Contain      xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[1]     ${product}
    
Submit Credentials
    Click Button    login-button