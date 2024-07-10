*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Browser}             Chrome   #If have a ChormeDriver issue change to Edge
${Shopee_URL}          https://www.lazada.co.th/
${Shopee_Username}     joauji@gmail.com  
${Shopee_Password}     2914856Joo


*** Keywords ***
Open Lazada home page
    Open Browser    ${Shopee_URL}    ${Browser}    
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//*[@id="q"]
    Location Should Be    https://www.lazada.co.th/#?

    Title Should Be    Lazada.co.th - ช้อปปิ้งออนไลน์ รับเครดิตเงินคืน 10% ส่งฟรีทุกวัน

    # Verify that specific elements are present
    Page Should Contain Element    xpath=//div[@class='lzd-logo-content']
    Page Should Contain Element    xpath=//input[@placeholder='Search in Lazada']
    Page Should Contain Element    xpath=//p[text()='Flash Sale']
    