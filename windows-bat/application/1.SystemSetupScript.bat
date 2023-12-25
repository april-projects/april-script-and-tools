@echo off
setlocal enabledelayedexpansion

:MENU
cls
echo ************************************************************
echo *
echo *        系统环境变量和服务安装配置,请用管理员身份运行
echo *
echo ************************************************************
echo.
echo 1. 设置JDK环境变量
echo 2. 设置MySQL环境变量
echo 3. 安装ZJDY服务
echo 4. 安装Influxdb服务
echo 5. 退出

set /p choice=请选择要执行的操作 (输入数字): 

if "%choice%"=="1" call :SetJDKEnvironment
if "%choice%"=="2" call :SetMySQLEnvironment
if "%choice%"=="3" call :InstallZJDYService
if "%choice%"=="4" call :InstallInfluxdbService
if "%choice%"=="5" exit

goto MENU

:SetJDKEnvironment
echo ************************************************************
echo *        JDK 系统环境变量设置，请用管理员身份运行
echo ************************************************************
:START_JDK
set /p javahome=请输入JDK安装路径：
IF EXIST "%javahome%\bin\java.exe" GOTO INSTALL_JDK
:WARNING_JDK
echo 您所输入的路径不是JDK安装路径
echo 请重新输入正确的JDK安装路径
pause
goto START_JDK
:INSTALL_JDK
echo 输入的路径是:%javahome%
echo.
echo === 准备设置环境变量: JAVA_HOME=%javahome%
rem 省略其余设置环境变量的部分，按照你的需求添加
goto END

:SetMySQLEnvironment
echo ************************************************************
echo *        MySQL 系统环境变量设置，请用管理员身份运行
echo ************************************************************
:START_MYSQL
set /p mysqlhome=请输入MySQL安装路径：
IF EXIST "%mysqlhome%\bin\mysql.exe" GOTO INSTALL_MYSQL
:WARNING_MYSQL
echo 您所输入的路径不是MySQL安装路径
echo 请重新输入正确的MySQL安装路径
pause
goto START_MYSQL
:INSTALL_MYSQL
echo 输入的路径是:%mysqlhome%
rem 省略其余设置环境变量的部分，按照你的需求添加
goto END

:InstallZJDYService
echo ************************************************************
echo *        ZJDY服务 系统服务安装配置，请用管理员身份运行
echo ************************************************************
:START_ZJDY
set /p zjdypath=请输入服务器安装路径：
IF EXIST "%zjdypath%\ZjdyService.exe" GOTO INSTALL_ZJDY
:WARNING_ZJDY
echo 您所输入的路径不是ZJDY安装路径，请重新输入正确的ZJDY安装路径
pause
goto START_ZJDY
:INSTALL_ZJDY
echo 输入的路径是:%zjdypath%
rem 省略其余安装服务的部分，按照你的需求添加
goto END

:InstallInfluxdbService
echo ************************************************************
echo *        Influxdb服务 系统服务安装配置，请用管理员身份运行
echo ************************************************************
:START_INFLUXDB
set /p influxdbpath=请输入Influxdb服务器安装路径：
IF EXIST "%influxdbpath%\InfluxdbService.exe" GOTO INSTALL_INFLUXDB
:WARNING_INFLUXDB
echo 您所输入的路径不是Influxdb安装路径，请重新输入正确的Influxdb安装路径
pause
goto START_INFLUXDB
:INSTALL_INFLUXDB
echo 输入的路径是:%influxdbpath%
rem 省略其余安装服务的部分，按照你的需求添加
goto END

:END
echo.
echo === 执行完毕，请按任意键退出!
pause>nul
exit /b