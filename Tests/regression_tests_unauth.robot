*** Settings ***
Resource  ../Resources/slate.robot
Resource  ../Resources/slateauth.robot
Resource  ../Resources/welcomepayment.robot
Resource  ../Resources/common.robot
Resource  ../Resources/agreement.robot
Resource  ../Resources/paymentmethod.robot
Resource  ../Resources/Creditinfo.robot
Resource  ../Resources/Confirmpayment.robot
Resource  ../Resources/success.robot


Library     DataDriver  ../Data/trial.xlsx
Test Setup    common.Begin Web test
#Suite Teardown   common.End Web test



#Test Teardown  common.End Web test
#Test Teardown   Run Keyword If Test Failed  capture page screenshot



*** Variables ***

# robot -d results tests/demo.robot
${Un_FORM_URL} =  https://boulder3.apply.colorado.edu/register/summer2copy
${First Name} =   jay
${Last Name} =   isaac
${Email}=  jacob.issac@gmail.com
${Country}=    United States
${Street}=     9488 NE 2nd Ave
${City}=   Miami Shores
${State}=  Florida
${Zip}=    33138
${Sex}=    Female
${Month}=  May
${Day}=    11
${Year}=   1982
${Phone}=  4567891234



*** Test Cases ***

#Unauth form verify title
#
#    slate.Open Slate form   ${Un_FORM_URL}
#    slate.title
#
#
#Unauth form verify filter results showall courses
#     slate.Open Slate form   ${Un_FORM_URL}
#     slate.verify Showall Courses
#
#embargoed
#     slate.Open Slate form   ${Un_FORM_URL}
#     slate.verify Showall Courses
#    slate.new unauth form with privacy
#    slate.embargoed countries


embargoed ncsara
     slate.Open Slate form   ${Un_FORM_URL}
     slate.verify Showall Courses
    slate.new unauth form with privacy
    slate.embargoed access course

#form submission
#    [Arguments]     ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
#
#    slate.Open Slate form   ${Un_FORM_URL}
#    slate.verify Showall Courses
#    slate.new unauth form with privacy
#    slate.Input personal info unauth    ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
#    slate.unauth privacy
#    slate.Click Enroll and Pay
#    #agreement.Open page aand click agreement unauth








