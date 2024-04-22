*** Settings ***
Library    Browser
Library    String
Resource    ../elements/caloriesTracker.resource
Variables    ../elements/caloriesTrackerElements.yml

*** Keywords ***
Get Locator
    [Arguments]    ${locator}
    Get Yaml Value    practice_expand_testing/page-objects/elements/caloriesTrackerElements.yml    ${locator}


Add Meal And Calories    [Arguments]    ${mealName}    ${calories}
    Type Text    ${AddItemInput}    ${mealName}
    Type Text    ${AddCaloriesInput}    ${calories}
    Click    ${AddMealButton}

Get the calories    [Arguments]    ${index}
    ${calories}    Get Calories Item    ${index}
    ${string}    Get Text    ${calories}
    @{calories}    Split String    ${string}    ${SPACE}
    [Return]    ${calories[0]}
    
