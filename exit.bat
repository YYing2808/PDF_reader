::����PDFelement�˳�����ʱ���ã�����رպ���̲��������⡣
echo off

setlocal
set currentDir=%~dp0
set pePid=%~1

echo currDir= %currentDir%
echo pePid= %pePid%

::�ӳ�2���������ָ����pid
choice /c yn /t 2 /d y 
taskkill /pid %pePid%
endlocal 