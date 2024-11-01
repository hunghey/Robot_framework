*** Settings ***
Resource    ../settings/orangehrm.robot


*** Variables ***
${CSV_FILE}     ${CURDIR}/../data/login_data.xlsx


*** Keywords ***
OpenOrangeHrmBrowser
    LaunchBrowser_Headless
    Go To    ${ORANGEHRM_URL}
    Wait Until Element Is Enabled    ${Hompage_login_header}

LoginOrangeHrm
    ${login_data}    Get all Login Data Excel    ${CSV_FILE}
    FOR    ${user}    IN    @{login_data}
        ${username}    Set Variable    ${user['username']}
        ${password}    Set Variable    ${user['password']}
        ${confirm_username}    Set Variable    ${user['confirm_username']}
        ${confirm_password}    Set Variable    ${user['confirm_password']}
        ${confirm}    Set Variable    ${user['confirm']}

        Input_Text_Into_Element    ${LoginPage_username}    ${username}
        Input_Text_Into_Element    ${LoginPage_password_orm}    ${password}
        Click_On_Element    ${LoginPage_loginbutton_orm}
        # Check if confirm_username is not empty or NaN
        IF    '${confirm_username}' != ''
            Verify_Element    ${LoginPage_username_confirm_orm}    ${confirm_username}
        END

        # Check if confirm_password is not empty or NaN
        IF    '${confirm_password}' != ''
            Verify_Element    ${LoginPage_password_confirm_orm}    ${confirm_password}
        END

        # Check if confirm is not empty or NaN
        IF    '${confirm}' != ''
            Verify_Element    ${LoginPage_confirm_orm}    ${confirm}
        END

        # Check if correct
        IF    '${confirm_username}' == '' and '${confirm_password}' == '' and '${confirm}' == ''
            Verify_Element_Displayed    ${Dashboard_header}    break
        END

        RELOAD PAGE
    END