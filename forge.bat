@echo off
setlocal enabledelayedexpansion

set "ROOT=%~dp0"
if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

set "PROJECT_DIR=%ROOT%\project"
set "SFTOOL=%ROOT%\platform\SF32LB52x\tools\sftool.exe"
set "CHIP=SF32LB52"

:: Collect available projects (directories under project/ that contain CMakeLists.txt)
set "COUNT=0"
for /d %%D in ("%PROJECT_DIR%\*") do (
    if exist "%%D\CMakeLists.txt" (
        set /a COUNT+=1
        set "PROJ_!COUNT!=%%~nxD"
    )
)

if %COUNT%==0 (
    echo [forge] No projects found under %PROJECT_DIR%
    exit /b 1
)

:: No argument — list all projects
if "%~1"=="" (
    echo [forge] Available projects:
    echo.
    for /l %%i in (1,1,%COUNT%) do (
        echo   !PROJ_%%i!
    )
    echo.
    echo Usage: forge ^<project_name^>
    exit /b 0
)

set "TARGET=%~1"

:: Exact match
set "MATCHED="
for /l %%i in (1,1,%COUNT%) do (
    if /i "!PROJ_%%i!"=="%TARGET%" (
        set "MATCHED=!PROJ_%%i!"
    )
)

:: Substring match if no exact match
if not defined MATCHED (
    set "CANDIDATES="
    set "CANDIDATE_COUNT=0"
    for /l %%i in (1,1,%COUNT%) do (
        echo !PROJ_%%i! | findstr /i /c:"%TARGET%" >nul 2>&1
        if !errorlevel!==0 (
            set /a CANDIDATE_COUNT+=1
            set "CANDIDATES=!CANDIDATES! !PROJ_%%i!"
            set "LAST_CANDIDATE=!PROJ_%%i!"
        )
    )

    if !CANDIDATE_COUNT!==0 (
        echo [forge] No project matching "%TARGET%". Available projects:
        echo.
        for /l %%i in (1,1,%COUNT%) do (
            echo   !PROJ_%%i!
        )
        exit /b 1
    )

    if !CANDIDATE_COUNT!==1 (
        set "MATCHED=!LAST_CANDIDATE!"
        echo [forge] Matched: !MATCHED!
    ) else (
        echo [forge] Ambiguous "%TARGET%". Did you mean:
        echo.
        for %%C in (!CANDIDATES!) do echo   %%C
        exit /b 1
    )
)

set "PROJECT_NAME=%MATCHED%"
set "PROJECT_SRC=%PROJECT_DIR%\%PROJECT_NAME%"
set "BUILD_DIR=%PROJECT_SRC%\build"

echo [forge] Building: %PROJECT_NAME%
echo [forge] Source:    %PROJECT_SRC%
echo [forge] Build dir: %BUILD_DIR%
echo.

:: CMake configure + build via project's own preset
cmake --preset default -S "%PROJECT_SRC%"
if errorlevel 1 (
    echo.
    echo [forge] CMake configure failed.
    exit /b 1
)

cmake --build "%BUILD_DIR%"
if errorlevel 1 (
    echo.
    echo [forge] Build failed.
    exit /b 1
)

:: Firmware is output to project/build/
set "ELF_PATH=%BUILD_DIR%\%PROJECT_NAME%.elf"

:: Generate flash.bat next to the firmware
(
    echo @echo off
    echo set /p PORT="Enter COM port number: "
    echo "%SFTOOL%" -c %CHIP% -p COM%%PORT%% write_flash "%%~dp0%PROJECT_NAME%.elf"
    echo if errorlevel 1 ^(
    echo     echo.
    echo     echo Flash failed.
    echo ^)
    echo pause
) > "%BUILD_DIR%\flash.bat"

echo.
echo [forge] Build complete.
echo [forge] Firmware: %ELF_PATH%
echo [forge] To flash: %BUILD_DIR%\flash.bat
