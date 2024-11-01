*** Settings ***
Resource    ../resources/keywords/tgdd.robot
Library     SeleniumLibrary


*** Test Cases ***
Register Appointment
    CreateDriver_pageLoadStrategy    eager
    Go to    https://www.thegioididong.com/dtdd-apple-iphone
#    open browser    https://www.thegioididong.com/dtdd-apple-iphone    chrome
    maximize browser window
    ${iphones}    get_all_iphone
