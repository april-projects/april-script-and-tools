@echo off
adb disconnect
REM ��������ַ���
set command=adb shell "ip address | grep inet | grep 192 | grep -v inet6 | grep -v 127"
for /F "tokens=*" %%i in ('%command%') do set str="%%i"
REM set str="inet 192.168.1.137/24 brd 192.168.1.255 scope global wlan0"
 
REM FOR����ǰ��н��б�����Ҳ����һ��һ��ѭ��������������˵��ֻ��һ���ַ�����
REM ���FORѭ���϶�ֻ����һ�Ρ���������Ҫ���ַ������пո�ָ���ٴ��������
REM ����GOTO�����ʵ��ѭ������FOR���ֻ�迴����һ����䣬�������ʵ����������
REM ���ܣ����ַ����ָ����һ���֣�һ�����ǵ�һ���ո�ǰ���ִ�����һ������ʣ���
REM �ִ���tokens=1,*������һ���ֱ����� a �����У��ڶ����ֱ����� b �����У���
REM �� b ���Զ��ġ�
for /f "tokens=2,*" %%a in (%str%) do (
    REM ��������滻���Լ��Ĵ����������ֻ�Ǽ򵥵���ʾֵ
    REM set a = "%%a"
    REM echo %a%
    REM ��ʣ���ַ�������b����
    set str="%%a"
)
echo str = %str% 
for /f "delims=/ tokens=1,*" %%a in (%str%) do (
    REM ��������滻���Լ��Ĵ����������ֻ�Ǽ򵥵���ʾֵ
    REM set a = "%%a"
    REM echo %a%
    REM ��ʣ���ַ�����ֵ��str����
    set str=%%a
)
echo �ҵ�������IP = %str% 

adb tcpip 6666
set _ip=%str%:6666
set command=adb connect %_ip%
for /F "tokens=*" %%i in ('%command%') do set RESULT="%%i"

echo %RESULT% |findstr "connected" >nul

if %errorlevel% equ 0 (
echo "�ɹ����ӵ�%_ip%"
) else (
echo "���ӵ�%_ip%ʧ�ܣ���"
pause
)