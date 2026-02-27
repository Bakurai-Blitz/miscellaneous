@echo off
title Light Cleaner
color 0A

:: Admin Check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ ERROR ] Please Right-Click and 'Run as Administrator'
    pause
    exit
)

echo Starting Light Cleanup...
echo ---------------------------------------

:: 1. Empty Recycle Bin
echo [1/3] Emptying Recycle Bin...
powershell.exe -NoProfile -Command "Clear-RecycleBin -Confirm:$false -ErrorAction SilentlyContinue"

:: 2. Clean User Temp
echo [2/3] Cleaning User Temp...
del /f /s /q "%temp%\*.*"

:: 3. Clean Windows System Temp
echo [3/3] Cleaning System Temp...
del /f /s /q "C:\Windows\Temp\*.*"

echo ---------------------------------------
echo Cleanup Finished!
pause
