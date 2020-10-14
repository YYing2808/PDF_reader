::用于PDFelement退出进程时调用，解决关闭后进程残留的问题。
echo off

setlocal
set currentDir=%~dp0
set pePid=%~1

echo currDir= %currentDir%
echo pePid= %pePid%

::延迟2秒结束参数指定的pid
choice /c yn /t 2 /d y 
taskkill /pid %pePid%
endlocal 