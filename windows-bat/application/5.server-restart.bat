@echo off
setlocal enabledelayedexpansion
REM �Թ���Ա�������
@echo off
cd /d "%~dp0"
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin
REM ��ȡ�û�����ķ�������
set /p "service_name=������Ҫ�����ķ�������: "

REM ����������������ʵ������޸�
echo ���� !service_name! ����
net stop "!service_name!"
net start "!service_name!"

echo �����������

pause
exit /b 0
