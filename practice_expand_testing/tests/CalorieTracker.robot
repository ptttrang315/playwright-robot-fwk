*** Settings ***
Library   Browser
Library   String
Resource    ../page-objects/elements/homePage.resource
Resource    ../page-objects/keywords/homePage.resource
Resource    ../page-objects/keywords/caloriesTracker.resource

Library    caloriesTracker.operations

*** Test Cases ***
Add a meal or food item to the list
    [Documentation]    This is an example test case
    Set Browser Timeout    30
    Go To "Calories Tracker" Page
    Add Meal And Calories    Spaghetti    500
    ${calories1}    Get The Calories    0
    Add Meal And Calories    Pizza    800
    ${calories2}    Get The Calories    1
    ${sum}    Calculate The Calories    ${calories1}    ${calories2}    addmeal



