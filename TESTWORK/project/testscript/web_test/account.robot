*** Settings ***
Resource            ../../../project/environment/library.robot




*** Test Cases ***
Create Samsung Account
    Open Browser    ${ACCOUNT_KR_URL}    ${BROWSER}
    Set Window Size    800    1200
    Sleep    3s
    Click Element    xpath=//button[@id="component-id"]/div[2]/div[5]/div[3]/a/svg   # 계정 생성 버튼 클릭
    Sleep    3s      
    Click Element    xpath://button[@id="gateCheckName14Under"]   # 만 14세 이상 회원가입 버튼 클릭
    Sleep    5s    # 페이지 로딩을 기다리기 위해 충분한 시간 대기
    Close Browser