@echo off
setlocal

REM 设置变量
set GPG_PARAMS_FILE=%~dp0gpg_key_params.txt
set TEMP_FILE=%temp%\gpg_keys.txt

REM 检查参数文件是否存在
if not exist "%GPG_PARAMS_FILE%" (
    echo Error: %GPG_PARAMS_FILE% does not exist.
    pause
    exit /b 1
)

REM 创建GPG密钥
echo Generating GPG key...
gpg --batch --gen-key "%GPG_PARAMS_FILE%"

REM 等待一段时间确保密钥生成完全
ping localhost -n 5 > nul

REM 获取创建的密钥ID
echo Retrieving generated GPG key ID...
gpg --list-secret-keys --keyid-format LONG > "%TEMP_FILE%"

REM 从临时文件中提取密钥ID
set "KEY_ID="
for /f "tokens=2 delims=/ " %%i in ('findstr /c:"sec" "%TEMP_FILE%"') do (
    set "KEY_ID=%%i"
    goto :GotKeyID
)
:GotKeyID

REM 删除临时文件
del "%TEMP_FILE%"

REM 去掉空格和换行符
set "KEY_ID=%KEY_ID: =%"
set "KEY_ID=%KEY_ID:=%"

REM 显示提取的密钥ID
echo Extracted GPG key ID: %KEY_ID%

REM 检查是否成功获取密钥ID
if "%KEY_ID%"=="" (
    echo Error: Failed to generate GPG key or retrieve key ID.
    pause
    exit /b 1
)

REM 提取纯粹的密钥ID部分
for /f "tokens=1" %%a in ("%KEY_ID%") do set "PURE_KEY_ID=%%a"

REM 推送密钥到GPG服务器
echo Pushing GPG key to server with ID: %PURE_KEY_ID%
gpg --send-keys %PURE_KEY_ID%

echo GPG key creation and push complete.
pause

endlocal
