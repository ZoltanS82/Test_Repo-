# Created by zoltan.spirk at 2024. 09. 26.
*** Variables ***
${TERM_CHECKBOX}                          //input[@id='termsofservice']
${CHECKOUT_BUTTON}                        //button[@id='checkout']
${BILLING_SAVE}                           //input[@onclick='Billing.save()']
${CONFIRM}                                //input[@value='Confirm']
${LOG_OUT_BUTTON}                         //a[normalize-space()='Log out']
${LOG_IN_BUTTON}                          //a[normalize-space()='Log in']
${SHIPPING_SAVE}                          //input[@onclick='Shipping.save()']
${PAYMENT_METHOD}                         //span[@id='payment-method-please-wait']/../input[@value='Continue']
${PAYMENT_INFO}                           //span[@id='payment-info-please-wait']/../input[@value='Continue']
${SHIPING_SAVE_1}                         //span[@id='shipping-method-please-wait']/../input[@value='Continue']
${CITY_INPUT}                             //input[@id='BillingNewAddress_City']
${ADDRESS_INPUT}                          //input[@id='BillingNewAddress_Address1']
${ZIP_INPUT}                              //input[@id='BillingNewAddress_ZipPostalCode']
${PHONE_NUMBER_INPUT}                     //input[@id='BillingNewAddress_PhoneNumber']
${NEW_ADDRESS_DROP_DOWN}                  //select[@id='BillingNewAddress_CountryId']
${UPDATECART}                             //input[@name='updatecart']


*** Keywords ***

Fill out the Billing Address section
    Select Options By    ${NEW_ADDRESS_DROP_DOWN}    text    Hungary
    ${city}=    FakerLibrary.City
    ${address}=    FakerLibrary.Street Address
    ${zipcode}=    FakerLibrary.Postcode
    ${phonenumber}=    FakerLibrary.Phone Number
    Fill text    ${CITY_INPUT}    ${city}
    Fill text    ${ADDRESS_INPUT}    ${address}
    Fill text    ${ZIP_INPUT}    ${zipcode}
    Fill text    ${PHONE_NUMBER_INPUT}    ${phonenumber}
