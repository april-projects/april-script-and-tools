@echo off
setlocal enabledelayedexpansion

:MENU
cls
echo ************************************************************
echo *
echo *        ϵͳ���������ͷ���װ����,���ù���Ա�������
echo *
echo ************************************************************
echo.
echo 1. ����JDK��������
echo 2. ����MySQL��������
echo 3. ��װZJDY����
echo 4. ��װInfluxdb����
echo 5. �˳�

set /p choice=��ѡ��Ҫִ�еĲ��� (��������): 

if "%choice%"=="1" call :SetJDKEnvironment
if "%choice%"=="2" call :SetMySQLEnvironment
if "%choice%"=="3" call :InstallZJDYService
if "%choice%"=="4" call :InstallInfluxdbService
if "%choice%"=="5" exit

goto MENU

:SetJDKEnvironment
echo ************************************************************
echo *        JDK ϵͳ�����������ã����ù���Ա�������
echo ************************************************************
:START_JDK
set /p javahome=������JDK��װ·����
IF EXIST "%javahome%\bin\java.exe" GOTO INSTALL_JDK
:WARNING_JDK
echo ���������·������JDK��װ·��
echo ������������ȷ��JDK��װ·��
pause
goto START_JDK
:INSTALL_JDK
echo �����·����:%javahome%
echo.
echo === ׼�����û�������: JAVA_HOME=%javahome%
rem ʡ���������û��������Ĳ��֣���������������
goto END

:SetMySQLEnvironment
echo ************************************************************
echo *        MySQL ϵͳ�����������ã����ù���Ա�������
echo ************************************************************
:START_MYSQL
set /p mysqlhome=������MySQL��װ·����
IF EXIST "%mysqlhome%\bin\mysql.exe" GOTO INSTALL_MYSQL
:WARNING_MYSQL
echo ���������·������MySQL��װ·��
echo ������������ȷ��MySQL��װ·��
pause
goto START_MYSQL
:INSTALL_MYSQL
echo �����·����:%mysqlhome%
rem ʡ���������û��������Ĳ��֣���������������
goto END

:InstallZJDYService
echo ************************************************************
echo *        ZJDY���� ϵͳ����װ���ã����ù���Ա�������
echo ************************************************************
:START_ZJDY
set /p zjdypath=�������������װ·����
IF EXIST "%zjdypath%\ZjdyService.exe" GOTO INSTALL_ZJDY
:WARNING_ZJDY
echo ���������·������ZJDY��װ·����������������ȷ��ZJDY��װ·��
pause
goto START_ZJDY
:INSTALL_ZJDY
echo �����·����:%zjdypath%
rem ʡ�����లװ����Ĳ��֣���������������
goto END

:InstallInfluxdbService
echo ************************************************************
echo *        Influxdb���� ϵͳ����װ���ã����ù���Ա�������
echo ************************************************************
:START_INFLUXDB
set /p influxdbpath=������Influxdb��������װ·����
IF EXIST "%influxdbpath%\InfluxdbService.exe" GOTO INSTALL_INFLUXDB
:WARNING_INFLUXDB
echo ���������·������Influxdb��װ·����������������ȷ��Influxdb��װ·��
pause
goto START_INFLUXDB
:INSTALL_INFLUXDB
echo �����·����:%influxdbpath%
rem ʡ�����లװ����Ĳ��֣���������������
goto END

:END
echo.
echo === ִ����ϣ��밴������˳�!
pause>nul
exit /b