@echo off
setlocal enabledelayedexpansion

:inputPort
set /p "inputPort=请输入要释放的端口号（输入exit退出）: "
if /i "%inputPort%"=="exit" goto :eof

rem 检查输入是否为数字
set "numeric=true"
for /f "delims=0123456789" %%a in ("%inputPort%") do set "numeric=false"
if not "%numeric%"=="true" (
    echo 请输入有效的端口号。
    goto inputPort
)

echo ------------------------------
echo 查找端口号 %inputPort% 的进程信息：
echo ------------------------------
echo PID   端口  可执行文件路径
echo ------------------------------

for /f "tokens=5,2,*" %%a in ('netstat -ano ^| find "LISTENING" ^| find "%inputPort%"') do (
    set "pid=%%a"
    set "port=%inputPort%"
    set "exePath="
    
    rem 使用 PowerShell 获取可执行文件路径
    for /f "delims=" %%e in ('powershell "Get-Process -Id !pid! | Select-Object -ExpandProperty Path"') do (
        set "exePath=%%e"
    )
    
    echo !pid!   !port!   !exePath!
)

echo ------------------------------

set /p "closePort=是否关闭占用此端口的进程？（输入Y确认关闭，其他键取消）: "
if /i "%closePort%"=="Y" (
    taskkill /f /pid %pid%
    taskkill /f /pid %pid% -a 2>NUL
    echo 端口 %port% 的进程已被关闭。
) else (
    echo 端口 %port% 的进程未被关闭。
)

goto inputPort
