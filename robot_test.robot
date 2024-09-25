*** Settings ***
Library               RequestsLibrary

*** Variables ***
${HOST}    http://192.168.182.102:8080

*** Test Cases ***

Get Plus 1 2
    ${response}=    GET  ${HOST}/plus/1/2
    Should Be Equal    ${response.text}    3.0
