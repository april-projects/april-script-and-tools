@echo off
title JDK ϵͳ������������,���ù���Ա�������
echo ************************************************************
echo *
echo *        JDK ϵͳ������������,���ù���Ա�������
echo *
echo ************************************************************
:START
set /p javahome=������JDK��װ·����
IF EXIST "%javahome%\bin\java.exe" GOTO INSTALL
:WARNING
rem ����Ŀ¼������ʾ��������
echo ���������·������JDK��װ·��
echo ������������ȷ��JDK��װ·��
pause
goto START
:INSTALL
rem ��������ȷ�� JavaSDK ��װĿ¼����ʼ���û�������
echo �����·����:%javahome%
echo.
echo === ׼�����û�������: JAVA_HOME=%javahome%
echo === ע��: ��� JAVA_HOME ����,�ᱻ����,�˲����������,����ϸ���ȷ��!!! ===
echo.
echo === ׼�����û�������(�����и�.): CLASSPATH=.;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;
echo === ע��: ��� CLASSPATH ����,�ᱻ����,�˲����������,����ϸ���ȷ��!!! ===
echo.
echo === ׼�����û�������: PATH=%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;
echo === ע��: PATH ��׷������ǰ��
echo.
set /P EN=��ȷ�Ϻ� �س��� ��ʼ����!
echo.
echo.
echo === �´����������� JAVA_HOME=%javahome%
setx "JAVA_HOME" "%javahome%" -M
echo.
echo === �´����������� CLASSPATH=.;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;
setx "CLASSPATH" "%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;" -M
echo.
echo === ��׷�ӻ�������(׷�ӵ���ǰ��) PATH=%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;

::����path��������
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;"
setx path "%path%"
echo.
set /p java=��������֤�汾���java -version����
rem ���Java�汾
%java%
echo Java�����������
echo.
rem LPY https://www.mobaijun.com/
start https://www.mobaijun.com/
echo === �밴������˳�!
pause>nul
