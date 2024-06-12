@echo off
setlocal enabledelayedexpansion

color 17
title InsiderTo11Downgrader
echo This tool will downgrade your Windows 11 Insider version to the Windows 11 Stable version.
echo Press any key to begin the process.
pause>nul

color 47
echo WARNING - THIS MAY BREAK YOUR SYSTEM. MAKE SURE TO HAVE A WINDOWS USB ON HAND AND A BACKUP OF ALL YOUR DATA. I AM NOT RESPONSIBLE FOR ANY DAMAGES CAUSED BY THIS TOOL.
echo Press any key if you understand what you're doing.
pause>nul

set /p download=Please paste in the download URL for your Windows 11 ISO. To do this, right click on the Download button on the site and copy the link: 
echo Downloading the Windows 11 ISO. Please wait patiently.
curl %download% -o %temp%\Windows.iso>nul

%temp%\Windows.iso
set /p %DRIVEPOINT%=Please check the path the downloaded Windows ISO has been mounted to (example: F:\): 

echo Copying installation files to C:\winISO. Please wait...
md C:\winISO
xcopy %DRIVEPOINT% C:\winISO\ /S /E /I /Y

echo Complete. Now patching ISO.
del C:\winISO\sources\setupcompat.dll
copy setupcompat.dll C:\winISO\sources\

echo Complete. Now starting the installer and exiting (since it's up to you on using the installer now).
echo Press any key to exit...

C:\winISO\setup.exe
exit