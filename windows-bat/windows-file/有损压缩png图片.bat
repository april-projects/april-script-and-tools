@echo off

:: ���ߣ���˧����
:: ���ڣ�2021 �� 2 �� 10 ��
:: ���д˽ű���Ҫ��ȷ����װ�У�pngquant

for %%i in (%*) do (
	if /i %%~xi==.png (
		move %%i "%temp%\temp.png"
		pngquant  - < "%temp%\temp.png" > %%i
	)
)

echo Mission complete! 

pause
