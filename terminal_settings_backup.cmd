@echo off
set "backupFile=C:\Users\new19\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "sourceFile=C:\Users\new19\Documents\PowerShell\settings.json"

REM Check if the backup file exists
if exist "%backupFile%" (
    echo Deleting existing backup file...
    del "%backupFile%"
)

REM Create a new hard link
mklink /H "%backupFile%" "%sourceFile%"

echo Hard link created successfully.