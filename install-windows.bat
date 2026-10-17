@echo off
setlocal enabledelayedexpansion
title Fire TV One-Click Installer & Permission Setup
echo ======================================================
echo    Fire TV Screen Resizer - Auto-Installer
echo ======================================================
echo.

:: Check for ADB
where adb >nul 2>&1
if errorlevel 1 (
    echo [ERROR] ADB was not found in your system PATH.
    echo Please ensure Android Platform Tools (adb) is installed.
    echo.
    pause
    exit /b 1
)

:: Check for APK
set "APK_FILE=FireTV-Screen-Resizer-v1.1.apk"
if not exist "%APK_FILE%" (
    if exist "%~dp0%APK_FILE%" (
        set "APK_FILE=%~dp0%APK_FILE%"
    ) else (
        echo [ERROR] Could not find %APK_FILE% in the current folder.
        echo Please ensure this script is in the same folder as the APK.
        echo.
        pause
        exit /b 1
    )
)

echo [1/3] Scanning local network for Fire TV (port 5555)...
set "FOUND_IP="

:: First, check if already connected
for /f "tokens=1" %%d in ('adb devices ^| findstr ":5555"') do (
    for /f "delims=:" %%a in ("%%d") do set "FOUND_IP=%%a"
)

if defined FOUND_IP (
    echo       Already connected to: !FOUND_IP!
    goto :INSTALL
)

:: Get default gateway / subnet prefix (e.g. 192.168.1.)
for /f "tokens=3" %%g in ('route print 0.0.0.0 ^| findstr "\<0.0.0.0\>"') do (
    set "GW=%%g"
    goto :PARSESUBNET
)

:PARSESUBNET
for /f "tokens=1,2,3 delims=." %%a in ("!GW!") do set "SUBNET=%%a.%%b.%%c"

echo       Detected local subnet: !SUBNET!.*
echo       Pinging devices and probing ADB port 5555...

:: Scan ARP table entries
for /f "tokens=1" %%i in ('arp -a ^| findstr "!SUBNET!."') do (
    powershell -NoProfile -Command "$t = New-Object Net.Sockets.TcpClient; try { $c = $t.BeginConnect('%%i', 5555, $null, $null); if ($c.AsyncWaitHandle.WaitOne(300)) { $t.EndConnect($c); Write-Output '%%i' } } catch {} finally { $t.Close() }" > "%TEMP%\firetv_ip.txt" 2>nul
    for /f %%f in (%TEMP%\firetv_ip.txt) do (
        set "FOUND_IP=%%f"
        del "%TEMP%\firetv_ip.txt" >nul 2>&1
        goto :FOUND
    )
)

:FOUND
if not defined FOUND_IP (
    echo.
    echo [!] Could not auto-detect Fire TV IP address.
    echo Make sure:
    echo   1. Your Fire TV is ON and connected to the same Wi-Fi / network.
    echo   2. 'ADB Debugging' is turned ON in Settings -^> My Fire TV -^> Developer Options.
    echo.
    set /p FOUND_IP="Please enter your Fire TV IP address manually: "
)

if not defined FOUND_IP (
    echo No IP entered. Exiting.
    pause
    exit /b 1
)

:INSTALL
echo.
echo [2/3] Connecting to Fire TV at !FOUND_IP!:5555...
adb connect !FOUND_IP!:5555

echo.
echo [3/3] Installing Screen Resizer APK and granting permissions...
adb install -r "%APK_FILE%"
adb shell pm grant com.antigravity.screenresizer android.permission.WRITE_SECURE_SETTINGS

echo.
echo ======================================================
echo    SUCCESS! Screen Resizer is installed on your Fire TV!
echo    You can now open it from your Fire TV Apps menu.
echo ======================================================
echo.
pause
