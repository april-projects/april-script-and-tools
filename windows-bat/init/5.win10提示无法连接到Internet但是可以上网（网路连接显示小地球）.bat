@echo off
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :act","","runas",1)(window.close) && exit
:act
color 1F
echo ��Ȩ�ɹ�����

:tishi
setlocal enabledelayedexpansion
title Windows 10 ��BUG�ű�
set cho=
set regval=
MODE con: COLS=82 LINES=13
::cls
ECHO.
ECHO.
ECHO    ****************************************************************************
ECHO.
ECHO           ��Win10����������������������ʾС�����޷����ӵ�Internet����
ECHO.
ECHO                        Y.ִ���޸�       N.�ָ�Ĭ��
ECHO.
ECHO    ****************************************************************************
ECHO.
ECHO.
set /p cho=.          �����루y/n����
if !cho!==y goto choyes
if !cho!==n goto chono
goto choerr

:choerr
CLS
COLOR 0a
MODE con: COLS=60 LINES=10
echo.
echo.
echo.
echo.
echo.
echo �������󣬰�������������˵�
pause>nul
GOTO tishi

:chono
set regval=1
goto setregval

:choyes
set regval=0
goto setregval

:setregval
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d !regval! /f
ECHO ��������ã��������Ժ���Ч���������������ԣ���������˳�...
pause >nul