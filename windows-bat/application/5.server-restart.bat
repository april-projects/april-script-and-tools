@echo off
setlocal enabledelayedexpansion
REM 以管理员身份运行
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
REM 读取用户输入的服务名称
set /p "service_name=请输入要重启的服务名称: "

REM 重启服务的命令，根据实际情况修改
echo 重启 !service_name! 服务
net stop "!service_name!"
net start "!service_name!"

echo 服务重启完成

pause
exit /b 0
