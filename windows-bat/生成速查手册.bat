@echo off & setlocal EnableDelayedExpansion
echo.========================================

REM ��Դ��https://www.jb51.net/article/25960.htm

echo ��ʼ������CMD�����ٲ��ֲᡷ�����Ժ򡭡�
echo ������ҳ�ļ�ͷ����
>CMDHelp.htm echo ^<head^>
>>CMDHelp.htm echo ^<title^>CMD�����ٲ��ֲ�^</title^>
>>CMDHelp.htm echo ^<meta http-equiv="Content-Type" content="text/html^; charset=gb2312" ^/^>
>>CMDHelp.htm echo ^</head^>
>>CMDHelp.htm echo ^<A NAME="Top"^>
>>CMDHelp.htm echo ^<center^>^<h1^>CMD �����ٲ��ֲ�^</h1^>%username% - %date%^</center^>^<br^>
>>CMDHelp.htm echo ^<table^>

echo ��������Ŀ¼����
for /f "delims=:" %%f in ('help^|findstr /n "^ASSOC"') do set head=%%f
set /a head-=1
if "%head%"=="0" (set head=) else set head=skip=%head%
for /f "%head% delims=" %%i in ('help') do (
set str=%%i & set name=!str:~0,9! & set desc=!str:~9!
echo.!name! | findstr /v "^[A-Z]" >nul && echo !desc! >>CMDHelp.htm
if errorlevel 1 echo ^</td^>^</tr^>^<tr^>^<td^>^<a href="#!name!"^>!name!^</a^>^</td^>^<td^>^ ^ ^ !desc!>>CMDHelp.htm
)
>>CMDHelp.htm echo ^</td^>^</tr^>^</table^>^<br^>^<a href="#top"^>����ҳ��^</a^>^<br^>

echo �����������ġ���
cscript //h:cscript //b
for /f %%i in ('help^|findstr "^[A-Z]"') do (
>>CMDHelp.htm echo ^<a name="%%i"^>^<h2^>%%i^</h2^>^<pre^>
echo ���ڴ��� %%i �İ��������С���
if /I "%%i"=="SC" echo �밴Y����������
help %%i | findstr "<.*>" >nul
if not errorlevel 1 (
for /f "delims=" %%a in ('help %%i') do (
set st=%%a & set st=!st:^<=^&lt;! & set st=!st:^>=^&gt;!
echo !st!>> CMDHelp.htm
)
) else help %%i>>CMDHelp.htm
>>CMDHelp.htm echo ^</pre^>^<a href="#top"^>����ҳ��^</a^>^<br^>^<br^>
)


echo ��CMD�����ٲ��ֲᡷ������ϣ��������
echo.========================================
pause>nul && start CMDHelp.htm