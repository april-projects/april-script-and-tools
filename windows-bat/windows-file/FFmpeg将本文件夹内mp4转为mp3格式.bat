@echo off
setlocal enabledelayedexpansion

:: ���ߣ�Haujet Zhao
:: ���ڣ�2021 �� 2 �� 11 ��
:: ���ã������ļ����ڵ� mp4 �ļ�תΪ mp3 ��Ƶ

:: ���д˽ű���Ҫ��ȷ����װ�У�FFmpeg


for /R %%i in (*.mp4) do (
	set �����ļ�·��=%%~dpi
	set �����ļ�����=%%~ni
	set �����ļ���չ��=%%~xi
	
	set ȫ��ѡ��=-y -hide_banner
	
	set �����ļ�ѡ��=-i
	set �����ļ�="%%~i"
	
	set ����ļ�ѡ��=
	
	set ����������ļ���=output
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

echo Mission complete! 

pause
