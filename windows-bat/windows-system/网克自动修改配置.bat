@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                �Զ���IP�����������                :::::
:::::������ʹ�ð�[ComputerName]�ֶ��¸�Ϊ���Լ��Ļ�������:::::
::::: 	               ��������QQ: 215135209             :::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@cls
@echo   [ComputerName]  [MacAddress]    [IPAddress]     >>config.cfg
@echo    qq-A001    00-14-85-2c-1a-b2    192.168.0.1    >>config.cfg
@echo    qq-A002    00-14-85-2a-22-12    192.168.0.2    >>config.cfg
@echo    qq-A003    00-14-85-31-3f-7a    192.168.0.3    >>config.cfg
if exist ipconfig.txt  del ipconfig.txt   
ipconfig /all >ipconfig.txt 
if exist phyaddr.txt   del phyaddr.txt
find  "Physical Address" ipconfig.txt >phyaddr.txt
for /f "skip=2 tokens=12" %%M in (phyaddr.txt) do set strMac=%%M
@echo ��ȡMAC��ַΪ��%strMac%
find "%strMac%" Config.cfg >ComputerCfg.txt
for /f "skip=2 tokens=1" %%N in (ComputerCfg.txt) do set ComputerName=%%N
@echo �����������Ϊ��%ComputerName%  
for /f "skip=2 tokens=3" %%I in (ComputerCfg.txt) do set IPAddress=%%I
@echo ����IPΪ��%IPAddress%  
for /f "skip=2 tokens=2" %%M in (ComputerCfg.txt) do set MacAddress=%%M
::::�ָ�����ע������::::
@echo Windows Registry Editor Version 5.00 >ComputerName.reg
@echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName] >>ComputerName.reg
@echo "ComputerName"="%ComputerName%"  >>ComputerName.reg
@echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters] >>ComputerName.reg
@echo "NV Hostname"="%ComputerName%"  >>ComputerName.reg
@echo "Hostname"="%ComputerName%"  >>ComputerName.reg
regedit /s C:\ComputerName.reg
@echo ::::�޸ļ������������ɡ�::::
@echo :::::::::::::::::::::::::::::::::::::::::::::::
@echo ::::�����޸�IP ��ַ��������Ҫ�ȴ�һ��ʱ�䡣::::
@echo ::::      �޸ĺ�ϵͳ���Զ���������         ::::
@echo :::::::::::::::::::::::::::::::::::::::::::::::
net start remoteregistry
netsh interface ip set address name="��������" source=static addr=%IPAddress% mask=255.255.255.0 gateway=192.168.0.1 gwmetric=1
net stop remoteregistry

::::ȫ�Զ���װ���㣡
C:\DF.EXE /install /pw=QQ457514 /thaw=F:
::::10 ����ʱ�ػ�������Ҫ������
C:\winnt\system32\shutdown.exe /r /t 15
del c:\*.* /q