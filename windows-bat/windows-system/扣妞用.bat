@echo off
color 0A
echo ����!!��Ҫ������
:send
set /p num=�Է�QQ����:
if /i "%num%"=="n" exit
start tencent://message/?uin=%num% (������ʱ�Ի���)
cls
goto send