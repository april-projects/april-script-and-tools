@echo off
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::     ���оٴ��ڵķ�����Ȼ�������ɾ���Է����������Ĺ���
::     ͨ���޸�ע����ֹadmin$�������´ο���ʱ���¼��أ� 
::     IPC$������ҪadministritorȨ�޲��ܳɹ�ɾ��
::
::                             jm �Ķ��� 2006-5-12
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title Ĭ�Ϲ���ɾ����
echo. 
echo ------------------------------------------------------ 
echo. 
echo ��ʼɾ��ÿ�������µ�Ĭ�Ϲ���. 
echo. 
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do @(
    if exist %%a:\nul (
        net share %%a$ /delete>nul 2>nul && echo �ɹ�ɾ����Ϊ %%a$ ��Ĭ�Ϲ��� || echo ��Ϊ %%a$ ��Ĭ�Ϲ�������
    ) 
)
net share admin$ /delete>nul 2>nul && echo �ɹ�ɾ����Ϊ admin$ ��Ĭ�Ϲ��� || echo ��Ϊ admin$ ��Ĭ�Ϲ�������
echo.
echo ------------------------------------------------------ 
echo.
net stop Server>nul 2>nul && echo Server������ֹͣ.
net start Server>nul 2>nul && echo Server����������.
echo. 
echo ------------------------------------------------------ 
echo. 
echo �޸�ע����Ը���ϵͳĬ������. 
echo. 
echo ���ڴ���ע����ļ�. 
echo Windows Registry Editor Version 5.00> c:\delshare.reg 
:: ͨ��ע����ֹAdmin$�����Է��������ٴμ���
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters]>> c:\delshare.reg
echo "AutoShareWks"=dword:00000000>> c:\delshare.reg 
echo "AutoShareServer"=dword:00000000>> c:\delshare.reg 
:: ɾ��IPC$������������ҪadministritorȨ�޲��ܳɹ�ɾ��
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]>> c:\delshare.reg
echo "restrictanonymous"=dword:00000001>> c:\delshare.reg
echo ���ڵ���ע����ļ��Ը���ϵͳĬ������. 
regedit /s c:\delshare.reg 
del c:\delshare.reg && echo ��ʱ�ļ��Ѿ�ɾ��. 
echo. 
echo ------------------------------------------------------ 
echo. 
echo �����Ѿ��ɹ�ɾ�����е�Ĭ�Ϲ���. 
echo. 
echo ��������˳�...
pause>nul