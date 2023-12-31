*** Settings ***
Resource           ../../environment/library.robot



*** Variables ***



*** Keywords ***
Set Deviceid
    [Documentation]
    ...    [Description]    Set Deviceid
    ...    [Author]    keumyong.lee
    ...    [Date]    2023/08/17
    [Arguments]    ${testdeviceid}
    Log To Console    Set deviceid${testdeviceid}
    Set Global Variable    ${videodeviceid}    ${testdeviceid}
    
Inital And Connect Device
    [Documentation]
    ...    [Description]    Inital And Connect Device
    ...    [Author]    keumyong.lee
    ...    [Date]    2023/08/17
    [Arguments]    ${deviceid}    ${devicename}
    Log To Console    init Uiautomator2, connect to device
    ${del_status}    Run Keyword And Return Status    Delete ATX Agent After Cheking Android OS    ${deviceid}
    Run Keyword If    ${del_status}==${False}    Fail    Please check the connection status of [${deviceid}] devices.

    ${conn_status}    Run Keyword And Return Status        Connect Use Device
    Run Keyword If    ${conn_status}==${False}    Fail     Please check the connection status of [${deviceid}] devices.


Delete ATX Agent After Cheking Android OS
    [Documentation]
    ...    [Description]    Delete ATX Agent After Cheking Android OS
    ...    안드로이드 OS가 12 이상인 경우  Atx Agent 파일을 삭제
    ...    [Author]    keumyong.lee
    ...    [Date]    2023/08/17
    [Arguments]    ${deviceid}    
    Log To Console    Delete ATX Agent After Cheking Android OS
    Evalute    os.system("adb start-ser")    modules=os
    Sleep    1s
    ${adb_devices_output}    Run    adb devices | findstr ${deviceid}
    ${devices_omline_status}    Run Keyword And Return Status    Should Contain    ${adb_devices_output}    device
    Run Keyword If    "${devices_omline_status}"=="${False}"    Fail
    
    ${android_os}    Run Keyword If    "${devices_omline_status}"=="${True}"    Run    adb -s ${deviceid} shell getprop ro.build.version.release
    ${android_os}    Fetch From Left   ${android_os}
    Run Keyword If    ${android_os}>=${12}    Uninstall Atx Agent    ${deviceid}







Wake Up And Unlock Screen
    [Documentation]
    ...    [Description]   Wake Up And Unlock Screen
    ...    [Author]    keumyong.lee
    ...    [Date]    2023/08/17
    [Arguments]    ${devicename}
    Log To Console    Wake Up And Unlock Screen
    FOR    ${count}    IN RANGE    ${20}
        ${lock_status}    Get Screen Lock Status    ${devicename}
        






