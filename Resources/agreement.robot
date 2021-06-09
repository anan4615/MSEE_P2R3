*** Settings ***

Resource  ../Resources/Page Object/Agreementpage.robot




*** Keywords ***
Open page aand click agreement auth

    Agreementpage.Maximize Window
    Agreementpage.Click Agreement auth


Open page aand click agreement unauth

    Agreementpage.Maximize Window
    Agreementpage.Click Agreement unauth


