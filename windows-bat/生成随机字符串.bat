rem ����3������ַ���
@echo off
set n=3
rem n=3��˼Ҫ����3������ַ�������Ҫ10���޸�n=10
setlocal enabledelayedexpansion
rem ���������ӳ�
set str=abcdefghijklmnopqrstuvwxyz0123456789
for /l %%a in (1,1,%n%) do call :slz "%%a"
rem forѭ��n�Σ���Ϊÿѭ��һ�εõ�1������ַ�����n�α���n������ַ���
echo %random_str%

goto end
:slz
if "%~1"=="" goto:eof
set /a r=%random%%%36
rem ����С��36�������(26����ĸ��10�����ֵ���36�ܺ�����)
set random_str=%random_str%!str:~%r%,1!
rem �ַ�������ȡ���ϲ������Ҫ��һ�����������ײ��ܿ��������ٶȻ�google�ؼ��ʡ�����ַ���ȡ���ܡ���
EXIT /B 0

:end
pause