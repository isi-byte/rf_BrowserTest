*** Settings ***
Documentation    Automate API responses for pet store
Library          RequestsLibrary
Library          JSONLibrary
Library          BuiltIn
Library          Collections



*** Test Cases ***
Get pet with status Available
       [Documentation]   This test should get pets by status
       Create Session     My session    https://petstore.swagger.io/v2   verify=true
       ${response} =      GET On Session   My session   /pet/findByStatus?     params=status=available
       status should be   200       ${response}



Get pet with status Pending
       [Documentation]   This test should get pets by status
       Create Session     My session    https://petstore.swagger.io/v2   verify=true
       ${response} =      GET On Session   My session   /pet/findByStatus?     params=status=pending
       status should be   200       ${response}




Get pet with status Sold
       [Documentation]   This test should get pets by status
       Create Session     My session    https://petstore.swagger.io/v2   verify=true
       ${response} =      GET On Session   My session   /pet/findByStatus?     params=status=sold
       status should be    200       ${response}




Create a pet in pet store
          #[Tags]  CHIDI
          [Documentation]   This test should get pets by status
          ${body}=    Create Dictionary   id=0   name=simba   status=available
          ${response}=   POST   https://petstore.swagger.io/v2/pet   json=${body}
          status should be    200       ${response}



Update a pet
          #[Tags]  CHIDI
          [Documentation]   This test should get pets by status
          ${body}=    Create Dictionary   id=9223372036854735000   name=dog   status=available
          ${response}=   PUT   https://petstore.swagger.io/v2/pet   json=${body}
          status should be    200       ${response}


Delete a pet
       [Tags]  CHIDI
       [Documentation]   This test should get pets by status
       ${response}=       DELETE     https://petstore.swagger.io/v2/pet/9223372036854735000
       status should be   200       ${response}



