@echo off
cls
goto ready

:ready
cls
Title Projection Control Menu by Abril
goto menu

:menu
cls
echo ====================================
echo  Projection Control Menu
echo ====================================
echo  Hello Master, What mode are you gonna pick today?
echo  1. Activate Screen Mirroring
echo  2. Activate OTG Mode
echo  3. Activate New Window
echo  4. Exit
set /p "menu=~ Enter Number Mode ~: "
if "%menu%" == "1" goto sm
if "%menu%" == "2" goto otg
if "%menu%" == "3" goto nw
if "%menu%" == "4" exit
if "%menu%" == "" goto menu
echo Invalid input. Please try again.
pause >nul
goto menu

:sm
echo You'll enter (Screen Mirroring Mode). Are you sure Master?:
echo 1 for Yes
echo 0 for No
set /p "sm=Your choice: "
if "%sm%" == "1" goto sm1
if "%sm%" == "0" goto menu
cls
if "%sm%" == "" goto sm
echo Invalid input. Please try again.
pause >nul
goto sm

:sm1
cls
C:\Users\abril\Documents\SCRCPY\scrcpy-win64-v3.3.3\scrcpy.exe -f --video-codec=h264 --max-size=1920 --video-bit-rate=19M --video-buffer=0 -M
echo Press any key to return to menu...
pause >nul
goto menu

:otg
echo You'll enter (OTG Mode). Are you sure Master?:
echo 1 for Yes
echo 0 for No
set /p "otg=Your choice: "
if "%otg%" == "1" goto otg1
if "%otg%" == "0" goto menu
cls
if "%otg%" == "" goto otg
echo Invalid input. Please try again.
pause >nul
goto otg

:otg1
cls
C:\Users\abril\Documents\SCRCPY\scrcpy-win64-v3.3.3\scrcpy.exe --otg
echo Press any key to return to menu...
pause >nul
goto menu

:nw
echo You'll enter (New Window Mode). Are you sure Master?:
echo 1 for Yes
echo 0 for No
set /p "nw=Your choice: "
if "%nw%" == "1" goto nwpick
if "%nw%" == "0" goto menu
cls
if "%nw%" == "" goto nw
echo Invalid input. Please try again.
pause >nul
goto nwpick

:nwpick
cls
echo Here are lists of available Applications on your device:
C:\Users\abril\Documents\SCRCPY\scrcpy-win64-v3.3.3\scrcpy.exe --list-apps
set /p "nwpick=Paste package to open: "
echo  Type 0 to return to menu
goto nwopen

:nwopen
cls
if "%nwpick%" == "" (
    echo Master, Please enter a valid package name.
    echo Press any key to return...
    pause >nul
    goto nwpick
)
if "%nwpick%" == "0" (
    cls
    goto menu
)
C:\Users\abril\Documents\SCRCPY\scrcpy-win64-v3.3.3\scrcpy.exe -Sw -K --video-bit-rate=16M --new-display=1920x1080/210 --start-app="%nwpick%" 
echo  Press any key to return...
pause >nul
goto nwpick