*** Settings ***
Library  SeleniumLibrary
Library  String



*** Keywords ***


Maximize Window

    Maximize Browser Window



#Change URL to get payment page
Change URL



    ${pay_url}=   Get Location
    @{link} =    Split String   ${pay_url}  /
    ${len} =  get length  ${link}

    ${str} =  Replace String  ${pay_url}  @{link}[2]  cbo.test.technolutions.net
    Go To  ${str}

#validate payment and course details and submit payment
Click Submit Payment
   Wait until page contains  Submit Payment
    ${amount} =  get text  css=#content > table > tbody > tr:nth-child(3) > td
    ${course} =  get text  css=#content > table > tbody > tr:nth-child(2) > td
    log to console    ${tuition2}
    run keyword and continue on failure  should be equal  ${tuition2}   ${amount}
    log to console  Sucesss amount matches
    page should contain     Session: March 9 2020 - May 1 2020

    #run keyword and continue on failure  should be equal  ${course_name1}   ${course}
    click button  xpath=//*[@id="content"]/form/div/button