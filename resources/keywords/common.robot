*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Resource    ../settings/luma.robot


*** Variables ***
${wait}         2s
${BROWSER}      Chrome


*** Keywords ***
Browser_Setting_Common
    [Documentation]    Init common options
    IF    '${BROWSER}' == 'Chrome'
        ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ELSE IF    '{$BROWSER}' == 'Firefox'
        ${options}    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    END
    Call method    ${options}    add_argument    --lang\=en
    Call method    ${options}    add_argument    --no-sandbox
    Call method    ${options}    add_argument    --disable-gpu
    RETURN    ${options}

Browser_Setting_Headless
    [Documentation]    Init common options
    [Arguments]    ${options}
    Call method    ${options}    add_argument    --headless
    RETURN    ${options}

CreateDriver
    [Documentation]    CreateDriver
    [Arguments]    ${options}
    ${alias}    Get current date    result_format=%m%d%H%M%S
    IF    '${BROWSER}' == 'Chrome'
        Create webdriver    Chrome    ${alias}    options=${options}
    ELSE
        PASS
    END
    RETURN    ${alias}

Change_dowload_dir
    [Arguments]    ${download_dir}=${DOWNLOAD_DIR}
    ${chrome options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary
    ...    download.default_directory=${download_dir}
    ...    download.prompt_for_download=False
    ...    directory_upgrade=True
    ...    safebrowsing.enabled=True
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    options=${chrome options}

CreateDriver_pageLoadStrategy
    [Documentation]    Create Chrome driver with pageLoadStrategy
#    Control the speed at which webdriver performs interactions
    [Arguments]    ${option}
    ${options}    Evaluate
    ...    sys.modules['selenium.webdriver'].ChromeOptions()
    ${options.page_load_strategy}    Set Variable    ${option}
    ${alias}    Get current date    result_format=%m%d%H%M%S
    Create Webdriver    Chrome    ${alias}    options=${options}
    RETURN    ${alias}

LaunchBrowser
    [Documentation]    launch browser
    ${option}    Browser_Setting_Common
    ${alias}    CreateDriver    ${option}

LaunchBrowser_Headless
    [Documentation]    launch browser
    ${option}    Browser_Setting_Common
    ${option}    Browser_Setting_Headless    ${option}
    ${alias}    CreateDriver    ${option}

open_browser_to_login_page
    open browser    ${LUMA_URL}    chrome
    maximize browser window
    Click_On_Element    ${Hompage_signin_header}
    capture page screenshot

Verify_Element_Displayed
    [Documentation]    Verify element displayed on the current page
    [Arguments]    ${locator}    ${timeout}=${wait}
    wait until element is visible    ${locator}    ${timeout}
    wait until element is enabled    ${locator}    ${timeout}
    run keyword and ignore error    scroll element into view    ${locator}

Input_Text_Into_Element
    [Documentation]    Wait element for visible and input text
    [Arguments]    ${locator}    ${text}
    Verify_Element_Displayed    ${locator}
    input text    ${locator}    ${text}

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
    ${text_displayed}    get text    ${locator}
    capture page screenshot
    RETURN    ${text_displayed}

Compare_Text_On_Element
    [Documentation]    Verify text on elemnet
    [Arguments]    ${locator}    ${expected_text}
    ${text_displayed}    get_text_on_element    ${locator}
    run keyword and continue on failure    should be equal    ${text_displayed}    ${expected_text}

Verify_Element
    [Documentation]    Verify text displayed after click login button
    [Arguments]    ${locator}    ${expected_text}
    Compare_Text_On_Element    ${locator}    ${expected_text}
