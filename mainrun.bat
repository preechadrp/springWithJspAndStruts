@echo off
setlocal

REM cd ไป folder ของ script
cd /d "%~dp0"

set INI_FILE=runapp.ini

if not exist "%INI_FILE%" (
    echo ERROR: %INI_FILE% not found
    exit /b 1
)

set /p APP_FILE=<%INI_FILE%

for /f "tokens=* delims=" %%a in ("%APP_FILE%") do set APP_FILE=%%a

if "%APP_FILE%"=="" (
    echo ERROR: No app name in %INI_FILE%
    exit /b 1
)

if not exist "%APP_FILE%" (
    echo ERROR: %APP_FILE% not found
    exit /b 1
)

echo Running %APP_FILE% ...

java -jar "%APP_FILE%"