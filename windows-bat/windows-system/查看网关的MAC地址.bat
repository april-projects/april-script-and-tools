@echo off
set /p getway="����������IP��ַ:"%getway%
arp -a|find "%getway% "
pause