*** Settings ***
Documentation    This is the first test for ORM
Resource    ../resources/settings/luma.robot
Library    ../resources/keywords//login_data.py
Library    OperatingSystem

*** Variables ***
${CSV_FILE}    ${CURDIR}/../data/login_data.csv

*** Test Cases ***
open browser to login page
    open_browser_to_login_page
    ${login_data}    Get all Login Data    ${CSV_FILE}
    FOR    ${user}    IN    @{login_data}
        ${email}    Set Variable    ${user['email']}
        ${password}    Set Variable    ${user['password']}

        Input_Text_Into_Element  ${LoginPage_email}     ${email}
        Input_Text_Into_Element     ${LoginPage_password}       ${password}
        sleep   3s
        Click_On_Element    ${LoginPage_loginbutton}
        Verify_Element      ${LoginPage_email_confirm}    Please enter a valid email address (Ex: johndoe@domain.com).
