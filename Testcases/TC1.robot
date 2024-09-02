*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
OpenWebsite
   open browser    https://www.google.com/  chrome
   maximize browser window