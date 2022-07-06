@echo off & "%__APPDIR__%chcp.com" 65001 >nul
:mode
cls
title webhook tool by steever38#2032
set /a messages=0
set /a messages_send=0
::::   _____        _              _                           _       
::::  / ____|      | |            | |                         | |      
:::: | (___    ___ | |  ___   ___ | |_   _ __ ___    ___    __| |  ___ 
::::  \___ \  / _ \| | / _ \ / __|| __| | '_ ` _ \  / _ \  / _` | / _ \
::::  ____) ||  __/| ||  __/| (__ | |_  | | | | | || (_) || (_| ||  __/
:::: |_____/  \___||_| \___| \___| \__| |_| |_| |_| \___/  \__,_| \___|v1.3
::::                                                                   
for /f "delims=: tokens=*" %%B in ('findstr /b :::: "%~f0"') do @echo(%%B
echo github : github.com/steever38

echo.
echo [1] webhook spammer - [2] webhook message - [3] delete webhook
set /p M=number : 
echo.
set /p lien=Lien du webhook : 
if %M%==3 goto :delete
set /p name=Nom du webhook : 
set /p avatar=Photo de profil du webhook : 

:settings
cls
set /p message=Message a envoyer : 
set /p tts=Tts : true/false : 

:send
curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%message%\", \"tts\":\"%tts%\", \"avatar_url\":\"%avatar%\"}" %lien% >nul
if %M%==2 timeout 1 >nul & goto :mode

set /a messages=messages+1
set /a messages_send=messages_send+1
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
curl -X DELETE %lien% <nul
echo Le webhook à bien été supprimé.
timeout 1 >nul
goto :mode