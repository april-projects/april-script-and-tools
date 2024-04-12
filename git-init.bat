@echo off
chcp 65001 > nul
setlocal

REM 设置用户名和邮箱地址
set /p username="请输入Git用户名: "
set /p email="请输入Git邮箱地址: "

REM 初始化Git配置
git config --global user.name "%username%"
git config --global user.email "%email%"

REM 检查是否已存在SSH密钥，如果不存在则生成新的密钥对
if not exist "%userprofile%\.ssh\id_rsa.pub" (
    echo 生成新的SSH密钥对...
    ssh-keygen -t rsa -b 4096 -C "%email%"
) else (
    echo 发现已存在的SSH密钥对:
)

REM 打印SSH公钥
type "%userprofile%\.ssh\id_rsa.pub"
pause
endlocal
