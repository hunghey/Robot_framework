*** Settings ***
Resource    ../locators/curalheathcare.robot
Library     SeleniumLibrary


*** Keywords ***
GetTextOnElement    [Arguments]    ${locator}
    wait until element is visible    ${locator}    2s
    ${title_page}    get text    ${locator}
    RETURN    ${title_page}

VerifyText    [Arguments]    ${locator}    ${expected_text}
    ${displayed_title}    GetTextOnElement    ${locator}
    Should Be Equal    ${displayed_title}    ${expected_text}

# Hompage

Homepage_check_title
    [Arguments]    ${expected_title}
    VerifyText    ${Hompage_title}    ${expected_title}

Homepage_click_makeappointment
    click element    ${Hompage_Appointment_btn}

# LoginPage

LoginPage    [Arguments]    ${username}    ${password}
    input text    ${Loginpage_username_input}    ${username}
    input text    ${Loginpage_password_input}    ${password}
    click element    ${Loginpage_login_btn}

# Appointment page

Appointmentpage_choose_facility
    click element    ${Appointmentpage_facility_select}
    wait until element is visible    ${Appointmentpage_hongKong_option}    2s
    click element    ${Appointmentpage_hongKong_option}

Appointmentpage_check_read_commission
    click element    ${Appointmentpage_chk_hospotal_readmission}

Appointmentpage_choose_program
    click element    ${Appointmentpage_medicaid_radio}

Appointmentpage_choose_visitDate
    click element    ${Appointmentpage_visit_picker}
    Mouse Over    ${Appointmentpage_date_visit}
    click element    ${Appointmentpage_date_visit}

Appointmentpage_input_comment
    [Arguments]    ${comment}
    input text    ${Appointmentpage_cmt_textarea}    ${comment}

Appointmentpage_click_book_appointment
    click element    ${Appointmentpage_appointmentBook_btn}

# Confirmation page

Confirmationgage_verify_title
    [Arguments]    ${expected_title}
    VerifyText    ${Confirmationgage_confirm_title}    ${expected_title}

Confirmationgage_verify_register
    [Arguments]    ${facility}    ${readcommision}    ${heathcareprogram}    ${visitdate}    ${cmt}
    VerifyText    ${Confirmationgage_facility_data}    ${facility}
    VerifyText    ${Confirmationgage_hospital_readmission_data}    ${readcommision}
    VerifyText    ${Confirmationgage_heathy_program_data}    ${heathcareprogram}
    VerifyText    ${Confirmationgage_visitdate_data}    ${visitdate}
    VerifyText    ${Confirmationgage_cmt_data}    ${cmt}
