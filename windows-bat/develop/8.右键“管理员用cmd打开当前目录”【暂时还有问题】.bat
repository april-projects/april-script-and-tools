@echo off
setlocal enabledelayedexpansion
title ����Ҽ�������Ա��cmd�򿪵�ǰĿ¼��(by���԰�)
color 0A


cls::����
call :admintest::����Ƿ��ǹ���Ա�������
::call :vercheck::��鵱ǰϵͳ�Ƿ���Win7��Win8


:menu
set Line===================================================
echo %Line%
echo 	��ʾ��������ͬʱ֧��XP��Win7��Win8ϵͳ
echo.
echo		[A]	����Ҽ�������Ա��cmd�򿪵�ǰĿ¼��
echo		[B]	ȥ���Ҽ�������Ա��cmd�򿪵�ǰĿ¼��
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
copy /y %ComSpec% "C:\Program Files"
REG ADD "HKCR\*\shell\����Ա��cmd�򿪵�ǰĿ¼\command" /ve /t REG_EXPAND_SZ /d "C:\Program Files\cmd.exe" /f
REG ADD "HKCR\Directory\shell\����Ա��cmd�򿪵�ǰĿ¼\command" /ve /t REG_EXPAND_SZ /d "C:\Program Files\cmd.exe" /f
REG ADD "HKCR\Drive\shell\����Ա��cmd�򿪵�ǰĿ¼\command" /ve /t REG_EXPAND_SZ /d "C:\Program Files\cmd.exe" /f
echo ���ע���ɹ������������һ�������»س������Զ���λ��"C:\Program Files\cmd.exe"�ļ������ֶ��Ҽ�,����,������,��ѡ���Թ���Ա������С�,ȷ�����Ժ�ͻ������Թ���Ա��ݴ��ˣ�
pause>nul
explorer /select, "C:\Program Files\cmd.exe"
goto :EOF


:remove
del "C:\Program Files\cmd.exe"
echo Y|REG DELETE "HKCR\*\shell\����Ա��cmd�򿪵�ǰĿ¼"
echo Y|REG DELETE "HKCR\Directory\shell\����Ա��cmd�򿪵�ǰĿ¼"
echo Y|REG DELETE "HKCR\Drive\shell\����Ա��cmd�򿪵�ǰĿ¼"
echo ɾ���ɹ���
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
ver | find "6.3" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win8.1������Ҫ��&set value=imageres.dll,197&echo.&goto :EOF)
echo.&echo ��Ǹ����������ֻ����XP��Win7��Win8ϵͳ��ʹ�ã�
echo.&echo �밴������˳��ɡ���
pause>nul
exit


:about::����
echo.
echo ������Ҽ�������Ա��cmd�򿪵�ǰĿ¼����
echo ���ߣ����԰�
echo ΢����http://weibo.com/liuxianan
echo QQ��937925941
echo ���ڣ�2013��3��23��
echo ����޸ģ�2015��2��15��
echo.
goto :EOF

