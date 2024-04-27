*** Settings ***
Library    Browser
Library    String
Resource    ../elements/caloriesTracker.resource
Resource    ../../common-utilities/variablesUtils.resource
Variables    ../elements/caloriesTrackerElements.yml

*** Keywords ***

Add Meal And Calories
    [Arguments]    ${mealName}    ${calories}
    Type Text    ${AddItemInput}    ${mealName}
    Type Text    ${AddCaloriesInput}    ${calories}
    Click    ${AddMealButton}

Get Calories Item
    [Arguments]    ${xpath}    ${index}
    ${xpath}    Update XPath Value    ${xpath}    \${index}    ${index}
    [Return]    ${xpath}    

Get the calories
    [Arguments]    ${filePath}   ${keyPath}    ${index}
    ${xpath}    Get Yaml Value    ${filePath}    ${keyPath}
    ${xpath}    Get Calories Item    ${xpath}    ${index}
    ${string}    Get Text    ${xpath}
    @{calories}    Split String    ${string}    ${SPACE}
    [Return]    ${calories[0]}

Get the total calories
    [Arguments]    ${filePath}   ${keyPath}
    ${xpath}    Get Yaml Value    ${filePath}    ${keyPath}
    ${calories}    Get Text    ${xpath}
    [Return]    ${calories}


