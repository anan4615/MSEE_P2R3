*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Dialogs


*** Variables ***

${cardholdersname} =  Monica
${mastercard_creditcardno} =  5454545454545454
${exp_mon} =  12
${exp_year} =  2024
${address1} =  3676 Yale dr
${city} =  Broomfield
${state1} =  COLORADO
${zip} =  80023
${phone} =  7208971234
${emailaddress} =  anita.antonysamy@colorado.edu


*** Keywords ***


Maximize Window
    Maximize Browser Window
    Wait until page contains  Provide Credit Card Information
    sleep  3s


Enter credit card information
    Input text  xpath=//*[@id="cardholdername_in"]  ${cardholdersname}
    Input text  xpath=//*[@id="cardnumber_in"]  ${mastercard_creditcardno}
    Input text  xpath=//*[@id="confirmcardnumber_in"]   ${mastercard_creditcardno}
    select from list by label  id=include_CreditCardFormElement_expMonth  ${exp_mon}
    select from list by label  id=include_CreditCardFormElement_expYear  ${exp_year}

Enter Billing address
    Input text  id=address_street1_in  ${address1}
    Input text  id=address_city_in  ${city}
    select from list by label  id=address_state_in  ${state1}


    Input text  id=address_zip_in  ${zip}

Enter contact details
    Input text  id=daytimephone_in  ${phone}
    Input text  id=emailaddress_in  ${emailaddress}

Confiirm payment
    click element    id=confirmbutton_btn
