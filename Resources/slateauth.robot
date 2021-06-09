*** Settings ***
Resource  ../Resources/Page Object/slateformpage.robot
Resource    ../Resources/Page Object/authenticated.robot

*** Keywords ***


login user
    [Arguments]  ${data}
    authenticated.Load  ${data}
    authenticated.maximize window
    authenticated.Credentials
    authenticated.Authenticated user

    authenticated.verify page loaded


Select course
    [Arguments]  ${courses}
    authenticated.Showall Courses
    authenticated.Course Selection  ${courses}

#Choose a Course
    #slateformpage.Select a course



Click Enroll and Pay


   authenticated.Users should be able to click enroll and pay button

