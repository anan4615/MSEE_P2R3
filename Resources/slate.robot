*** Settings ***
Resource  ../Resources/Page Object/slateformpage.robot


*** Keywords ***
Open Slate form
    [Arguments]  ${data}
    slateformpage.Load  ${data}
    slateformpage.maximize window
Authentication
    [Arguments]  ${uid}     ${pwd}



title
    slateformpage.verify page loaded unauth

titleauth
    slateformpage.verify page loaded auth


no Login
         slateformpage.unAuthenticated user
Syllabus links
    [Arguments]   ${courses}    ${coursera}
    #slateformpage.Showall Courses



      click element    xpath=${courses}
      ${course_name}=  get text    xpath=${courses}
      log to console      ${course_name}
      sleep   2s
      ${coursenamedis} =    Fetch From Left    ${course_name}    (
      ${coursenamedis1} =     Remove String Using Regexp      ${coursenamedis}    ECEA \\d\\d\\d\\d
      ${coursenamedis2}=    evaluate       '${coursenamedis1}'.strip()
       ${strong} =  get text   xpath=//div[@data-reactid="269"]/p/strong[contains(text(), '${coursenamedis2}')]
       ${strong1}=   evaluate       '${strong}'.strip()
      Run keyword And Continue On Failure     should be equal     ${strong1}   ${coursenamedis2}
       log to console  Course name display on the side content box matches

    click element   xpath=//div/a[contains(text(),"Syllabus for ${strong1}")]
    #click element   xpath=//div/a[contains(text(),"Syllabus for")]

      sleep   10s
      @{win_title} =     get window titles
      Run keyword And Continue On Failure     should be equal     @{win_title}[1]   ${coursera}
      log to console  Title matches with Coursera
       #close all browsers


verify Showall Courses
    slateformpage.Showall Courses



Select course
    [Arguments]  ${courses}
    slateformpage.Showall Courses
    slateformpage.Course Selection  ${courses}
    #slateformpage.Course Selection
#Choose a Course
    #slateformpage.Select a course

Input personal info unauth
    [Arguments]     ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}

    #slateformpage.click Notsure
    Users should be able to Input f/m/l name    ${First Name}    ${Last Name}    ${Email}

    slateformpage.Users should be able to input mailing address  ${Country}  ${Street}   ${City}  ${State}    ${Zip}
    slateformpage.Users should be able to input other info   ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}


new unauth form with privacy
    slateformpage.new slate form with privacy for unauth

unauth privacy
    slateformpage.unauth privacy agreement

Input personal info auth

    slateformpage.click Notsure
    slateformpage.Users should be able to Input f/m/l name
    slateformpage.Users should be able to Input Mailing Address
    slateformpage.Users should be able to Input other info

embargoed countries
    slateformpage.embargoed list

embargoed countries auth
    slateformpage.embargoed list auth

embargoed access course
    slateformpage.embargoed nc

embargoed access course auth
    slateformpage.embargoed nc auth

#ssn verify
#    slateformpage.ssn rules
Click Enroll and Pay


    slateformpage.Users should be able to click enroll and pay button to go to the payment page

logout inside
    slateformpage.logout name