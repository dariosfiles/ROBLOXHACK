@echo off
title Silba Boom Deleter V3
set /p path="Enter the full path of the file or folder to delete: "

:: Check if the path exists
if not exist "%path%" (
    echo Path does not exist.
    pause
    exit /b
)

:: Check if it's a file
if exist "%path%" (
    del /f /q "%path%" && echo File deleted: %path% && exit /b
)

:: Check if it's a directory
if exist "%path%\*" (
    rmdir /s /q "%path%" && echo Folder deleted: %path% && exit /b
)

echo Error: Could not delete the specified path.
pause
