@echo off
for /f "tokens=*" %%b in ('dir') do echo "%%b"|find "���ļ�">nul&&for /f "tokens=3*" %%c in ("%%b") do echo ��ǰĿ¼ %%c %%d
for /f %%a in ('dir/ad/s/b') do for /f "tokens=*" %%b in ('"dir %%a\"') do echo "%%b"|find "���ļ�">nul&&for /f "tokens=3*" %%c in ("%%b") do echo %%a %%c %%d
pause