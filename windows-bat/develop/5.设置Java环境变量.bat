@echo off
mode con cols=42 lines=23
color 0A 
title Java��������һ�����ù���
call :admintest::����Ƿ��ǹ���Ա�������
echo 	Java��������һ�����ù���
echo 	by�����԰���
echo 	2013��4��20��
echo.
echo ִ��ǰ��ȷ�ϣ�
echo.
echo 1���뽫�����������Java\jdk_1.6.0\Ŀ¼��(����bin)
echo 2���˳�360��ɱ�����(��Ϊ�޸�ϵͳpathɱ��������Զ�����)
echo 3�����Զ�Ϊ������JAVA_HOME��ClassPath��Path 3����������������Ѿ����ڻ��Զ�Ϊ�����ǣ������ʹ�ã�
echo 4����������ˮƽ������֤һ��ִ����ȷ���Դ���ɵ���ʧ�Ų����𣡻����Ƽ����ֶ����á�����������
echo.
echo �����������ִ�У���Ҫ�˳����ֶ��رձ���������
pause>nul 2>nul

::�������JAVA_HOME����������ô��ɾ��֮
wmic ENVIRONMENT where "name='JAVA_HOME'" delete

::�������ClassPath����������ô��ɾ��֮
wmic ENVIRONMENT where "name='ClassPath'" delete

::����JAVA_HOME�����С�%~dp0��Ϊ�������ļ����ڵ�Ŀ¼��·������/��β
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%~dp0"

::����ClassPath
wmic ENVIRONMENT create name="ClassPath",username="<system>",VariableValue="%~dp0lib\dt.jar;%~dp0lib\tools.jar;.;"

::��һ�仰���ܱȽ�����⣬�ܵ���˼���ǽ�%Path%�����%JAVA_HOME%��ɾ��
call set newPath=%%Path:%JAVA_HOME%bin;=%%

::����Path������������%JAVA_HOME%%bin;������õ�����path�ϲ�
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%%JAVA_HOME%%bin;%newPath%"

echo ����������⣬����������Ϊ�����óɹ���
echo �밴������˳���
pause>nul 2>nul

:admintest::�����Ƿ����Թ���Ա�������
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo ���Ҽ����������ļ���ѡ���Թ���Ա������С���&echo.&echo �����԰�������˳�����&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF

::By���԰�
::����21:42 2013/4/20
::΢����http://weibo.com/liuxianan
::QQ:937925941