@echo off
setlocal enabledelayedexpansion
title ����Ҽ�����cmd�򿪵�ǰĿ¼��
color E0


cls::����
call :admintest::����Ƿ��ǹ���Ա�������
call :vercheck::��鵱ǰϵͳ�Ƿ���Win7��Win8


:menu
set Line===================================================
echo %Line%
echo 	��ʾ��������ͬʱ֧��XP��Win7��Win8ϵͳ
echo.
echo		[A]	����Ҽ�����cmd�򿪵�ǰĿ¼��
echo		[B]	ȥ���Ҽ�����cmd�򿪵�ǰĿ¼��
echo		[C]	����
echo.
echo		[X]	�˳�
echo %Line%


choice /c ABCX /M ��ѡ��
if %errorlevel%==1 call :add
if %errorlevel%==2 call :remove
if %errorlevel%==3 call :about
if %errorlevel%==4 exit
goto :menu


:add
REG ADD "HKCR\*\shell\��cmd�򿪵�ǰĿ¼\command" /ve /t REG_EXPAND_SZ /d %ComSpec%
REG ADD "HKCR\Directory\shell\��cmd�򿪵�ǰĿ¼\command" /ve /t REG_EXPAND_SZ /d "%ComSpec% /k cd %1"
REG ADD "HKCR\Drive\shell\��cmd�򿪵�ǰĿ¼\command" /ve /t REG_EXPAND_SZ /d "%ComSpec% /k cd %1"
echo ��ӳɹ���
goto :EOF


:remove
echo Y|REG DELETE "HKCR\*\shell\��cmd�򿪵�ǰĿ¼"
echo Y|REG DELETE "HKCR\Directory\shell\��cmd�򿪵�ǰĿ¼"
echo Y|REG DELETE "HKCR\Drive\shell\��cmd�򿪵�ǰĿ¼"
echo ɾ���ɹ���
goto :EOF



:admintest::�����Ƿ����Թ���Ա�������
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo ���Ҽ����ļ���ѡ���Թ���Ա������С���&echo.&echo �����԰�������˳�����&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF


:vercheck::ϵͳ�汾���
ver | find "5.1" >nul 2>nul && (echo ���ĵ�ǰϵͳ��WinXP������Ҫ��&echo.&goto :EOF)
ver | find "6.1" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win7������Ҫ��&echo.&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win8������Ҫ��&echo.&goto :EOF)
ver | find "6.3" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win8.1������Ҫ��&echo.&goto :EOF)
echo.&echo ��Ǹ����������ֻ����XP��Win7��Win8ϵͳ��ʹ�ã�
echo.&echo �밴������˳��ɡ���
pause>nul
exit

goto :EOF

