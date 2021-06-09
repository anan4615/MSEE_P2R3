*** Settings ***
Resource  ../Resources/Page Object/sucesspage.robot
Resource  ../Resources/Page Object/slateformpage.robot



*** Keywords ***

Verify link and sucess message
    sucesspage.Maximize Window
    sucesspage.Click enrollment link
