@echo off
:begin

echo ------------Verifying Files------------------
if not exist ".\Brightness.exe" (
    dir
    echo Brightness.exe is Missing, Please Download Again.
    goto end
)
if not exist ".\ModifyQuickAction.reg" (
    echo ModifyQuickAction.reg is Missing, Please Download Again.
    goto end
)

echo.  
echo Files Verified Successfully!!!
echo.  

echo -------------Copying Files--------------------
if exist "%APPDATA%\BrightnessControls\" (
    if not exist "%APPDATA%\BrightnessControls\Brightness.exe" (
        copy ".\Brightness.exe" "%APPDATA%\BrightnessControls"
    )
) else (
    mkdir "%APPDATA%\BrightnessControls"
    copy ".\Brightness.exe" "%APPDATA%\BrightnessControls"
)

echo.
echo Files Copied Successfully!!!
echo.

echo ------------Adding Registry-------------------

reg import ".\ModifyQuickAction.reg"
reg add "HKEY_CLASSES_ROOT\brightness\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "\"%^APPDATA%\BrightnessControls\Brightness.exe""

echo.
echo Registry Added Successfully!!!
echo.

echo Done.
pause
exit

:end
echo Failed to Install.
pause
exit
