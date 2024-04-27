*** Settings ***
Library    Browser
Library    String
Library    OperatingSystem
Library    Collections
Library    .yaml.YamlUtils
Library    keywords.caloriesTracker.operations
Resource    ../page-objects/elements/homePage.resource
Resource    ../page-objects/keywords/homePage.resource
Resource    ../page-objects/keywords/caloriesTracker.resource

*** Test Cases ***
Add a meal or food item to the list
    [Documentation]    This is an example test case
    Set Browser Timeout    30
    Go To "Calories Tracker" Page
    Add Meal And Calories    Spaghetti    500
    ${calories1}    Get The Calories    practice_expand_testing/page-objects/elements/caloriesTrackerElements.yml    caloriesTrackerElements.mealCalories    0
    Add Meal And Calories    Pizza    800
    ${calories2}    Get The Calories    practice_expand_testing/page-objects/elements/caloriesTrackerElements.yml    caloriesTrackerElements.mealCalories    1
    ${sum}    Calculate The Calories    ${calories1}    ${calories2}    addmeal
    ${totalCalories}    Get The Total Calories    practice_expand_testing/page-objects/elements/caloriesTrackerElements.yml    caloriesTrackerElements.totalCalories
    Should Be Equal As Numbers    ${sum}    ${totalCalories}

Testing case
    [Tags]    testName
    Set Browser Timeout    30
    Go To "Calories Tracker" Page
    ${yamlString}    Get File    practice_expand_testing/test-data/listMeals.yml
    ${list}    Convert YAML To Dictionary    ${yamlString}
    ${keys} =    Get Dictionary Keys    ${list}    False
    FOR    ${key}    IN    @{keys}
        ${calories}    Get Dictionary Value    ${list}    ${key}
        Add Meal And Calories    ${key}    ${calories}
    END
    



