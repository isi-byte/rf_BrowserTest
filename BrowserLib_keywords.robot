*** Settings ***
Documentation      Keywords for luma project
Library            Browser
Library            FakerLibrary



*** Variables ***
${URL}                      https://magento.softwaretestingboard.com/
${BROWSER}   chrome
${HOMEPAGE_SIGNIN_LINK}      class:authorization-link
${LOGIN_USERNAME_FIELD}      name:login[username]
${LOGIN_PASSWORD_FIELD}       id:pass
${SIGNIN_BUTTON}              id:send2
${LOGIN_SUCCESS_MESSAGE}       Welcome, Jane Zoe!
${CREATE_NEW_ACCOUNT_LINK}      xpath=/html/body/div[2]/header/div[1]/div/ul/li[3]/a
${CREATEACC_FIRSTNAME_FIELD}    id=firstname
${CREATEACC_LASTNAME_FIELD}      name=lastname
${CREATEACC_EMAIL_FIELD}         name=email
${CREATEACC_PASSWORD_FIELD}      name=password
${CREATEACC_CONFIRMPASS_FIELD}   id=password-confirmation
${CREATEACC_BTN}    xpath=//a[text() = 'Create an Account']
${ADDRESS_BOOK}     xpath://*[@id="block-collapsible-nav"]/ul/li[6]
${EDITADD_PHONE}    id=telephone
${EDITADD_STREETADD}   name:street[]
${EDITADD_CITY}     name:city
${EDITADD_STATE}    id:region_id
${EDITADD_PC}       id:zip
${EDIT_COUNTRY}     id:country
${EDIT_SAVEADDRESS}  xpath://*[@id="form-validate"]/div/div[1]/button/span




*** Keywords ***
Navigate to home page
            New Browser    Chromium   headless=false
            New page       ${URL}
            Click          ${CREATE_NEW_ACCOUNT_LINK}


Edit user address details
             [Arguments]   ${phone_number}   ${street_address}     ${city}     ${postcode}
             Click                       ${ADDRESS_BOOK}
             Fill text                   ${EDITADD_PHONE}       ${phone_number}
             Fill text                   ${EDITADD_STREETADD}   ${street_address}
             Wait and Input Text         ${EDITADD_CITY}        ${city}
             Select from list by label   ${EDIT_COUNTRY}       Finland
             Select from list by index   ${EDITADD_STATE}        6
             Wait and Input Text         ${EDITADD_PC}       ${postcode}
             Wait and Click Element      ${EDIT_SAVEADDRESS}




Enter login credentials and click on the login button
         [Arguments]   ${username}   ${password}
         Wait and Click Element        ${HOMEPAGE_SIGNIN_LINK}
         Wait and Input Text            ${LOGIN_USERNAME_FIELD}   ${username}
         Wait and Input Text           ${LOGIN_PASSWORD_FIELD}   ${password}
         Wait and Click Element        ${SIGNIN_BUTTON}



Click the create account link and enter required details for new user
          Enter firstname for creating new user
          Enter lastname for creating new user
          Enter email for creating new user
          Fill Text             ${CREATEACC_PASSWORD_FIELD}      Testing123!
          Fill Text             ${CREATEACC_CONFIRMPASS_FIELD}   Testing123!



Click create account and assert that user has been created successfully
           Click             ${CREATEACC_BTN}
           Get Text         xpath://*[@id="maincontent"]/div[1]/div[2]/div/div/div  ==   Thank you for registering with Main Website Store.



Logout new user and go to create account page
           Wait and Click Element          xpath://html/body/div[2]/header/div[1]/div/ul/li[2]/span/button
           Wait until element is Enabled   linktext:Sign Out
           Wait and Click Element          linktext:Sign Out
           Wait and Click Element          ${CREATE_NEW_ACCOUNT_LINK}



Enter required details for new user and omit Firstname
          Wait and Click Element        ${CREATE_NEW_ACCOUNT_LINK}
          Enter lastname for creating new user
          Enter email for creating new user
          Wait and Input Text          ${CREATEACC_PASSWORD_FIELD}      Testing123!
          Wait and Input Text          ${CREATEACC_CONFIRMPASS_FIELD}   Testing123!
          Wait and Click Element       ${CREATEACC_BTN}




Enter required details for new user and omit Lastname
         Wait and Click Element          ${CREATE_NEW_ACCOUNT_LINK}
         Enter firstname for creating new user
         Enter email for creating new user
         Wait and Input Text             ${CREATEACC_PASSWORD_FIELD}      Testing123!
         Wait and Input Text             ${CREATEACC_CONFIRMPASS_FIELD}   Testing123!
         Wait and Click Element          ${CREATEACC_BTN}


Enter required details for new user and omit Email
          Wait and Click Element                ${CREATE_NEW_ACCOUNT_LINK}
          Enter firstname for creating new user
          Enter lastname for creating new user
          Wait and Input Text                   ${CREATEACC_PASSWORD_FIELD}      Testing123!
          Wait and Input Text                   ${CREATEACC_CONFIRMPASS_FIELD}  Testing123!
          Wait and Click Element                 ${CREATEACC_BTN}


Enter required details for new user and omit Password
          Wait and Click Element       ${CREATE_NEW_ACCOUNT_LINK}
          Enter firstname for creating new user
          Enter lastname for creating new user
          Enter email for creating new user
          Wait and Input Text                 ${CREATEACC_PASSWORD_FIELD}      Testing123!
          Wait and Click Element        ${CREATEACC_BTN}



Enter required details for new user and omit ConfirmPassword
          Wait and Click Element      ${CREATE_NEW_ACCOUNT_LINK}
          Enter firstname for creating new user
          Enter lastname for creating new user
          Enter email for creating new user
          Wait and Input Text             ${CREATEACC_CONFIRMPASS_FIELD}   Testing123!
          Wait and Click Element          ${CREATEACC_BTN}




Wait and Click Element
      [Documentation]    Wait for an element to be eneabled before clicking
       [Arguments]   ${locator}    ${timeout}=10s
       wait until element is enabled     ${locator}
       click element   ${locator}



Wait and Input Text
        [Documentation]  Wait for an element to be eneabled before before inputting text
       [Arguments]   ${locator}      ${text}     ${timeout}=10s
       wait until element is enabled     ${locator}
       input text   ${locator}    ${text}


Enter email for creating new user
        ${email}=  FakerLibrary.email
        log   ${email}
        Set Test Variable  ${email}
        Fill Text     ${CREATEACC_EMAIL_FIELD}   ${email}


Enter firstname for creating new user
        ${firstname}=  FakerLibrary.firstname
        log    ${firstname}
        set test variable  ${firstname}
        Fill Text          ${CREATEACC_FIRSTNAME_FIELD}   ${firstname}


Enter lastname for creating new user
         ${lastname}=  FakerLibrary.lastname
         log    ${lastname}
         set test variable  ${lastname}
         Fill Text          ${CREATEACC_LASTNAME_FIELD}     ${lastname}
