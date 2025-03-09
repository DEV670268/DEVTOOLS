@echo off
chcp 65001 >nul
title DEVTOOLS
cls

:: Load saved Webhook
if not exist webhook.txt (
    echo No saved Webhook! Please enter a new one.
    set /p webhook= Enter Webhook URL: 
    echo %webhook% > webhook.txt
)

:menu
cls
echo.
echo ██████  ███████ ██    ██     ████████  ██████   ██████  ██      ███████ 
echo ██   ██ ██      ██    ██        ██    ██    ██ ██    ██ ██      ██      
echo ██   ██ █████   ██    ██        ██    ██    ██ ██    ██ ██      ███████ 
echo ██   ██ ██       ██  ██         ██    ██    ██ ██    ██ ██           ██ 
echo ██████  ███████   ████          ██     ██████   ██████  ███████ ███████ 
echo.
echo --------------------------------------------
echo     Welcome to DEVTOOLS Multi-Tool
echo --------------------------------------------
echo.
echo [1] Send CUSTOM TEST message to Webhook
echo [2] Spam Webhook (Custom message)
echo [3] Enter new Webhook URL
echo [0] Exit
echo.
set /p choice= Select an option: 

if "%choice%"=="1" goto test_webhook
if "%choice%"=="2" goto spam_webhook
if "%choice%"=="3" goto set_webhook
if "%choice%"=="0" exit
cls
goto menu

:test_webhook
cls
set /p message= Enter your TEST message: 
echo %message% > message_test.txt
powershell -ExecutionPolicy Bypass -File send_test.ps1
pause
cls
goto menu

:spam_webhook
cls
set /p spam_msg= Enter your SPAM message: 
set /p spam_count= How many times to send? (Max: 10) 
if %spam_count% GTR 10 set spam_count=10
echo %spam_msg% > message_spam.txt
echo %spam_count% > spam_count.txt
powershell -ExecutionPolicy Bypass -File spam_webhook.ps1
pause
cls
goto menu

:set_webhook
cls
set /p webhook= Enter new Webhook URL: 
echo %webhook% > webhook.txt
cls
goto menu
