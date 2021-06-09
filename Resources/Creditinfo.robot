*** Settings ***
Resource  ../Resources/Page Object/Creditcardpage.robot
Resource  ../Resources/Page Object/slateformpage.robot



*** Keywords ***

Enter details
    Creditcardpage.Maximize Window
    Creditcardpage.Enter credit card information
    Creditcardpage.Enter Billing address
    Creditcardpage.Enter contact details

Confirm amount
    Creditcardpage.Confiirm payment


