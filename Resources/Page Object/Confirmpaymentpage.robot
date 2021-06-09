*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Dialogs


*** Variables ***



*** Keywords ***


Maximize Window
    Maximize Browser Window
    Page Should Contain  Please review your credit card information.
    sleep  5s



Confirmation
    click button    xpath=//*[@id="confirmbutton_btn"]