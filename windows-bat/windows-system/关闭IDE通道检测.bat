:: �޸�IDEͨ������豸ģʽ�������豸������Ϊ�ޣ����XP�����ٶ�
:: ������ϵͳ�ڶ�������������⵽�����Ѿ���װ��IDE�豸������
:: Author: Climbing(xclimbing@msn.com)
:: Date: 2006.10.28
@set _debug=
@echo %_debug% off & setlocal ENABLEDELAYEDEXPANSION
set hkey1=HKLM\SYSTEM\CurrentControlSet\Enum\PCIIDE\IDEChannel
set hkey2=HKLM\SYSTEM\CurrentControlSet\Control\Class
for /f "usebackq tokens=*" %%I in (`reg query %hkey1% ^| find /i "IDEChannel\"`) do call :_check "%%I"
goto :eof

:_check
::echo %1
set subkey=
for /f "usebackq tokens=3*" %%J in (`reg query %1 ^| find /i "driver"`) do set subkey=%%J
set DriverDesc=
for /f "usebackq tokens=3,4*" %%K in (`reg query "%hkey2%\%subkey%" /v DriverDesc ^| find /i "driverdesc"`) do set DriverDesc=%%K %%L ͨ��
reg query "%hkey2%\%subkey%" /v MasterDeviceType | find /i "0x1" > nul
if %errorlevel%==1 goto _ChgMaster
goto _CheckSlave

:_ChgMaster
reg add "%hkey2%\%subkey%" /v UserMasterDeviceType /t REG_DWORD /d 3 /f
echo ��%DriverDesc%�����豸0��ⷽʽ����Ϊ�ޡ�

:_CheckSlave
reg query "%hkey2%\%subkey%" /v SlaveDeviceType | find /i "0x1" > nul
if %errorlevel%==1 goto _ChgSlave
goto :eof

:_ChgSlave
reg add "%hkey2%\%subkey%" /v UserSlaveDeviceType /t REG_DWORD /d 3 /f
echo ��%DriverDesc%�����豸1��ⷽʽ����Ϊ�ޡ�
goto :eof