@echo off
setlocal enabledelayedexpansion

:: ���ߣ�Haujet Zhao
:: ���ڣ�2021 �� 2 �� 11 ��
:: ���д˽ű���Ҫ��ȷ����װ�У�FFmpeg

for %%i in (%*) do (
	if /i %%~xi neq .mp4 (
		set ����·��=%%~dpi
		set �������ļ���=%%~ni
		set ������չ��=%%~xi
		
		set ȫ��ѡ��=-y -hide_banner
		
		set ����ѡ��=-i
		set ����·����="%%~i"
		
		set ����ļ�ѡ��=-c copy
		
		set ��������ļ�����=
		
		set ������ļ���=!�������ļ���!
		
		if defined ��������ļ����� (
			set ���·��=!����·��!!��������ļ�����!\
			echo yes
		) else (
			set ���·��=!����·��!
			echo no
		)
		
		if not exist !���·��! (
			mkdir !���·��!
		)
		
		set ���·����="!���·��!!������ļ���!.mp4"
		
		set ����=ffmpeg !ȫ��ѡ��! !����ѡ��! !����·����! !����ļ�ѡ��! !���·����!
		
		echo=
		echo !����!
		echo=
		
		!����!
	)
)

echo Mission complete! 

pause
