@echo off
set a=
set/p a=������Ҫ���ҵ��û���
net user %a% >nul 2>nul && echo ���ڸ��û� || echo �û�������.
pause>nul
