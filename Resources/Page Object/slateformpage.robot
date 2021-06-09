*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Dialogs


*** Variables ***

# This needs to be updated
${expfilter_result} =  Results: 22 courses
@{emb_country}    Iran  Cuba  Syria   Korea, North


*** Keywords ***
Load
    [Arguments]  ${data}
    Go To   ${data}
Maximize Window
    Maximize Browser Window

Verify Page Loaded unauth
    # This needs to be updated
     Run keyword And Continue On Failure    Wait until page contains  CU Boulder MS-EE on Coursera Enrollment
    sleep  3s
#uncomment when testing sinfle test cases
    #Click element   xpath=//a[contains(text(),"Learn more about our Online Master's - Electrical Engineering")]

Verify Page Loaded auth
    # This needs to be updated
     Run keyword And Continue On Failure    Wait until page contains  CU Boulder MS-EE on Coursera Enrollment - Returning Students


unAuthenticated user
     # This needs to be updated

    page should not contain element     xpath=//span[contains(text(),"Your October-December 2019 MS-EE on Coursera courses")]
    page should not contain element     xpath=//span[contains(text(),"Your January-March 2020 MS-EE on Coursera courses")]
    page should not contain element     xpath=//span[contains(text(),"Your March - May 2020 2020 MS-EE on Coursera courses")]



logout name
    click element  xpath=//a[contains(text(),'Log Out')]
    sleep   2s
    page should contain     Logout
    page should contain element     xpath=//a[contains(text(),'Return to enrollment form')]
    click element   xpath=//a[contains(text(),'Return to enrollment form')]
    sleep   2s
    Run keyword And Continue On Failure    Wait until page contains  CU Boulder MS-EE on Coursera Enrollment
#personal information
Showall Courses

#click show all
# This needs to be updated for auth/unauth
    #UnAuth
    #click element   xpath=//label[contains(text(),'Show All')]



    log to console  showall sucess
    sleep   4s
     # This needs to be updated for auth/unauth
     #UnAuth
    ${filter_result}=  get value    xpath=//div[@class="form_responses"]/input[@name="form_4dbb5622-ffac-7928-3136-89296ec06379"]

    ${filter_result1}=    evaluate       '${filter_result}'.strip()
    log to console      ${filter_result1}
    Run keyword And Continue On Failure     should be equal   ${filter_result1}    ${expfilter_result}

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
    #unauth
    textfield should contain     xpath=//div/input[@name="form_f945e5bd-c3ae-3edd-d8f5-4bf15fa9f759"]    ${course_name}


    #unauth
    textfield should contain     xpath=//div/input[@name="form_30fcf151-6bdb-97eb-357b-a7680bd80905"]    ${course_name}

    #unauth
     textfield should contain     xpath=//div/input[@name="form_03f2b947-0713-339e-c8fe-c384e0cb56dd"]    ${course_name}



    log to console  All Course name matches
    ${course_name1} =     Set Variable    ${course_name}
    set suite variable   ${course_name1}    ${course_name}
    #tuition that is displayed at tyhe page end
    #unauth
    ${tuition} =  get text  id=payment_display_form_c41b7fe7-2f43-7cc3-100e-2df8e84e1cf5



    log to console   ${tuition}

    #Total Cost
    #unauth
    textfield should contain     xpath=//div/input[@name="form_5f0b7be7-9464-53d8-2d66-43008a6c9ad6"]    ${tuition}



    log to console  Sucesss tuition matches
    ${tuition1} =   replace variables    ${tuition}

    set test variable  ${tuition2}    ${tuition1}
    log to console     ${tuition2}
    #uncomment when testing sinfle test cases
    #Click element   xpath=//a[contains(text(),"Current student calendars and information")]

Click Notsure
 # This needs to be updated
    click element   xpath=//div/label[@for="form_48aaa06e-f190-e344-6520-7a2712e97749_4"]

