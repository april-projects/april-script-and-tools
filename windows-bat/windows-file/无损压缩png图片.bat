@echo off

:: ���ߣ���˧����
:: ���ڣ�2021 �� 2 �� 12 ��
:: ���д˽ű���Ҫ��ȷ����װ�У�optipng

for %%i in (%*) do (
	if /i %%~xi==.png (
		optipng -o2 %%i
	)
)

echo Mission complete! 

pause
