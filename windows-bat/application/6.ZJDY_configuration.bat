@echo off
title ZJDY���� ϵͳ����װ����,���ù���Ա�������
echo ************************************************************
echo *
echo *        ZJDY���� ϵͳ����װ����,���ù���Ա�������
echo *
echo ************************************************************
:START
set /p zjdypath=�������������װ·����
IF EXIST "%zjdypath%\ZjdyService.exe" GOTO INSTALL
:WARNING
rem ����Ŀ¼������ʾ��������
echo ���������·������ZJDY��װ·����������������ȷ��ZJDY��װ·��
pause
goto START
:INSTALL
rem ��������ȷ�� ZJDY ��װĿ¼����ʼ��װ����
echo �����·����:%zjdypath%
echo.
echo === ׼����װ����: ZjdyService.exe install
echo.
%zjdypath%\ZjdyService.exe install
echo === ���������������Եȣ�����===
echo.
net start zjdy
echo �����������
echo.
start https://localhost:8002/
echo === �밴������˳�!
pause>nul
