@echo off
:: �����д��3742668 �����޶���namejm www.cn-dos.net

::���ø�ʽ��
call :select "ip address" "ip"
call :select "Physical Address" "mac"
call :select "Default Gateway" "gateway"
call :select "DNS Servers" "dns"
call :select "Description" "netcard"

:: ��ʾЧ��
echo IP:%ip%
echo MAC:%mac%
echo DNS:%dns%
echo GATEWAY:%gateway%
echo NETCARD:%netcard%
pause>nul
goto :eof

::**************************************************************
::              ����ipconfig�������ͨ�ú���
::**************************************************************
:select
    for /f "tokens=2 delims=:" %%i in ('ipconfig /all ^| findstr /i /c:%1') do if not "!%~2!" == "" set "%~2=%%i"
goto :eof