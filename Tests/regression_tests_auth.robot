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


#Library     DataDriver  ../Data/course2.xlsx
Test Setup    common.Begin Web test
#Suite Teardown   common.End Web test



Test Teardown  common.End Web test
#Test Teardown   Run Keyword If Test Failed  capture page screenshot



*** Variables ***

# robot -d results tests/demo.robot
${auth_FORM_URL} =  https://boulder3.apply.colorado.edu/register/testSummerReturning
${uname} =  z9z97134
${passwd} =  Z9teststudent2!

*** Test Cases ***


auth form verify title

    slate.Open Slate form   ${auth_FORM_URL}
    slate.titleauth


auth form verify filter results showall courses
     slate.Open Slate form   ${auth_FORM_URL}
     slate.verify Showall Courses

embargoed
     slate.Open Slate form   ${auth_FORM_URL}
    slate.embargoed countries auth


embargoed ncsara
     slate.Open Slate form   ${auth_FORM_URL}
    slate.embargoed access course auth

internal logout
    slate.logout inside






