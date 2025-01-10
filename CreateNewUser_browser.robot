*** Settings ***
Documentation   Test cases for browser library tests
Library         Browser
Resource        BrowserLib_keywords.robot




*** Test Cases ***
Create new user for luma app
          Navigate to home page
          Click the create account link and enter required details for new user
          Click create account and assert that user has been created successfully






*** Keywords ***
Provided precondition
    Setup system under test