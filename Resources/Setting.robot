*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Browser_Edge}        chrome
${Shopee_URL}          https://shopee.co.th/
${Shopee_Username}     joauji@gmail.com  
${Shopee_Password}     2914856Joo

*** Keywords ***
Open Shopee home page
    Open Browser    ${Shopee_URL}    ${Browser_Edge}    
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="modal"]/div[1]/div[1]/div/div[3]/div[1]/button
    Click Element    xpath=//*[@id="modal"]/div[1]/div[1]/div/div[3]/div[1]/button

    Input Text    xpath=//*[@id="main"]/div/div[2]/div/div/div/div[2]/div/div[2]/form/div[1]/div[1]/input    ${Shopee_Username}
    Input Password    xpath=//*[@id="main"]/div/div[2]/div/div/div/div[2]/div/div[2]/form/div[2]/div[1]/input    ${Shopee_Password}
    Click Button    xpath=//*[@id="main"]/div/div[2]/div/div/div/div[2]/div/div[2]/form/button
    #Wait Until Page Contains Element    xpath=//*[@id="main"]/div/header/div[2]