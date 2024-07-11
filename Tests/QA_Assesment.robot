*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../resources/Setting.robot

*** Test Cases ***
S_01 F_01 TC-01 To verify display of "Lazada" home page can display correctly.
    [Documentation]    Lazada home page with English language.
    [Tags]             Lazada home page.

    Open Lazada home page
    
    Close Browser

S_01 F_01 TC-02 To verify the "Lazada" home page can be successfully accessed with the default language set to English.
    [Documentation]    Lazada home page with English language.
    [Tags]             Lazada home page.

    Open Lazada home page

    # Verify default language
    ${class_attribute}=    Get Element Attribute    xpath=//*[@id="lzdSwitchPop"]/div/div[2]    class
    IF    '${class_attribute}' == 'lzd-switch-item currentSelected'
        Log    Pass, The default language is set to English.
    ELSE
        Log    Fail!!!!!!!,, The default language is set to Thai.
    END

    Close Browser
    
S_01 F_01 TC-03 To verify the "Lazada" home page can be successfully accessed with the default language set to Thai.
    [Documentation]    Lazada home page with English language.
    [Tags]             Lazada home page.

    Open Lazada home page

    # Verify default language
    ${class_attribute}=    Get Element Attribute    xpath=//*[@id="lzdSwitchPop"]/div/div[1]    class
    IF    '${class_attribute}' == 'lzd-switch-item currentSelected'
        Log    Pass, The default language is set to Thai.
    ELSE
        Log    Fail!!!!!!!,, The default language is set to English.
    END

    Close Browser

S_01 F_01 TC-04 To verify the "Lazada" home page can be successfully accessed, and then change to Thai language.
    [Documentation]    Lazada home page with English language.
    [Tags]             Lazada home page.

    Open Lazada home page

    # Change to Thai language
    Click Element    xpath=//*[@id="topActionSwitchLang"]
    Wait Until Element Is Visible    xpath=//*[@id="lzdSwitchPop"]/div/div[1]
    Click Element    xpath=//*[@id="lzdSwitchPop"]/div/div[1]
    Sleep    1s

    # Verify language has change to Thai
    ${class_attribute}=    Get Element Attribute    xpath=//*[@id="lzdSwitchPop"]/div/div[1]    class
    IF    '${class_attribute}' == 'lzd-switch-item currentSelected'
        Log    Pass, The language has been changed to Thai.
    ELSE
        Log    Fail!!!!!!!, The language has not been changed to Thai.
    END

    Close Browser

S_01 F_01 TC-05 To verify the "Lazada" home page can be successfully accessed, and then change to English language.
    [Documentation]    Lazada home page with English language.
    [Tags]             Lazada home page.

    Open Lazada home page

    # Change to English language
    Click Element    xpath=//*[@id="topActionSwitchLang"]
    Wait Until Element Is Visible    xpath=//*[@id="lzdSwitchPop"]/div/div[2]
    Click Element    xpath=//*[@id="lzdSwitchPop"]/div/div[2]
    Sleep    1s

    # Verify language has change to Thai
    ${class_attribute}=    Get Element Attribute    xpath=//*[@id="lzdSwitchPop"]/div/div[2]    class
    IF    '${class_attribute}' == 'lzd-switch-item currentSelected'
        Log    Pass, The language has been changed to English.
    ELSE
        Log    Fail!!!!!!!, The language has not been changed to English.
    END

    Close Browser

S_02 F_01 TC-01 To verfify display of "Search" field can display correctly.
    [Documentation]    Search function with keywords "baby toys".
    [Tags]             Search with keyword.

    Open Lazada home page

    # Input "baby toys" in search field
    Input Text    xpath=//*[@id="q"]    baby toys

    # The website displays "baby toys" in the search field
    ${txt_baby_toy}    Get Value    xpath=//*[@id="q"]
    Should Be Equal As Strings    ${txt_baby_toy}    baby toys

    # The website displays dropdown list related to keyword "baby toys"
    Sleep    1s
    ${keyword_related_list}    Create List
    ${keyword_relateds}    Get WebElements    css: .suggest-item-content--20px

    FOR    ${keyword_related}    IN    @{keyword_relateds}
    ${text}    Get Text    ${keyword_related}
    Append To List    ${keyword_related_list}    ${text}
    END

    FOR    ${contain}    IN    @{keyword_related_list}
        Should Contain    ${contain}    Baby toys
    END

    Close Browser

