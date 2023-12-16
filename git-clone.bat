@echo off

REM ��ȡ�û�����Ĺ���Ŀ¼
set /p WORK_DIR=�����빤��Ŀ¼��

REM ��֤�û�����Ĺ���Ŀ¼�Ƿ����
if not exist "%WORK_DIR%" (
    echo ���󣺹���Ŀ¼�����ڣ����������롣
    exit /b 1
)

REM �����û�ָ���Ĺ���Ŀ¼
cd /d %WORK_DIR%

REM �û����� Git �ֿ� URL
set /p REPO_URL=������ Git �ֿ� URL��

REM �û������������
set /p HTTP_PROXY_PORT=������HTTP����˿ںţ�

REM ��֤����˿��Ƿ�Ϊ����
setlocal enabledelayedexpansion
set "nonnumeric=!HTTP_PROXY_PORT!"
for /l %%a in (0,1,9) do set "nonnumeric=!nonnumeric:%%a=!"
if defined nonnumeric (
    echo ��������Ĳ��ǺϷ��Ķ˿ںţ����������롣
    endlocal
    exit /b 1
)

REM ���ô���
git config --global http.proxy 127.0.0.1:%HTTP_PROXY_PORT%
git config --global https.proxy 127.0.0.1:%HTTP_PROXY_PORT%

REM ִ�� Git Clone ����
git clone %REPO_URL%

REM ȡ����������
git config --global --unset http.proxy
git config --global --unset https.proxy

echo Git Clone ������ɡ�

REM �򿪿�¡�Ĳֿ�Ŀ¼
explorer .
pause