@echo off
setlocal enabledelayedexpansion

:: ���ߣ�Haujet Zhao
:: ���ڣ�2021 �� 2 �� 10 ��
:: ���д˽ű���Ҫ��ȷ����װ�У�adb

REM ·������ǵò�Ҫ��б��
set Ŀ��·��=/sdcard/_���Դ���

echo Ŀ��·����%Ŀ��·��%
echo=

set ������=False
for /F "tokens=* skip=1" %%i in ('adb devices') do set ������=True

set n=10
set str=abcdefghijklmnopqrstuvwxyz0123456789
for /l %%a in (1,1,%n%) do call :slz "%%a"

if  %������%==True (
	for %%i in (%*) do (
		set ԭ������=%%~nxi
		set ����·��=%Ŀ��·��%/!ԭ������!
		
		set ����ļ���·��=%Ŀ��·��%/!random_str!
		adb push %%i "!����ļ���·��!"
		adb shell "mv ""!����ļ���·��!"" ""!����·��!"""
	)
) else (
	echo ������
)

echo=

rem ============�����Ǻ�����==============================
goto end

:slz
if "%~1"=="" goto:eof
set /a r=%random% %% 36
set random_str=%random_str%!str:~%r%,1!
EXIT /B 0

:end
pause