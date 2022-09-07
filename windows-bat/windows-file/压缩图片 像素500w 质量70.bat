@echo off
setlocal enabledelayedexpansion

:: ���ߣ���˧����
:: ���ڣ�2021 �� 6 �� 18 ��
:: ***********************************************************************
:: 
:: ���д˽ű���Ҫ��ȷ����װ�У�����
::    - ImageMagick (https://imagemagick.org/script/download.php)
::    - MozJPEG  ��https://github.com/mozilla/mozjpeg/releases��
::    - pngquant  ��https://pngquant.org/��
::    - libwebp   ��https://developers.google.com/speed/webp/download��
:: ����װ������˼����������ִ���ļ���Ŀ¼�ӵ�����������
:: 
:: ***********************************************************************
:: 
:: ����ʹ�÷�����
::    1. ��ͼƬ�ϵ��� bat�ű��Ͻ��д���
::    2. ���˽ű��ŵ� %AppData%\Microsoft\Windows\SendTo
::       Ȼ�󣬾Ϳ������ļ��ϣ��Ҽ������͵���ʹ����
:: 
:: ***********************************************************************
:: 
:: �ű����ô��ǣ��Է�������������ͼƬ��
::   - ���������� 500w
::   - ��߱�С�� 3
::   - ��߱ȴ��� 0.3
:: ʹ�� ImageMagick ��С�ֱ��ʵ� 500w ���أ�����ԭ��ʽ
:: 
:: Ȼ�󣬲�ͬ��ʽ������
::   - jpg �� jpeg ��ʽʹ�� MozJPEG �� cjpeg ѹ��������Ĭ�ϣ�75��
::   - png ��ʽʹ�� pngquant ѹ��������Ĭ�ϣ�
::   - webp ��ʽʹ�� libwebp �� cwebp ѹ��������Ĭ�ϣ�75��
:: 
:: ע�⣺�� jpg��jpeg��webp ��ʽ����ѹ��
::       ��������������д���½�
::       ���ʷ�����һ���½�
::       
::       ���� png ����ѹ�����Ի��ʲ�������Ӱ��
:: 
:: ***********************************************************************


for %%i in (%*) do (
	
	rem ȷ����ʽ���� jpg��jpeg��png��webp
	if /i %%~xi==.jpg (
		set ��ʽ��ȷ=yes
	) else if /i %%~xi==.jpeg (
		set ��ʽ��ȷ=yes
	) else if /i %%~xi==.png (
		set ��ʽ��ȷ=yes
	) else if /i %%~xi==.webp (
		set ��ʽ��ȷ=yes
	)
	
	if /i !��ʽ��ȷ!==yes (

		echo ���ڴ��� %%i
		
		for /F "tokens=*" %%m in ('magick identify -format "%%[fx:w/h]" %%i') do set ��߱�=%%m
		echo ͼƬ��߱ȣ�!��߱�!
		
		if !��߱�! GEQ 0.3 (
			if !��߱�! LEQ 3 (
				rem �����������߱ȣ����ǳ���ͼ����ƴͼ��������� 500 ������
				echo ���ڵ�����С����
				magick %%i -resize "5000000@>" %%i
			)
		)
		
		rem ��������ѹ��
		echo ����ѹ������
		if /i %%~xi==.jpg (
			copy /y %%i "%temp%\cjpeg_temp.jpg"
			cjpeg -quality 70 -outfile %%i "%temp%\cjpeg_temp.jpg"
		) else if /i %%~xi==.jpeg (
			copy /y %%i "%temp%\cjpeg_temp.jpeg"
			cjpeg -quality 70 -outfile %%i "%temp%\cjpeg_temp.jpeg"
		) else if /i %%~xi==.png (
			copy /y %%i "%temp%\pngquant_temp.png"
			pngquant - < "%temp%\pngquant_temp.png" > %%i
		) else if /i %%~xi==.webp (
			cwebp -q 75 %%i -o %%i
		)
		
		echo=
	)
)



echo ����ͼƬ�������! 

pause
