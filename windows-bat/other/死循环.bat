@echo off
title ��ѭ�������ű���ѡ����ת�����޸Ķ���
:: ˵��:��:myflag�� �Ƕ���һ����ǵ㣬��ͨ����goto :myflag����ʵ����ת
:: ����˵����myflag���Զ�������

:myflag
set /p flag=������ִ�е����֣�

if %flag% == 1 (
	goto onefuction
) else (
	goto twofuction
)
pause

:onefuction
	echo ����1ִ��
	goto :myflag
pause
goto:eof

:twofuction
	echo ����2ִ��
	goto :myflag
pause
goto:eof
