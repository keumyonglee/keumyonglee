*** Settings ***
Resource           ../../environment/library.robot



*** Variables ***
${DEVICE_NAME}    R3CN1090L7Y
${Web_APK_Plsu}   com.sec.android.app.sbrowser
${APP_ACTIVITY}   .SBrowserMainActivity

${Device_Name}    ${EMPTY}
${Device_OS}      ${EMPTY}
${Device_MAC}     ${EMPTY}
${Device_Number}  ${EMPTY}



*** Keywords ***
Verify Device Information
    [Documentation]
    ...    [Description]    Verify Device Information
    ...    [Date]    2023.08.22
    ...    [Author]    Keumyong.Lee
    [Arguments]    ${Device}
    Log to Console    Verify Device Information
    ${Device_Name}    Run Keyword    Shell Adb    getprop ro.product.model
    ${Device_OS}      Run Keyword    Shell Adb    getprop ro.build.version.release
    ${Device_MAC}     Run Keyword    Shell Adb    settings get secure bluetooth_address
    ${Device_Number}  Run Keyword    Shell Adb    service call iphonesubinfo 18| cut -c 52-66 | tr -d '.[:space:]+'
    ${WiFi_Status}    Run Keyword    Verify Device Wifi Status

    ${Device_Name}    Remove String    ${Device_Name}        \n
    ${Device_OS}      Remove String    ${Device_OS}          \n
    ${Device_MAC}     Remove String    ${Device_MAC}         \n
    ${Device_Number}  Remove String    ${Device_Number}      \n
    ${WiFi_Status}    Remove String    ${WiFi_Status}        \n
    
    ${WiFi_Name}      Run Keyword If    ${WiFi_Status} == ${1}    Run Keyword    Get Device Network Information
    Run Keyword If    ${WiFi_Status} == ${0}    Set Global Variable    ${WiFi_Name}    USIM-NETWORK

    ${WiFi_Name}      Remove String     ${WiFi_Name}        \n

    Log to Console    ++++++++  device information  ++++++++++
    Log to Console    Device Name : ${Device_Name}
    Log to Console    Device_Serial : ${Device_OS}
    Log to Console    WiFi SSID : ${WiFi_Name}
    Log to Console    MAC Address : ${Device_MAC}
    Log to Console    Phonenumber : ${Device_Number}

Verify Device Wifi Status
    [Documentation]
    ...    [Description]    Verify Device Wifi Status
    ...    [Author]    Keumyong.Lee
    Log To Console    Verify Device Wifi Status
    ${WiFi_Status}    Shell Adb    settings get global wifi_on
    Set Global Variable     ${WiFi_Status}     ${WiFi_Status}
    [Return]     ${WiFi_Status}

Get Device Network Information
    ...    [Description]    Get Device Network Information
    ...    [Author]    Keumyong.Lee
    Log To Console    Get Device Network Information
    ${network_1_output}    Run Keyword    Shell Adb    dumpsys netstats | grep -e 'iface=wlan,*networkId'
    ${network_2_output}    Run Keyword    Shell Adb    dumpsys netstats | grep -e 'iface=wlan,*wifiNetworkKey'

    ${networkID}    Set Variable If    """${network_1_output}"""!=""   ${network_1_output}    ${network_2_output}
    ${networkID}    Fetch From Left    ${networkID}    , metered
    ${networkID}    Fetch From Right   ${networkID}    networkId=
    ${WiFi_Name}    Fetch From Right   ${networkID}    wifiNetworkKey=
    ${WiFi_Name}    Remove String        ${WiFi_Name}    wpa2-psk
    ${WiFi_Name}    Remove String        ${WiFi_Name}    "
    
    Set Global Variable     ${WiFi_Name}    ${WiFi_Name}
    [Return]    ${WiFi_Name}
          
Clear Notification
    ...    [Description]    Clear Notification
    ...    [Author]    Keumyong.Lee
    Log To Console     Clear Notification #상단바 모든내용 삭제
    FOR    ${index}    IN RANGE    ${3}
        Open Android Notification    ${3}
    END

*** Test Cases ***
Connect and Open App
    Log To Console    Connect and Open App
    Connect Device    ${DEVICE_NAME}
    Verify Device Information    ${DEVICE_NAME}  
    Open Application  ${Web_APK_Plsu}    ${APP_ACTIVITY}




