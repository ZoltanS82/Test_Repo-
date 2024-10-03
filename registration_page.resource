# Created by zoltan.spirk at 2024. 09. 26.
*** Variables ***
${REGISTER}                               //a[normalize-space()='Register']
${REGISTER_BUTTON}                        //input[@id='register-button']
${FIRST_NAME_INPUT}                       //input[@id='FirstName']
${LAST_NAME_INPUT}                        //input[@id='LastName']
${PASSWORD_INPUT}                         //input[@id='Password']
${CONFIRM_PASSWORD_INPUT}                 //input[@id='ConfirmPassword']
${EMAIL_ADDRESS_INPUT}                    //input[@id='Email']
${CONTINUE_BUTTON}                        //input[@value='Continue']

*** Keywords ***

Fill out the register page
    [Arguments]    ${first_name}    ${last_name}    ${email_address}    ${password}
    Click    ${REGISTER}
    Fill Text    ${FIRST_NAME_INPUT}    ${first_name}
    Fill Text    ${LAST_NAME_INPUT}    ${last_name}
    Fill Text    ${EMAIL_ADDRESS_INPUT}    ${email_address}
    Fill Text    ${PASSWORD_INPUT}    ${password}
    Fill Text    ${CONFIRM_PASSWORD_INPUT}    ${password}
    Click    ${REGISTER_BUTTON}
    Click    ${CONTINUE_BUTTON}

New registration
    Open browser    ${TRICENTIS_WEBSHOP}
    Click    ${REGISTER}
    ${first_name}=    FakerLibrary.First Name
    ${last_name}=    FakerLibrary.Last Name
    ${password}=    FakerLibrary.Password    length=10
    ${email_address}=    FakerLibrary.Email
    Fill out the register page    ${first_name}    ${last_name}    ${email_address}    ${password}
    Click    ${LOG_OUT_BUTTON}
    RETURN    ${email_address}    ${password}