@echo off 
color 1f 
Title XP�˿�-���̲�ѯ 
setlocal enabledelayedexpansion 
echo �X-                              -�[ 
echo   �������ŵĶ˿ڼ�ʹ�øö˿ڵĽ��� 
echo �^-                              -�a 
echo ------------------------------------ 
echo          �˿ں�           ��������       
ECHO TCPЭ��: 
::����netstat�����ҳ�ʹ��TCPЭ��ͨ�ŵĶ˿ڣ���������ָ 
::���ڶ�������(IP�Ӷ˿�)����%%i�����������(PID��)����%%j; 
for /F "usebackq skip=4 tokens=2,5" %%i in (`"netstat -ano -p TCP"`) do ( 
  call :Assoc %%i TCP %%j 
  echo           !TCP_Port!           !TCP_Proc_Name!  
) 

ECHO UDPЭ��: 
for /F "usebackq skip=4 tokens=2,4" %%i in (`"netstat -ano -p UDP"`) do (  
  call :Assoc %%i UDP %%j 
  echo           !UDP_Port!           !UDP_Proc_Name! 
) 
echo ��������˳� 
pause>nul 

:Assoc 
::��%1(��һ�����������зָ���ڶ�����������%%e���ڱ������У�%1��Ϊ�����%%i(��ʽΪ��IP:�˿ں�) 
for /F "tokens=2 delims=:" %%e in ("%1") do ( 
    set  %2_Port=%%e 
  ) 
:: ��ѯPID����%3(����������)�Ľ��̣����������������?_Proc_Name,?����UDP����TCP�� 
for /F "skip=2 usebackq delims=, tokens=1" %%a in (`"Tasklist /FI "PID eq %3" /FO CSV"`) do ( 
   ::%%~a��ʾȥ��%%a��������ţ���Ϊ��������Ľ�����������������ġ�  
   set %2_Proc_Name=%%~a 
  ) 
