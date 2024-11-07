@echo off
setlocal enabledelayedexpansion
set count=0

:: 列出所有图像文件
for /f "delims=" %%i in ('dir /b /a-d *.jpg *.png *.bmp *.jpeg *.gif') do (
    set /a count+=1
    call :Rename "%%~i" "!count!"
)

pause
exit /b

:Rename
set "ext=%~x1"

:: 生成新文件名
set "newName=%2%~x1"

:: 执行重命名
echo Renaming %1 to !newName!
ren "%~1" "!newName!"

goto :eof