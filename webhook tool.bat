@echo off & "%__APPDIR__%chcp.com" 65001 >nul
:mode
cls
title webhook tool by steever38#2655
set /a messages=0
set /a messages_send=0
::::   _____        _              _                           _       
::::  / ____|      | |            | |                         | |      
:::: | (___    ___ | |  ___   ___ | |_   _ __ ___    ___    __| |  ___ 
::::  \___ \  / _ \| | / _ \ / __|| __| | '_ ` _ \  / _ \  / _` | / _ \
::::  ____) ||  __/| ||  __/| (__ | |_  | | | | | || (_) || (_| ||  __/
:::: |_____/  \___||_| \___| \___| \__| |_| |_| |_| \___/  \__,_| \___|v1.5
::::                                                                   
for /f "delims=: tokens=*" %%B in ('findstr /b :::: "%~f0"') do @echo(%%B
echo github : github.com/steever38

echo.
echo [1] webhook spammer - [2] webhook message - [3] delete webhook
set /p M=nombre : 
echo.
if %M%==3 goto :delete
set /p name=Nom du webhook : 
set /p avatar=Photo de profil du webhook : 

:settings
cls
set /p message=Message a envoyer : 
:tts
set /p tts=Tts : true/false : 
if %tts%==true goto :check_ok
if %tts%==false (goto :check_ok) else cls & echo erreur: entre true ou false & goto :tts

:check_ok
set /p webhooknb=Nombre de webhook (max 10) : 
if %webhooknb% GEQ 1 set /p lien1=lien du webhook 1 :  
if %webhooknb% GEQ 2 set /p lien2=lien du webhook 2 : 
if %webhooknb% GEQ 3 set /p lien3=lien du webhook 3 : 
if %webhooknb% GEQ 4 set /p lien4=lien du webhook 4 : 
if %webhooknb% GEQ 5 set /p lien5=lien du webhook 5 :  
if %webhooknb% GEQ 6 set /p lien6=lien du webhook 6 : 
if %webhooknb% GEQ 7 set /p lien7=lien du webhook 7 : 
if %webhooknb% GEQ 8 set /p lien8=lien du webhook 8 : 
if %webhooknb% GEQ 9 set /p lien9=lien du webhook 9 : 
if %webhooknb% GEQ 10 set /p lien10=lien du webhook 10 : 

:send
if %webhooknb% GEQ 1 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien1% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 1 envoyé
if %webhooknb% GEQ 2 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien2% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 2 envoyé
if %webhooknb% GEQ 3 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien3% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 3 envoyé
if %webhooknb% GEQ 4 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien4% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 4 envoyé
if %webhooknb% GEQ 5 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien5% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 5 envoyé
if %webhooknb% GEQ 6 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien6% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 6 envoyé
if %webhooknb% GEQ 7 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien7% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 7 envoyé
if %webhooknb% GEQ 8 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien8% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 8 envoyé
if %webhooknb% GEQ 9 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien9% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 9 envoyé
if %webhooknb% GEQ 10 curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien10% >nul & echo [%time:~0,2%h%time:~3,2%] Webhook 10 envoyé
if %M%==2 timeout 1 >nul & goto :mode

set /a messages=messages+1
set /a messages_send=webhooknb
if %messages% GEQ 2 set /a messages_send=messages * webhooknb
if %messages% == 30 goto :wait
echo messages envoyés : %messages_send%
goto :send 

:wait
cls
echo Le webhook est temporairement bannis pour 50 secondes
echo Attendez svp....
timeout 50 /nobreak
set /a messages=0
goto :send

:delete
set /p lien=lien a supprmier : 
curl -X DELETE %lien% <nul
echo Le webhook à bien été supprimé.
timeout 1 >nul
goto :mode
