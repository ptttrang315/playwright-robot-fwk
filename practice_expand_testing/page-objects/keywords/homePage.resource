*** Settings ***
Library   Browser
Resource    ../../globalConfiguration.resource
Resource    ../elements/homePage.resource

*** Keywords ***
Open Page
    New Browser    headless=False
    New Page    ${BASE_URL}
    Get Title    contains    Automation Testing Practice Website for UI and API

Go To "Calories Tracker" Page
    Open Page
    Click    ${CalorieTracker_tab}
    Get Title    contains    Tracalorie
    Wait For Load State    networkidle