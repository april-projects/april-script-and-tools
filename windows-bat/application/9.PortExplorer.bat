@echo off
setlocal enabledelayedexpansion

:inputPort
set /p "inputPort=������Ҫ�ͷŵĶ˿ںţ�����exit�˳���: "
if /i "%inputPort%"=="exit" goto :eof

rem ��������Ƿ�Ϊ����
set "numeric=true"
for /f "delims=0123456789" %%a in ("%inputPort%") do set "numeric=false"
if not "%numeric%"=="true" (
    echo ��������Ч�Ķ˿ںš�
    goto inputPort
)

echo ------------------------------
echo ���Ҷ˿ں� %inputPort% �Ľ�����Ϣ��
echo ------------------------------
echo PID   �˿�  ��ִ���ļ�·��
echo ------------------------------

for /f "tokens=5,2,*" %%a in ('netstat -ano ^| find "LISTENING" ^| find "%inputPort%"') do (
    set "pid=%%a"
    set "port=%inputPort%"
    set "exePath="
    
    rem ʹ�� PowerShell ��ȡ��ִ���ļ�·��
    for /f "delims=" %%e in ('powershell "Get-Process -Id !pid! | Select-Object -ExpandProperty Path"') do (
        set "exePath=%%e"
    )
    
    echo !pid!   !port!   !exePath!
)

echo ------------------------------

set /p "closePort=�Ƿ�ر�ռ�ô˶˿ڵĽ��̣�������Yȷ�Ϲرգ�������ȡ����: "
if /i "%closePort%"=="Y" (
    taskkill /f /pid %pid%
    taskkill /f /pid %pid% -a 2>NUL
    echo �˿� %port% �Ľ����ѱ��رա�
) else (
    echo �˿� %port% �Ľ���δ���رա�
)

goto inputPort
