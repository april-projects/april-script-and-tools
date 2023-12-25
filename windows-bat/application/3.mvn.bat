@echo off
setlocal enabledelayedexpansion

REM �����û�����Ĺ���Ŀ¼
set /p "work_dir=�����빤��Ŀ¼���س�ʹ�õ�ǰĿ¼��: "
if not defined work_dir set "work_dir=%cd%"

REM �л����û�ָ���Ĺ���Ŀ¼
cd /d "%work_dir%"

:menu
cls
echo.
echo. * * * * * * * * * * mvn commands * * * * * * * * * *
echo. * * ����ʹ��mvn�������maven���� * *
echo. * 0 -Dmaven.test.skip=true Ĭ��Ϊtrue����ͨ��02��03��04��ʽ���ò���������
echo. * *
echo. * 1 mvn clean
echo. * *
echo. * 2 mvn clean install
echo. * *
echo. * 3 mvn clean compile
echo. * *
echo. * 4 mvn clean package
echo. * *
echo. * 5 mvn deploy
echo. * *
echo. * 99 exit
echo. * *
echo. * * * * * * * * * * * * * * * * * * * * * * * * * * *
echo.
echo ������ѡ������ţ�
set /p ID=

set skipTest=-Dmaven.test.skip=true

if "%ID%"=="1" goto clean

if "%ID%"=="2" goto install

if "%ID%"=="3" goto compile

if "%ID%"=="4" goto package

if "%ID%"=="5" goto deploy

if "%ID%"=="02" (set skipTest= & goto install)

if "%ID%"=="03" (set skipTest= & goto compile)

if "%ID%"=="04" (set skipTest= & goto package)

if "%ID%"=="99" goto quit
goto quit

:clean
echo. ��ʼclean
call mvn clean
echo.
echo.
pause
goto menu

:install
echo. ��ʼִ�У�mvn clean install %skipTest%
call mvn clean install %skipTest%
echo.
echo.
pause
goto menu

:compile
echo. ��ʼִ�У�mvn clean compile %skipTest%
call mvn clean compile %skipTest%
echo.
echo.
pause
goto menu

:package
echo. ��ʼִ�У�mvn clean package %skipTest%
call mvn clean package %skipTest%
echo.
echo.
pause
goto menu

:deploy
echo. ��ʼִ�У�mvn deploy %skipTest%
call mvn deploy %skipTest%
echo.
echo.
pause
goto menu

:quit
if not {%ID%}=={99} echo �����ѡ���ȷ & pause & goto menu