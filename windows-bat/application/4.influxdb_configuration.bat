@echo off
title Influxdb���� ϵͳ����װ����,���ù���Ա�������
echo ************************************************************
echo *
echo *        Influxdb���� ϵͳ����װ����,���ù���Ա�������
echo *
echo ************************************************************
:START
set /p influxdbpath=������influxdb��������װ·����
IF EXIST "%influxdbpath%\InfluxdbService.exe" GOTO INSTALL
:WARNING
rem ����Ŀ¼������ʾ��������
echo ���������·������Influxdb��װ·����������������ȷ��Influxdb��װ·��
pause
goto START
:INSTALL
rem ��������ȷ�� Influxdb ��װĿ¼����ʼ��װ����
echo �����·����:%influxdbpath%
echo.
echo === ׼����װ����: InfluxdbService.exe install
echo.
%influxdbpath%\InfluxdbService.exe install
echo === ���������������Եȣ�����===
echo.
net start Influxdb
echo �����������
echo.
echo === �밴������˳�!
pause>nul