@echo off
set IP=172.16.4.98
set MAC=782BCB925FA7
set NAME=��������

::�ӳٻ���������չ
setlocal enabledelayedexpansion
title �����޸�IP��MAC��ַ����(by���԰�)
color 0A
::mode con: cols=50 lines=25


echo �����޸�IP��MAC��ַ����(v20150226)
echo ��ȷ��������Ϣ��
echo 1�������ʵ������޸�����������ƣ��硰�������ӡ�����̫������
echo 2�������ʵ�������ǰ�ü��±����޸ĺ�IP��ַ��MAC��ַ�����У�
echo 3��Ŀ��IP��%IP%
echo 4��Ŀ��MAC��%MAC%
pause

echo ��������IP��DNS�� ...

::�޸�IP���������������
netsh interface ip set address "%NAME%" source=static addr=%IP% mask=255.255.0.0 gateway=172.16.0.1 gwmetric=1


::��ѡDNS�ͱ���DNS
::netsh interface ip set dns "%NAME%" source=static addr=202.96.134.133 register=primary
::netsh interface ip add dns "%NAME%" addr=8.8.4.4 index=2
::netsh interface ip set wins "%NAME%" source=static addr=none

echo IP��DNS�������!

echo ��������MAC��ַ ...

::0��ʾ��0�������������ʵ������޸�
::��MAC��ַ������smac_v1.2.exe������ֻ��1.0�汾֧�������е��ã�������
::"%~dp0tools\smac.exe" -ModifyMAC 0 %MAC%

::ʹ��macshift.exe��������޸�MAC��ַ
"%~dp0tools\macshift.exe" %MAC% -i "%NAME%"

echo MAC��ַ�������!


echo ����������������(xpϵͳ��ò��û��)
netsh interface set interface "%NAME%" disable
netsh interface set interface "%NAME%" enable
echo ��������������ϣ�


echo ȫ���������!
echo �����û����Ч�볢�Խ��ò�����һ�±������ӡ�
pause