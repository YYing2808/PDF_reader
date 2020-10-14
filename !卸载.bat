@ECHO OFF & CD /D %~DP0 & TITLE
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

taskkill /f /im WSHelper* >NUL 2>NUL
taskkill /f /im PDFelement* >NUL 2>NUL
start /wait /B "" "%~dp0FileAssociation.exe" /UnInstallFileUnAssociate >NUL 2>NUL
rd/s/q "%ProgramData%\PDFelement 7" 2>NUL
rd/s/q "%AppData%\Wondershare\PDFelement 7" 2>NUL
rd/s/q "%AppData%\Wondershare\PDFelement 6 Pro" 2>NUL
rd/s/q "%AllUsersProfile%\Application Data\Wondershare"2>NUL
rd/s/q "%LOCALAPPDATA%\Wondershare"2>NUL
rd/s/q "%LOCALAPPDATA%\PDFelement 7"2>NUL
rd/s/q "%USERPROFILE%\Local Settings\Wondershare"2>NUL
del /q "%userprofile%\Desktop\万兴PDF专家.lnk" >NUL  2>NUL 
del /q "%userprofile%\桌面\万兴PDF专家.lnk" >NUL  2>NUL 
reg delete "HKLM\Software\Wondershare\Wondershare PDF Expert" /f   >NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Wondershare\Wondershare PDF Expert" /f  >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Wondershare\Wondershare PDFelement 6 pro" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wondershare\Wondershare PDFelement 6 pro" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Wondershare PDF Expert" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Wondershare PDFelement 7" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Wondershare" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Wondershare PDFelement 7" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.fdf"  /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\WondersharePDF.Document7\DefaultIcon" /f   >NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.pdf\Shell\WondersharePDFExpert" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.pdf\Shell\WondersharePDFExpertPrint" /f >NUL 2>NUL
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice /v ProgId /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "Wondershare Helper Compact.exe" >NUL 2>NUL
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" /f /v "Wondershare Helper Compact.exe" >NUL 2>NUL
for /f "skip=2 tokens=3 delims= " %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v personal') do (
       for /f "delims=*" %%j in ('echo %%i') do rd/s/q "%%j\Wondershare" 2>NUL)

ECHO. &ECHO 卸载完成！&PAUSE >NUL 2>NUL & EXIT