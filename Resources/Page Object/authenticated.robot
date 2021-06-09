*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Dialogs



*** Variables ***

# This needs to be updated
${expfilter_result} =  Results: 22 courses

${username} =
${pwd} =   

*** Keywords ***
Load
    [Arguments]  ${data}
    Go To   ${data}

Maximize Window
    Maximize Browser Window

Credentials
    sleep   3s
    Input text  id=username  ${username}
    Input text  id=password  ${pwd}
    Click button    xpath=//button[contains(text(),"Continue")]

Verify Page Loaded
    # This needs to be updated
    Wait until page contains  CU Boulder MS-EE on Coursera Enrollment - Returning Students (test)
    sleep  3s
    #uncomment when testing sinfle test cases
    #Click element   xpath=//a[contains(text(),"Learn more about our Online Master's - Electrical Engineering")]

Authenticated user
    # This needs to be updated as some students may contain all courses where as others may have just 1
    #page should contain element     xpath=//span[contains(text(),"Your October-December 2019 MS-EE on Coursera courses")]
    #page should contain element     xpath=//span[contains(text(),"Your January-March 2020 MS-EE on Coursera courses")]
    page should contain element     xpath=//div[contains(text(),"Your March - May 2020 MS-EE on Coursera courses:")]



#personal information
Showall Courses

#click show all
# This needs to be updated for auth/unauth

    #Auth
    click element   xpath=//div/label[@for="form_ed195cb4-6a02-4d18-ecb4-4789cb2d0faf_1"]

    log to console  showall sucess
    sleep   4s
     # This needs to be updated for auth/unauth
     #Auth
    ${filter_result}=  get value    xpath=//div[@class="form_responses"]/input[@name="form_11b76faa-113d-7030-373d-934062b1a1c7"]

    ${filter_result1}=    evaluate       '${filter_result}'.strip()
    log to console      ${filter_result1}
    should be equal   ${filter_result1}    ${expfilter_result}

Course Selection

    sleep   4s
    [Arguments]   ${courses}
    #Course locators change for the forms update the data sheet for auth/unauth

       click element    xpath=//fieldset/div[@class="form_responses"]/div/label[@for="${courses}"]

       ${course_name}=  get text    xpath=//fieldset/div[@class="form_responses"]/div/label[@for= "${courses}"]
        log to console      ${course_name}

    sleep   4s
    ${coursenamedis} =    Fetch From Left    ${course_name}    (
    log to console    ${coursenamedis}



     ${coursenamedis1} =     Remove String Using Regexp      ${coursenamedis}    ECEA \\d\\d\\d\\d
    ${coursenamedis2}=    evaluate       '${coursenamedis1}'.strip()
    log to console    ${coursenamedis1}

    ${strong} =  get text   xpath=//div[@data-reactid="269"]/p/strong[contains(text(), '${coursenamedis2}')]
    ${strong1}=   evaluate       '${strong}'.strip()
   log to console   ${strong1}
    Run keyword And Continue On Failure     should be equal     ${strong1}   ${coursenamedis2}
   log to console  Course name display on the side content box matches
   sleep    3s

    #auth
    textfield should contain     xpath=//div/input[@name="form_91f74b19-1a85-700c-98fd-84699f692d0a"]    ${course_name}
    #auth
    textfield should contain     xpath=//div/input[@name="form_6b61d956-bfae-4eac-bfd2-28bcc1801919"]    ${course_name}
        #Auth
     textfield should contain     xpath=//div/input[@name="form_64da04ad-dd48-6e1d-7987-5e3a33690f4f"]    ${course_name}



    log to console  All Course name matches
     ${course_name1} =     Set Variable    ${course_name}
    set suite variable   ${course_name1}    ${course_name}
    #tuition that is displayed at tyhe page end

    #auth
    ${tuition} =  get text  id=payment_display_form_1526f4a8-36cb-1629-b917-6ecfc5c5367c


    log to console   ${tuition}
    #Total Cost

    #auth
    textfield should contain     xpath=//div/input[@name="form_6c60c09c-6c02-1fca-d6a6-db6c3195017d"]    ${tuition}

    log to console  Sucesss tuition matches
    ${tuition1} =   replace variables    ${tuition}

    set test variable  ${tuition2}    ${tuition1}
    log to console     ${tuition2}
    wait until element is visible  xpath=//a[contains(text(),"Current student calendars and information")]
    Set Focus To Element    xpath=//a[contains(text(),"Current student calendars and information")]
    #uncomment when testing sinfle test cases
    #Click element   xpath=//a[contains(text(),"Current student calendars and information")]



#enroll and pay
Users should be able to click enroll and pay button

    wait until element is visible    xpath=/descendant::a[@id="http://www.colorado.edu"][2]
#uncomment when testing sinfle test cases
    #Set Focus To Element    xpath=/descendant::a[@id="http://www.colorado.edu"][2]
   # Click element   xpath=/descendant::a[@id="http://www.colorado.edu"][2]
    Click button    xpath=//button[contains(text(),"Submit and Pay")]
    sleep  5s


