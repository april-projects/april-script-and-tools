@echo off
color f2
echo.
set for=��
set of=��
set with=��
set in=(��
set data:=����
set milli-seconds:=����Ϊ��λ)
set Approximate=��Լ
set times=ʱ��:
set round=����
set trip=�г�
set Reply=Ӧ��
set from=����
set bytes=�ֽ�
set time=ʱ��:
set timed=ʱ��
set out=����
set statistics=ͳ��
set Packets:=��:
set Sent=�ѷ���=
set Received=���յ�=
set Lost=�Ѷ�ʧ=
set loss)=��ʧ)
set Minimum=��Сֵ=
set Maximum=���ֵ=
set Average=ƽ��ֵ=
set TTL=TTL=
setlocal enabledelayedexpansion
set a=
set/p a=������Ҫping����ַ��IP   
for /f "delims=" %%i in ('ping %a%') do (
    set ret=
    for %%a in (%%i) do if defined %%a (set ret=!ret!!%%a!) else set ret=!ret! %%a 
    if not "!ret!"=="" (set ret=!ret:time=ʱ��! && echo !ret!) else echo.
)
pause>nul