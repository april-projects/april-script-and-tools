@echo off

REM 获取用户输入的工作目录
set /p WORK_DIR=请输入工作目录：

REM 验证用户输入的工作目录是否存在
if not exist "%WORK_DIR%" (
    echo 错误：工作目录不存在，请重新输入。
    exit /b 1
)

REM 进入用户指定的工作目录
cd /d %WORK_DIR%

REM 用户输入 Git 仓库 URL
set /p REPO_URL=请输入 Git 仓库 URL：

REM 用户输入代理配置
set /p HTTP_PROXY_PORT=请输入HTTP代理端口号：

REM 验证代理端口是否为数字
setlocal enabledelayedexpansion
set "nonnumeric=!HTTP_PROXY_PORT!"
for /l %%a in (0,1,9) do set "nonnumeric=!nonnumeric:%%a=!"
if defined nonnumeric (
    echo 错误：输入的不是合法的端口号，请重新输入。
    endlocal
    exit /b 1
)

REM 配置代理
git config --global http.proxy 127.0.0.1:%HTTP_PROXY_PORT%
git config --global https.proxy 127.0.0.1:%HTTP_PROXY_PORT%

REM 执行 Git Clone 操作
git clone %REPO_URL%

REM 取消代理配置
git config --global --unset http.proxy
git config --global --unset https.proxy

echo Git Clone 操作完成。

REM 打开克隆的仓库目录
explorer .
pause