*** Settings ***
Library  SeleniumLibrary



*** Keywords ***

Maximize Window
    Maximize Browser Window
    sleep  3s
Click enrollment link
    Wait until page contains  Enrollment Request and Payment Received

    #Click element  css=#content > p > a




