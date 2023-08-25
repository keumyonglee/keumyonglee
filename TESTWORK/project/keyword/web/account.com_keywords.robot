*** Settings ***
Resource            ../../../../project/environment/library.robot

*** Keywords ***
##############################Common############################
Set Curren Timestamp Email
    ...    [Description]  Set Curren Timestamp Email
    ...    [Author] Keum
    ...    [Date] 2023.08.14
    [Arguments]  ${id}  ${mailname}
    Log To Console  Set Curren Timestamp Email
    ${date}  Get Current Timestamp With formate(${EMPTY})
    Set Global Variable  ${email}   ${id}${date}${mailname}
    Log To Console  Set Email : ${email}
    [Return]  ${email}



Set Country
    [Documentation]
    ...    [Description] Set Country
    ...    [Author] Keum
    ...    [Date] 2023.08.14
    [Arguments]  ${country}
    Log To Console  Set Country ${country}
    Set Global Variable  ${nation} ${country}
    Register Keword to Run to Run on Failere  notihing
    
    

    