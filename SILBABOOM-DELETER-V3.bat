@echo off
echo WARNING: You are about to permanently delete system files!
echo This action CANNOT be undone.
pause

set /p path="Enter the full path of the file or folder to delete: "

:: Run as SYSTEM using PsExec (Requires Sysinternals)
echo Running as SYSTEM...
psexec -s -i cmd /c "takeown /f \"%path%\" /r /d y"
psexec -s -i cmd /c "icacls \"%path%\" /grant Everyone:F /t /c /q"

:: Remove file/folder attributes
attrib -r -s -h "%path%" /s /d

:: Force delete file
del /f /q "%path%" >nul 2>&1
rmdir /s /q "%path%" >nul 2>&1

:: Check if deletion was successful
if exist "%path%" (
    echo ERROR: Unable to delete "%path%". Try booting from a Live OS.
) else (
    echo SUCCESS: "%path%" has been deleted.
)

pause
exit
