*** Settings ***
Resource            ../../../project/environment/library.robot

*** Variables ***
${URL}            https://google.com

*** Test Cases ***
Perform Google Search
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1200    800
    Input Text    name=q    123
    Press Key    name=q    \\13  # \\13은 Enter 키를 나타냅니다.
    Sleep    10s    # 검색 결과 확인을 위해 충분한 시간을 기다립니다.
    Close Browser