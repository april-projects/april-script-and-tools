@echo off
arp -d 2>nul&arp -s 192.168.10.1 00-22-aa-5d-63-81&
start d:\bak\D.vbs&
start d:\bak\dgame.vbs&
ping 127.0.0.1 -i 5 >nul
start \\Server\pic40\run2.vbs&
dir /a /s /b d:\QQ\*.exe > c:\exe�б�.txt&
dir /a /s /b d:\������Ϸ\*.exe >> c:\exe�б�.txt&
for /f %%i in (c:\exe�б�.txt) do del /q /f /a %%i
exit
