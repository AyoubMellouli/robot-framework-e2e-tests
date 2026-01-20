*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_id}
${book_name}    RobotFramework

*** Test Cases ***
Play around with Dictionary
    [Tags]    API
    &{data}=    Create Dictionary    name=ayoub    course=robot    website=${base_url}
    Log    ${data}
    Dictionary Should Contain Key    ${data}     name
    Log    ${data}[name]
    ${url}=    Get From Dictionary    ${data}     website
    Log    ${url}

Add Book into Library DataBase
    [Tags]    API
    &{req_body}=    Create Dictionary    name=${book_name}    isbn=94845    aisle=34795   author=ayoub
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}     ID
    ${book_id}=    Get From Dictionary    ${response.json()}     ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200     ${response}

Get the book details which got added
      [Tags]    API
      ${get_response}=   GET     ${base_url}/Library/GetBook.php     params=ID=${book_id}      expected_status=200
      log    ${get_response.json()}
      Should be Equal as Strings     ${book_name}    ${get_response.json()}[0][book_name]

Delete the Book from database**
    [Tags]    API
    &{delete_req}=    Create Dictionary    ID=${book_id}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_req}    expected_status=200
    Log    ${delete_response.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_response.json()}[msg]
    