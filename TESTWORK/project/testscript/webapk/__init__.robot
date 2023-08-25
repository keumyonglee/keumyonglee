*** Settings ***
Resource           ../../environment/library.robot

Suite Setup        Run Keywords    Inital And Connect Device    ${Web_APK_Device_ID}    ${Web_APK_Device_Name}
