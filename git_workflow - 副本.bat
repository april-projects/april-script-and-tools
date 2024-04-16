@echo off
setlocal enabledelayedexpansion

REM ��ȡ�û�����Ĺ���Ŀ¼
set /p WORK_DIR=�����빤��Ŀ¼��

REM ��֤�û�����Ĺ���Ŀ¼�Ƿ����
if not exist "%WORK_DIR%" (
    echo ���󣺹���Ŀ¼�����ڣ����������롣
    exit /b 1
)

REM �����û�ָ���Ĺ���Ŀ¼
cd /d "%WORK_DIR%"

REM ִ�� Git ����
echo ִ�� git pull ����
git pull

echo ִ�� git add ����
git add .

REM �û������ύע��
set /p COMMIT_MESSAGE=�������ύע�ͣ�

REM ��֤�ύע���Ƿ�Ϊ��
if "%COMMIT_MESSAGE%"=="" (
    echo �����ύע�Ͳ���Ϊ�գ����������롣
    exit /b 1
)

REM ��ȡ��ǰ���ں�ʱ��
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a
set "date=!datetime:~0,4!-!datetime:~4,2!-!datetime:~6,2!"
set "time=!datetime:~8,2!:!datetime:~10,2!:!datetime:~12,2!"

REM ������ں�ʱ�䵽�ύע��
set "COMMIT_MESSAGE=%COMMIT_MESSAGE% - !date! !time!"

echo ִ�� git commit ����
git commit -m ":sparkles: !COMMIT_MESSAGE!"

echo ִ�� git push ����
git push

REM �û�ѡ��رջ���һ��
set /p CHOICE=����������ѡ��1. �ر�  2. ִ����һ��

if "%CHOICE%"=="1" (
    echo �û�ѡ��ر�
    pause
) else (
    echo �û�ѡ��ִ����һ��
    REM �����������һ���Ĳ���
    pause
)
