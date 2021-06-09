*** Settings ***
Library  SeleniumLibrary



*** Keywords ***

Maximize Window
    Maximize Browser Window
    sleep  3s
Click Agreement unauth
    #Wait until page contains  CU Boulder MS-EE on Coursera Enrollment
    page should contain element  id=correctemail
    page should contain element  id=agree1
    page should contain element  id=agree2


    click element   id=correctemail

    click element   xpath=//a[contains(text(),"Consent to Conduct Business Electronically")]
    click element   id=agree1
    click element   xpath=//a[contains(text(),"Tuition and Fee Agreement and Disclosure")]
    click element   id=agree2



    Click element   xpath=//a[contains(text(),"Continue")]

Click Agreement auth
   Wait until page contains  Authenticated MSEE Enrollment App Creation - P2R2
    page should not contain element  id=correctemail
    page should not contain element  id=agree1
    page should not contain element  id=agree3
    click element   xpath=//a[contains(text(),"Tuition and Fee Agreement and Disclosure")]
    click element   id=agree2

    Click element   xpath=//a[contains(text(),"Continue")]
