
@echo off

:: JAVA ��������
set workdir=%~dp0
set workdir=%workdir:~0,-1%

echo ��ǰ����Ŀ¼��%workdir%
::setx JAVA_HOME %workdir% /M
::set UGII_USER_DIR

pause

@echo off

:: TODO:����java��������
:: Author: Gwt
:: color 02
:: ����java�İ�װ·�����ɷ����л���ͬ�İ汾
set "USER_JAVA_PATH=%workdir%"
set input=%USER_JAVA_PATH%
echo jdk·��Ϊ%input%
set javaPath=%input%

::����еĻ�����ɾ��JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete
_
::����еĻ�����ɾ��ClASS_PATH 
wmic ENVIRONMENT where "name='CLASS_PATH'" delete

::����JAVA_HOME
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%javaPath%"

::����CLASS_PATH
wmic ENVIRONMENT create name="CLASS_PATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;"

::�ڻ�������path�У��޳�������java_home�е��ַ�������ʣ�µ��ַ���
call set xx=%Path%;%%JAVA_HOME%%\jre\bin;%%JAVA_HOME%%\bin

echo %xx%

::�������Ե��ַ����¸�ֵ��path��
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%xx%"

pause