*** Settings ***
Resource  ../Resources/Page Object/enterpaymentpage.robot
Resource  ../Resources/Page Object/slateformpage.robot



*** Keywords ***

Open payment page and verify amount
    enterpaymentpage.Maximize Window
    #enterpaymentpage.Verify Amount

Confirm amount
    enterpaymentpage.Click Continue


