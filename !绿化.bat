@ECHO OFF & CD /D %~DP0 & TITLE �̻�
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

taskkill /f /im PDFelement*  >NUL 2>NUL

rd/s/q "%ProgramData%\PDFelement 7" 2>NUL
rd/s/q "%AppData%\Wondershare\PDFelement 7" 2>NUL
reg delete "HKLM\SOFTWARE\PDF Expert" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wondershare PDFelement 7" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Wondershare PDF Expert" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Wow6432Node\Wondershare PDFelement 7" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "Wondershare Helper Compact.exe" >NUL 2>NUL
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" /f /v "Wondershare Helper Compact.exe" >NUL 2>NUL

if "%PROCESSOR_ARCHITECTURE%"=="x86"  reg add "HKLM\Software\PEPrinter\Wondershare PDFelement Monitor" /f /v InstallName /d "%~dp0PDFelement.exe" >NUL 2>NUL
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"  reg add "HKLM\Software\Wow6432Node\PEPrinter\Wondershare PDFelement Monitor" /f /v InstallName /d "%~dp0PDFelement.exe" >NUL 2>NUL

::�����ڰ�ΪPDF Expert��
if "%PROCESSOR_ARCHITECTURE%"=="x86"  reg add "HKLM\Software\Wondershare\Wondershare PDFelement 7" /f /v InstallPath /d "%~dp0" >NUL 2>NUL
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"  reg add "HKLM\Software\Wow6432Node\Wondershare\Wondershare PDFelement 7" /f /v InstallPath /d "%~dp0" >NUL 2>NUL

if "%PROCESSOR_ARCHITECTURE%"=="x86"  reg add "HKLM\Software\Wondershare\Wondershare PDFelement 7" /f /v appsetuppath /d "%~dp0" >NUL 2>NUL
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"  reg add "HKLM\Software\Wow6432Node\Wondershare\Wondershare PDFelement 7" /f /v appsetuppath /d "%~dp0" >NUL 2>NUL

::OCR�����װ�����ı�Ҫ��ֵ; �����ڰ�ΪWondershare PDF Expert��RegAppVersion��appsetuppat��
if "%PROCESSOR_ARCHITECTURE%"=="x86"  reg add "HKLM\Software\Wondershare\Wondershare PDFelement 7" /f /v Version /d "%~dp0" >NUL 2>NUL
if "%PROCESSOR_ARCHITECTURE%"=="x86"  reg add "HKLM\Software\Wondershare\Wondershare PDFelement 7" /f /v InstallPath /d "7.4.0.4670" >NUL 2>NUL
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"  reg add "HKLM\Software\Wow6432Node\Wondershare\Wondershare PDFelement 7" /f /v InstallPath /d "%~dp0" >NUL 2>NUL
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"  reg add "HKLM\Software\Wow6432Node\Wondershare\Wondershare PDFelement 7" /f /v Version /d "7.4.0.4670" >NUL 2>NUL

::�ͻ���ʶ,����Ҫ�и�ID����,û������ĳЩϵͳ����������;
::start /wait /B "" "%~dp0Wondershare Helper Compact.exe" /VERYSILENT
::ping -n 5 127.0.0.1 >NUL 2>NUL
if "%PROCESSOR_ARCHITECTURE%"=="x86"  reg add "HKLM\Software\Wondershare\Wondershare Helper Compact" /f /v ClientSign /d "{F13D1728-7416-4EF7-B14D-9C0373C763BC}" >NUL
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"  reg add "HKLM\Software\Wow6432Node\Wondershare\Wondershare Helper Compact" /f /v ClientSign /d "{F13D1728-7416-4EF7-B14D-9C0373C763BC}" >NUL

mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\����PDFר��.lnk""):b.TargetPath=""%~dp0PDFelement.exe"":b.WorkingDirectory=""%~dp0"":b.Save:close")

:Menu
Echo.&Echo   �̻���ɣ����¿�ѡ
Echo.&Echo  1������ΪPDFĬ�ϳ���
Echo.&Echo  2�����PDF�Ҽ��˵���
Echo.&Echo.
set /p a=�������ְ��س���
If Not "%a%"=="" Set a=%a:~0,1%
If "%a%"=="1" Goto Associate
If "%a%"=="2" Goto Menu
Echo.&Echo ������Ч�����������룡
PAUSE >NUL & CLS & GOTO Menu
:Menu
reg add "HKLM\Software\Classes\.fdf\OpenWithList\PDFelement.exe" /f /ve /d "" >NUL 2>NUL
reg add "HKLM\Software\Classes\SystemFileAssociations\.pdf\Shell\WondersharePDFExpert" /f /ve /d "����PDF�༭"  >NUL 2>NUL
reg add "HKLM\Software\Classes\SystemFileAssociations\.pdf\Shell\WondersharePDFExpert\Command" /f /ve /d  "\"%~dp0PDFelement.exe\" \"%%1\"" >NUL 2>NUL
reg add "HKLM\Software\Classes\WondersharePDF.Document7\DefaultIcon" /f /ve /d "\"%~dp0projectfile.ico\""  >NUL 2>NUL
reg add "HKLM\Software\Classes\WondersharePDF.Document7\shell\open\command" /f /ve /d "\"%~dp0PDFelement.exe\" \"%%1\""  >NUL 2>NUL
SET E=���!&GOTO MSGBOX
:Associate
start /wait /B "" "%~dp0FileAssociation.exe"  /InstallFileAssociate  >NUL 2>NUL
SET E=���!&GOTO MSGBOX
:MsgBox
if "%1"=="" mshta VBScript:MsgBox("%e%",vbSystemModal,"")(close)&Cls&Goto Menu