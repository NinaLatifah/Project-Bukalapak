*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           os
Library           JSONLibrary

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Test Cases ***
PostApi
    Create Session    mysession    ${base_url}
    ${body}    Create Dictionary    title=recomendation    body=motorcycle    userId=12
    ${header}    Create Dictionary    Content-Type=application.json
    ${response}    Post On Session    mysession    /posts    data=${body}    headers=${header}
    #Response
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #Log To Console    ${response}
    #Validation Status
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201
    ${res_body}=    Convert To String    ${response.content}
