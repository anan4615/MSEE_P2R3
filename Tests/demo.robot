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


Library     DataDriver  ../Data/course2.xlsx
Test Setup    common.Begin Web test
#Suite Teardown   common.End Web test

Test Template   Unauth form verify syllabus link

Test Teardown  common.End Web test
#Test Teardown   Run Keyword If Test Failed  capture page screenshot



*** Variables ***

# robot -d results tests/demo.robot
# robot -t "form submission" tests/regression_tests_unauth.robot
${Un_FORM_URL} =  https://boulder3.apply.colorado.edu/register/summer2copy



*** Test Cases ***
MSEE_unauth_regression
    #[Teardown]    Close All Browsers




*** Keywords ***

Unauth form verify syllabus link
   [Arguments]     ${courses}   ${coursera}
    slate.Open Slate form   ${Un_FORM_URL}

    slate.Syllabus links    ${courses}  ${coursera}








