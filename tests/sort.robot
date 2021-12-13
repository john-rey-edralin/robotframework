*** Settings ***
Documentation   A test suite with a multiple test for sort
...             
...             This test follows the example using keywords from
...             the SeleniumLibrary
Resource        resources.robot

*** Test Cases ***
Sort Product Name (A To Z)
    Open Browser To Login Page
    # input username
    Input Username      ${VALID USER}
    # input password
    Input Pass      ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    #Check Filter
    Selected Filter     ${A TO Z}
    #Check First Product
    Check First Product     ${A TO Z First Product}
    # close browser
    [Teardown]      Close Browser

Sort Product Name (Z To A)
    Open Browser To Login Page
    # input username
    Input Username      ${VALID USER}
    # input password
    Input Pass      ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    #Choose Filter
    Choose Filter     ${Z TO A}
    #Check Filter
    Selected Filter     ${Z TO A}
    #Check First Product
    Check First Product     ${Z TO A First Product}
    # close browser
    [Teardown]      Close Browser

Sort Product Price (Low to High)
    Open Browser To Login Page
    # input username
    Input Username      ${VALID USER}
    # input password
    Input Pass      ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    #Choose Filter
    Choose Filter     ${LOW TO HIGH}
    #Check Filter
    Selected Filter     ${LOW TO HIGH}
    #Check First Product
    Check First Product     ${LOW TO HIGH First Product}
    # close browser
    [Teardown]      Close Browser

Sort Product Price (High to Low)
    Open Browser To Login Page
    # input username
    Input Username      ${VALID USER}
    # input password
    Input Pass      ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    #Choose Filter
    Choose Filter     ${HIGH TO LOW}
    #Check Filter
    Selected Filter     ${HIGH TO LOW}
    #Check First Product
    Check First Product     ${HIGH TO LOW First Product}
    # close browser
    [Teardown]      Close Browser