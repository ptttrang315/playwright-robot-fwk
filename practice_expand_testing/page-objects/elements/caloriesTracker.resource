*** Variables ***
${AddItemInput}=                    xpath=//input[@id= "item-name"]
${AddCaloriesInput}=                xpath=//input[@id= "item-calories"]
${AddMealButton}=                   xpath=//button[contains(text(), "Add Meal")]

*** Keywords ***
Get Calories Item    [Arguments]    ${index}
    [Return]    xpath=//*[@id = "item-${index}"]/em