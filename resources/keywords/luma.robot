*** Settings ***
Resource   ./common.robot

*** Keywords ***
Verify_Element
    [Documentation]    Verify text displayed after click login button
    [Arguments]    ${locator}   ${expected_text}
    Compare_Text_On_Element    ${locator}   ${expected_text}
    select radio button