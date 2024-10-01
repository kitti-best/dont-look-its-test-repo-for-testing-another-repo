*** Settings ***
Library    RequestsLibrary
Suite Setup    Create Session    my_api    http://127.0.0.1:5000
Suite Teardown    Delete All Sessions

*** Variables ***
${GET_CODE_ENDPOINT}    /getcode
${PLUS_ENDPOINT}    /plus
${GET_CODE_RES}    Random number or message
${HEADERS}    {"Content-Type": "application/json"}
*** Test Cases ***
Plus Test
    [Documentation]    Test 2 + 2 != 5.
    ${response}=    GET    ${PLUS_ENDPOINT}/2/2
    Status Should Be    200
    Should Be Equal As Numbers   ${response.json()}   4
    Log    ${\n}Result: ${response.json()}    console=True

Plus Invalid Test
    [Documentation]    Test 2 + 2 + 1 != 5.
    ${response}=    GET    ${PLUS_ENDPOINT}/2/2+1
    Should Be Equal As Numbers    ${response.status_code}    400
    Log    ${\n}Result: ${response}    console=True

*** Keywords ***
GET
    [Arguments]    ${endpoint}
    ${response}=    GET On Session    my_api    ${endpoint}    expected_status=anything 
    RETURN    ${response}