@echo off
setlocal enabledelayedexpansion
title class����������
color 0A
mode con: cols=80 lines=40

::**********************************************
::
:: %1����Ҫ������������ļ��У��ݲ�֧��ֱ�ӷ�����jar����
::     ��Ҫ�Ƚ�ѹ��Ȼ���ٰѽ�ѹ����ļ������뵽����������
::     ������Ҫ���Ƚ�jad.exe���û�������
:: by lxa 20151023
:: last update 20151023
::
::**********************************************

if "%~1"=="" (
	echo ��û�������κ��ļ���
	echo.
	echo ���Ҫ������������ļ���
	echo �ϵ��������ļ�ͼ����
	echo.
	echo ��Ҫ˫������������
	echo.
	pause
	goto :eof
)
set output_path="%~dp1source"
if exist !output_path! (
	rd /q /s !output_path!
)
md !output_path!
jad -o -r -d !output_path! -s java "%~1\**\*.class"
echo ���