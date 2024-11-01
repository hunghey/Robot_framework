*** Settings ***
Resource    ../resources/keywords/curalheathcare.robot
Library     SeleniumLibrary


*** Variables ***
${username}     John Doe
${password}     ThisIsNotAPassword
${comment}      test


*** Test Cases ***
RegisterAppointment#
    open browser    https://katalon-demo-cura.herokuapp.com/    chrome
    maximize browser window
#    # Homepage
    Homepage_check_title    CURA Healthcare Service
    Homepage_click_makeappointment
    # LoginPage
    LoginPage    ${username}    ${password}
    # Appointment
    Appointmentpage_choose_facility
    Appointmentpage_check_read_commission
    Appointmentpage_choose_program
    Appointmentpage_choose_visitDate
    Appointmentpage_input_comment    ${comment}
    Appointmentpage_click_book_appointment
    # Confirmation
    Confirmationgage_verify_title    Appointment Confirmation
    Confirmationgage_verify_register    Hongkong CURA Healthcare Center    Yes    Medicaid    04/12/2024    ${comment}
