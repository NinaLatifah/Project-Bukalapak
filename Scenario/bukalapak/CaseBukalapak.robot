*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        firefox
${LOGIN_URL}      https://accounts.bukalapak.com/login
${USERNAME}      087883336962
${PASSWORD}      *********
${SLEEPSHORT}     2s
${SLEEPOTP}       25s
${SLEEPLONG}      5s

*** Test Cases ***
testLogin
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${SLEEPSHORT}    Wait for a reply
    Input Text    //*[@id="user_session_username"]    ${USERNAME}
    Input Password    //*[@id="user_session_password"]    ${PASSWORD}
    Click Button    Login
    Sleep    ${SLEEPSHORT}    #Wait for a Elements
    Click Element    //span[contains(@class, "action-text")]
    Sleep    ${SLEEPOTP}    #Wait for input manual OTP
    Click Element    //div[@class='c-btn c-btn--red block c-btn--redt']
    Sleep    ${SLEEPSHORT}    #Wait for a Elements
    Click Element    //*[contains(text(), "Oke")]

testSearchProduct
    Sleep    ${SLEEPLONG}
    Click Element    //*[contains(text(), "Kategori barang")]    #Click Category
    Sleep    ${SLEEPSHORT}
    Set Focus To Element    //li[contains(@class, "is-active")]/a/div/div[1]    #Set Focus Element Handphone & Tablet
    Sleep    ${SLEEPSHORT}c
    Click Element    //*[contains(text(), "HP & Smartphone")]    #Click Category Hp & Smartphone
    Sleep    ${SLEEPSHORT}
    Click Element    //label[contains(@class, "te-filter-popular-1")]/input    #Click Filter Lable Bintang 4
    Sleep    ${SLEEPSHORT}
    Click Element    //ul[contains(@class, "bl-filter-category")]/li[5]/a/span    #Click Filter Only Handphone
    Sleep    ${SLEEPSHORT}
    Click Element    //label[contains(@class, "te-filter-bukamall")]/input    #CLick Filter Buka Mall
    Sleep    ${SLEEPLONG}
    Click Element    //*[contains(text(), "Apple Iphone 12 64GB - Garansi Resmi")]    #Click Product
