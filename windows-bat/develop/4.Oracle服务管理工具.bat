@echo off
setlocal enabledelayedexpansion
title Oracle��������ߡ�(by���԰�)
color E0


cls::����
call :admintest::����Ƿ��ǹ���Ա�������
call :vercheck::��鵱ǰϵͳ�Ƿ���Win7��Win8


:menu
set Line===================================================
echo %Line%
echo 	��ʾ��������ͬʱ֧��XP��Win7��Win8ϵͳ
echo.
echo		[A]	����Oracle
echo		[B]	ֹͣOracle
echo		[C]	����
echo.
echo		[X]	�˳�
echo %Line%


choice /c ABCX /M ��ѡ��
if %errorlevel%==1 call :start
if %errorlevel%==2 call :stop
if %errorlevel%==3 call :about
if %errorlevel%==4 exit
goto :menu

:start
net start OracleXETNSListener 2>nul
net start OracleServiceXE 2>nul
@oradim -startup -sid XE -starttype inst > nul 2>&1
goto :EOF

:stop
net stop OracleServiceXE
goto :EOF


:admintest::�����Ƿ����Թ���Ա�������
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo ���Ҽ����ļ���ѡ���Թ���Ա������С���&echo.&echo �����԰�������˳�����&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF


:vercheck::ϵͳ�汾���
ver | find "5.1" >nul 2>nul && (echo ���ĵ�ǰϵͳ��WinXP������Ҫ��&set value=shell32.dll,49&echo.&goto :EOF)
ver | find "6.1" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win7������Ҫ��&set value=imageres.dll,196&echo.&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win8������Ҫ��&set value=imageres.dll,197&echo.&goto :EOF)
echo.&echo ��Ǹ����������ֻ����XP��Win7��Win8ϵͳ��ʹ�ã�
echo.&echo �밴������˳��ɡ���
pause>nul
exit


:about::����
echo.
echo ��Oracle��������ߡ�
echo ���ߣ����԰�
echo ΢����http://weibo.com/liuxianan
echo QQ��937925941
echo ���ڣ�2013��3��23��
echo.
goto :EOF

