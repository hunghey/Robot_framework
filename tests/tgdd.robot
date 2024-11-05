*** Settings ***
Resource    ../resources/keywords/tgdd.robot
Library     SeleniumLibrary


*** Test Cases ***
# Register Appointment
#    CreateDriver_pageLoadStrategy    eager
#    Go to    https://www.thegioididong.com/dtdd-apple-iphone
##    open browser    https://www.thegioididong.com/dtdd-apple-iphone    chrome
#    maximize browser window
#    ${iphones}    get_all_iphone

Shopping devices
    CreateDriver_pageLoadStrategy    eager
    Go to    https://www.thegioididong.com/
    maximize browser window
    Phonepage_ChangeToIphonePage
    LocationForm_AddLocation    Hồ Chí Minh    Quận 3    Phường 4    312
    DetailInfoPage_AddtoCart    iPhone 16 Pro    iPhone 15 Pro Max
