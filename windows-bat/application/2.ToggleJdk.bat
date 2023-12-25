@echo off
rem --- Base Config ����JDK�İ�װĿ¼ ---
:init
set JAVA_HOME_1_8=C:\Program Files\Java\jdk1.8.0_281
set JAVA_HOME_1_9=C:\Program Files\Java\jdk-9.0.1
set JAVA_HOME_1_0=C:\Program Files\Java\jdk-10.0.2
set JAVA_HOME_1_1=C:\Program Files\Java\jdk-11.0.4
set JAVA_HOME_1_2=C:\Program Files\Java\jdk-12.0.2
set JAVA_HOME_1_3=C:\Program Files\Java\jdk-13.0.2
set JAVA_HOME_1_4=C:\Program Files\Java\jdk-14.0.2
set JAVA_HOME_1_5=C:\Program Files\Java\jdk-15.0.2
set JAVA_HOME_1_6=C:\Program Files\Java\jdk-16.0.2
set JAVA_HOME_1_7=C:\Program Files\Java\jdk-17.0.2
set RefreshEnv=D:\APP\refjdk\RefreshEnv.exe
:start

echo ��ǰʹ�õ�JDK �汾:
echo =============================================
java -version
echo =============================================
echo jdk�汾�б�:
echo  jdk8
echo  jdk9
echo  jdk10
echo  jdk11
echo  jdk12
echo  jdk13
echo  jdk14
echo  jdk15
echo  jdk16
echo  jdk17
echo =============================================
:select
set /p opt=��ѡ��JDK�汾(8��9��10��11��12��13��14��15��16��17)��
if %opt%==8 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_8%
)
if %opt%==9 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_9%
)
if %opt%==10 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_0%
)
if %opt%==11 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_1%
)
if %opt%==12 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_2%
)
if %opt%==13 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_3%
)
if %opt%==14 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_4%
)
if %opt%==15 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_5%
)
if %opt%==16 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_6%
)
if %opt%==17 (
     set TARGET_JAVA_HOME=%JAVA_HOME_1_7%
)
echo ��ǰѡ���Java·��:%TARGET_JAVA_HOME%
echo =============================================
rem ɾ��JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete

rem �½�JAVA_HOME����ֵ
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%TARGET_JAVA_HOME%"

rem ˢ�»�������
call %RefreshEnv%
echo =============================================
echo �밴������˳�!
pause>nul

@echo on