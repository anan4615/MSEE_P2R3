*** Settings ***
Library  SeleniumLibrary
Library  String


*** Variables ***

${payment_method} =  " Credit Card "

*** Keywords ***

Maximize Window
    Maximize Browser Window
    Wait until page contains  Payment Amount
    sleep  3s

Verify Amount
    ${pay_amt} =  get text  xpath=//div/label[@for="epay_AmountMethod_amount"]/following-sibling::div/div/div[@class="form-control-static propertyValue"]
#    ${total_amt}=  get text  xpath=//*[@id="total_amount"]
#    set global variable  ${total_amt1}  ${total_amt}
#    should be equal   ${pay_amt}    ${total_amt1}

    textfield should contain     xpath=//input[@id="total_amount"]    ${pay_amt}
    log to console  Sucesss amount matches



Click Continue
    click button    id=continue_btn
