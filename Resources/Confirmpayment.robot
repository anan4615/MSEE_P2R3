*** Settings ***
Resource  ../Resources/Page Object/Confirmpaymentpage.robot
Resource  ../Resources/Page Object/slateformpage.robot



*** Keywords ***

verify and confirm amount
    Confirmpaymentpage.Maximize Window
    Confirmpaymentpage.Confirmation
