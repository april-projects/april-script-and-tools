@echo off

echo %%1     ����·��,������    %1
echo %%~1    ��������·��       %~1
echo %%~f1   ��ȫ�ϸ�·��       %~f1 
echo %%~d1   ��������           %~d1 
echo %%~p1   ·��               %~p1 
echo %%~n1   �ļ���             %~n1 
echo %%~x1   �ļ���չ��         %~x1 
echo %%~s1   ���ж���           %~s1 
echo %%~a1   �ļ�����           %~a1 
echo %%~t1   ����/ʱ��          %~t1 
echo %%~z1   �ļ���С           %~z1 
echo %%~$PATH:1 ���价������  %~$PATH:1

for %%i in (%*) do (
	echo �̷���·���� %%~dpi
)

pause