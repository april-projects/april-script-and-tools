@echo off
netsh -c interface dump >������Ϣ.txt
:loop
cls
set a=
set/p a=1�����鿴������Ϣ��2�����������ã�Q�����˳�
if "%a%"=="1" start ������Ϣ.txt
if "%a%"=="2" netsh -f c:\gongsi.txt
if "%a%"=="q" exit
goto loop
