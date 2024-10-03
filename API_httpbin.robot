*** Settings ***
Library     Browser
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary

*** Variables ***
${baseUrl}    https://httpbin.org/
${getEndPoint}  /get
${postEndPoint}  /post
${putEndPoint}  /put
${deleteEndPoint}  /delete

*** Test Cases ***
TC: API test practice 01
    Create Session    mysesion    ${baseUrl}
    #  store request to ${response}
    ${get_response}=  GET On Session    mysesion    ${getEndPoint}
    ${post_response}=  POST On Session    mysesion    ${postEndPoint}
    ${put_response}=  PUT On Session    mysesion    ${putEndPoint}
    ${delete_response}=  DELETE On Session    mysesion    ${deleteEndPoint}

    #  log to console content, statuscode, headers of response
    log to console    ${get_response.content}
    log to console    ${get_response.status_code}
    log to console    ${get_response.headers}

    log to console    ${post_response.content}
    log to console    ${post_response.status_code}
    log to console    ${post_response.headers}

    log to console    ${put_response.content}
    log to console    ${put_response.status_code}
    log to console    ${put_response.headers}

    log to console    ${delete_response.content}
    log to console    ${delete_response.status_code}
    log to console    ${delete_response.headers}

    #  statuscode of response convert to string and store a variable
    ${code}=    convert to string    ${get_response.status_code}
    #  validation of status code equal 200
    should be equal    ${code}    200

    #  statuscode of response convert to string and store a variable
    ${code}=    convert to string    ${post_response.status_code}
    #  validation of status code equal 200
    should be equal    ${code}    200

    #  statuscode of response convert to string and store a variable
    ${code}=    convert to string    ${put_response.status_code}
    #  validation of status code equal 200
    should be equal    ${code}    200

    #  statuscode of response convert to string and store a variable
    ${code}=    convert to string    ${delete_response.status_code}
    #  validation of status code equal 200
    should be equal    ${code}    200

    #  content of response convert to string and store a variable
    ${get_body}=    convert to string    ${get_response.content}
    #  validation of status content contain origin word
    should contain    ${get_body}    origin

    #  content of response convert to string and store a variable
    ${post_body}=    convert to string    ${post_response.content}
    #  validation of status content contain origin word
    should contain    ${post_body}    origin

    #  content of response convert to string and store a variable
    ${put_body}=    convert to string    ${put_response.content}
    #  validation of status content contain origin word
    should contain    ${put_body}    origin

    #  content of response convert to string and store a variable
    ${delete_body}=    convert to string    ${delete_response.content}
    #  validation of status content contain origin word
    should contain    ${delete_body}    origin

    # grab response.headers values using get from dictionary
    ${contentTypevalue}=    get from dictionary    ${get_response.headers}    Content-Type
    #log to console value of Content-Type
    log to console    ${contentTypeValue}

    ${contentTypevalue}=    get from dictionary    ${post_response.headers}    Content-Type
    #log to console value of Content-Type
    log to console    ${contentTypeValue}

    ${contentTypevalue}=    get from dictionary    ${put_response.headers}    Content-Type
    #log to console value of Content-Type
    log to console    ${contentTypeValue}

    ${contentTypevalue}=    get from dictionary    ${delete_response.headers}    Content-Type
    #log to console value of Content-Type
    log to console    ${contentTypeValue}

