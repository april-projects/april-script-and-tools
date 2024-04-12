@echo off
setlocal

rem 函数：设置代理
:setProxy
set "proxy=127.0.0.1:10809"
git config --global http.proxy "%proxy%"
git config --global https.proxy "%proxy%"
echo 代理已设置为: %proxy%
goto :eof

rem 函数：取消代理
:unsetProxy
git config --global --unset http.proxy
git config --global --unset https.proxy
echo 代理已取消设置
goto :eof

rem 主函数
:main
cls
echo 请选择操作:
echo 1. 设置代理
echo 2. 取消代理
set /p "choice=选择操作 (1/2): "

if "%choice%"=="1" (
    call :setProxy
) else if "%choice%"=="2" (
    call :unsetProxy
) else (
    echo 无效的选择
)

pause