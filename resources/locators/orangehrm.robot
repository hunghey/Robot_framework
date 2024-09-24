*** Variables ***
#Homepage
${Hompage_login_header}     xpath=//h5[text()="Login"]


#LoginPage
${LoginPage_username}     xpath=//input[@name='username']
${LoginPage_password_orm}     xpath=//input[@name='password']
${LoginPage_loginbutton_orm}  xpath=//button[contains(@class,"login-button")]

${LoginPage_username_confirm_orm}     xpath=//label[text()='Username']/../../span
${LoginPage_password_confirm_orm}     xpath=//label[text()='Password']/../../span
${LoginPage_confirm_orm}     xpath=//div[contains(@class,'content--error')]//p




