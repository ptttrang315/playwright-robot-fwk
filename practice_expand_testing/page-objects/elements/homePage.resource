*** Variables ***
${CalorieTracker_tab} =             xpath=//a[text()= "Calorie Tracker"]
${AddItemInput}=                    xpath=//input[@id= "item-name"]
${PlaceHolderAddItemInput}=         xpath=//input[@placeholder= "Add Item"]
${AddCaloriesInput}=                xpath=//input[@id= "item-calories"]
${AddMealButton}=                   xpath=//button[contains(text(), "Add Meal")]
${CaloriesItem0}=                   xpath=//*[@id = "item-0"]/em