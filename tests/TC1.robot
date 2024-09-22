*** Settings ***
Documentation    This is the first test for ORM
Resource    ../resources/settings/luma.robot
Library    ../lib/csv_data.py
Library    OperatingSystem

*** Variables ***
${CSV_FILE}    ${CURDIR}/../data/login_data.csv

*** Test Cases ***
open browser and login
    OpenLumaBrowser
    Click_On_Element    ${Hompage_signin_header}
    HomepageCheckLogo
    LoginLuma

