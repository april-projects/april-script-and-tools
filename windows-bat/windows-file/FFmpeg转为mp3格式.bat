@echo off
setlocal enabledelayedexpansion

:: ���ߣ�Haujet Zhao
:: ���ڣ�2021 �� 2 �� 11 ��
:: ���д˽ű���Ҫ��ȷ����װ�У�FFmpeg

for %%i in (%*) do (
	if /i %%~xi neq .mp3 (
		set �����ļ�·��=%%~dpi
		set �����ļ�����=%%~ni
		set �����ļ���չ��=%%~xi
		
		set ȫ��ѡ��=-y -hide_banner
		
		set �����ļ�ѡ��=-i
		set �����ļ�="%%~i"
		
		set ����ļ�ѡ��=
		
		set ����������ļ���=
		
		set ����ļ�����=!�����ļ�����!
		
		if defined ����������ļ��� (
			set ����ļ���=!�����ļ�·��!!����������ļ���!\
			echo yes
		) else (
			set ����ļ���=!�����ļ�·��!
			echo no
		)
		
		if not exist !����ļ���! (
			mkdir !����ļ���!
		)
		
		set ����ļ�·��="!����ļ���!!����ļ�����!.mp3"
		
		set ����=ffmpeg !ȫ��ѡ��! !�����ļ�ѡ��! !�����ļ�! !����ļ�ѡ��! !����ļ�·��!
		
		echo=
		echo !����!
		echo=
		
		!����!
	)
)

echo Mission complete! 

pause
