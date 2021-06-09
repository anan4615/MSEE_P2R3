*** Settings ***
Resource  ../Resources/Page Object/welcomepaymentpage.robot
Resource  ../Resources/Page Object/slateformpage.robot
Resource  ../Resources/Page Object/authenticated.robot



*** Keywords ***
Open welcome payment page

    welcomepaymentpage.maximize window



payment URL


    welcomepaymentpage.Change URL

Submit Payment
    welcomepaymentpage.Click Submit Payment