Users should be able to Input f/m/l name
    [Arguments]     ${First Name}    ${Last Name}    ${Email}

  # This needs to be updated
    Input text  id=form_a9de7ed7-16f7-fe3a-b5e9-cd44dc373c5d  ${First Name}
    #Input text  id=form_9b5ae97e-e765-132c-fed4-adb26f610453  ${Middle Name}
    Input text  id=form_8f4a3df3-36dc-3856-b828-2409e2e74e65  ${Last Name}
    Input text  id=form_3527d4b3-2209-209a-d195-1ea88e57be5d  ${Email}

Users should be able to Input Mailing Address
    [Arguments]     ${Country}  ${Street}   ${City}  ${State}     ${Zip}

 # This needs to be updated
    select from list by label  id=form_31feb314-ede6-b30f-af14-8b7c4e505f3e_country  ${Country}

#         Run Keyword If    '${Country}'== 'Iran'    Run Keywords    embargoed
#         ...   ELSE IF   '${Country}'== 'Cuba'    Run Keywords    embargoed
#         ...   ELSE IF   '${Country}'== 'Syria'    Run Keywords    embargoed
#         ...   ELSE IF   '${Country}'== 'Korea, North'    Run Keywords    embargoed
#         ...    ELSE    No updates

    Input text  id=form_31feb314-ede6-b30f-af14-8b7c4e505f3e_street  ${Street}
    Input text  id=form_31feb314-ede6-b30f-af14-8b7c4e505f3e_city  ${City}
    select from list by label  xpath=//select[@id='form_31feb314-ede6-b30f-af14-8b7c4e505f3e_region']  ${State}
    Input text  id=form_31feb314-ede6-b30f-af14-8b7c4e505f3e_postal     ${Zip}

embargoed list

    sleep  2s
    :FOR        ${item}     IN      @{emb_country}
    \   log to console  ${item}
    \   sleep   5s
    \   page should contain element     xpath=//select[@id='form_31feb314-ede6-b30f-af14-8b7c4e505f3e_country']

    \   select from list by label   xpath=//select[@id='form_31feb314-ede6-b30f-af14-8b7c4e505f3e_country']    ${item}
    \   sleep   5s
    \   page should contain  United States export control regulations prevent us from offering services and content to students who are ordinarily resident or domiciled in Iran, Cuba, Syria, and North Korea. Students residing in those countries may not register for courses in the MS-EE program.
    \   log to console  ${item} passed
    \   select from list by label   xpath=//select[@id='form_31feb314-ede6-b30f-af14-8b7c4e505f3e_country']    Aruba
    \   page should contain  United States export control regulations prevent us from offering services and content to students who are ordinarily resident or domiciled in Iran, Cuba, Syria, and North Korea. Students residing in those countries may not register for courses in the MS-EE program.
    \   log to console  Aruba passed

embargoed list auth

    sleep  2s
    :FOR        ${item}     IN      @{emb_country}
    \   log to console  ${item}
    \   sleep   2s
    \   select from list by label   xpath=//select[@id='form_e1d445fc-780d-4e0e-91d6-115eb3de790d_country']    ${item}
    \   sleep   3s
    \   page should contain  United States export control regulations prevent us from offering services and content to students who are ordinarily resident or domiciled in Iran, Cuba, Syria, and North Korea. Students residing in those countries may not register for courses in the MS-EE program.
    \
    \   reload page

embargoed nc


    :FOR        ${item}     IN      @{emb_country}
    \   log to console  ${item}


    \   wait until element is enabled   xpath=//input[@id='form_438982cf-49b9-a519-f09d-4d79f7d96ad9_1']
    \   click element   xpath=//input[@id='form_438982cf-49b9-a519-f09d-4d79f7d96ad9_1']
    \   sleep   5s
    \   select from list by label   xpath=//select[@id='form_b25c98ad-b7c9-c053-b3df-af402c57ca46']    ${item}
    \   sleep   4s
    \   page should contain  United States export control regulations prevent us from offering services and content to students who are ordinarily resident or domiciled in Iran, Cuba, Syria, and North Korea. Students residing in those countries may not register for courses in the MS-EE program.
    \   log to console  ${item} passed
    \   select from list by label   xpath=//select[@id='form_b25c98ad-b7c9-c053-b3df-af402c57ca46']   Aruba
    \   page should contain  United States export control regulations prevent us from offering services and content to students who are ordinarily resident or domiciled in Iran, Cuba, Syria, and North Korea. Students residing in those countries may not register for courses in the MS-EE program.
    \   log to console  Aruba passed



