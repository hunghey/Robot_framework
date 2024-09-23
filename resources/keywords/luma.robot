*** Settings ***
Resource   ../settings/luma.robot

*** Variables ***
${CSV_FILE}    ${CURDIR}/../../data/login_data.csv

*** Keywords ***
OpenLumaBrowser
    LaunchBrowser
    Go To   ${LUMA_URL}

HomepageCheckLogo
    Verify_Element_Displayed    ${HomePage_Logo}

LoginLuma
    ${login_data}    Get all Login Data    ${CSV_FILE}
    FOR    ${user}    IN    @{login_data}
        ${email}    Set Variable    ${user['email']}
        ${password}    Set Variable    ${user['password']}

        Input_Text_Into_Element  ${LoginPage_email}     ${email}
        Input_Text_Into_Element     ${LoginPage_password}       ${password}
        sleep   3s
        Click_On_Element    ${LoginPage_loginbutton}
        Verify_Element      ${LoginPage_email_confirm}    Please enter a valid email address (Ex: johndoe@domain.com).
    END