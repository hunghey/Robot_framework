*** Variables ***
#Homepage
${Hompage_signin_header}     xpath=//li[@class='authorization-link']/a

#LoginPage
${LoginPage_email}     xpath=//input[@name='login[username]']
${LoginPage_password}     xpath=//input[@name='login[password]']
${LoginPage_loginbutton}  xpath=//button[contains(@class,"login primary")]

${LoginPage_email_confirm}     xpath=//div[contains(@class,"email")]//div[@class="mage-error"]
${LoginPage_password_confirm}     xpath=//div[contains(@class,"password")]//div[@class="mage-error"]
