@echo off
title ɱ��Windows PID
set /p PID=������һ������PID��
if %PID% == "" (
echo "Yes"
) else (
taskkill /pid %PID% -t -f
)
@pause