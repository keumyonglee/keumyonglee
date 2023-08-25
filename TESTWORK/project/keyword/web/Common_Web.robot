*** Settings ***
Resource            ../../../project/environment/library.robot

*** Keywords ***
##############################Common############################
Get Current Timestamp With formate(${seperator})
    [Description]  현재 날짜 텍스트 생성(${seperator})
    &{TIME}  Get Current Date  result_format=%Y${seperator}%m${seperator}%d${seperator}%H${seperator}%M${seperator}%S
    [Return]  ${TIME}
        
    


Open Moakt Email page And Create Email
    [Description]  Open Moakt Email page And Create Email
    ...    [Author] Keum
    ...    [Date] 2023.08.14
    [Arguments]  ${email]
    