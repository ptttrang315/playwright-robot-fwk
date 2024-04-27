*** Settings ***
Library    String

*** Keywords ***
Update XPath value
    [Arguments]    ${xpath}    ${searchFor}    ${replaceWith}
    ${xpath}    Replace String    ${xpath}    ${searchFor}    ${replaceWith}
    [Return]    ${xpath}