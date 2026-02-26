@echo off
title C Drive Deep Cleaner
color 0B
mode con: cols=70 lines=30

:: ===== ADMIN CHECK =====
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo   [ ERROR ] Run this file as Administrator.
    echo.
    pause
    exit
)

cls
echo.
echo  ##############################################################
echo  #                                                            #
echo  #                    C DRIVE CLEANER                         #
echo  #                                                            #
echo  ##############################################################
echo.


echo  [1/6] Cleaning USER Temp...
del /q /f /s "%TEMP%\*" >nul 2>&1

echo  [2/6] Cleaning WINDOWS Temp...
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1

echo  [3/6] Cleaning Prefetch...
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1

echo  [4/6] Emptying Recycle Bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1

echo  [5/6] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /q /f /s "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

echo  [6/6] Cleaning Component Store...
Dism.exe /online /Cleanup-Image /StartComponentCleanup >nul 2>&1

echo.

echo  ##############################################################
echo  #                 CLEANUP COMPLETE                           #
echo  ##############################################################

powershell -c "[console]::beep(1000,300);Start-Sleep -m 200;[console]::beep(1200,300)"


echo.
pause