setlocal enabledelayedexpansion
@echo off

:: ���ߣ���˧����
:: ���ڣ�2021 �� 6 �� 18 ��
:: ���д˽ű���Ҫ��ȷ����װ�У�ImageMagick
:: 
:: ��ͼƬ�ϵ��˽ű��Ͻ��д���
:: �Է�������������ͼƬ��
::   - ��ʽΪ jpg �� jpeg
::   - ���������� 500w
::   - ��߱�С�� 3
::   - ��߱ȴ��� 0.3
:: ��С�ֱ��ʵ� 500w ���أ����Ұ����� 50 ѹ����

for %%i in (%*) do (
	
	if /i %%~xi==.jpg (
		set ��ʽ��ȷ=yes
	) else if /i %%~xi==.jpeg (
		set ��ʽ��ȷ=yes
	) else (
		set ��ʽ��ȷ=noo
	)
	
	if /i !��ʽ��ȷ!==yes (
	
		for /F "tokens=*" %%m in ('magick identify -format "%%[fx:w/h]" %%i') do set ��߱�=%%m
		echo ���ڴ��� %%i
		echo ͼƬ��߱ȣ�!��߱�!
		
		set ��߱�����=no
		if !��߱�! GEQ 3 (
			if !��߱�! LEQ 3 (
				set ��߱�����=yes
			)
		)
		
		if /i !��߱�����!=yes (
			magick %%i -resize "5000000@>" -quality 50 %%i
		) else (
			magick %%i -resize "2000x2000^>" -quality 50 %%i
		)
		
		echo=
	)
)

echo Mission complete! 

pause