S_02 F_01 TC-02 To verify the "Search" function on Lazada's home page when click "Search" icon can work properly.
    [Documentation]    Search function with keywords "baby toys".
    [Tags]             Search with keyword.

    Open Lazada home page

    # Input "baby toys" in search field and click on "Search" icon
    Input Text    xpath=//*[@id="q"]    baby toys
    Click Element    xpath=//*[@id="topActionHeader"]/div/div[2]/div/div[2]/div/form/div/div[2]
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/h1
    Page Should Contain Element    xpath=//h1[text()='Baby Toys']

    # The website displays the results related to keyword "baby toys"
    ${results}    Get Text    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/div/div[1]/div/div
    Log    ${results}

    Close Browser

S_02 F_01 TC-03 To verify the "Search" function on Lazada's home page when press "Enter" button can work properly.
    [Documentation]    Search function with keywords "baby toys".
    [Tags]             Search with keyword.

    Open Lazada home page

    # Input "baby toys" in search field and press "Enter" button
    Input Text    xpath=//*[@id="q"]    baby toys
    Press Key    xpath=//*[@id="q"]    \\13
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/h1
    Page Should Contain Element    xpath=//h1[text()='Baby Toys']

    # The website displays the results related to keyword "baby toys"
    ${results}    Get Text    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/div/div[1]/div/div
    Log    ${results}

    Close Browser

S_02 F_01 TC-04 To verify the "Search" function on Lazada's home page when select keyword "baby toy" in drop-down list can work properly.
    [Documentation]    Search function with keywords "baby toys".
    [Tags]             Search with keyword.

    Open Lazada home page

    # Input "baby toys" in search field and select keyword "baby toy" in drop-down list
    Input Text    xpath=//*[@id="q"]    baby toys
    Sleep    1s
    Click Element    xpath=//*[@id="topActionHeader"]/div[1]/div[2]/div/div[2]/div/form/div/div[3]/div/a[7]/div    # Maybe path has been change
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/h1
    Page Should Contain Element    xpath=//h1[text()='Baby Toys']

    # The website displays the results related to keyword "baby toys"
    ${results}    Get Text    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/div/div[1]/div/div
    Log    ${results}

    Close Browser

S_03 F_01 TC-01 To verify the "Display of results as a list" when click "Search" icon can work properly.
    [Documentation]    Display of search results as a list.
    [Tags]             Display as a list.

    Open Lazada home page

    # Input "baby toys" in search field and click on "Search" icon
    Input Text    xpath=//*[@id="q"]    baby toys
    Click Element    xpath=//*[@id="topActionHeader"]/div/div[2]/div/div[2]/div/form/div/div[2]
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/h1
    Page Should Contain Element    xpath=//h1[text()='Baby Toys']

    # The website displays the results related to keyword "baby toys" as a list
    Page Should Contain Element    xpath=//div[@data-qa-locator="general-products"]
    Page Should Contain Element    xpath=//div[@data-tracking="product-card"]
    Page Should Contain Element    xpath=//div[@data-spm="list"]

    Close Browser

S_03 F_01 TC-02 To verify the "Display of results as a list" when press "Enter" button can work properly.
    [Documentation]    Display of search results as a list.
    [Tags]             Display as a list.

    Open Lazada home page

    # Input "baby toys" in search field and press "Enter" button
    Input Text    xpath=//*[@id="q"]    baby toys
    Press Key    xpath=//*[@id="q"]    \\13
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/h1
    Page Should Contain Element    xpath=//h1[text()='Baby Toys']

    # The website displays the results related to keyword "baby toys" as a list
    Page Should Contain Element    xpath=//div[@data-qa-locator="general-products"]
    Page Should Contain Element    xpath=//div[@data-tracking="product-card"]
    Page Should Contain Element    xpath=//div[@data-spm="list"]

    Close Browser

S_03 F_01 TC-03 To verify the "Display of results as a list" when select keyword "baby toy" in drop-down list can work properly.
    [Documentation]    Display of search results as a list.
    [Tags]             Display as a list.

    Open Lazada home page

    # Input "baby toys" in search field and select keyword "baby toy" in drop-down list
    Input Text    xpath=//*[@id="q"]    baby toys
    Sleep    1s
    Click Element    xpath=//*[@id="topActionHeader"]/div[1]/div[2]/div/div[2]/div/form/div/div[3]/div/a[7]/div    # Maybe path has been change
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[1]/h1
    Page Should Contain Element    xpath=//h1[text()='Baby Toys']

    # The website displays the results related to keyword "baby toys" as a list
    Page Should Contain Element    xpath=//div[@data-qa-locator="general-products"]
    Page Should Contain Element    xpath=//div[@data-tracking="product-card"]
    Page Should Contain Element    xpath=//div[@data-spm="list"]

    Close Browser