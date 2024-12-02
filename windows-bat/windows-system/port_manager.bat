@echo off
chcp 65001 >nul
:: 检查是否以管理员权限运行
:: 如果不是管理员权限，则重新以管理员权限运行
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 当前脚本需要管理员权限运行！
    echo 正在尝试以管理员权限重新运行...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:menu
cls
echo ===========================================
echo          Windows 端口管理脚本
echo ===========================================
echo 1. 查看所有端口号和对应程序
echo 2. 查询指定端口号
echo 3. 关闭指定端口号
echo 4. 退出
echo ===========================================
set /p choice=请输入选项（1-4）： 

if "%choice%"=="1" goto list_ports
if "%choice%"=="2" goto query_port
if "%choice%"=="3" goto close_port
if "%choice%"=="4" exit
echo 无效选项，请重新输入！
pause
goto menu

:list_ports
echo 正在列出所有端口及其对应的程序...
echo ===========================================
echo 端口信息: [协议 本地地址 外部地址 状态 PID]
netstat -ano | findstr LISTENING
echo ===========================================
echo 正在查询 PID 对应的程序信息：
for /f "tokens=5" %%A in ('netstat -ano ^| findstr LISTENING') do (
    echo.
    echo PID %%A 对应的程序为：
    tasklist /fi "pid eq %%A" 2>nul | findstr /i ".exe" || echo 无法找到 PID %%A 对应的程序。
)
pause
goto menu

:query_port
set /p port=请输入要查询的端口号： 
echo 正在查询端口 %port% 的信息...
netstat -ano | findstr :%port%
if %errorlevel% neq 0 (
    echo 没有找到使用端口 %port% 的信息！
) else (
    for /f "tokens=5 delims= " %%A in ('netstat -ano ^| findstr :%port%') do (
        echo 端口 %port% 的 PID 是 %%A
        tasklist /fi "pid eq %%A"
    )
)
pause
goto menu

:close_port
set /p port=请输入要关闭的端口号： 
for /f "tokens=5 delims= " %%A in ('netstat -ano ^| findstr :%port%') do (
    echo 正在尝试关闭端口 %port% 对应的进程，PID 为 %%A...
    taskkill /PID %%A /F
    if %errorlevel% neq 0 (
        echo 关闭端口 %port% 失败！
    ) else (
        echo 端口 %port% 已成功关闭！
    )
)
pause
goto menu
