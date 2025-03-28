@echo off
title SILBA-BOOM DELETER V4
echo WARNING: Run this an administrator
echo Fixed by dariosfiles on GitHub :)
echo.
set /p path="Enter the full path of the file or folder to delete: "

:: Take ownership (required for system files)
takeown /f "%path%" /r /d y
icacls "%path%" /grant %username%:F /t /c /q

:: Force delete file or folder
if exist "%path%" (
    attrib -r -s -h "%path%" /s /d
    del /f /q "%path%" >nul 2>&1
    rmdir /s /q "%path%" >nul 2>&1
    echo Successfully deleted: %path%
) else (
    echo Path does not exist or could not be deleted.
)

pause
exit
