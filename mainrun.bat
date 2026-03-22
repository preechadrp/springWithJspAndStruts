@echo off
setlocal enabledelayedexpansion

set INI_FILE=runapp.ini

REM check file exists
if not exist "%INI_FILE%" (
    echo ERROR: %INI_FILE% not found
    exit /b 1
)

REM read first line
set /p APP_FILE=<%INI_FILE%

REM trim space (แบบง่าย)
for /f "tokens=* delims=" %%a in ("%APP_FILE%") do set APP_FILE=%%a

REM check empty
if "%APP_FILE%"=="" (
    echo ERROR: No app name in %INI_FILE%
    exit /b 1
)

REM check file exists
if not exist "%APP_FILE%" (
    echo ERROR: %APP_FILE% not found
    exit /b 1
)

echo Running %APP_FILE% ...

java -jar "%APP_FILE%"
