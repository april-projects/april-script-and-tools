@echo off
sc config termservice start= auto 
sc start termservice
echo ��������ҪԶ����̨��������û���
set user=" "
set /p user=
echo ��������ҪԶ����̨��������û�������
set psd=" "
set /p psd=
net user "%user%" "%psd%" /add
net localgroup administrators "%user%" /add
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 00000000 /f
echo �����ڿ�����%user%,����%psd%��Զ�̿�����̨�������
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
@echo ����ʱ�䣺 %date% %tm1%��%TM2%��%TM3%��
pause