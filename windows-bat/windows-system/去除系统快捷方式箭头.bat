@color a0
@echo off
color f2
@title ȥ��ϵͳ��ݷ�ʽ��ͷ���������
echo. 
echo.           �������������������������
echo.           ��                                            ��
echo.           ��         ȥ�������ݷ�ʽ��ͷ������         ��
echo.           ��                                            ��
echo.           ��    ��e����,������ɫ!(www.e666.cn)          ��
echo.           ��                                            ��
echo.           �������������������������
echo.
echo.                 ���� ���   ÿ��֪����һ��   ������
echo.                 ��          �W�T�T�j�T�T�Z         ��
echo.                 �����������q�m�r      �q�m�r ��������
echo.                 ��������   �v�u   ��   �v�u  ��������
echo.                  ��             ��  ��           ��
echo.
echo.
echo.
echo.=====================================================================

echo.
@echo ��Ҫȥ��ϵͳ��ݷ�ʽ��ͷ
@pause
@echo Windows Registry Editor Version 5.00>>1.reg
@echo [HKEY_CLASSES_ROOT\lnkfile]>>1.reg
@echo "IsShortcut"=->>1.reg
@echo [HKEY_CLASSES_ROOT\piffile]>>1.reg
@echo "IsShortcut"=->>1.reg
@echo [HKEY_CLASSES_ROOT\InternetShortcut]>>1.reg
@echo "IsShortcut"=->>1.reg
@echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\InternetShortcut]>>1.reg
@echo "IsShortcut"=->>1.reg
regedit/s 1.reg
del 1.reg
@echo 5���Ӻ󽫹ر���ʾ�������,�벻�ؾ���,�Ժ�����¿���
ping localhost -n 5
taskkill /f /im Explorer.exe
@echo ���ڿ�����ʾ����,ϵͳ��ݷ�ʽ��ͷ�����
ping localhost -n 8
start "explorer.exe" "%windir%\explorer.exe"
echo.
echo.=====================================================================
echo.ִ�гɹ���
echo. & pause 
cls
color 2f
echo. 
echo.           �������������������������
echo.           ��                                            ��
echo.           ��         ϵͳ�����ļ�������������         ��
echo.           ��                                            ��
echo.                ��e����,������ɫ!(www.e666.cn)           ��
echo.           ��                                            ��
echo.           �������������������������
echo.
echo.                 ���� ���      ллʹ��     ������
echo.                 ��          �W�T�T�j�T�T�Z         ��
echo.                 �����������q�m�r      �q�m�r ��������
echo.                 ��������   �v�u   ��   �v�u  ��������
echo.                  ��             ��  ��           ��
echo.
echo.
echo.
echo.
echo.
echo.=====================================================================
echo.
pause