@echo off
title MySQL ϵͳ������������,���ù���Ա�������
echo ************************************************************
echo * 
echo *        MySQL ϵͳ������������,���ù���Ա�������
echo *
echo ************************************************************
:START
set /p mysqlhome=������MySQL��װ·����
IF EXIST "%mysqlhome%\bin\mysql.exe" GOTO INSTALL
:WARNING
rem ����Ŀ¼������ʾ��������
echo ���������·������MySQL��װ·��
echo ������������ȷ��MySQL��װ·��
pause
goto START
:INSTALL
rem ��������ȷ�� MySQL ��װĿ¼����ʼ���û�������
echo �����·����:%mysqlhome%
rem LPY
echo.
echo === ׼�����û�������: MySQL_HOME=%mysqlhome%
echo === ע��: ��� MySQL ����,�ᱻ����,�˲����������,����ϸ���ȷ��!!! ===
echo.
echo === ׼�����û�������: PATH=%%MySQL_HOME%%\bin;
echo.
set /P EN=��ȷ�Ϻ� �س��� ��ʼ����!
echo.
echo === �´����������� MySQL_HOME=%mysqlhome%
setx "MySQL_HOME" "%mysqlhome%" -M
echo.
echo === ��׷�ӻ������� PATH=%%MySQL_HOME%%\bin;
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%%%MySQL_HOME%%\bin;"
setx path "%path%"
echo.
echo MySQL�����������
rem LPY https://www.mobaijun.com/
echo === �밴������˳�!
pause>nul