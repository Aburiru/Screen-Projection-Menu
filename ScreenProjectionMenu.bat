@echo off
setlocal EnableExtensions EnableDelayedExpansion
cls
color A

:: Configuration
set "SCRCPY_DIR=C:\Users\abril\Documents\SCRCPY\scrcpy-win64-v3.3.3"
set "SCRCPY_EXE=%SCRCPY_DIR%\scrcpy.exe"

goto ready

:ready
cls
Title Projection Control Menu by Abril
goto menu

:menu
cls
chcp 65001 >nul
type "%~dp0art.txt"
echo.
echo   ---------------------------------------------------------------------------------
echo                               Developed by: Abril
echo   ---------------------------------------------------------------------------------
echo.
echo   [1] Activate Screen Mirroring
echo   [2] Activate OTG Mode
echo   [3] Activate New Window (App Specific)
echo   [4] Exit
echo.
set /p "menu=  ~ Master, please enter your choice ~ : "
if "%menu%" == "1" goto sm
if "%menu%" == "2" goto otg
if "%menu%" == "3" goto nw
if "%menu%" == "4" exit
if "%menu%" == "" goto menu
echo.
echo   [!] Invalid input. Returning to menu...
timeout /t 2 >nul
goto menu

:sm
cls
echo.
echo   [ SCREEN MIRRORING MODE ]
echo.
echo   Are you sure you want to enter this mode, Master?
echo   [1] Yes
echo   [0] No
echo.
set /p "sm=  Choice: "
if "%sm%" == "1" goto sm1
if "%sm%" == "0" goto menu
if "%sm%" == "" goto sm
echo.
echo   [!] Invalid input.
timeout /t 2 >nul
goto sm

:sm1
cls
if not exist "%SCRCPY_EXE%" (
    echo [!] ERROR: scrcpy.exe not found at %SCRCPY_EXE%
    pause
    goto menu
)
"%SCRCPY_EXE%" -f --video-codec=h264 --max-size=1920 --video-bit-rate=19M --video-buffer=0 -M
echo.
echo   Operation finished. Returning to menu...
timeout /t 2 >nul
goto menu

:otg
cls
echo.
echo   [ OTG MODE ]
echo.
echo   Are you sure you want to enter this mode, Master?
echo   [1] Yes
echo   [0] No
echo.
set /p "otg=  Choice: "
if "%otg%" == "1" goto otg1
if "%otg%" == "0" goto menu
if "%otg%" == "" goto otg
echo.
echo   [!] Invalid input.
timeout /t 2 >nul
goto otg

:otg1
cls
if not exist "%SCRCPY_EXE%" (
    echo [!] ERROR: scrcpy.exe not found at %SCRCPY_EXE%
    pause
    goto menu
)
"%SCRCPY_EXE%" --otg
echo.
echo   Operation finished. Returning to menu...
timeout /t 2 >nul
goto menu

:nw
cls
echo.
echo   [ NEW WINDOW MODE ]
echo.
echo   Are you sure you want to enter this mode, Master?
echo   [1] Yes
echo   [0] No
echo.
set /p "nw=  Choice: "
if "%nw%" == "1" goto nwpick
if "%nw%" == "0" goto menu
if "%nw%" == "" goto nw
echo.
echo   [!] Invalid input.
timeout /t 2 >nul
goto nw

:nwpick
cls
if not exist "%SCRCPY_EXE%" (
    echo [!] ERROR: scrcpy.exe not found at %SCRCPY_EXE%
    pause
    goto menu
)
echo.
echo   Scanning available applications on your device...
echo.
"%SCRCPY_EXE%" --list-apps
echo.
echo   [0] Return to Menu
echo.
set /p "nwpick=  Enter package name to open: "
if "%nwpick%" == "0" goto menu
goto nwopen

:nwopen
cls
if "%nwpick%" == "" (
    echo.
    echo   [!] Master, please enter a valid package name.
    timeout /t 2 >nul
    goto nwpick
)
"%SCRCPY_EXE%" -Sw -K --video-bit-rate=16M --new-display=1920x1080/210 --start-app="%nwpick%" 
echo.
echo   Operation finished. Returning to menu...
timeout /t 2 >nul
goto nwpick