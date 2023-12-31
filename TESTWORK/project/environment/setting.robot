*** Settings ***
Documentation     Test Execution Environment

*** Variables ***
&{add_name}                                            device=mobile  platform=Android


# Use In Common and Project forder
${RetryKeywordsTimeOut}                                120s
&{WAIT_ELEMENT_TIME}                                   keword=30s

# Border
${BORDER_WAITING_TIME}                                 0.05s
${BORDER_ON}                                           ${False}
${BORDER_STYLE}                                        bordae: 3px solid blue;

# Project Resource Path
${LOCATION}                                            KOREA

# Selenium
${BROWSER}                                             chrome
${SELENIUM TIMEOUT}                                    20s
${SELENIUM_SPEED}                                      0.5s


# Samsung account
${ACCOUNT_KR_URL}                                      https://account.samsung.com

# Samsung.com
${ACCOUNT.COM_US_URL}                                  https://samsung.com/us

${ACCOUNT.COM_USERBUTTEN}                              xpath=//*[@id="component-id"]/div[2]/div[5]/div[3]/a
${ACCOUNT.COM_SIGNUP}                                  xpath=/html/body/div[1]/main/div/div/div[2]/div/form/fieldset/div[2]/ul/li[2]/a
&{ACCOUNT.COM_All}                                     xpath=//*[@id="lblIptTncTC"]/span
&{ACCOUNT.COM_TERMS}                                   xpath=//*[@id="terms"]




# 삼성 어카운트
${ACCOUNT_KR_DEVICE_ID}                                R3CN1090L7Y

${ACCOUNT_KR_DEVICE_NRMR}                              ${add_name}${ACCOUNT}${ACCOUNT_KR_DEVICE_ID}


# 삼성멤버스
${SAMSUNG_MEMBERS_DEVICES_ID_KR}                       R3CN1090L7Y
${SAMSUNG_MEMBERS_DEVICE_NAME_KR}                      ${add_name}${SAMSUNG_MEMBERS_DEVICES_ID_KR}  


${Web_APK_Device_ID}                                   R3CN1090L7Y
${Web_APK_Device_Name}                                 ${add_name}${Web_APK_Device_ID}



${Web_APK_Plsu}                                         xpath=//*[@text="Internet"]
