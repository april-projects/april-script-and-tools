@echo off
cd.>script.txt
>>script.txt echo list disk
for /f %%i in ('diskpart /s script.txt^|find /c ^"����^"') do Set HardDrivers=%%i
del script.txt /q
echo ���ļ������Ӳ�̰�װ����Ϊ��%HardDrivers%
pause