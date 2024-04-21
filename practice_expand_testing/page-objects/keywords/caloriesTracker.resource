*** Settings ***
Library    Browser
Library    String
Resource    ../elements/caloriesTracker.resource

*** Keywords ***
Add Meal And Calories    [Arguments]    ${mealName}    ${calories}
    Type Text    ${AddItemInput}    ${mealName}
    Type Text    ${AddCaloriesInput}    ${calories}
    Click    ${AddMealButton}

Get the calories    [Arguments]    ${index}
    ${calories}    Get Calories Item    ${index}
    ${string}    Get Text    ${calories}
    @{calories}    Split String    ${string}    ${SPACE}
    [Return]    ${calories[0]}
    
