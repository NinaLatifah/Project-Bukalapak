*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           os
Library           JSONLibrary

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Test Cases ***
GetApi
    Create Session    mysession    ${base_url}
    ${header}    Create Dictionary    Content-Type=application/json
    ${response}    Get On Session    mysession    /posts    headers=${header}
    Log To Console    ${response.status_code}
    ${json_object}    To Json    ${response.content}
    Log To Console    ${response.content}
    #Validation StatusCode
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${res_body}=    Convert To String    ${response.content}
    #Validation Integer
    ${userId}    Get Value From Json    ${json_object}    $..userId
    #Log To Console    ${userId}
    Pass Execution If    ${userId}==int    PASS
    ${id}    Get Value From Json    ${json_object}    $..id
    #Log To Console    ${id}
    Pass Execution If    ${id}==int    PASS
    #Validation String
    ${title}    Get Value From Json    ${json_object}    $..title
    #Log To Console    ${title}
    Pass Execution If    ${title}==str    PASS
    ${body}    Get Value From Json    ${json_object}    $..body
    #Log To Console    ${body}
    Pass Execution If    ${body}==str    PASS