embargoed nc auth

    :FOR        ${item}     IN      @{emb_country}
    \   log to console  ${item}


    \   wait until element is enabled   xpath=//input[@id='form_fc07afd1-678d-1538-75e4-6900953b2e24_1']
    \   click element   xpath=//input[@id='form_fc07afd1-678d-1538-75e4-6900953b2e24_1']
    \   sleep   3s
    \   select from list by label   xpath=//select[@id='form_21b95224-9031-1536-b9e4-faa55f3add4a']    ${item}
    \   sleep   2s
    \   page should contain  United States export control regulations prevent us from offering services and content to students who are ordinarily resident or domiciled in Iran, Cuba, Syria, and North Korea. Students residing in those countries may not register for courses in the MS-EE program.
    \   reload page



Users should be able to Input other info
    [Arguments]     ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
     # This needs to be updated
    select from list by label  id=form_b47d04a6-3ab4-6e51-fe49-8d3e11abbb69  ${Sex}
    select from list by label  id=form_4d99d129-772e-14f2-1d08-1ce5c8c7fb13_m   ${Month}
    select from list by label  id=form_4d99d129-772e-14f2-1d08-1ce5c8c7fb13_d   ${Day}
    select from list by label  id=form_4d99d129-772e-14f2-1d08-1ce5c8c7fb13_y   ${Year}
    Input text  id=form_79e5d9a4-be12-00ad-46d3-f01159e293e7  ${Phone}


#ssn rules
#    input text  xpath=//input[@id='form_38db842f-984d-9fd9-8b7b-9fa5eb52fdee']  983596390
#    Click button    xpath=//button[contains(text(),"Submit and Pay")]
#
#    #select frame  xpath=//iframe[@id='_hjRemoteVarsFrame']
#    #frame should contain  xpath=//iframe[@id='_hjRemoteVarsFrame']  9 required fields were not completed and 1 field was not properly formatted
#    click element   xpath=//div[@class='dialog_host']
#    log to console  get text  xpath=//div[@class='dialog_host']
#    #element text should be  xpath=//div{@class='dialog_host']   9 required fields were not completed and 1 field was not properly formatted
#

new slate form with privacy for unauth
    click element    xpath=//label[contains(text(),'ECEA 5361 Hardware Description Languages for FPGA')]
    page should contain element     xpath=//div[contains(text(),'Current Session')]
    page should contain element     xpath=//div[contains(text(),'Declaration of Intent to Pursue Degree')]
    page should contain element     xpath=//div[contains(text(),'Personal Information')]
    page should contain element     xpath=//div[contains(text(),'Citizenship Information')]
    page should contain element     xpath=//div[contains(text(),'Submit and Pay')]
    click element  xpath=//fieldset[@id='form_48aaa06e-f190-e344-6520-7a2712e97749']//div[@class='form_response']//label[contains(text(),'No')]

unauth privacy agreement
    page should contain element  xpath=//label[contains(text(),'I agree to authorize the University of Colorado to')]
    click element  xpath=//label[contains(text(),'I agree to authorize the University of Colorado to')]


#enroll and pay
Users should be able to click enroll and pay button to go to the payment page
    #uncomment when testing sinfle test cases
    Click element   xpath=//a[contains(text(),"Please review our refund, drop and withdrawal policies")]
    sleep  5s
    Click button    xpath=//button[contains(text(),"Submit and Pay")]
    sleep  5s


