@echo off
setlocal

rem ���������ô���
:setProxy
set "proxy=127.0.0.1:10809"
git config --global http.proxy "%proxy%"
git config --global https.proxy "%proxy%"
echo ����������Ϊ: %proxy%
goto :eof

rem ������ȡ������
:unsetProxy
git config --global --unset http.proxy
git config --global --unset https.proxy
echo ������ȡ������
goto :eof

rem ������
:main
cls
echo ��ѡ�����:
echo 1. ���ô���
echo 2. ȡ������
set /p "choice=ѡ����� (1/2): "

if "%choice%"=="1" (
    call :setProxy
) else if "%choice%"=="2" (
    call :unsetProxy
) else (
    echo ��Ч��ѡ��
)

pause