*** Settings ***
Library    SeleniumLibrary
Resource    ../settings/luma.robot

*** Variables ***
${wait}     5s

*** Keywords ***
open_browser_to_login_page
    open browser    ${LUMA_URL}      chrome
    maximize browser window
    Click_On_Element    ${Hompage_signin_header}
    capture page screenshot

Verify_Element_Displayed
   [Documentation]    Verify element displayed on the current page
   [Arguments]    ${locator}    ${timeout}=${wait}
   wait until element is visible    ${locator}  ${timeout}
   wait until element is enabled    ${locator}  ${timeout}
   run keyword and ignore error    scroll element into view    ${locator}

Input_Text_Into_Element
   [Documentation]      Wait element for visible and input text
   [Arguments]      ${locator}  ${text}
   Verify_Element_Displayed    ${locator}
   input text    ${locator}     ${text}

Click_On_Element
    [Documentation]    Wait element for visible and click on
    [Arguments]    ${locator}
    Verify_Element_Displayed    ${locator}
    click element    ${locator}
    capture page screenshot

Get_Text_On_Element
    [Documentation]    Wait for elemnet visible and get text
    [Arguments]    ${locator}
    Verify_Element_Displayed    ${locator}
    ${text_displayed}   get text    ${locator}
    capture page screenshot
    [Return]    ${text_displayed}

Compare_Text_On_Element
    [Documentation]    Verify text on elemnet
    [Arguments]    ${locator}   ${expected_text}
    ${text_displayed}   get_text_on_element    ${locator}
    run keyword and continue on failure     should be equal     ${text_displayed}   ${expected_text}