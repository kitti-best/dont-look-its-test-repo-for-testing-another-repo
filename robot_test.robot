*** Settings ***
Library               RequestsLibrary

*** Variables ***
${HOST}    http://192.168.182.102:8080

*** Test Cases ***

Get Root
    ${response}=    GET  ${HOST}
    Should Be Equal As Numbers    ${response.status_code}     1
Get Code
    ${response}=    GET  ${HOST}/getcode
    Should Be Equal As Strings    ${response.text}    Hello!

Get Plus 1 2
    ${response}=    GET  ${HOST}/plus/1/2
    Should Be Equal    ${response.text}    {"result":3.0}
