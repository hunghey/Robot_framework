*** Settings ***
Documentation    This is the first test for ORM
Resource    ../resources/settings/luma.robot

*** Test Cases ***
open browser to login page
    open_browser_to_login_page
    Input_Text_Into_Element  ${email}   abc
    Input_Text_Into_Element     ${password}     123
    sleep   3s