*** Settings ***
Library    SeleniumLibrary
Resource    ../settings/luma.robot

*** Variables ***
${wait}     5s

*** Keywords ***
open_browser_to_login_page
    open browser    ${LUMA_URL}      chrome
    maximize browser window
    Click_On_Element    ${signin}

Verify_Element_Displayed
   [Documentation]    Verify element displayed on the current page
   [Arguments]    ${locator}    ${timeout}=${wait}
   wait until element is visible    ${locator}  ${timeout}

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

