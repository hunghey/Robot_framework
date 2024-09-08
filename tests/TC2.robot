*** Settings ***
Documentation    This is the first test for ORM
Resource    ../resources/settings/luma.robot
Library    ../resources/keywords//login_data.py
Library    OperatingSystem

*** Variables ***

*** Test Cases ***
open browser to login page
    open browser    https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php   chrome
    select radio button    Gender   M
    sleep   3