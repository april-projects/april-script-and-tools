@echo off
mode con cols=52 lines=23
setlocal enabledelayedexpansion
title Tomcat6��������ߡ�(by���԰�)
color 0A 


cls::����
call :admintest::����Ƿ��ǹ���Ա�������
call :vercheck::��鵱ǰϵͳ�Ƿ���Win7��Win8

:menu
set Line===================================================
echo %Line%
echo 	��ʾ��������ͬʱ֧��XP��Win7��Win8ϵͳ
echo.
echo		[A]	��װTomcat6����
echo		[B]	ж��Tomcat6����
echo		[C]	����Tomcat6����
echo		[D]	ֹͣTomcat6����
echo		[E]	����Tomcat6����
echo		[F]	����
echo.
echo		[X]	�˳�
echo %Line%


choice /c ABCDEFX /M ��ѡ��
if %errorlevel%==1 call :install
if %errorlevel%==2 call :uninstall
if %errorlevel%==3 call :start
if %errorlevel%==4 call :stop
if %errorlevel%==5 call :restart
if %errorlevel%==6 call :about
if %errorlevel%==7 exit
goto :menu


:install
echo ����δ֪ԭ���������е��÷���װ����ʧ�ܡ�
echo ���Թ���Ա��ݶ�λ��tomcat/binĿ¼�£�Ȼ���ֶ�ִ�У�
echo service.bat install Tomcat6
goto :EOF


:uninstall
sc delete Tomcat6
goto :EOF

:start
net start Tomcat6
goto :EOF

:stop
net stop Tomcat6
goto :EOF

:restart
net stop Tomcat6
net start Tomcat6
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
echo ��Tomcat6��������ߡ�
echo ���ߣ����԰�
echo ΢����http://weibo.com/liuxianan
echo QQ��937925941
echo ���ڣ�2013��3��23��
echo.
goto :EOF

