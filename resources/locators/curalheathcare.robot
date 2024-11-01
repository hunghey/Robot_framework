*** Variables ***
# Home_page
${Hompage_title}                                    //div[@class='text-vertical-center']/h1
${Hompage_Appointment_btn}                          //a[text()='Make Appointment']

# Login_page
${Loginpage_username_input}                         //input[@name='username']
${Loginpage_password_input}                         //input[@name='password']
${Loginpage_login_btn}                              //button[@id='btn-login']

# Make_appoinment_page
${Appointmentpage_facility_select}                  //select[@id='combo_facility']
${Appointmentpage_hongKong_option}                  //option[@value='Hongkong CURA Healthcare Center']
${Appointmentpage_chk_hospotal_readmission}         //input[@id='chk_hospotal_readmission']
${Appointmentpage_medicaid_radio}                   //input[@id='radio_program_medicaid']
${Appointmentpage_visit_picker}                     //input[@id='txt_visit_date']
${Appointmentpage_date_visit}                       //tbody//td[@class='new day' and text() ='4']
${Appointmentpage_cmt_textarea}                     //textarea[@id='txt_comment']
${Appointmentpage_appointmentBook_btn}              //button[@id='btn-book-appointment']

# Confirm_page
${Confirmationgage_confirm_title}                   //div[@class='container']//h2
${Confirmationgage_facility_data}                   //p[@id='facility']
${Confirmationgage_hospital_readmission_data}       //p[@id='hospital_readmission']
${Confirmationgage_heathy_program_data}             //p[@id='program']
${Confirmationgage_visitdate_data}                  //p[@id='visit_date']
${Confirmationgage_cmt_data}                        //p[@id='comment']
