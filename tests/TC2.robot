*** Settings ***
Documentation    This is the first test for ORM
Resource    ../resources/settings/orangehrm.robot


*** Test Cases ***
open browser and login
    OpenOrangeHrmBrowser
    LoginOrangeHrm


