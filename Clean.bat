@echo off
title Detailed System Cleanup
echo Starting cleanup... Errors will be displayed for files currently in use.
echo ---------------------------------------

:: Empty Recycle Bin
echo.
echo [1/5] Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin

:: Clear User Temp Files
echo.
echo [2/5] Cleaning User Temp files...
del /s /f /q "%temp%\*.*"
for /d %%x in ("%temp%\*") do rd /s /q "%%x"

:: Clear System Temp Files
echo.
echo [3/5] Cleaning System Temp files...
del /s /f /q "%systemroot%\Temp\*.*"
for /d %%x in ("%systemroot%\Temp\*") do rd /s /q "%%x"

:: Clear Windows Update Cache
echo.
echo [4/5] Cleaning Windows Update Download Cache...
del /s /f /q "%systemroot%\SoftwareDistribution\Download\*.*"
for /d %%x in ("%systemroot%\SoftwareDistribution\Download\*") do rd /s /q "%%x"

:: Clear Prefetch (Useless startup cache)
echo.
echo [5/5] Cleaning Prefetch...
del /s /f /q "%systemroot%\Prefetch\*.*"

echo ---------------------------------------
echo Cleanup Process Finished. Review any "Access Denied" messages above.
pause
