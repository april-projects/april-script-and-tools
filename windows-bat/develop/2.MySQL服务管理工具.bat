@echo off
setlocal enabledelayedexpansion::�ӳٻ���������չ
title MySQL���������(byС��ͬѧ)
color 0A
mode con: cols=50 lines=30

call :admintest::����Ƿ��ǹ���Ա�������
call :vercheck::��鵱ǰϵͳ�Ƿ���Win7��Win8
call :pathcheck::����Ƿ����binĿ¼������
cls::����

::����ǰ·����ӵ�path������������Ҫ��β�����пո�
:menu
set Line===================================================
echo %Line%
echo 	��ʾ��������ͬʱ֧��XP��Win7��Win8ϵͳ
echo			v20170427
echo.
echo		[A]	��װMySQL����
echo		[B]	ж��MySQL����
echo		[C]	����MySQL����
echo		[D]	ֹͣMySQL����
echo		[E]	����MySQL����
echo		[F]	Ϊroot��������
echo		[G]	����
echo.
echo		[X]	�˳�
echo %Line%


choice /c ABCDEFGX /M ��ѡ��
if %errorlevel%==1 call :install
if %errorlevel%==2 call :uninstall
if %errorlevel%==3 call :start
if %errorlevel%==4 call :stop
if %errorlevel%==5 call :restart
if %errorlevel%==6 call :password
if %errorlevel%==7 call :about
if %errorlevel%==8 exit
goto :menu


:install
"%~dp0mysqld.exe" --install
goto :EOF

:uninstall
sc delete mysql
goto :EOF

:start
net start mysql
goto :EOF

:stop
net stop mysql
goto :EOF

:restart
net stop mysql
net start mysql
goto :EOF

:password
echo.
echo ��ܰ��ʾ����������ǰ��������MySQL����Ŷ��
echo.
echo ���Ƿ��ǵ�һ���������룿
choice /c YN /M ��ѡ��
if %errorlevel%==1 call :pwd1
if %errorlevel%==2 call :pwd2
goto :EOF

:pwd1
echo �������������õ�����:
set /p pwd=%=%
mysqladmin -uroot password %pwd%
goto :EOF

:pwd2
echo �����������:
set /p old=%=%
echo ������������:
set /p pwd=%=%
mysqladmin -uroot -p%old% password %pwd%
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
ver | find "10.0" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win10������Ҫ��&set value=imageres.dll,197&echo.&goto :EOF)
echo.&echo ��Ǹ����������ֻ����XP��Win7����߰汾ϵͳ��ʹ�ã�
echo.&echo �밴������˳��ɡ���
pause>nul
exit

:pathcheck::����Ƿ����binĿ¼��
echo.
echo ��ܰ��ʾ��
echo.
echo ������ǰ�װMySQL��������޸����룬
echo ����ؽ������������MySQL\binĿ¼��ִ�У�
echo.
echo ��������������˳��������رա�������
pause>null
goto :EOF

:about::����
echo.
echo ��MySQL��������ߡ�
echo ���ߣ�������
echo ������http://liuxianan.com
echo �������ڣ�2013��3��23��
echo ����޸ģ�2017��4��27��
echo.
echo ������ʷ��
echo 20130323��v1.0 ����汾���߱���װ��ж�ء�������ֹͣMySQL����ȹ��ܣ����Ǳ������ֶ�����MySQL·��
echo 20130504��v1.1 ��������·�������豣֤������binĿ¼�£����������޸Ĺ���
echo 20130505: v1.2 ���������������MySQL·��ֱ������path���µİ�װ��MySQL����·������ȷ��Bug����λ��binĿ¼Ȼ��ֱ��ʹ�á�mysqld --install����װ�������⣡������
echo 20130902: v1.3 ���Win8.1��ϵͳ�ж����⣬����"%~dp0mysqld.exe"����ǺϷ��ġ�
echo.
goto :EOF

