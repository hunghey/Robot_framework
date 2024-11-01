*** Settings ***
Documentation       This is the first test for ORM

Resource            ../resources/settings/luma.robot


*** Test Cases ***
open browser and login
    OpenLumaBrowser
    Click_On_Element    ${Hompage_signin_header}
    HomepageCheckLogo
    LoginLuma
