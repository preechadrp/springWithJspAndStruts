@echo off
setlocal enabledelayedexpansion

REM cd ไปยัง directory ของ script
cd /d "%~dp0"

set INI_FILE=runapp.ini

REM check file exists
if not exist "%INI_FILE%" (
    echo ERROR: %INI_FILE% not found
    exit /b 1
)

set "APP_FILE="

REM อ่านไฟล์ทีละบรรทัด (ข้าม comment และบรรทัดว่าง)
for /f "usebackq tokens=* delims=" %%a in ("%INI_FILE%") do (
    set "line=%%a"

    REM trim space
    for /f "tokens=* delims=" %%b in ("!line!") do set "line=%%b"

    REM ข้ามบรรทัดว่าง
    if not "!line!"=="" (
        REM ข้าม comment (#)
        if not "!line:~0,1!"=="#" (
            set "APP_FILE=!line!"
            goto :found
        )
    )
)

:found

REM check empty
if "%APP_FILE%"=="" (
    echo ERROR: No app name in %INI_FILE%
    exit /b 1
)

REM check นามสกุล
echo %APP_FILE% | findstr /i "\.war$" >nul
if errorlevel 1 (
    echo ERROR: %APP_FILE% is not a .war file
    exit /b 1
)

REM check file exists
if not exist "%APP_FILE%" (
    echo ERROR: %APP_FILE% not found
    exit /b 1
)

echo Running %CD%\%APP_FILE% ...

java -jar "%APP_FILE%"
