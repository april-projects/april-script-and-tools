@echo off
:: =========================================================================================================
:: ChangeHalByRundll.cmd  ʹ��Windows��rundll32���������ļ�������͵�������
:: �÷��� ChangeHalByRundll <Ӳ��ID>
:: ����<Ӳ��ID>��ָ������ĳɵļ������������Ӧ��HardwareID��
:: ���磺���뽫������ĳ�ACPI Uniprocessor���ͣ���ôʹ�����ChangeHalByRundll ACPIPIC_UP
:: �����������Ӳ��ID�Ķ�Ӧ��ϵ���£�
:: ���������            Ӳ��ID(HardwareID)
:: Standard              E_ISA_UP
:: ACPI Uniprocessor     ACPIAPIC_UP
:: ACPI Multiprocessor   ACPIAPIC_MP
:: MPS Uniprocessor      MPS_UP
:: MPS Multiprocessor    MPS_MP
:: Compaq SystemPro      SYSPRO_MP
:: ACPI                  ACPIPIC_UP
:: ========================================================================================================= 


if %1#==# goto _usage
set HardIDs=E_ISA_UP ACPIPIC_UP ACPIAPIC_UP ACPIAPIC_MP MPS_UP MPS_MP SGI_MPS_MP SYSPRO_MP
echo %HardIDs% | find /i "%1" > nul
if errorlevel 1 goto _usage

:_update
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0000" /f
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0001" /f
REG.EXE DELETE "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0000" /f
REG.EXE DELETE "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0001" /f
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Enum\Root\ACPI_HAL" /f
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Enum\Root\PCI_HAL" /f
rundll32.exe setupapi,InstallHinfSection %1_HAL 131 %windir%\inf\hal.inf
cls
echo.
echo ��ϲ����������͸�����ϣ����������������ʹ������Ч��ϵͳ������ɨ��Ӳ����
echo ��������˳�...
pause >nul
goto _quit

:_usage
cls
echo.
echo ������û��ָ����������Ͷ�Ӧ��Ӳ��ID������ָ����Ӳ��ID�����ڡ�
echo �÷��� %0  ^<Ӳ��ID^>
echo.
echo �����������Ӳ��ID�Ķ�Ӧ��ϵ���£�
echo.
echo ���������            Ӳ��ID(HardwareID)
echo Standard              E_ISA_UP
echo ACPI Uniprocessor     ACPIAPIC_UP
echo ACPI Multiprocessor   ACPIAPIC_MP
echo MPS Uniprocessor      MPS_UP
echo MPS Multiprocessor    MPS_MP
echo Compaq SystemPro      SYSPRO_MP
echo ACPI                  ACPIPIC_UP
echo.
echo ��������˳�...
pause>nul
goto _quit

:_quit
set HardIDs=
