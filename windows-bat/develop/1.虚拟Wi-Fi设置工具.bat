@echo off
setlocal enabledelayedexpansion
title ����Wi-Fi���ù���v1.1
color 0A
mode con: cols=50 lines=25


cls::����
call :admintest::����Ƿ��ǹ���Ա�������
call :vercheck::��鵱ǰϵͳ�Ƿ���Win7��Win8


:menu
set Line===================================================
echo %Line%
echo 	��ʾ����һ�����б������밴"B"��������
echo.
echo		[A]	�鿴����Wi-Fi��Ϣ�����������磩
echo		[B]	�������޸�����Wi-Fi���ƺ�����
echo		[C]	��������Wi-Fi
echo		[D]	�ر�����Wi-Fi
echo		[E]	���׽�������Wi-Fi
echo		[F]	����
echo.
echo		[X]	�˳�
echo %Line%


choice /c ABCDEFX /M ��ѡ��
if %errorlevel%==1 (netsh wlan show hostednetwork)
if %errorlevel%==2 call :update
if %errorlevel%==3 (netsh wlan start hostednetwork)
if %errorlevel%==4 (netsh wlan stop hostednetwork)
if %errorlevel%==5 (netsh wlan set hostednetwork mode=disallow)
if %errorlevel%==6 call:about
if %errorlevel%==7 exit
goto :menu


:update::�޸����ƺ�����
echo ����������Wi-Fi������:
set /p ssid=%=%
echo �������������õ�����(����8λ)��
set /p key=%=%
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
goto :EOF

:admintest::�����Ƿ����Թ���Ա�������
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo ���Ҽ����ļ���ѡ���Թ���Ա������С���&echo.&echo �����԰�������˳�����&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF

:vercheck::ϵͳ�汾���
ver | find "6.1" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win7������Ҫ��&echo.&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win8������Ҫ��&echo.&goto :EOF)
ver | find "6.3" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win8.1������Ҫ��&echo.&goto :EOF)
ver | find "10.0" >nul 2>nul && (echo ���ĵ�ǰϵͳ��Win10������Ҫ��&echo.&goto :EOF)
echo.&echo ��Ǹ����������ֻ����Win7����߰汾ϵͳ��ʹ�ã�
echo.&echo �밴������˳��ɡ���
pause>nul
exit


:about::����
echo.
echo ������WiFi���ù��ߡ�
echo ���ߣ�ī��
echo ������https://www.mobaijun.com
echo �������ڣ�2021��10��08��
echo ����޸ģ�2021��10��08��
echo.
goto :EOF


